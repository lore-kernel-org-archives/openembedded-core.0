Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D338A60959
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 09:16:16 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z11so4415579wgg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 02:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FEEZZsVWsiEoYgOhamdNQOkbHdwLniio5pBHiNRb6sk=;
	b=dblE24vh2+V00pu2ajFJKUEqqDQlUAJIXAUom+YzbUSnLL1rzRWw4n1d8QyFcFryv1
	fHlsw5IZRWCV8J1R4VzEoTIbe8SnJ5c50uV/n1JTlrce+jRMFr7nkEcOwECbHhd1ekju
	OZgGWA+PF05NkKs0dlLtLmAHkeb1y7wX1PCNKQwQzUgBcRiIUzJ62F7AnXfpJ5axg3Hd
	k5Prpy6nGegSdlfQzRw4W2p71gC20TdO3XnXRxKx+DeIDZHmldbEKIZV7AgQ8Dc2+jT0
	TSa1S66yQqLIgpg+tjvKAHMM8tcmC0XnF2Z1DBdg4qItlf2zn8dA3ReE2ghaabVlF0vv
	1D6A==
X-Received: by 10.180.21.167 with SMTP id w7mr7237266wie.2.1371546977394;
	Tue, 18 Jun 2013 02:16:17 -0700 (PDT)
Received: from flashheart.burtonini.com (92.40.253.27.threembb.co.uk.
	[92.40.253.27])
	by mx.google.com with ESMTPSA id k10sm639202wia.4.2013.06.18.02.16.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 02:16:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2013 10:16:10 +0100
Message-Id: <1371546970-7034-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmy76ByhKox/6W9qAj4B0gNjwWp0UbzNoUpVRBEql/vv34sx5Vu1dUlU69mJuzwMe51tYyc
Subject: [PATCH] core-image-weston: add weston-examples to the image
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
X-List-Received-Date: Tue, 18 Jun 2013 09:16:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/images/core-image-weston.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index e49b205..cb9d7c7 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -6,4 +6,4 @@ LICENSE = "MIT"
 
 inherit core-image
 
-CORE_IMAGE_BASE_INSTALL += "weston weston-init gtk+3-demo"
+CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo"
-- 
1.7.10.4


