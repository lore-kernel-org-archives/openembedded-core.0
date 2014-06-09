Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0735365CD4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 16:32:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2014 09:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="352552408"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2014 09:28:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 17:31:47 +0100
Message-Id: <7bb705cb9b9ef6873d3cad180e6e34478e6bd206.1402331462.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402331462.git.paul.eggleton@linux.intel.com>
References: <cover.1402331462.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402331462.git.paul.eggleton@linux.intel.com>
References: <cover.1402331462.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 1/1] x264: Update SRCREV to match commit in upstream git repo
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
X-List-Received-Date: Mon, 09 Jun 2014 16:32:14 -0000

From: Khem Raj <raj.khem@gmail.com>

It seems that 585324fee380109acd9986388f857f413a60b896 is no
longer there in git and it has been rewritten to
ffc3ad4945da69f3caa2b40e4eed715a9a8d9526

Change-Id: I9ffe8bd9bcef0d2dc5e6f6d3a6e4317bada8f4be
(From OE-Core rev: b193c7f251542aa76cb5a4d6dcb71d15b27005eb)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 406df30..e40290f 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.videolan.org/x264.git \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            "
 
-SRCREV = "585324fee380109acd9986388f857f413a60b896"
+SRCREV = "ffc3ad4945da69f3caa2b40e4eed715a9a8d9526"
 
 PV = "r2265+git${SRCPV}"
 
-- 
1.9.3


