Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1CA612E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:00:06 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so158055914wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 06:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6LiOTCff9O2bLE/flBwnECpE5LpIsYvOlcfhwtsfklQ=;
	b=J7FEvqiMgB30UDfWQkjEesiybh7utqHuadA5iebQREIgwXNfvfFcpCXrDrIppwcIh0
	4trdzyD22N5vcEnsE+M3KTSAsed3T7DRB1MBe/Z4ibGoFcRccfnItPz12Uu2NyDSDYSv
	exiy7yg0RF5YMkCQpOWH330q77Y5R8r25BhOfnUTnaxZKBV0igXdnlZDI1dQD3LtVnt2
	MAbYLumyOYsvZ0I0Ofmm171/OCJt2X19zPigxV+ZRHzuY5pBHNz99B/pq3+YHfu9mLG3
	PtpmUOaaRRxLgWRAmO59Lu3zmCQpFBFNm1msif4JP+xgHtyT/j721xQC2ZpFfsh5KcUx
	qJNg==
X-Received: by 10.28.232.136 with SMTP id f8mr30431500wmi.1.1448892007541;
	Mon, 30 Nov 2015 06:00:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	da10sm46774973wjb.22.2015.11.30.06.00.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 06:00:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 15:00:49 +0100
Message-Id: <1448892049-873-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][dizzy] layer.conf: Add missing dependency for allarch package initramfs-framework
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
X-List-Received-Date: Mon, 30 Nov 2015 14:00:07 -0000

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


