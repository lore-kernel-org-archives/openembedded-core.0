Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 32C136FFEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:41 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c201so33847030wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0qvvUqXSDlzqNeWbnn+nkHS63B080kCoVUIpaWQtX1E=;
	b=kWQ9BSkIr4sa9rjz9PpIS9BpKBKp8Tdq9kFZqDoRZhQzivZi2EejT8vfMuyuPjlKde
	uvscwIQg0EFRv5a9XN1twL+Pnx+dmacEbOtg7MJPTvo3nfErp297KYHn4YOX2/7vEQw3
	Wid4UmpnyXbD1B7S2Djt9QQGBtnSOtF8iQvuUDyQUrDX1YMgavj1+mlCYJBDf+2xKVhI
	BnkeTkI9m/d5ISelZEDs4okAYOAQuRZUyBBT0FRKUx0Shh3nCv0X/XASAFHpiyizUz40
	410oi8XxvRQuQT7En/GaFXhb+igFaOYFtRPRlhJQy9vSWi7IRYTfM53U+43THTPJ+2XF
	svMg==
X-Received: by 10.28.211.203 with SMTP id k194mr18105788wmg.4.1449755202229;
	Thu, 10 Dec 2015 05:46:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m191sm937900wma.3.2015.12.10.05.46.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:18 +0100
Message-Id: <3582f0dafa24ea9349afdd12ee9a72a617a2c143.1449754339.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
Subject: [PATCH][fido][RESEND 2/5] layer.conf: Add missing dependency for allarch package initramfs-framework
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:42 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similiarly to the other previous changes, add a missing allarch package dependency
for initramfs-framework on udev.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 4880371..77168ed 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -50,6 +50,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   initramfs-framework->busybox \
   initramfs-framework->systemd \
+  initramfs-framework->udev \
   liberation-fonts->fontconfig \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
-- 
2.6.3


