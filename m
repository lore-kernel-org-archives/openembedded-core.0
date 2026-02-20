Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1CAC5ACA8
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:49 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.319.1771602100407910617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gj3oLB9h;
 spf=pass (domain: gmail.com, ip: 209.85.161.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-679b072ed3aso1050547eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602099; x=1772206899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=gj3oLB9hw04zMXPTSBT8RipWmTcItu+rmCnPZpcxTE1EeqS+8Yt+2ZNsVJLYv6vHrG
         4Q38cA3BoVR2xtT1dD1oTU09Z/9+DGtP31v2zLfQCppk/2xs50WG4JVw4C0Vrp411Zdk
         KYaJAPoYrXrN2jGlftX3Hr2wyz/FQMNucvATr/6WQ3KaYrEElhU6lasZa1w68Lo7NZcl
         +tSGrkxN0BaC/MO4nBD67FBcHIqx90ETBpFKqlpKsBKTwPya9JSF5hBpw/Y9MEY1uq5u
         5ItvbjtQKT/ChgTD25HNGhT4HI6mEN2oREX+ulEyLkJo9RV1xXVDzT1I7F1TGTRarsfR
         sULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602099; x=1772206899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=s6HivIPU1DGAvpOoVOMyhEYFODPQB4M6yvKmcTZXOwClJjG2l+lCwDu+BSZZ0JfzMm
         dNs9MEpj/VsqA+Jx4bS0kYuqKO8KoAb9QuzYyv5fN1N5pknQAVUwVOz2c7qI8Y+dGIjx
         Wsvbn5X4Qa09empEd05m5ll/7CgtdCwe3/gL6KsRef9JsCzlCmT4+GXsGk6/xBBTgRdB
         GRE9vJ5otjhnj0l65Od+ySfbe08lQ8tftDJcl3OLyLxBdjU0Iu66WldxoD7zIw4rrgFw
         LAaI3h7XYYjWNjrCkxhsIfOwkOrKoJcEJaZyWJEm1C+KqEgD3Q2Oo3fVETVS/MEwAV1c
         Zllg==
X-Gm-Message-State: AOJu0YzPzKt0LM8ZQqYF4oL9PqV81AtbftAnDddMozDY4r/l+NTL2fLa
	69HLUGOXoz3NXBmS1PAZKU25vOyHrVlABKa7L/3BmoRlrvXavBkCvPqWTA54u3oq
X-Gm-Gg: AZuq6aKFyacmC7BPHPFV+QIhleIgp2TyJJevpiH/dNP6ZcXHouvKyUgEsbmzEQr/Onr
	OkbIK8BFPXK4lRXTHfh+dEe/ffYPRlc8Ir0ULGrWJY2G0CaqUsibKQLBOW+Z8bpWJNs5tTY00Km
	DFCPjBARMPwZ8i6kC/Bh/1hf7xxyOJc6n8lXMeQLb285JmujCxrRYCEjBU+bVgr5YApJBB+uQ7T
	zQI2+Z4fit+kbzagHTPwHUk72XncOI84EsV2oQoKPIfNDydwodCd3XLRvgB8Er4THL3sDaEZEAc
	V0X2PeJHPHDSEPMSqTQcoYRB0+r/3lOERP2AO7NIhHxSLaJeKZe6R1XUJH8vXRK7A/gDp5TeMR8
	FL97nlxN7ln8ufZPZXV1nyrkPT/I+xGMny1oGbIzQyE9SwnNz26RWlt2rCz0HyRRmy97BcDBOh/
	G1HeGnnTjoRvsEvThTLXpE
X-Received: by 2002:a05:6820:1903:b0:663:859:c41e with SMTP id 006d021491bc7-679c4612ff7mr128314eaf.71.1771602099397;
        Fri, 20 Feb 2026 07:41:39 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/9] gcc-source: Use allarch.bbclass
Date: Fri, 20 Feb 2026 08:40:37 -0700
Message-ID: <20260220154123.376880-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231521

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 265bcf4bef..3ac679b1a6 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,11 +1,11 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


