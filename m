Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEE8770CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 00:07:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA307FBX015817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Nov 2015 16:07:15 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 2 Nov 2015 16:07:15 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Nov 2015 18:07:10 -0600
Message-ID: <1446509230-116578-5-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1446509230-116578-1-git-send-email-mark.hatle@windriver.com>
References: <1446509230-116578-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] Revert "local.conf.sample: Disable image-prelink by default"
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
X-List-Received-Date: Tue, 03 Nov 2015 00:07:15 -0000
Content-Type: text/plain

This reverts commit 6dd28030f323d7106a02ec54ce4e249561ab0836.

Prelink now works properly again.  Re-enable the functionality.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/local.conf.sample | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 9d1480e..3ae24ab 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -128,9 +128,7 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
-# that you do NOT run the prelinker at this time. 
-USER_CLASSES ?= "buildstats image-mklibs"
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
 
 #
-- 
1.9.3


