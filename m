Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C3C9A600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 20:28:56 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so64879962wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sXE2045I9/T1oetDYKRZ2l0v5371uZ8d2Pxp/HkvMzk=;
	b=FOEM0tFhJMDuS6f3zIUTFPa/6ShkjYjo6UFgZs1dbmEm8biCPYGtZkV01c1+R3XQGK
	ziYLJfrdcrQSa1Gpg1c21d/RrlXM+d5J8VxA6kW9FHYKQQLVIm8g3S/Y/mfcU9GLk+KX
	RmxXezqz8AB0yJ6VInzyG8oRoxvStluigLY35ooUClqxhPdNJUs/bZTqgy/mwyizwx77
	QBJMuXhMtjDq9kp7biDdITxcdHz5H2Axzrq/0zbWb1D9iwZFef2EILHkrOEAy3AcEreM
	d7kLc/qv9S1DoQnqssMDJaJlqJ2sqB4Dipo6a/0xLm5KXCASM8pflAnznKU0JPpfH/D+
	HvfQ==
X-Gm-Message-State: ALoCoQnQeMHAkKTNUwXM0j461RrNfakAEMFm/P6MS7k5XblV2Vrc3mCzoryr9zjypy2ZAM91ajwp
X-Received: by 10.194.157.194 with SMTP id wo2mr19989258wjb.103.1432153737526; 
	Wed, 20 May 2015 13:28:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id b10sm5208846wiz.9.2015.05.20.13.28.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 13:28:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 21:24:36 +0100
Message-Id: <1432153478-5784-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
References: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] xdpyinfo: upgrade to 1.3.2
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
X-List-Received-Date: Wed, 20 May 2015 20:28:58 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-app/{xdpyinfo_1.3.1.bb => xdpyinfo_1.3.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.1.bb => xdpyinfo_1.3.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
index 3688e1b..af04bb6 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
@@ -14,7 +14,7 @@ PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "cacc0733f16e4f2a97a5c430fcc4420e"
-SRC_URI[sha256sum] = "aef9285069a517ed870e5d8a02d13f7d8a953d7f7220146da563e04c7f128b94"
+SRC_URI[md5sum] = "8809037bd48599af55dad81c508b6b39"
+SRC_URI[sha256sum] = "30238ed915619e06ceb41721e5f747d67320555cc38d459e954839c189ccaf51"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.1.4


