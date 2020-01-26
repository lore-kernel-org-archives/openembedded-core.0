Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id EA251916C0
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:04 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id p23so2853773plq.10
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VJcgys1BEQNPimbAYP6oNGoeglmOH+wjxTwrfaV6HnA=;
	b=mxBzPTU3nfKuxZbFCpoSahumZBtFJ/uVh9nd1Q09kJv8K0Gl5qWg9RS4aoLFaAKUXR
	mGfetdtoWuxjUHCPH/bc89f/OFO0R6z6/MNOqiyBMgTLdOIIM3v+x/Bvu7V29fSJVY1I
	bwoLResS4FdM4BoL0quLghZuVC/2iokth7MXVYuIv3VdB/crQguQRMNA0Z5AmuURvWE5
	jkTmSteQ6kSVGdZuEquSHegEdTdhTEkPAX1+WHj59pH9TPWYvYim+vM05BcnRWo0SkF8
	ZacosUMbwf5uFCH27A8IoJHTs6gQX/X2ptqOWG0+yIQEpkinNC1QhKCkJ72wkctVtwSh
	3YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VJcgys1BEQNPimbAYP6oNGoeglmOH+wjxTwrfaV6HnA=;
	b=G74zr8ZdI2Ai8sAvJPBUV7s+lkXu/eT/wPO2qVTLNm3nlhVET9UXm/r8mKxnxworB3
	39HyXkvqHxObZR1DZh0o6VAPj9rIMDxpvFuWaphA9EB3AvpbC3eHph0TgE7xX/WkED2y
	Av98z8vWTuAgTnYS3XYEfc/LzrARENaOwM1sHrZDbLgXST9zyg7ZF3LSAp3+BtpAudl4
	3TiiJI7rhaBLeBYeX6PNoAW5q4cLs267IQ7nORA+TezjdxaWo1naOKtSQGYXsIgiXvgW
	BnRIuDC7yOrPEXgF2dWJXmH3vpkJDXtCOhlW+bfQOR9ZCLChez+ClGOT3iCE+ZlfUS+G
	SCkQ==
X-Gm-Message-State: APjAAAUyBRREmfr0hAR/w/P3YZxXCgVwWeILbknZaJZBewR9ugxABSwl
	ciXxuqtj3cXqtLaGpXWq7vtTEJnf
X-Google-Smtp-Source: APXvYqwLWKUaFdQQDph+6ND8/lkKQMh34H6T6wEK0YHdtd2mzt37diRIeRuqhLnWcm9H5Ca2GCiyQQ==
X-Received: by 2002:a17:902:ab91:: with SMTP id
	f17mr13739030plr.172.1580055905806; 
	Sun, 26 Jan 2020 08:25:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:36 -0800
Message-Id: <de04ec5dcf72d76f2e8274af4bcddf27cb02e544.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 11/29] glibc: fix CVE-2019-19126
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jan 2020 16:25:05 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Backport from 2.30 stable branch and drop NEWS section.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../glibc/glibc/CVE-2019-19126.patch          | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.29.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-19126.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch b/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
new file mode 100644
index 0000000000..aead04c485
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
@@ -0,0 +1,32 @@
+From 37c90e117310728a4ad1eb998c0bbe7d79c4a398 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Marcin=20Ko=C5=9Bcielnicki?= <mwk@0x04.net>
+Date: Thu, 21 Nov 2019 00:20:15 +0100
+Subject: [PATCH] rtld: Check __libc_enable_secure before honoring
+ LD_PREFER_MAP_32BIT_EXEC (CVE-2019-19126) [BZ #25204]
+
+The problem was introduced in glibc 2.23, in commit
+b9eb92ab05204df772eb4929eccd018637c9f3e9
+("Add Prefer_MAP_32BIT_EXEC to map executable pages with MAP_32BIT").
+
+(cherry picked from commit d5dfad4326fc683c813df1e37bbf5cf920591c8e)
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=37c90e117310728a4ad1eb998c0bbe7d79c4a398]
+CVE: CVE-2019-19126
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h b/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
+index 975cbe2..df2cdfd 100644
+--- a/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
++++ b/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
+@@ -31,7 +31,8 @@
+    environment variable, LD_PREFER_MAP_32BIT_EXEC.  */
+ #define EXTRA_LD_ENVVARS \
+   case 21:								  \
+-    if (memcmp (envline, "PREFER_MAP_32BIT_EXEC", 21) == 0)		  \
++    if (!__libc_enable_secure						  \
++	&& memcmp (envline, "PREFER_MAP_32BIT_EXEC", 21) == 0)		  \
+       GLRO(dl_x86_cpu_features).feature[index_arch_Prefer_MAP_32BIT_EXEC] \
+ 	|= bit_arch_Prefer_MAP_32BIT_EXEC;				  \
+     break;
+-- 
+2.9.3
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index c6b2caad42..28af4d1ba4 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -56,6 +56,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch \
            file://CVE-2019-9169.patch \
+           file://CVE-2019-19126.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


