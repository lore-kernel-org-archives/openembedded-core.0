Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4EEC00144
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14385.1658882472935540883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RNnainyS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id 17so14754973pfy.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGDxvf7IYjTSCd+r87sZlth9Jr29IC8M2ZQ142KTt7g=;
        b=RNnainySxSKHZmBZdulbc5ylM1vsXZjHSOUSIzku1cfV4hSrdHqoyjAtYI46P/F2HL
         VvtN2YZCe87kPK/tovNM8wO9wl89mC1AoBPQiy0fDkTNAAe9U+vtTWol6MXOwddFrmu7
         VKK2csTn1FVqbM//mdvm++u2ed7gvV8feCVmOxHT0EGC0zUKsv080LKmVFF98DUoohyh
         TiPt9u9tZ90x0QVE4fx440qCDccxRK4oeTCMd1eOzI4sprehsmFqlnVaCKFlP0BCqd76
         nLYbl06PtzppMjGz1fLWFo6r6f4Hm/Xxo9zrOHzGRM5g9uSBDmJ8JunYsVWx39gmnuf6
         U94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGDxvf7IYjTSCd+r87sZlth9Jr29IC8M2ZQ142KTt7g=;
        b=euRLla0L0JgZ6v1XSl36IwKgdkPr+nWhnytKvq3xqPsqVHJnuo0iOArTIYaef+f3Pg
         tc8VyQpK2lzt2d30ej6040Wo0KpTmX/B75SkgQ0HtRxcJvTFXHzkYSMQQPu0PCsTWFF0
         VWt5ykP1VW3lYDumWcLPhVtRhfeiehaVo5MODo6KPyF4kYa88OOMixC1IAqiok0I/OkB
         8hmdMPapbRqV9x0w7/PkGaAgCthFciul6tp3KGxhBe2ynTswQpFVdCEEYDus7DemHJ0Y
         Ah2jwB0/K0KwrLymi/jiAV+WCdYxuxko6nacazdoSiWKYMTcPkUb4LpVeCoRoQYvfdvB
         3kYA==
X-Gm-Message-State: AJIora/uh/Fcyv74gWKBsH+lzCA176Hf44nHXNDNXxplovR18j+dvMff
	wtSN63kUUBFe7EYIiM12hTmpWOeBVa7LwNiE
X-Google-Smtp-Source: 
 AGRyM1ucao8GbnKxVokE0av3IN2Klkr1oMgcxVjIDsvL9XOdAHTugUTcTxVF+xKmeYstSU7Lyelz/Q==
X-Received: by 2002:a63:4a12:0:b0:419:9ede:b7a0 with SMTP id
 x18-20020a634a12000000b004199edeb7a0mr16485778pga.167.1658882471332;
        Tue, 26 Jul 2022 17:41:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Tue, 26 Jul 2022 14:40:31 -1000
Message-Id: <cover.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168523

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3979

The following changes since commit f1c2e21a28f8ad5dc6ff7b0db877aa22e01a9e00:

  pulseaudio: add m4-native to DEPENDS (2022-07-17 16:59:57 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  gnupg: update 2.3.4 -> 2.3.6

Joshua Watt (1):
  sstatesig: Include all dependencies in SPDX task signatures

Khem Raj (2):
  lua: Backport fix for CVE-2022-33099
  gcc-runtime: Pass -nostartfiles when building dummy libstdc++.so

Ming Liu (1):
  rootfs-postcommands.bbclass: move host-user-contaminated.txt to ${S}

Naveen (1):
  gcc: Backport a fix for gcc bug 105039

Richard Purdie (1):
  vim: Upgrade 9.0.0021 -> 9.0.0063

Sakib Sajal (3):
  dpkg: fix CVE-2022-1664
  go: update v1.17.10 -> v1.17.12
  git: upgrade v2.35.3 -> v2.35.4

Tom Hochstein (1):
  gobject-introspection-data: Disable cache for g-ir-scanner

Yi Zhao (1):
  tiff: Security fixes CVE-2022-1354 and CVE-2022-1355

Yue Tao (1):
  gnupg: upgrade to 2.3.7 to fix CVE-2022-34903

wangmy (2):
  bind: upgrade 9.18.2 -> 9.18.3
  bind: upgrade 9.18.3 -> 9.18.4

 .../gobject-introspection-data.bbclass        |   5 +
 meta/classes/rootfs-postcommands.bbclass      |   2 +-
 meta/lib/oe/sstatesig.py                      |   9 +
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.2 => bind-9.18.4}/bind9   |   0
 .../{bind-9.18.2 => bind-9.18.4}/conf.patch   |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.2.bb => bind_9.18.4.bb}   |   2 +-
 ...ive-Prevent-directory-traversal-for-.patch | 328 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.21.4.bb     |   1 +
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +-
 .../gcc/gcc/0030-rust-recursion-limit.patch   |  92 +++++
 .../git/{git_2.35.3.bb => git_2.35.4.bb}      |   2 +-
 .../go/{go-1.17.10.inc => go-1.17.12.inc}     |   2 +-
 ...1.17.10.bb => go-binary-native_1.17.12.bb} |   4 +-
 ....17.10.bb => go-cross-canadian_1.17.12.bb} |   0
 ...o-cross_1.17.10.bb => go-cross_1.17.12.bb} |   0
 ...ssdk_1.17.10.bb => go-crosssdk_1.17.12.bb} |   0
 ...native_1.17.10.bb => go-native_1.17.12.bb} |   0
 ...ntime_1.17.10.bb => go-runtime_1.17.12.bb} |   0
 .../go/{go_1.17.10.bb => go_1.17.12.bb}       |   0
 .../lua/lua/CVE-2022-33099.patch              |  61 ++++
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   1 +
 .../gobject-introspection_1.72.0.bb           |   3 -
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 +++++++++++
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 ++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 ...-a-custom-value-for-the-location-of-.patch |   6 +-
 .../0003-dirmngr-uses-libgpg-error.patch      |  29 --
 .../gnupg/gnupg/relocate.patch                |  18 +-
 .../gnupg/{gnupg_2.3.4.bb => gnupg_2.3.7.bb}  |   3 +-
 .../vim/files/crosscompile.patch              |  51 +++
 meta/recipes-support/vim/files/racefix.patch  |  12 +-
 meta/recipes-support/vim/vim.inc              |   9 +-
 40 files changed, 860 insertions(+), 61 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.4}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.2.bb => bind_9.18.4.bb} (98%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch
 rename meta/recipes-devtools/git/{git_2.35.3.bb => git_2.35.4.bb} (98%)
 rename meta/recipes-devtools/go/{go-1.17.10.inc => go-1.17.12.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.10.bb => go-binary-native_1.17.12.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.10.bb => go-cross-canadian_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.10.bb => go-cross_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.10.bb => go-crosssdk_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.10.bb => go-native_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.10.bb => go-runtime_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.10.bb => go_1.17.12.bb} (100%)
 create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/{gnupg_2.3.4.bb => gnupg_2.3.7.bb} (95%)
 create mode 100644 meta/recipes-support/vim/files/crosscompile.patch

-- 
2.25.1


