Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E30C5731EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:30:57 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id pv5so24097395pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=snfBFtTi5D6KVSNmp2RTA+w8B6N2PNEyTHm4cgQtCpU=;
	b=tUvR6jGNFKT26ZwdBMo9DsTQ2L/RXzI1HwgIoGabI+PtahDLeJNilM6s2HY/Y5YeFt
	oys1r6pfdHpM5VBEI9GmRZnMiZ7dXsNS+cqo00VwxJHdK5rHbbiXRiZP+O5wBQiH7NRx
	Iu/pnfdGUJq5jew1Y0KPmUawCghWn+RT7/aD3JORBPzyZR2ik7S+Wmqa0j2sN6L04UEy
	9KGkld556k/NTRsZq2nQnt9AT4Kpeb9E/EccZnuCrvpiVt1ORx6M9N6708Co1hnAfeUI
	Xmd1v0TBfaYotwb2ThJPqDvNihuX4BAlHvww14ll8Bcc3xg6iyNvZNtJR8pBFtn/Tcl+
	ubHw==
X-Received: by 10.66.236.129 with SMTP id uu1mr65962557pac.158.1452385858555; 
	Sat, 09 Jan 2016 16:30:58 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	y86sm13701331pfa.26.2016.01.09.16.30.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:30:55 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id E64E2FCC839; Sat,  9 Jan 2016 16:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:34 -0800
Message-Id: <ed5756cb6cbd878e8ac612475c16aaad13c7aff3.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 08/20] layer.conf: Add missing dependency for allarch package initramfs-framework
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
X-List-Received-Date: Sun, 10 Jan 2016 00:30:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similiarly to the other previous changes, add a missing allarch package dependency
for initramfs-framework on udev.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


