Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F88C6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:29 +0000 (UTC)
Received: by wmec201 with SMTP id c201so25490149wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6LiOTCff9O2bLE/flBwnECpE5LpIsYvOlcfhwtsfklQ=;
	b=yP7aXHwWlaJ6XPvHEIUXcQJWPdb+p3ZniKPczhdDiQ7PczyeMogKTBTPrnTg9DISm5
	+FdRqfwfOiaQa0TDry2dple8fZ/IEUhxKTEBAsvtEunQScRU7ohWftsMlWIT3phPZvS8
	IUgRyG80y2whEtw2OE0+kNPMzLYb2KshZ6Q5oyrBayCNQO/KYNWMNfpk0RBN6hQYBsEU
	uGWWcJ9qgtKzQA0qLto21UOARxvAQu7iFj+O7pj6n2/vsNJv/JZle1JGJD/MmNLst29I
	iXw9eVfhIIjdg18YZvFvgnf5cqZA5gZ29UAIe0VhynLpH94cQ1k4Xx7pwcFB9l4C7NQW
	FYnQ==
X-Received: by 10.28.214.143 with SMTP id n137mr43193295wmg.2.1449755190565;
	Thu, 10 Dec 2015 05:46:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s11sm13049362wmb.14.2015.12.10.05.46.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:02 +0100
Message-Id: <b2541ae73fed1cef8fc68814bca395b5631b9556.1449754336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy][RESEND 4/7] layer.conf: Add missing dependency for allarch package initramfs-framework
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:30 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similiarly to the other previous changes, add a missing allarch package dependency
for initramfs-framework on udev.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 047292d..5b47cf4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -48,6 +48,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   initramfs-framework->busybox \
   initramfs-framework->systemd \
+  initramfs-framework->udev \
   liberation-fonts->fontconfig \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
-- 
2.6.3


