Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEE0C433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 02:12:33 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.11259.1653703951538339493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 19:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aI1Y6fmQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id g184so5402905pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 19:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1t+N84yS3otXlSHwm0nQXyugn0b/Sr1Ctp/3hKbOgCY=;
        b=aI1Y6fmQNghlMg5XUYtBzhnI688IGL4x4+W28OLJabkliRoeT8WCrWdErGLfHjybrP
         mkUBd2o8RATssYOvtZuoXtYyV5HPTs9myH4om8NPCEpBszLUNtnnAtyTPm7piFv78s5U
         GPyFr4ZtQfKwR0kDjZWUMKeJXoDm/L+1tjGRXz7cALsdW7FDm1jpWcpJhvKyFbw0t9eL
         Ji+WPP1dITo+zbZUvFWvzah9ZTmuESjToCZe7YwWVlSKVVKNjY6r7IrAK5hjeOELxCMJ
         Iamw+duYQ5UTVDvdWlikBQzssQFtxEV+ao0Cp0e55gDL1RBJ8/SOC6Q7i/LfsMRw8g+R
         3KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1t+N84yS3otXlSHwm0nQXyugn0b/Sr1Ctp/3hKbOgCY=;
        b=Hhk1Cuao9J867JV7ICacRpZMoCJh+DV1jc2earRgzGS9ItLbowaomb0CmrX7MvDBHn
         ON4T1xYisW0Wo5kMwF4HdzWnt+/SZGyQA0I6HiHTVPR/974Ee2hw/cufU1pH4CdWkgeo
         JAV9fq8Sb1J4+GYiWo7OhmrNyIumZ5ArmObaFanUQ6nJmJXFEDME/OzTN7Uh7IHJt8IK
         QoIxbeKe2Fico+SDvJH4VSitKn0sdu/r5rxZh79eIQIwIN/lv6x158QM3gusrxMgpQ+K
         LHbGAnzYlSsfTFiMEv3VPduR2THl6ELoWGbWf6yhqNMVZypCOqIW+WjxmmP5LjzA/ydY
         bhGA==
X-Gm-Message-State: AOAM533fAKGpCtKXc+V5FAA+6T6SSw9bVwFOTK1qUtBj/2sxqiYqoeGl
	1sReXTaq5NyihY/Na1+P4e97bpQkWS/E0E52
X-Google-Smtp-Source: 
 ABdhPJxHHXWjY65fqLgzPmHfn38MUdgcOqkHUpY5zxuQ5x8H0k6k3ffHkfRP93jDgJZtF5wn0wYZ/w==
X-Received: by 2002:a63:688a:0:b0:3fa:a80c:a228 with SMTP id
 d132-20020a63688a000000b003faa80ca228mr17487435pgc.182.1653703949925;
        Fri, 27 May 2022 19:12:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b0015e8d4eb20esm377722plg.88.2022.05.27.19.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 19:12:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Pull request (cover letter only)
Date: Fri, 27 May 2022 16:12:18 -1000
Message-Id: <cover.1653703882.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 02:12:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166219

The following changes since commit d3beac233558242ab6895e9ba8536a6df9df8eb3:

  selftest/imagefeatures/overlayfs: Always append to DISTRO_FEATURES (2022-05-22 11:40:26 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (15):
  gst-devtools: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-libav: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-omx: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-bad: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-base: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-good: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-ugly: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-python: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-rtsp-server: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-vaapi: upgrade 1.20.1 -> 1.20.2
  libcgroup: upgrade 2.0.1 -> 2.0.2
  mesa: upgrade 22.0.2 -> 22.0.3
  mobile-broadband-provider-info: upgrade 20220315 -> 20220511
  sqlite3: upgrade 3.38.3 -> 3.38.5

Hitendra Prajapati (1):
  pcre2: CVE-2022-1586 Out-of-bounds read

Peter Kjellerstedt (1):
  license_image.bbclass: Make QA errors fail the build

Ross Burton (1):
  oeqa/selftest/cve_check: add tests for recipe and image reports

Steve Sakoman (1):
  go: upgrade 1.17.8 -> 1.17.10

 meta/classes/license_image.bbclass            |  2 +
 meta/lib/oeqa/selftest/cases/cve_check.py     | 77 ++++++++++++++++++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 ...{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} |  2 +-
 .../go/{go-1.17.8.inc => go-1.17.10.inc}      |  2 +-
 ..._1.17.8.bb => go-binary-native_1.17.10.bb} |  4 +-
 ...1.17.8.bb => go-cross-canadian_1.17.10.bb} |  0
 ...go-cross_1.17.8.bb => go-cross_1.17.10.bb} |  0
 ...sssdk_1.17.8.bb => go-crosssdk_1.17.10.bb} |  0
 ...-native_1.17.8.bb => go-native_1.17.10.bb} |  0
 ...untime_1.17.8.bb => go-runtime_1.17.10.bb} |  0
 .../go/{go_1.17.8.bb => go_1.17.10.bb}        |  0
 .../{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb}   |  0
 ...tools_1.20.1.bb => gst-devtools_1.20.2.bb} |  2 +-
 ...1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} |  2 +-
 ...x_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.2.bb} |  2 +-
 ....20.1.bb => gstreamer1.0-python_1.20.2.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.2.bb} |  2 +-
 ...1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} |  2 +-
 ...er1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} |  2 +-
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 58 ++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.39.bb |  5 +-
 .../{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb}  |  2 +-
 29 files changed, 158 insertions(+), 22 deletions(-)
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} (93%)
 rename meta/recipes-devtools/go/{go-1.17.8.inc => go-1.17.10.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.8.bb => go-binary-native_1.17.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.8.bb => go-cross-canadian_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.8.bb => go-cross_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.8.bb => go-native_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.8.bb => go-runtime_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.8.bb => go_1.17.10.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb} (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.1.bb => gst-devtools_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} (97%)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb} (86%)

-- 
2.25.1


