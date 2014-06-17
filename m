Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E53C765D34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:52:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFqYb0027787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:52:35 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 17 Jun 2014 08:52:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 00:05:53 +0800
Message-ID: <5c8bd0f7399a98cbceec0e2ea57c0d7c65817ee5.1403021109.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403021109.git.liezhi.yang@windriver.com>
References: <cover.1403021109.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: wpdster@gmail.com
Subject: [PATCH 1/1] x264: Update SRCREV to match commit in upstream git repo
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
X-List-Received-Date: Tue, 17 Jun 2014 15:52:35 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

It seems that 585324fee380109acd9986388f857f413a60b896 is no
longer there in git and it has been rewritten to
ffc3ad4945da69f3caa2b40e4eed715a9a8d9526

Change-Id: I9ffe8bd9bcef0d2dc5e6f6d3a6e4317bada8f4be
(master rev: b193c7f251542aa76cb5a4d6dcb71d15b27005eb)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Patrick Doyle <wpdster@gmail.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
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
1.8.3.1


