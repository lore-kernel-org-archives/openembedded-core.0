Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E13FC70786
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:30 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so6511469wib.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BKp/2mnRrNqBRyxXY9TGLflVjU4ye9BmLcSarFOiK48=;
	b=LxwAh1bHwnKKgiZfXIMLWPDpDE7XO83szypc8vOYHhiVMVjTFD5LJ9IuKKPhmoF7j3
	5ykBXooCcSuJOIcUGSUjWrViDpg6zCh2vYV8MUqZuLneGfCvKZrdpn9CTxSncM4+s3V9
	zFLo/BCgippQ7SMHKiB3obITjFyQnVv6hpQnzU7/SYNEdThmrbtBECrFE1Ioty+xsTw6
	GQi36vA7VmAO3PEEO7RMe2Oyj4W7YE5Q+Xvs8qGKOI4echyH9+AgiObCj/w0yUtlvHb4
	q/pBLBdbi3f7BAhH/67+HCisVcnYT+beTX/N/U5HPw6BtTNT2OYip9PzMjq3HyjUfixy
	wgKw==
X-Gm-Message-State: ALoCoQkRVmr8FKsCgB4b7uh2zCNLEZIo1BzcHqUO4dqO05ofqePRZi+s8P9dHV9y+wCFihGZ2kWk
X-Received: by 10.180.20.15 with SMTP id j15mr17549071wie.60.1406054311397;
	Tue, 22 Jul 2014 11:38:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:12 +0100
Message-Id: <1406054301-9027-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 02/11] libxfont: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxfont_1.4.7.bb => libxfont_1.5.0.bb}              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.7.bb => libxfont_1.5.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index d587ba8..ef0bde2 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -18,5 +18,5 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "b21ee5739d5d2e5028b302fbf9fe630b"
-SRC_URI[sha256sum] = "d16ea3541835d296b19cfb05d7e64fc62173d8e7eb93284402ec761b951d1543"
+SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
+SRC_URI[sha256sum] = "3a3c52c4adf9352b2160f07ff0596af17ab14f91d6509564e606678a1261c25f"
-- 
1.7.10.4


