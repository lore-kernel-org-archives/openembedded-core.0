Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 21F0A601A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:38:02 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id xp5so2572548lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OaKjSwoIQeefcbSuMtz7Vgrc+ziraXUDOUI1nJH6WKU=;
	b=Db6wWXvF6xIBNgYBc+uJBhFMaWJwuJVYOcD+ua6duhAQrrszlJMFrLeJu9kh/4K8q2
	buHnrCoN0kp92AzKA+T7TSGz1M22EWC7m5LRajwPIj8it7Kiiq4YtU5xoCwbXrYOO5vB
	fAW4huoLu1a5Zw8fnGUql8WUMf4udK+/+pTBDggoIqf6INCV7dynUuj+B3bDMHT9MNYC
	dKxGartPPZNcCwHTPvPs3fNVUne2GXP7LHmoNuefXXdMMPVm52hDf4o5dBtMJFiuE9Tm
	mUNhIFfwlL6s5SwuCxVhWDrGc+Tl5RJ9g7+PPY/WJa3gB1W/G10u2j71nz23LJpmHSbc
	eDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OaKjSwoIQeefcbSuMtz7Vgrc+ziraXUDOUI1nJH6WKU=;
	b=jhR/5GXscpB9xVmEi105PAS07fXQL9e/YLVufh3hZsZ8HYIrn/iofVVhRkb5mdzEwg
	Z/WDleOV3o/qLUY7deZEgAFXOtpo1yvAIN/wJ+ClesK/SgjQ1l5YZoujPcR243GyebYW
	G3oFqUs5u6yVoeEvA+LcEXHmpICs6/sj8jmuPAyUYozS1K/QX318jCyKQlDMe6b0JpFH
	ao/PUjZkuwvlOwpNEhmn/fSPBstBqkDRpP4hzKpoqEUnZ90vS30KsLaJb4tNsqByHMrO
	6MoWSTfqzjEuw4iFGeXWiprp6BvJbHGKo4IcKTAm33VNNfVWEYsEkGRcpl852meidrwM
	IFUQ==
X-Gm-Message-State: ALyK8tLBrHhyGbaWbW/hoCDRfPeuwrg6FgMFzw35f1Q56g3/EcahgZCFiJoNBbYO3k6BY26f
X-Received: by 10.194.58.162 with SMTP id s2mr13333397wjq.37.1466001482550;
	Wed, 15 Jun 2016 07:38:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q63sm344924wma.0.2016.06.15.07.38.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 07:38:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2016 15:37:59 +0100
Message-Id: <1466001479-10764-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] core-image-sato: add gtk+ for M1
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
X-List-Received-Date: Wed, 15 Jun 2016 14:38:04 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e3246d2..b93bf23 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -8,4 +8,5 @@ LICENSE = "MIT"
 
 inherit core-image
 
-IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
+# Add GTK+ to the image temporarily for M1 testing
+IMAGE_INSTALL += "packagegroup-core-x11-sato-games gtk+"
-- 
2.8.0.rc3


