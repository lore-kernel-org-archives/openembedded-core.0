Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3E860809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 21:19:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8QLJR8L006899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 14:19:27 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Sep 2014 14:19:26 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Sep 2014 14:19:26 -0700
Message-ID: <1411766366-9917-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] oprofile: eliminate git recipe
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
X-List-Received-Date: Fri, 26 Sep 2014 21:19:35 -0000
Content-Type: text/plain

oprofile_git.bb does not unpack because it stills uses
INC_PR, which is no longer expanded.  If one fixes that,
patching fails.  Since there is another, later, version oprofile
recipe, we might just as well get rid of this one.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile_git.bb |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_git.bb

diff --git a/meta/recipes-kernel/oprofile/oprofile_git.bb b/meta/recipes-kernel/oprofile/oprofile_git.bb
deleted file mode 100644
index ca562db..0000000
--- a/meta/recipes-kernel/oprofile/oprofile_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require oprofile.inc
-
-SRCREV = "88f43190d412d28ebf5c75a76ba20343d0fe4c41"
-PV = "0.9.7+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-SRC_URI += "git://oprofile.git.sourceforge.net/gitroot/${BPN}/${BPN}"
-
-S = "${WORKDIR}/git"
-
-DEFAULT_PREFERENCE = "-1"
-- 
1.7.3.4


