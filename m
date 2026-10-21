Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11642.1792589521278059168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 06:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hy28ujdA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso463016f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792589519; x=1793194319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWhJDkGgcqDkoiGXr2Y4FSQsq3jJZlGjCnekF+AIQD4=;
        b=hy28ujdAZr18mZ+flTXsjJik9lKbD4a1uuvya16nseET4uK1QBzhLq5xVcsfFsy6xT
         1h1xeym98I3FLrd7+6DTvxzVPmFC2U8Pw2FQPYBh2CsP5w5Ebq8/HMkzkJnKMNuxySTj
         8Qo9Wg2ChONiJXdkmik/Ol3Rh3KzXgypmYHQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589519; x=1793194319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cWhJDkGgcqDkoiGXr2Y4FSQsq3jJZlGjCnekF+AIQD4=;
        b=Jtpso1IVnNcTVtQXkzKhf+NppRu+gkqCHJFjNCoqgl8fx6FGj3mNQHdDXMeXdKd4ve
         aPsrG4mBl1F8Pkt5DTDd4WGh9dUtjKvaP5TxCU9n42JUrIxtXp7XYKnHhCDkYYasdF4F
         bp7uPrkndF/nDK7x4oyTlkmtBnLiYx4AczgMxxWJfSe/2ayuRz2cX7tb8IdEEFrwRKM9
         PEPtUKiJisspk+4u/HNp92sYnKR66dMJQWxl+RNHcbk/KWAm9+xuIP5Zoo4B2mx/wx/G
         EjZYGHzhq63ZNl2Yt65WJ5Mx7dGyQGFzTgjU8GqJ/9HUv/Es7MPb0EA+iiYxMmqYNNt2
         Tv+g==
X-Gm-Message-State: AFq9FYJ5acyBYRu2bKZFk8klKOEk2SQVnAsQs17Ru2tqsTm9vuBUBj07
	Fu33fPJwMHpNozYoZFn6K8FmxDuun38TvF0ROlcjWu2u/a3lFPL4HGKvzj2eZSsEdc71bc/y1gI
	VkX/jwhU=
X-Gm-Gg: AYBFou25nbohvB7jCrjqdmP/AxoITvnfYz9QgKUr+kYi+A1rz1vVcjTMfIq/H+km69Q
	75cYLlkczr3365ooch7BDe3rgyID0hx/ZDmogjTAR0s8kMCY2st72A2lb79H8X8wnNykmloVkaN
	RAV2X23pccyCsJBQAXsL11jsS71Gu8P4PqgXm2W4NrPMeYvc1PQ+tqi58mbDAknxyWPIRN9fqL/
	YXvo9oeYEHBPYHXVaLALAVZwaF5bsNtX/Cm3irk+zDrTUNxqqFpvUhmCU42Ld37xSHdb3tzP8gY
	SLMMF5zyJ97jP7ZMYtPjNFFnqLDXvXpDl3ytLEnjrYPc6vrh50W1UUlkrGn98vsPw+Jke7iWXYg
	BdkiF40/DDvc58EY83uqbory1C7kI6s7NAudBukaso5jb+wB3k2Ck1A3PPpz5R9wvKrZyV0rV1w
	Z7wJx9T7/lYkT+vCtUsJhGDHpzTH6P9xZja8Y4qqGoTIcSOkS3mAqj7mDwnv2zvYBoXHWdGgu8k
	z/FCz84AbFLqAwEAX/oOuix4TViLhsBN6NMFqzwGTl2OoMcOh3uxt2Tz56BrHdv5yV6lDeBIwwM
	zh3ClMU=
X-Received: by 2002:a05:6000:604:b0:48e:412:3829 with SMTP id ffacd0b85a97d-48e264a2de6mr4453638f8f.15.1792589519089;
        Wed, 21 Oct 2026 06:31:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aca:5725:8818:30bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm5381117f8f.41.2026.10.21.06.31.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:31:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3: Fix build arch reproducibility issues
Date: Wed, 21 Oct 2026 14:31:57 +0100
Message-ID: <20261021133157.2895233-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 13:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248399
Content-Type: text/plain; charset="utf-8"

The build arch leaks into some of the installed python files. This tweaks/adds
some sed expressions to resolve those references for the target and improves
reproducibility between architectures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.7.bb
index f917edebd86..77929bc3e1e 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -227,6 +227,9 @@ do_install:append() {
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
                 -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,^ 'BUILD_GNU_TYPE'.*, 'BUILD_GNU_TYPE': '${HOST_SYS}'\,,g" \
+                -e "s,--build=${BUILD_ARCH},--build=${HOST_ARCH},g" \
+                -e "s,build_alias=${BUILD_ARCH},build_alias=${HOST_ARCH},g" \
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
@@ -402,6 +405,9 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                -e 's:BUILD_GNU_TYPE\(.*\)=\(.*\)[a-z\-]*:BUILD_GNU_TYPE\1=\2${HOST_SYS}:g' \
+                -e 's:build_alias=${BUILD_ARCH}:build_alias=${HOST_ARCH}:g' \
+                -e 's:--build=${BUILD_ARCH}:--build=${HOST_ARCH}:g' \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
@@ -435,8 +441,13 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                -e 's:build_alias=${BUILD_ARCH}:build_alias=${HOST_ARCH}:g' \
+                -e 's:--build=${BUILD_ARCH}:--build=${HOST_ARCH}:g' \
                 -e 's|"userbase": ".*"|"userbase": ""|g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
+
+        # Fix extensions in build-details.json
+        sed -i -e 's:${BUILD_ARCH}-${HOST_OS}:${HOST_ARCH}-${HOST_OS}:g' ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/build-details.json
 }
 
 # We want bytecode precompiled .py files (.pyc's) by default
