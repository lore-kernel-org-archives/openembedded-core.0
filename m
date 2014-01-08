Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7F66D05E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 18:36:32 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b57so866009eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=v1TB4LHDYB0HxdGHP/7EwJTng5Lml6D/UbNV5cv8PS4=;
	b=OXRBYTD/tZOPVnn7GDJbxtom0fIO56JC5in0VgBJyagyANrHxhyZCttBwLgwl6BC13
	0DpI/2a6+3b4niMYEqeCpBj9XSIp1XvJoQDN9E3h9EU9y5A50+/ggU3YiFgtHU5+1+D7
	dyJdxqolhEv3f7bYGfUpflE+TVggb67WVx/9jzBuFevUaLRFlZswVZ+OxipS6DVOzkqz
	+Y7Z3uDsn1kcrYaXMcGdgcZOTmLfZ3EGtU1/o38UZpbztlbC1E7BLIoyd51xCLefF6i7
	ORjhBV7WsFPfYzjt5nCES8/j8IOtcukwAcmw8mxoo42yhT2z4I7VyFmpaAsKQLmCF5rD
	xcvQ==
X-Received: by 10.14.2.73 with SMTP id 49mr100962221eee.15.1389206193238;
	Wed, 08 Jan 2014 10:36:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm191758715eef.9.2014.01.08.10.36.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 10:36:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 19:36:36 +0100
Message-Id: <3b5640a0bf9be0e7279be320149e92fd3bafd7a0.1389206129.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389206129.git.Martin.Jansa@gmail.com>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389206129.git.Martin.Jansa@gmail.com>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
Subject: [dora][PATCH 3/4] Revert "kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux"
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
X-List-Received-Date: Wed, 08 Jan 2014 18:36:33 -0000

From: Mike Crowe <mac@mcrowe.com>

This reverts commit 3baa63b4d588c3262254528b406ede265dd117bf. It broke
builds that aren't using kernel-yocto.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 61a6d10..1374e68 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_kernel_link_vmlinux before do_build
+addtask bundle_initramfs after do_compile before do_build
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-- 
1.8.5.2


