Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB910CD98CE
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:01:56 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.5111.1696982509738044478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mv+s+u5J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6c644a1845cso4267825a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982508; x=1697587308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ws/MfnGdUTucJYdNGVWTxdhbYEIYcTpjxuN1YWKGmOc=;
        b=Mv+s+u5Ju7IgTpnpWnb+97N36rQfbMt4D7BnHydN/jyqqlJjuxQme3ptebL0ocFdG9
         YT6EW9L95969ZC3mLXcboH3GvVKAt9Zdkmt/BM4pXJGgVJD7LgfT/0ZDXuzLm2JUdjYi
         yT6eGyxLTGJ4cJg5dd+wIqAsn9NtF2vti1ozetCcA7ReklukFrr0eUdxTCaTCF28/y8g
         MwWRxetf5Q72g705L11oE0+yi0JhtVVK30gi4UuyXTHT4JYBXcztvg5I+T6v5zu9Yo++
         adrOy31K1SQgINPb1uMFCzbtOX+Wjp25hZDLKzBhkHwsxBRL0K3RrPvsndv4Y9/nvPon
         /10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982508; x=1697587308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ws/MfnGdUTucJYdNGVWTxdhbYEIYcTpjxuN1YWKGmOc=;
        b=U8m4fTZIs5bNtf4GpPEMuQFLwaRd393UQMN/s58fNYCSIAxPMRqA/lVaIft0iTZOPi
         hZ4drP8oSTVvNaveERM4YQaCrNHWS0D0soENtTaZUzkBIPua0rsaABiVRs+Qi+dQw7jC
         TUoi/bIVd3OAX6RPkcJF4czUyT9kPKW+cKUxnKbJvRg5EtIf1PAYuBW0PZZKBsp0cOBd
         IL8jAIUwVvbaFbe42dN1Cnw49elgT5JBmS0ZlDUymGkSLj3oaxJsxDDqb+tojUHL8gz+
         goVVsbWMP+xzLUxI3/wTcQxaH2MSq4MbrI4Rt+IB1oOg8Tl9yLpde7KaEZKWF6ZIOw+j
         +SdQ==
X-Gm-Message-State: AOJu0Yw4Y8xseqorcE8IxoQsSgy5Qc4iSYkLAnsQJ/f3wiLtgYaxZm97
	sfT+7nutssXndgbuMs3EEdxRu4WlYBqgr0dPL4M=
X-Google-Smtp-Source: AGHT+IGIygwxqLyWcSYxI/LwHnCVGyP4P3kwH14GWv7sh6pc2hJDfocCjp8OzIdcwVhR6LPz+keH+w==
X-Received: by 2002:a9d:4d84:0:b0:6b9:1473:7fa3 with SMTP id u4-20020a9d4d84000000b006b914737fa3mr18788296otk.27.1696982508303;
        Tue, 10 Oct 2023 17:01:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:01:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/20] Patch review
Date: Tue, 10 Oct 2023 14:01:13 -1000
Message-Id: <cover.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188918

Please review this set of changes for mickledore and have comments back by
end of day Thursday, October 12.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6031

The following changes since commit aa90e5ea1fe77c97e5915e5e9a69bbd0b9461d09:

  linux/generate-cve-exclusions: print the generated time in UTC (2023-10-05 04:43:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (2):
  gnupg: upgrade 2.4.2 -> 2.4.3
  openssl: build and install manpages only if they are enabled

Archana Polampalli (1):
  gstreamer: upgrade 1.22.5 -> 1.22.6

Bruce Ashfield (2):
  linux-yocto/6.1: update to v6.1.52
  linux-yocto/6.1: update to v6.1.53

Emil Kronborg Andersen (2):
  dbus: add additional entries to CVE_PRODUCT
  libxkbcommon: add CVE_PRODUCT

Mikko Rapeli (3):
  oeqa selftest context.py: whitespace fix
  oeqa selftest context.py: remove warning from missing meta-selftest
  oeqa selftest context.py: fix git commands and set branch name

Peter Marko (1):
  openssl: Upgrade 3.1.2 -> 3.1.3

Richard Purdie (1):
  mdadm: Disable further tests due to intermittent failures

Ross Burton (6):
  glib-2.0: libelf has a configure option now, specify it
  pango: explictly enable/disable libthai
  libsoup-2.4: update PACKAGECONFIG
  wayland-utils: add libdrm PACKAGECONFIG
  busybox: remove coreutils dependency in busybox-ptest
  libgudev: explicitly disable tests and vapi

Steve Sakoman (1):
  linux-yocto: update kernel exclusions for 6.1

Yuta Hayama (1):
  linux/generate-cve-exclusions: fix mishandling of boundary values

 meta/lib/oeqa/selftest/context.py             |    8 +-
 .../{openssl_3.1.2.bb => openssl_3.1.3.bb}    |    7 +-
 meta/recipes-core/busybox/busybox.inc         |    2 +-
 .../busybox/busybox/start-stop-false.patch    |   35 +
 meta/recipes-core/busybox/busybox_1.36.1.bb   |    1 +
 meta/recipes-core/dbus/dbus_1.14.8.bb         |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    3 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |    5 +
 meta/recipes-gnome/libgudev/libgudev_237.bb   |    2 +
 meta/recipes-graphics/pango/pango_1.50.14.bb  |    2 +-
 .../wayland/wayland-utils_1.1.0.bb            |    3 +
 .../xorg-lib/libxkbcommon_1.5.0.bb            |    2 +
 .../linux/cve-exclusion_6.1.inc               | 4226 +++++++++--------
 .../linux/generate-cve-exclusions.py          |   14 +-
 .../linux/linux-yocto-rt_6.1.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
 ...tools_1.22.5.bb => gst-devtools_1.22.6.bb} |    2 +-
 ...1.22.5.bb => gstreamer1.0-libav_1.22.6.bb} |    2 +-
 ...x_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb} |    2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.6.bb} |    2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.6.bb} |    2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.6.bb} |    2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.6.bb} |    2 +-
 ....22.5.bb => gstreamer1.0-python_1.22.6.bb} |    2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.6.bb} |    2 +-
 ...1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} |    2 +-
 ...er1.0_1.22.5.bb => gstreamer1.0_1.22.6.bb} |    2 +-
 ...-a-custom-value-for-the-location-of-.patch |    4 +-
 .../gnupg/gnupg/fix-ldap.patch                |   34 +
 .../gnupg/gnupg/relocate.patch                |    2 +-
 .../gnupg/{gnupg_2.4.2.bb => gnupg_2.4.3.bb}  |    3 +-
 .../libsoup/libsoup-2.4_2.74.3.bb             |   18 +-
 33 files changed, 2276 insertions(+), 2159 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb} (97%)
 create mode 100644 meta/recipes-core/busybox/busybox/start-stop-false.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.5.bb => gstreamer1.0-libav_1.22.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.5.bb => gstreamer1.0-plugins-bad_1.22.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.5.bb => gstreamer1.0-plugins-base_1.22.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.5.bb => gstreamer1.0-python_1.22.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.5.bb => gstreamer1.0-rtsp-server_1.22.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.5.bb => gstreamer1.0_1.22.6.bb} (97%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.2.bb => gnupg_2.4.3.bb} (96%)

-- 
2.34.1


