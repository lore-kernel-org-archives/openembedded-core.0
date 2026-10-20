Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5938.1792498360617633008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JoaXfAX6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so26454745e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792498358; x=1793103158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XS1twkfL47GhPm0siqJLApQaAsd4fcUgl5Zfs3x85cA=;
        b=JoaXfAX679UqJh7KWyVQfFGe1fE3EEjHSIGlNeSEBK6VCQIUjePdgXRYTTowWle7jW
         xD4ts7a26tA2OPq6H0GXaEWeEyEInLCN68404u38lk8ov8Fki2Bu5+1qP+5Otr39UPBG
         moEZHOkvKjlNCVgihwgHn2IMwnTQcveiy8w78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498358; x=1793103158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XS1twkfL47GhPm0siqJLApQaAsd4fcUgl5Zfs3x85cA=;
        b=qSNYIIKd+SJwITr8+J1K4k1QVQR4b8aBbPBxN8OS9B9l+lmpfSijcCVBLiWoxM+wp6
         OOgc0S425+UmWBA3mzV4NIggxbkUf4XYJLb70DRrcRjMI+5ViK4Dr9V+/TmYhsyZh6GD
         7pPuTbdc7cJ/hRqx9vX5tlX6FAGNVHcRhdnaWHrJH+Ut5VnHpm6z7PMpUJvzencdr+o3
         nPOFSbi1u9ZNu4yaxvCzH0fOLekOtpZvaBHHGCbviSL3/Nl2oRhvaFNvrSjGKujpk4M6
         +QkYfaqTjbtqIMpM/wv4pW0OfeFyusH1a1Y0JO2QZgopA/Wm6Ra4g5Ts1JlddqGolFrv
         dLog==
X-Gm-Message-State: AFq9FYLyp/Ombz/CuaNEMLEDXRQnsgUCgd4ct4Jm3C1w3Mlzi+OrB7EQ
	4yU80ticR+iddgQ2DsMnJ1BZtT3+gr9yZcvgrR8C6NT9mINZJaBRs5FnptO1Qp9nKGHHbAhfdoF
	MPj6gjoU=
X-Gm-Gg: AYBFou0pFy1xgTIsFyl35FrdYOTmHIztX5TexjyrzUgJ3kAhArORjzTRipUpillarLz
	u477bzuBPCqCwI6WslIK4EsExigE6Bdngg7Hsg+UkS0Q7Giq+NL1rOnooSYokklPp1Yil9dd7tY
	NdeT8YaktuSXnmIJEbGPTPOCh7/VAlWAAiyQ6gR0skmWQTj4LB+FbaRv4+p45zIlCaYKgROMrqn
	UbHhsG2H/+NPbhbxOEggrX0rWZ/8TXWbJyLFWi5X3ueYJk9tJgfEcnm2617JjvR3jqCmu+Q2rUu
	2apIEnKmbzQCU/JAoY9weWLLS+I1jDkb4JcFzIx00Mw/U1JOBwKLaOTgTItnx3/q4/7hBwtqx5m
	blNBBOsHT2gmvK7+32ugN2Jh6ZajTJnIT9lCpXpzleubPsxbVtpX+LJ72aUL7PZP8wbOyk1IyQr
	CXdIZw76MnLA6zexPASYO8LWHBpqXGbFExEkB2sdJMbEtE9QzPPE1mJyqTqn7XRYC/UYzSsY9I2
	ppFWt1pI68/qbvjcoQb6ZWi2KcjH2fFFlviBA==
X-Received: by 2002:a05:600c:4ec7:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a1d760410dmr238585105e9.19.1792498358192;
        Tue, 20 Oct 2026 05:12:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:afe4:94a7:60b4:8f6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8315a3sm5222229f8f.56.2026.10.20.05.12.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:12:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: Fix build arch reproducibility issues
Date: Tue, 20 Oct 2026 13:12:35 +0100
Message-ID: <20261020121236.1426862-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 12:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248275
Content-Type: text/plain; charset="utf-8"

The build arch leaks into some of the installed python files. This tweaks/adds
some sed expressions to resolve those references for the target and improves
reproducibility between architectures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.7.bb
index f917edebd86..93c2db55c10 100644
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
+	# Fix extensions in build-details.json
+	sed -i -e 's:${BUILD_ARCH}-${BUILD_OS}:${HOST_ARCH}-${HOST_OS}:g' ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/build-details.json
 }
 
 # We want bytecode precompiled .py files (.pyc's) by default
