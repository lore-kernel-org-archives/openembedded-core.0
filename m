Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1E00F607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:03 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so21356098wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+u4E8ohZ3FdCYE8fHtOCvHuE06hdIo7sqZ54MDqwxgY=;
	b=nIohMUzR34sCJ7LS+127VmGr/MZDthvpzAkJZgwOMq83nytr+vTjNMljf+iSQmP25P
	FViiZhvjb3Vvi1mFPXWgz37AwJyMO0LQtoidzxNFUM3NR5t5o0vAbVdzMmgwZuprl17u
	+9wlUmf0CAKzZBi/CNp8rIDlrMxhZdi2uh9nAl7JxuplSz08/KBpgNDMbyfDsqnmbRWG
	F1Lx5FvSbNU7C5NA/HLqLOrPEzVoWDwcVPTcne9lsmYzQbrKbHz/7tCs+SULdWzrzf9H
	12p7eQsNdCH2R15qg73z6pPel0AG0o1tVZnRk4rtg7bEdFInmmBEIJqZGkWz4RSfBULk
	fh3A==
X-Gm-Message-State: ALoCoQkIT4v02oRtmphF2RSRP6zU/v1iZqaYBBNWJRWoMqD/LKsTFRKqM8a/SBRNCTbhnIqS8CvK
X-Received: by 10.194.216.230 with SMTP id ot6mr46874333wjc.68.1431967804767; 
	Mon, 18 May 2015 09:50:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:27 +0100
Message-Id: <1431967531-25163-9-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 09/13] libxrender: upgrade to 0.9.9
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
X-List-Received-Date: Mon, 18 May 2015 16:50:05 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxrender_0.9.8.bb => libxrender_0.9.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.8.bb => libxrender_0.9.9.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
index abd7767..9fde040 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
@@ -19,5 +19,5 @@ XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "2bd9a15fcf64d216e63b8d129e4f1f1c"
-SRC_URI[sha256sum] = "1d14b02f0060aec5d90dfdcf16a996f17002e515292906ed26e3dcbba0f4fc62"
+SRC_URI[md5sum] = "5db92962b124ca3a8147daae4adbd622"
+SRC_URI[sha256sum] = "fc2fe57980a14092426dffcd1f2d9de0987b9d40adea663bd70d6342c0e9be1a"
-- 
2.1.4


