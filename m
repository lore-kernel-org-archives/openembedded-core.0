Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 876FC6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:00:20 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so158067694wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 06:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0qvvUqXSDlzqNeWbnn+nkHS63B080kCoVUIpaWQtX1E=;
	b=N/NOv5RQiUYyHSqGltC4fZmzNNh+d/JB9JAplCGAV+bQHY9bhcwb3NbbDAN6JIO4rM
	Xp7otYL7yotc2gYYyyrKkm3xqwBi/sYhygEP+XLacqv03ABgpeJk3eJW32iIl5dl9BDl
	KjlB0o4rc8hx8e9cVf6VQj5ZPuPpyA39nQyrKekvzOxRxIIL3GEVprnjo7tBaUiQ7Rgm
	hdLUSsL1bpbMTKjnv2F9J0Pyk4MRKrQ4P4xbOeVdHHF7siMGijLMuPV76/+LFccfSmUx
	UHK/of9AtQdXOFjkoBU4por56M4MvpD7D9TlQYy0vHqagL23ryO5gKN7fsuwWpKGuyaS
	Ejng==
X-Received: by 10.28.96.4 with SMTP id u4mr30178065wmb.52.1448892021163;
	Mon, 30 Nov 2015 06:00:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o65sm21701901wmg.3.2015.11.30.06.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 06:00:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 15:01:10 +0100
Message-Id: <1448892070-969-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][fido] layer.conf: Add missing dependency for allarch package initramfs-framework
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
X-List-Received-Date: Mon, 30 Nov 2015 14:00:22 -0000

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


