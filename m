Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6256B7704E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:04:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7IH4N3Z001841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:04:24 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 10:04:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 12:04:17 -0500
Message-ID: <fd6451a6086e4a37205f3d31f3bad44b11a2477e.1471539779.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1471539779.git.mark.hatle@windriver.com>
References: <cover.1471539779.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] Revert "local.conf.sample: Disable prelink by default"
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
X-List-Received-Date: Thu, 18 Aug 2016 17:04:23 -0000
Content-Type: text/plain

This reverts commit 300f858ba07c938427ccd05a3d7220027a03d461.

Reenable prelink

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/local.conf.sample | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 8879a08..b35db51 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -129,8 +129,7 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-# image-prelink disabled for now due to issues with IFUNC symbol relocation
-USER_CLASSES ?= "buildstats image-mklibs"
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
 # Prelinker tests are currently failing on ARM and PPC.  Prevent us from
 # running on those architectures until the failure is explained.
-- 
2.5.5


