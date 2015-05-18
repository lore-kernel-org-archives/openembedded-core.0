Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E815A6E6CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:07 +0000 (UTC)
Received: by wibt6 with SMTP id t6so76529555wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tHYemcLatGK/fr1lpvRteqlEny16tOb+dmACsAyoKK0=;
	b=MgJ3SPSk0ZVkaTVOdYBP2LDBrX+88aj9Jks24Ab0gOZS3rGLfTeaD1O8OPqvLrJDQh
	+Lcz84DphWNkAqDWh+Qel+/0iC97y29oI3dukbE7EWgqQmMwNetOfpMgyAwaKMy08ZVr
	PuulBehxuN5LHWMypIJM/peoR6y70Tvof7dlGsMDL4/wLfB5cNib4WivEQsdNvD+MJqD
	yqVwrlik/7waMdCcKkvCUP4TxCjcOgj6+7JR8v7XeGJ/Es1pC4LjcMVGc3YYXDLlHsjN
	jLTbvYukSctCFW17OfYsovyH4rS+9ja1Rw59D0GwaNZtBClUDAY497tqxDkDSVY0U0h1
	VtYQ==
X-Gm-Message-State: ALoCoQmgiPQQQsQraHmUs551WiyirV2bxX6LN5qx1w7nDXIXzKEtYjtmLowjCcdQHRLkp0XGwNRb
X-Received: by 10.180.101.105 with SMTP id ff9mr23453423wib.64.1431967808518; 
	Mon, 18 May 2015 09:50:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:30 +0100
Message-Id: <1431967531-25163-12-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 12/13] libxvmc: upgrade to 1.0.9
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
X-List-Received-Date: Mon, 18 May 2015 16:50:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxvmc_1.0.8.bb => libxvmc_1.0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.8.bb => libxvmc_1.0.9.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.9.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.9.bb
index b0d5e0d..41e8498 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.9.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[md5sum] = "2e4014e9d55c430e307999a6b3dd256d"
-SRC_URI[sha256sum] = "5e1a401efa433f959d41e17932b8c218c56b931348f494b8fa4656d7d798b204"
+SRC_URI[md5sum] = "eba6b738ed5fdcd8f4203d7c8a470c79"
+SRC_URI[sha256sum] = "0703d7dff6ffc184f1735ca5d4eb9dbb402b522e08e008f2f96aee16c40a5756"
-- 
2.1.4


