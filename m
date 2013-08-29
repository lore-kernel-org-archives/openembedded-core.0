Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0646BD57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:02 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so350565eek.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rFNdNp2ZCK91l643QvZwHUKvypag8L9BH3YNXrET818=;
	b=T962zwyWkA8/3JTVkyPJfpm3Zu2+X1ypy6RGrZ6ezqAk4thkA6eWoG0mVY2N3f8F37
	7ykethp9OmEc7vB3OpC55pRD8UGOcrap16/rX1fP/z3XawfAB9bB67zxHJnUG+hAyF6H
	NjNWgxfcvMeuZafYd4eO8aHzI9STdzbF2cB9duLKx5La08twk4y6kYTxDYW1dOVb3YyA
	BkWxWtfMToEpe8hVx4r7neeDKY+kG+cVz+V3y3qCy/OJaeak6NwPxbJS2mVT0/igT/et
	c2l/T7DrKcahOK+LG1E0kmRZ5iMprHiXjNVrwLPUu9eH5pPZ7+2KmLmw7UfwwynAfjYE
	ymcQ==
X-Received: by 10.15.45.8 with SMTP id a8mr5505699eew.1.1377792122705;
	Thu, 29 Aug 2013 09:02:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm47246927eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:53 +0200
Message-Id: <e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 06/20] libmatchbox: Add PACKAGECONFIG for png
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:02 -0000

* enable it by default, because it's more likely that people were
  building libmatchbox after libpng than before
* with png disabled it also fails, because of missing csetjmp include
  | mbpixbuf.c:128:3: error: unknown type name 'jmp_buf'
  |    jmp_buf setjmp_buffer; /* for return to caller */

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index 244a495..932e484 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -16,4 +16,7 @@ SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= "png"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
+
 EXTRA_OECONF = "--enable-jpeg --enable-expat --enable-xsettings --enable-startup-notification"
-- 
1.8.3.2


