Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C6BC98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:26 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2944.1790154744807095959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eI9Jsllx;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2342395e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154743; x=1790759543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ScJJ8mffQPxpH3Exsunanxo08v4Z+2DF0ScW1l3dgSU=;
        b=eI9JsllxXaBL6igTVTCyjfUv8Zd2RlQTCp/9tE55oKaTPMlvpt6/ZfTJ87qUi+JJTi
         8WFuZqdvWeez0Hepgapz62yHSr90JkOktRSsjlH86wvyX6fBEQGunTwsadAp4XiKOnKx
         EGuvbiwvdRCxdqTjEByGibeNlBtcujCpBLQuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154743; x=1790759543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ScJJ8mffQPxpH3Exsunanxo08v4Z+2DF0ScW1l3dgSU=;
        b=GIRB0ZHfFK641QmpxgIgP1gDjXSA3sF3VFYP9Z7Gqq0bES0odN8qQvPcssKUWRS+lP
         Fwh2FnpMt+rUzajEHJYsh7wF5vRvvfoF2P/RFVh/HHzbl5XQeALXaru+TgqRkoOH5CoM
         LmRmcIqKpy/aQvnTBcAigkTmVRzZtY14JfMRPp7tdtZCW9NXi0xvhXgoUN+QwT9QXfMD
         xjpknKereinW6lg2OzFzselP6aH8fe3fh8L/Hk/19/gGTMA2zLDY3RQjd3Zz4t0d1qGy
         BgasjwrPeViTIUWwaOQEFh5BfEdsopUGL9jQkGdC/q7Vvkhe9xaL4PU/5sQ+ZN/gm3Ir
         +Y/Q==
X-Gm-Message-State: AFuF++nWSVEcEug+7DwjkdgzHCiIxzPoOSglsCAXpUFYLAQddfKvigYk
	HUXy8PJWowG4qk/47Hv87TwEl6LqxQppz7w3MUAf0vi+YnDu9AYSlray7lQpqQPM91sqZr/koNZ
	NfKeu2+c=
X-Gm-Gg: AYBFou1+Nnbztga4d0X3dOcRo9OahtdRDLWGaTANNEkwbzt4lZKGqQiqVFUumiFpD34
	vIdjktHG9fK8C+0uz5pnLyTLIxPGXvDv0m9bVxkwiHIQmjI3KIXjBcsLULCeX7EELTtLqA7jXbs
	2bqKnyr4DzFjsUiZX2S1OTQSwslllh0JpJzjJWYYPc0BXywF5+3B8J3JoSqWZozCSxxIA2kq7HK
	ZTYutpl1Atj4HaaD3l20143aXbBt0OOY8cS5RVUlvGWfHboOcJZsBdk8wFAHwJ0ymroKCiKCDgR
	xEIVpSHxOks/uXRSJVwy3E8Wm7wWyzvrs7oMp3TPS2p6GOi79I+JabPSaplXJ6Tcz7mk5rQPHr3
	6O/sGBF6wAFRDlFnxQotF4/hCd8yCQV07oLeHpAzD+CJXi8nqNKUkm8q9pKKpMC+95tTFyfUeAb
	XKyHiAWSVgxJCDjXgH8NywJBABvJznWGP9guMjQeB2J/8fO0lV+aOoePktYoSc/HFp+SM843cvD
	5Ca5vOstaoWReAvMfoQGBbt1LNq7bTtuEED+RhGgAlpcFhs9NEYO2irgxTvmCQBVk2HG9Lz
X-Received: by 2002:a05:600c:1f90:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49fde20e848mr27541615e9.0.1790154742962;
        Wed, 23 Sep 2026 02:12:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 48/48] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Wed, 23 Sep 2026 11:10:50 +0200
Message-ID: <70778df2c2882f1abbdd4dd2f8d229ade720d8a4.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246510

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
as 32-bit. Without -D_TIME_BITS=64 and -D_FILE_OFFSET_BITS=64, stat()
and time-related syscalls use 32-bit types, causing EOVERFLOW on
filesystems with large inode numbers (e.g. container overlay filesystems)
and Y2038 issues.

Add SDK_CC_ARCH appends for class-nativesdk:i686 and class-nativesdk:i586
using GLIBC_64BIT_TIME_FLAGS, mirroring how target architectures are
handled.

The existing GLIBC_64BIT_TIME_FLAGS:pn-glibc override only matches the
target recipe, not the class extended nativesdk-glibc, so an additional
pn-nativesdk-glibc override is needed here. This is required on
scarthgap but not on master/wrynose, because scarthgap carries glibc
2.39, which predates glibc commit a4ed0471d717 ("Always define
__USE_TIME_BITS64 when 64 bit time_t is used"). In 2.39 the header
redirect turns sigtimedwait into an alias of __sigtimedwait64, which
then collides with glibc's own weak_alias() and fails to assemble:

  Error: symbol '__sigtimedwait64' is already defined

Also exclude nativesdk-mingw-w64-runtime. The MinGW runtime provides the
Windows CRT rather than glibc, and _FILE_OFFSET_BITS=64 changes its
stat declarations. That causes conflicting declarations for wstat when
building the CRT itself.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/time64.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index dd29105db44..c2a4feab24b 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -32,6 +32,23 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 
+# Apply the same flags to nativesdk packages when building for a 32-bit SDK
+# host (i686, i586).
+SDK_CC_ARCH:append:class-nativesdk:i686 = "${GLIBC_64BIT_TIME_FLAGS}"
+SDK_CC_ARCH:append:class-nativesdk:i586 = "${GLIBC_64BIT_TIME_FLAGS}"
+
+# Recipes which implement or wrap the libc APIs themselves must not be built
+# with these flags, as the redirections glibc performs would collide with the
+# symbols the recipes define (e.g. "symbol '__sigtimedwait64' is already
+# defined" in nativesdk-glibc, or duplicate creat64/fopen64 in
+# nativesdk-pseudo). The pn- overrides above only match the target recipes, so
+# the class extended variants have to be listed separately.
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-glibc = ""
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-pseudo = ""
+# The MinGW runtime provides the Windows CRT rather than glibc. These flags
+# change its stat declarations and cause conflicting types in the CRT sources.
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-mingw-w64-runtime = ""
+
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"

