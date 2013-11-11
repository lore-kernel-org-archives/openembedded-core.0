Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 667856D320
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 12:21:17 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id y10so956411wgg.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 04:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BGPrq7F74zkFEaXlys6uaEryb8cBnF4vObAO2jlqPuc=;
	b=QpIRjI+ZxvjQFkhjcu8c5eL0N17rrx5h12gGcqCfeaih4rdJDA5fu8JhDlzuYG1T9s
	BFqF4+KMU/WGBWcCHqftPS9OFh+7b61ocKKZNV8K5Ap5AqgL4QRuXEN+9T84QaHG/Rx1
	PkNtpc/2ALOLtiRzpMcY4rf8k6XBUz2d6yLoYAP5riFGpAZH5oKMkrvFC6wVBfJ9eBfA
	iQ9WrxIZriuQ4k70YfxhmyTl5QOyH+8DvSWzPBxK+GkrtejI2gyy50REh9N7osSxBfqg
	YlQNMHgi0cQxER71FTuZ8Vq/M5oWk1Ngxu5MR88CRPb5SQS4V5ovCkxXFM7/WDO5US3H
	AtBg==
X-Gm-Message-State: ALoCoQkrI0rx4+ILdEgcCCXWUlBJL9FsHGbvxAHKaLvtNFZgV2TtKrFcZjjJyCB9qyQHRATP/t5h
X-Received: by 10.180.79.163 with SMTP id k3mr9620564wix.34.1384172478040;
	Mon, 11 Nov 2013 04:21:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dz5sm9709918wib.7.2013.11.11.04.21.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 04:21:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 12:21:13 +0000
Message-Id: <1384172473-23158-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] core-image-weston: add SSH and hwcodecs to the image
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
X-List-Received-Date: Mon, 11 Nov 2013 12:21:18 -0000

core-image-sato has these by default so add them here too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/images/core-image-weston.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 187523c..30cc845 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A very basic Wayland image with a terminal"
 
-IMAGE_FEATURES += "splash package-management"
+IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
 
 LICENSE = "MIT"
 
-- 
1.7.10.4


