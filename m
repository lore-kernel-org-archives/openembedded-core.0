Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83402EB64DD
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.31967.1688959242043324491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nLr0QsKN;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-635e5b06aaeso22227446d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959241; x=1691551241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNjEx8Uyy+0xWaC72e0rjBxB1XwY2u9uPmp/fMxFnyw=;
        b=nLr0QsKN3eLtvDGzLF3GAoCHoXEpegJExNOD6pUBbkkeH0ei+iN1BijUkRWZDlMKDU
         rZwUqP5bHBDxSNZhdvADlHy78KZxJQ0stfjeBeHlCMJuNeYXdPi585ak+XBc+8dGvKW9
         6oXXjvvUbMe8TzxPT0vrqp3CUYA2DoTYc/UBC6/iOAkhfv2ZPugHmDK3ijIZHZRwsyhL
         By/4fgRZrFWe3gdkqkdM/RP+NzqEoI7ueSNkd4arhECjm//aQHNAxs+gqYCnc5CLtYtC
         IjcGw2bSZd7+Mxyt1dz+7NHnZs4mARkKzvRSXhBwjk7EJSlkoAMpfSknMrYw0ODDt1tq
         GZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959241; x=1691551241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNjEx8Uyy+0xWaC72e0rjBxB1XwY2u9uPmp/fMxFnyw=;
        b=C3XH3TjxTbzAeAKMgbO1kT0dKQL+qEMUgS4kyMDg6gJI8fAyvrzbH3kkoR/wXBB4Jr
         sxYkmvD+qKenzVfqaryN7Blhjegy1Oh/p0GHA+teDnCYVS8zz8SeBmBkL1MB8iaq7l5m
         yfnU0poN/EyLp88+C86WpUyPpCsExl55X9ObFxBs0xlPCxlh2SnzakpsUgrSLyy33a4n
         Nvoh84Y6RSBu3Vp+TltvwJKVuDA5zKXlTrMKqgJ2snrNFFMopJuEKKPnQrVJDeYXuEQj
         yBtOVQbrEuX25agrM+NNAZLRTwJ/ZA4c+/RUx0Bl6v2cPQX2nPE2vAA/IEvyHO+jLc+4
         J80A==
X-Gm-Message-State: ABy/qLYMJqoDATemTCHDl42Gz9s8iKSuJt13lWDZr6isWY5q6ZfaTXs/
	BJXx4sGYYRfQIvA8+mqGCMU=
X-Google-Smtp-Source: APBJJlFk2tYAY/gMP72CF6l/18TJPjavRiIinlG0ozcUYD/k/N1QRNTgGo6bNXshKmPHFOTOlh+xIg==
X-Received: by 2002:a0c:f18a:0:b0:632:b37:3327 with SMTP id m10-20020a0cf18a000000b006320b373327mr9538354qvl.56.1688959241070;
        Sun, 09 Jul 2023 20:20:41 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/15] poky/poky-tiny: set preferred linux-yocto version to 6.4
Date: Sun,  9 Jul 2023 23:20:25 -0400
Message-Id: <c5d46c12bf4e00518ce6a5b96f6689dd862dbb83.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184056

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping poky and poky tiny to test the latest refernce kernel. We
leave poky-alt on 6.1 for LTS coverage.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index f65d2dabf3..09729178ab 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -44,7 +44,7 @@ FULL_OPTIMIZATION="-Os -pipe ${DEBUG_FLAGS}"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "6.1%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "6.4%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index d137527624..23d51a7be5 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "6.1%"
-PREFERRED_VERSION_linux-yocto-rt ?= "6.1%"
+PREFERRED_VERSION_linux-yocto ?= "6.4%"
+PREFERRED_VERSION_linux-yocto-rt ?= "6.4%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.34.1


