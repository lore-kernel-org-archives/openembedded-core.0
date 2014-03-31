Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id DE64C6F87D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:39:19 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so6092144wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8AccfUxx62MTudkJbkgA+Tp4+OaMvzbPtBq57d04jXg=;
	b=Y8WCHSwN8fFTy7b2yz94xh1Ce1L6wROALSfHoirqB+ZN/2GFt7Jy1pOHDQoZ9PMz0w
	AE6h3tsPFCFvyCSmqTVwWghljNj5yM2JJisbFPMDib4zpFtIIXdW73B3sqfy8fXjJTbl
	eQKw1Z1VtorD8bZlfotSlkjSzGkIvIm7q8xETjbdM2esrWR3LvibUjtIby8CrfrfgZ6N
	TqhCXDHkxBB+5eArk7tUC87kvVoqgfxgS1TFiWR5zs8LaLUWYWf3SbSrk2L9/0/uGgnx
	KIF/HGfnVp8GFncVVM/b+dFm/PyNdsBwvsC0ovHPu+q1ubi6vaHS1HEpO3G5icCummCh
	W5XQ==
X-Gm-Message-State: ALoCoQmyrmiNg7MqhExSIcpiNTITwCSrwEX4I4Vb9LwY+UKAMEMUW0gWLpsnRwQpoBqpjwNbEF3Z
X-Received: by 10.194.189.80 with SMTP id gg16mr5007944wjc.84.1396283959514;
	Mon, 31 Mar 2014 09:39:19 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	t10sm27576020wiw.19.2014.03.31.09.39.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 09:39:18 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 2D8D4560247; Mon, 31 Mar 2014 17:39:20 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 17:39:19 +0100
Message-Id: <1f7e36d6938c1376181470a3cdcf51749dda51a3.1396283886.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <7445f7145ee425302da5b9d1ca77e3448899b78d.1396283886.git.alexandru.damian@intel.com>
References: <7445f7145ee425302da5b9d1ca77e3448899b78d.1396283886.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1396283886.git.alexandru.damian@intel.com>
References: <cover.1396283886.git.alexandru.damian@intel.com>
Subject: [PATCH 2/2] toaster.bbclass: the license.manifest is located in DEPLOY_DIR
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
X-List-Received-Date: Mon, 31 Mar 2014 16:39:22 -0000

From: Cristiana Voicu <cristiana.voicu@intel.com>

Replaced DEPLOY_DIR_IMAGE with DEPLOY_DIR

[YOCTO #6051]
Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/classes/toaster.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index f55a4d7..9fb2cec 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -299,10 +299,10 @@ python toaster_buildhistory_dump() {
 # dump information related to license manifest path
 
 python toaster_licensemanifest_dump() {
-    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE', True);
+    deploy_dir = d.getVar('DEPLOY_DIR', True);
     image_name = d.getVar('IMAGE_NAME', True);
 
-    data = { 'deploy_dir_image' : deploy_dir_image, 'image_name' : image_name }
+    data = { 'deploy_dir' : deploy_dir, 'image_name' : image_name }
 
     bb.event.fire(bb.event.MetadataEvent("LicenseManifestPath", data), d)
 }
-- 
1.9.1


