Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2539C72440
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 20:28:58 +0000 (UTC)
Received: by wgjc11 with SMTP id c11so64872851wgj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZJOiZCP38P2CBr10tYYjgea7N+6IF6S9z2Gph65yLuY=;
	b=ALOm4iuLYtS8Gdw6cD+PPGogJKSC6GSFuYmxKO2H+99M/1giXLIuF2TeV49HOn9H0p
	ztfJrn1noN329lLNblU2IKQE6HW3SB0Ukfl6amU7POCbhZVZav5/TGufXAPMFKSyrTlE
	A6UC9POyo/6qaWoWCOAo8QeF6mxbEG34CxdnanEWc7pEhTbxxg+GhvCEGAEnsRpo4stc
	oZ8VehF+QV8xjsAIOjxBMKvI+l+KD4XduySTqVucw8ewcwfa53uvWRJQSf420YwrcZnj
	pPlbB6BbT4AApGQyS32sHrYv8PzAbAd/yNW9uI9FaSnEodwcXdyG8BHKcndCxZIm1q29
	p3wg==
X-Gm-Message-State: ALoCoQncnW9ab/6nLa4hi1X603vUZOrgZLl0UpEHTm8hvdr+997ljLAba6wYWx3LiQRFPEZ7bZn4
X-Received: by 10.194.249.201 with SMTP id yw9mr9914054wjc.5.1432153739582;
	Wed, 20 May 2015 13:28:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id b10sm5208846wiz.9.2015.05.20.13.28.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 13:28:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 21:24:38 +0100
Message-Id: <1432153478-5784-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
References: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] xvinfo: upgrade to 1.1.3
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
X-List-Received-Date: Wed, 20 May 2015 20:28:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-app/{xvinfo_1.1.2.bb => xvinfo_1.1.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.2.bb => xvinfo_1.1.3.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
index 8ea1ca0..2965ef7 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
@@ -9,7 +9,6 @@ extension."
 LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
 DEPENDS += " libxv"
 PE = "1"
-PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "1fbd65e81323a8c0a4b5e24db0058405"
-SRC_URI[sha256sum] = "eed3d90ffd788ef728c4a5e7aa4bd86dc6bbcebac929caf7a0479cf8b53b50e3"
+SRC_URI[md5sum] = "558360176b718dee3c39bc0648c0d10c"
+SRC_URI[sha256sum] = "9fba8b68daf53863e66d5004fa9c703fcecf69db4d151ea2d3d885d621e6e5eb"
-- 
2.1.4


