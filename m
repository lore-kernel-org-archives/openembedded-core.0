Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29830.1793868244648367359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ODectus7;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df54150dfso1074461f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868243; x=1794473043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ILwHOUrzptDDZQwTXirOGqXP4H0JnKsTkGHEiUm7GOg=;
        b=ODectus7s617gPkq6OTLA7rZEjBDAYwfxyAQUDXsz85vLQmzLZLFNoyRXVRKJaBmoP
         8mUWN1g/gMBMAS8ve+TPA2BauEoFH0OMfNmilP5wEcYIlyg8nSVoCSs9kk0G1JJnlOrm
         4rGA0cyfXUJ461myy7CCoDEub8NfnMAqxRqAqdRBPhJ/6skVZn1xrgABM9E5TMFqxp7Y
         x6lM8yBzHXBB4wjXm7jKcNF8+vjKv8IVBnpqY3wwzE3qbm4V+wzuaKv6400fUkecAiW8
         nx668XRWNDA/hfltDUqcL/ZLO45Gnrw3Y3Ng+tqjUHfosj1RkFbukNk+XWa+donSabML
         sh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868243; x=1794473043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ILwHOUrzptDDZQwTXirOGqXP4H0JnKsTkGHEiUm7GOg=;
        b=ODMBL6F3UrXEyB+8fdhVLjExMJN8pdCpOL9bzyfWhd39Z4+IPt/Z2e5SrsidhuOApD
         QDzeEdJMfAObFtt75IO/xnV9bPJK4sVqLe4zFpZ8r5P9HVPRLSAhCYsqhh873cNZNGtg
         2ofm6kbBHaSLvMCyONgjXFAPKx9+O1hzhlwKFsurHIJgdZLKHfdPc94TbfLfJYSu/0Zt
         iSuNet7Lw2Pp5euB9mf15w86OaHxfgY7w14o+gV4riiKf9sVlHx8/H4aUEy7DRJJdIt5
         cjUXoPRF3QvHtcDeePs5NzUTWrftpXLlmBbXYllA20yK0pvxv0gwJofG99qyAmmrD7oe
         Dkvg==
X-Gm-Message-State: APuU4Z9g7KTs7RJ/FOEqPrKCTXaDhkQ6xWCsWn4B3wEy+Vu3lm95eyvV
	A7SzycdiY+ssUITHIWtpZBuUgx5gDcHRdKVPFo/UB+9Dwtgyb21VGOaaxjtCq2tvKvGliT+wTHA
	OZBfpOhw=
X-Gm-Gg: AYBFou2hivHSIbJfKZLDC/D8HAXO5SaG0WNjsrDTAATbIgwG6sp3wR7V7A5yz5Mjcyx
	xfy1/p/ALdT2bqdTsHICtyxUGuj4Muvb9BedDLUPL+M7ISsOcy3y/Zg8R2Hb5qGthaupOn4Nlq2
	p2lJeC4F4dM5lReFFKVxEmrokTy3YgEoiSsfDYKe1cYGeGRvAN5dZV964TEbQjHYTQHzPx94xAB
	0mXAnDb30tDChvNg87Mf4Ixbeqwb39MhUl18RWvnrAMIJYASivUGi5oQeTCBXmrgKoLX3G1TzI6
	PHwr5INIh5ccsA8ykjnTmWMhsQDrEVGvA//eL53eriBHvMQkccBuclT8/rCsqVIWjhmqGJ4lVoW
	oP2QqV2R3rtyHUSYRJcArBlCPgviHNy2O6BhoD1uyQK5UjoJBud1aVa7U12v2qZUyq776lE5KAH
	DZ6X6vD+dvukij6q2ERNkLfIE19qZ3h0OZVSgZgPeqSIBaBdtotsXzNar40UoXVZH0bQmOcE6NG
	nQhJ2EikouZflBpRUtsdeWOBg4yYcVBVG3GoEOOkP4Zq3LZJxjgY1cp5TcXm8UKgVDPY8b6BxLE
	Ovd82Jy3JgvEWOIaIeXnjhQ/Q+RkvAIjlt1fYt+FEI7QMEpVOsEio8TIIUUAr2qlwWAMcGXRdUO
	eK1GRlnEkMkYdfxZD6iMExHdqSii1vw==
X-Received: by 2002:a05:6000:468f:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48e6e2fce08mr28435975f8f.24.1793868242846;
        Thu, 05 Nov 2026 00:44:02 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 46/60] python3: Fix build arch reproducibility issues
Date: Thu,  5 Nov 2026 09:43:05 +0100
Message-ID: <1082190fb455035d5e8a132e64b367ff6dfde3d4.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249505
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The build arch leaks into some of the installed python files. This tweaks/adds
some sed expressions to resolve those references for the target and improves
reproducibility between architectures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e631050b5aebf90f4ed1a1baa79ef5e00fa13bf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index db1211c0c10..b870a3defe3 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
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
@@ -407,6 +410,9 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                -e 's:BUILD_GNU_TYPE\(.*\)=\(.*\)[a-z\-]*:BUILD_GNU_TYPE\1=\2${HOST_SYS}:g' \
+                -e 's:build_alias=${BUILD_ARCH}:build_alias=${HOST_ARCH}:g' \
+                -e 's:--build=${BUILD_ARCH}:--build=${HOST_ARCH}:g' \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
@@ -440,8 +446,13 @@ py_package_preprocess () {
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
