Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCECC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 10:43:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.17724.1667472186156331979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 03:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k+MC3gQY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so917623wmg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 03:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1m0eGKItOnYLlKFVAnK07z2pgGy2F78IyZBUZG/C44=;
        b=k+MC3gQYVXS1EiEoYTm3KA6cw9CERaZfUUF8f5HYb5SSHxCO3z5vPMv7LRmTihXWbt
         jji4HRUzRT5jxj0yj3FFYXh9gdGE0aaaKjPNoroyBtOJgIngj3Whms9mb7OWOG3KlCVK
         YSi01dQtN7jcyY3K+qFvR9S8jUGexv4x0FlaO4YqbKyasMyNp5sUxbUKUldf1PykBC9O
         cVjIPXg2bxrCKC6eEZU3AWIlVDQC4h6OtgJGVihc7Wc+ttBQtghUcgTUTSc9HxDeSyiI
         geb3IfMAqdeBuzto+1w5CIcY6UKW9rdLeXlT5qXoa9hzvDIwgWXaBUmaDKSDQMj+a25H
         kYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1m0eGKItOnYLlKFVAnK07z2pgGy2F78IyZBUZG/C44=;
        b=wd9ZckIUCww3Xe5f+A8i2A1JoURtI55Bp2cNUwgLWwe4hp02pSTK4y5LevRIxqDUPO
         UMXEprsrOCjhj6rs9GDdLg8qO8lX5OVAUZBDLjg1zXHYwI4vQAooVLVpJhW+jE4NSzxD
         SvyUE5Lbhy2fmol1CLJpcpxdQo+ubCF+qxqT+cwlTCpcU/34Z5EQUAlT8zDMLoxL9uqZ
         3eEQWsBYhuh5fo12oidIuSRd1T7EmQz5wI65YQSQeGFMLnf8sSd/7VPAdRYGQGY7ZU1m
         5ofRw1RofVo5c4FPflaod9CnIKBh5IFNCXvur5IfjNPWRMCmaxUM/QOhc3vL5mCsqTp6
         8QkA==
X-Gm-Message-State: ACrzQf0tcMoM8X9EYcO3ULZ4o3lVObDB5C66PFQN3SYA6z6QXwfD4wrM
	8O1J0Zqxj+OTFkiZQndCtvjD5Os2OdNpJZVI
X-Google-Smtp-Source: AMsMyM7+RE+G/MhJ7hZHNFP+srNVM9lNgV/2rXgWeyv1yWGtu9nNlMF++SLDOUo9wvHGJrc+WfZbYg==
X-Received: by 2002:a05:600c:1e8c:b0:3cf:55e7:c54f with SMTP id be12-20020a05600c1e8c00b003cf55e7c54fmr23999002wmb.61.1667472183866;
        Thu, 03 Nov 2022 03:43:03 -0700 (PDT)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id m36-20020a05600c3b2400b003cf47556f21sm5586569wms.2.2022.11.03.03.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 03:43:03 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: bump to v252
Date: Thu,  3 Nov 2022 10:42:55 +0000
Message-Id: <20221103104255.1120494-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 10:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172622

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
NOTE: I do not use musl, so I have not touched those patches

 .../{systemd-boot_251.4.bb => systemd-boot_252.bb}       | 0
 meta/recipes-core/systemd/systemd.inc                    | 4 ++--
 ...t-Don-t-install-dependency-links-at-install-tim.patch | 4 ++--
 .../systemd/{systemd_251.4.bb => systemd_252.bb}         | 9 +++++++++
 4 files changed, 13 insertions(+), 4 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.4.bb => systemd-boot_252.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_251.4.bb => systemd_252.bb} (98%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recipes-core/systemd/systemd-boot_252.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.4.bb
rename to meta/recipes-core/systemd/systemd-boot_252.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 71eb93f23a2..fbaef910af7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
-SRCBRANCH = "v251-stable"
+SRCREV = "e8dc52766e1fdb4f8c09c3ab654d1270e1090c8d"
+SRCBRANCH = "v252-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index a19a0255591..2a033b134e1 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -29,7 +29,7 @@ diff --git a/units/meson.build b/units/meson.build
 index a9bf28f6d9..11d3644168 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -63,8 +63,7 @@ units = [
+@@ -62,8 +62,7 @@ units = [
          ['poweroff.target',                     '',
           (with_runlevels ? 'runlevel0.target' : '')],
          ['printer.target',                      ''],
@@ -64,7 +64,7 @@ diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
 index 96f595ad72..7c010bb224 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
+@@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_252.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_251.4.bb
rename to meta/recipes-core/systemd/systemd_252.bb
index 87668cadc75..7c929c22e0f 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.bb
@@ -526,12 +526,15 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-stdio-bridge \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
+                        ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
                         ${systemd_system_unitdir}/systemd-ask-password-console.path \
                         ${systemd_system_unitdir}/systemd-ask-password-console.service \
                         ${systemd_system_unitdir}/systemd-ask-password-wall.path \
                         ${systemd_system_unitdir}/systemd-ask-password-wall.service \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
                         ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
@@ -539,12 +542,17 @@ FILES:${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-bus-proxyd \
                         ${systemd_system_unitdir}/systemd-bus-proxyd.service \
                         ${systemd_system_unitdir}/systemd-bus-proxyd.socket \
+                        ${rootlibexecdir}/systemd/systemd-measure \
+                        ${rootlibexecdir}/systemd/systemd-pcrphase \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
                         ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \
                         ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
+                        ${systemd_system_unitdir}/systemd-pcrphase-initrd.service \
+                        ${systemd_system_unitdir}/systemd-pcrphase.service \
+                        ${systemd_system_unitdir}/systemd-pcrphase-sysinit.service \
                         ${systemd_system_unitdir}/systemd-suspend.service \
                         ${systemd_system_unitdir}/sleep.target \
                         ${rootlibexecdir}/systemd/systemd-initctl \
@@ -614,6 +622,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
                 ${bindir}/oomctl \
+                ${bindir}/userdbctl \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
-- 
2.34.1


