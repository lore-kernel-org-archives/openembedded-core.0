Return-Path: <jatedev@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id ABB9E61585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:46:54 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id nu7so4364245obb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=1bxJL7sw9r4j56VCBr5t4r0Ppjls/5vjWKBiL8xtdmc=;
	b=kA5EhbrOJTQc1FzcDVXTNQJ0zF7L9eJ/1/8Ai1gNaBC881VtQ1YHSzNczQ0EDOcnsO
	Oz0ymEuFgNTZ976rTawrvAuvm+sKdNe0nodvOhGwYAbYahFjne3bbyPbRtMJy3Z1Favr
	WXj/uleOssrKs3raNVq+vWQS85XB3EEqTzLwlvdKjg/7u73DwsTwQhtmRGG53xMY8yma
	9NTPAyObnArbZe40jwOCk1eKnOdR8NVmjN5fSH6xTip++gnoR77nlxDW+SJbvT4oEJll
	n5BD218g1OKJazTtd8OArYdDD392J0FXCtAuu4ZzRvVPzoJsAVWX0vrOAcaLazed3ckR
	+AYg==
X-Received: by 10.60.144.169 with SMTP id sn9mr837660oeb.75.1405349216112;
	Mon, 14 Jul 2014 07:46:56 -0700 (PDT)
Received: from STSPYoctoBuild.syntech.org (exchsrvr.syntech-fuelmaster.com.
	[199.44.250.2])
	by mx.google.com with ESMTPSA id g7sm45802883oex.10.2014.07.14.07.46.55
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jul 2014 07:46:55 -0700 (PDT)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 14 Jul 2014 10:46:43 -0400
Message-Id: <1405349203-32702-1-git-send-email-jatedev@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] python2: Add PACKAGECONFIG for tkinter to support tk from meta-oe
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
X-List-Received-Date: Mon, 14 Jul 2014 14:47:02 -0000

Previously, the python recipe did not have a way to add a DEPENDS on
tk.

This makes the option available for users of the meta-oe/meta-oe layer.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 0d64172..cc54296 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -42,6 +42,8 @@ S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools multilib_header python-dir pythonnative
 
+PACKAGECONFIG[tkinter] = ",,tk,tk tk-lib"
+
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-- 
1.7.9.5


