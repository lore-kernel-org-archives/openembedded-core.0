Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6B5D738AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:06 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id zy2so4801173pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bzwPmt6AK8+tpYM2VqEaNW45CX6/SeVR/tvjZtJyrXw=;
	b=WJMS8Bw5yJzb3DD7uZgIdS6f+9dlE5XjsIONLyIn9rjBhqDE0ZiVzx0/X8vTGTihD1
	bWGTQDxahJAqWxuLfMy5Nv7GLPaIXejvChHjpmn5CUBs8QmcMDTm81lkGJBY400MkwsL
	1ZOd0GSfRS+SRzyjX2KSXeOAIudfkAMGH0T6Dlu8/iS4LwWbZ9f5cc8sI89N41FhiWRK
	UHPa8oW7bIX6Y+qMRKgbqHG4dsM0a7ez3T+ocWBYXbTnixWhnAHrsdURfJgyfMhzgNbh
	DY8+y2kgFRCT8G4XPWrPQrtE2ON5+oDoqfuuAkN8mLNmou9sPzkaZWaEcyHW3uO7RKtj
	kQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bzwPmt6AK8+tpYM2VqEaNW45CX6/SeVR/tvjZtJyrXw=;
	b=IcHe1UrEaXMPHNYtgikI3CN/TCJkW5JT1ZltTQ8sNGP2KakvYdLpl6lQcWkqMbuDp1
	yy9oMAh3NvKpsEFVyOcCkHkH70ip1I3QtifOQOHVQSK9ftLZFKhf37yonJbAim2ojAON
	S+MSivljZUqPHRfNlPyJphpD7eMWZ8lj5JmSOkzS6ipG7eRy16YEinMj6uoyzoBq8QaO
	5/g4LCbYO76hx2HcTPAy1JWQc+/ALrtXe+C+irjEEl0CScmppHw1olE0lavIjJyzbMMT
	dBPh3W1MoZXszVwV1+n+/AchEvLfq2UPNx3zX6HwzQ47dCCWXUFAtAtGJ+cKqotkyh5z
	mACw==
X-Gm-Message-State: AOPr4FXD4wkXvCQgHGJqgka89pU5ks9WHSSnFQU0MsxlCb/riNZfFUg7XkZo2QpZIUx7rA==
X-Received: by 10.66.160.133 with SMTP id xk5mr6718459pab.71.1462988167178;
	Wed, 11 May 2016 10:36:07 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:16 -0700
Message-Id: <2e292f91ae41374ee06830304150316a3125ba54.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH 13/42] binutils: disable werror on native build
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
X-List-Received-Date: Wed, 11 May 2016 17:36:07 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

It's disabled on cross builds, and it's needed for gcc 6

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/binutils/binutils_2.26.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb b/meta/recipes-devtools/binutils/binutils_2.26.bb
index b70ffbf..e976bad 100644
--- a/meta/recipes-devtools/binutils/binutils_2.26.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
@@ -13,7 +13,8 @@ EXTRA_OECONF += "--with-sysroot=/ \
 EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-                             --enable-install-libbfd"
+                             --enable-install-libbfd \
+                             --disable-werror"
 
 do_install_class-native () {
 	autotools_do_install
-- 
2.8.2


