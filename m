Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 379026B925
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:28 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so184348eak.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=liHuWICNnL+pDoWAihF7WwF4lw1iPtiNbq/MYUkl1Jo=;
	b=yNAJvdxXpPw9lZDPXxoKbQPssg8JW8NG8znrH0UT1XzCwIgjQrHvrzEuz4IC7T8DcZ
	gr+9/BtV4KtC98j6KLsaUbN1HQ3x+DYTQ4V7BvwqTxp6tb4hwh1jBiECboJH0F4b5IRl
	0hZ/G6L9psJ9bMhN4PxS/t5X22mGftpqfhqPry19+Z02PasTbjt9oKbqxIbBRjlEbzZG
	iI86Q4GB67ONw8fkVFOX+GypUHbqP1H5mfqtPHO4IjhvZ48uFBrOMOEPlfagk4fii1um
	+H/e5MFThsKCXrKVFxO45qLhw2zO/jOh0YfmRRLUQU3MQrpWFfNb97M8AfXt8S1U60I6
	bFTA==
X-Received: by 10.15.91.3 with SMTP id r3mr20859345eez.4.1376551408651;
	Thu, 15 Aug 2013 00:23:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm7600400eev.6.2013.08.15.00.23.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:39 +0200
Message-Id: <ba9256e57e803fb6afb5391af00311efa8c163c5.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 28/33] sudo: add PACKAGECONFIG for zlib
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:28 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index e778485..cc31c5e 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=d25a8240ca6decdecb9990789e593130 \
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
+
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
 
 do_configure_prepend () {
-- 
1.8.3.2


