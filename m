Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89FCB73166
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:40:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S9eZI8011855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 02:40:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 02:40:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 02:40:25 -0700
Message-ID: <27524c3315a49b16d7b057aa38a95d2c0072e774.1459157937.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459157937.git.liezhi.yang@windriver.com>
References: <cover.1459157937.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] busybox_git: Fix SRCREV
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
X-List-Received-Date: Mon, 28 Mar 2016 09:40:34 -0000
Content-Type: text/plain

From: Brad Mouring <brad.mouring@ni.com>

The SRCREV in the busybox git recipe did not point to a commit ID
on the master branch. Point the variable to something reachable from
the master branch (which fixes this recipe's fetch()).

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..7c1b650 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-SRCREV = "be947c4d97c0dacb703a6f24dd813ff6dd3a33b6"
+SRCREV = "4d15068d83054a9f82b3f8842706cd6deb401e25"
 # Lookout for PV bump too when SRCREV is changed
 PV = "1.23.2+git${SRCPV}"
 
-- 
2.7.4


