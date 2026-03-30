Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AEBFB3CEF
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:40:27 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47548.1774863620952713202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=oKcNoeEY;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-66bd3fe1728so181481a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774863619; x=1775468419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=oKcNoeEYzitLFqcTWAQoz6RvVmp1Lj45XsOIuwyiVSOsl/6izjFLrIhFqE0UHW4I0i
         87xD/CgsCa9QIMRTmEoYAU0F73mDRvza7TNRxwFe1SIBVYc76AZ+Z5IK5Wbf814JeAvY
         YSWOwxbMNLXeoGZ4h5DUZLv5l6jF+70HdJsSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863619; x=1775468419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=Ar8vRv8gEdWu2x0zvoC8+UM1TBj4+peA+EfHEZogDk1HzieXgIyfLHQAIPAPgoCmfu
         bx/HxslxdzZItclF+Iw25kW7vC8+m5xZOB0eHlA2ZxcaPmWTf4b8J16Pq7z+DNjNlYRQ
         xCM2XRnwTsvmqzerb/RWIkSadBvH5qMSJhipgc13ruVLp5K9b98SixIEhAZY/I2nFa6Y
         hbTmm7d3GoNw3Xyqc1tWHO/FQ0jxkZ9TAH+kI0zcUY4PvNduBnevyyNazhorgDT0+mmN
         C3HVj5+NIskB0+sx9UnTxUdBVp5ZsehNZSS9PzPfM1RCvb3zlBWvuXER9uYFoKXC80ri
         wa6Q==
X-Gm-Message-State: AOJu0YxQhIzt3uMiIMsxBv2GPcQoxemxw8J3ZL9LxzqN8WnfzSZihYZC
	K4awuDHCUOKxKfAWCos9q6PcGuzoHeO9a5zfr9Kf4g6qIkUlhTvmtFNWb1kplCMnHniHce/7OVu
	lGOwauje+EQ==
X-Gm-Gg: ATEYQzxuqxtgi7Kuj10gs+7pwGD6BOKmia9SEAKMKf4YBUYlCeRYAC6vG7PkFix5q5A
	r3Zw68AlqfUUlIFHta6Tz7VBQQzHSBBn5SZAs4KsZDPgQAMWXeswgnV8uhAwuB9A4c4t8Yc9PWi
	4E2qEY/ZCAlT3HMBWPpBgISUI+40F4WMMaBp1fuE7tp9hEo+Kl+Ma45ZKfrsoSgHXTGk0NRXfME
	clHgreVT78DPUfQ5z9SGeFPabpeK+xmMk/oYis/Z41V7ix9BlkOiqnGiHxiLjYEj8nPV82lbuI2
	DSSyXdvjRFHxmIDtmOGvuxE4LOJdroY6P1Fzv3ZA5S29ZXMX4X5PBzABcotqhrIp3m6YX7NzpfN
	tm4/1rjorNL60PmRs0AdmpNXsk6gZd1Q+NJxEvAzIhSS8HzfcQHt90yrefHmAZu+NRjiFlsbdD8
	3z5Xf2OgxTM1BlPAQBdZ91XigIJYAUi8i8uXRAsGXimCCnxN4EmRluqk6M6lschOdnoDs0DLYLr
	l+n46e+DU47MmdFxFUC/8/0XuXESg8FBJxhiVsqypm9+o6BHIrZ66L2QKakwj21+Q==
X-Received: by 2002:a17:906:794a:b0:b76:2667:7736 with SMTP id a640c23a62f3a-b9b5078b949mr331154866b.4.1774863619056;
        Mon, 30 Mar 2026 02:40:19 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm266108666b.58.2026.03.30.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:40:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v6 1/7] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Mon, 30 Mar 2026 11:40:10 +0200
Message-ID: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234207

If DISTRO_CODENAME is not set in the environment, bash quietly
drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultsetup-

However, when python calls self.d.getVar('DISTRO_CODENAME'), the resulting
string is 'None', leading to a configuration file pointing to a key such
as PACKAGEFEED-GPG-KEY-defaultsetup-None

Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
DISTRO_CODENAME is not set.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-core/meta/signing-keys.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 94f4032911..c7713ed4a6 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -45,6 +45,10 @@ addtask get_public_keys before do_install
 do_get_public_keys[depends] += "gnupg-native:do_populate_sysroot"
 
 do_install () {
+    # Python evalutes an empty DISTRO_CODENAME to "None" which would cause mismatched files
+    # as the update config file would show GPG-KEY-${DISTRO}-None but the filename is
+    # installed as GPG-KEY-${DISTRO}-
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
@@ -57,6 +61,7 @@ do_install () {
 }
 
 do_deploy () {
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
-- 
2.53.0


