Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8BB7D9E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:31:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 80F8925CA2;
	Thu,  2 May 2019 17:31:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Thu, 02 May 2019 17:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm1; bh=e/OVi6ZBQjRVhrpW0ZfIBiuqJlHxNJqgiOSbCcytX3k=; b=LtykXebq
	/Ffk4GckzK1DWaBgNPGRstZzAkcq+UUVNEWrW/FCLd+NPghah57erUgbvSEUUQdv
	WzRAuRoJ1aHJE96WwrbNlIGLBO3+ISsVYwtoAMfqhop2KHJP2Qj8620GqL4H1Zsz
	LeucLnO00EDJSRAx/mYbZOMeMEHoXGAzZTpa9BfZjAbvdSqNwTEv4xOzIYhffd0i
	oK2tRYwKtnsKk5l74b1CezYz4jORQMdskQQ7wRsJCrXGE9HBZrtky07Efebi/Np+
	WdHlllznkTiJkOXy61wCW391V/ShGmH/ZpC0vToOsKeVd84ZDZlAVLzAVYDclhwx
	ZNstZYf6kIgLzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=e/OVi6ZBQjRVhrpW0ZfIBiuqJlHxN
	JqgiOSbCcytX3k=; b=yOmrfROKA8UeZVh7dEvWCqtHPTMiSeG+94BUa601pYEOp
	SWo1vcNESSmN4rT5u5Pah2kVAouS4ewIsW7Q4l8Fb/MaBnyf4fTxVmOILjDNQ2tJ
	n1dItP3ukI/NqwtKIKlSN5/pS5cm6E7y/RKsBFd96IdGv0sYUaugjO73V7TrK0Fi
	4svtBIUNmmTuYHxJjjxE+jKsvdxzCk4hSpBaygu3UpxtBs92VBUcjNtkkD4JipMN
	OwvtVtLhXb2DbiVQqy3Fw6nbdzL4rFnjmZZn9V6oGZGgALmSEn+qwk2EPZXkqx7X
	G63NZ7Ieo/kJF7BtoTVa5KVpFMtyXN11AJrChRW6Q==
X-ME-Sender: <xms:mmHLXFV2f4BwUr4ParthFq4fniug-_zPHvOUGRjLP7JBRsV7l_L9eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieelgdduieehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhephffvufffkffojghfsedttdertdertddtnecuhfhrohhmpehprghulhessggv
	thgrfhhivhgvrdgtohdruhhknecukfhppeekuddrudekjedrfedvrddufeeknecurfgrrh
	grmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehl
	uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:mmHLXFzcRsReKInaeZ58da4ePD14FTtNdmE4oC90R7liKOfYj1_Npg>
	<xmx:mmHLXEDg2Xz68n6ssHE5zoEKDSEtabPe-7HZ9z21Gb86JR6mMbQ--A>
	<xmx:mmHLXD7yvXlXwaOQ7kao-ZULtTKfoP7PuNRl1SBnhmBIwETi7x5p_w>
	<xmx:mmHLXF17sLhCTIylJp7u9F0J3sfxgmpfvAlTuC7iZwC-9ZDtL9NPVw>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id C04B8103CA;
	Thu,  2 May 2019 17:31:05 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 21:30:52 +0000
Message-Id: <20190502213052.15962-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502213052.15962-1-paul@betafive.co.uk>
References: <20190502213052.15962-1-paul@betafive.co.uk>
Subject: [PATCH 1/1] license_image: Don't try to hard link license files
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
X-List-Received-Date: Thu, 02 May 2019 21:31:05 -0000

From: Paul Barker <paul@betafive.co.uk>

This change allows us to support the placement of WORKDIR and DEPLOY_DIR
on different devices. As the license files are typically small, the
increase in disk usage and build time should be negligible.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/classes/license_image.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 67500386bf..655b56347f 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -37,6 +37,7 @@ python license_create_manifest() {
 
 def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     import re
+    import shutil
     import stat
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
@@ -102,7 +103,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
                 os.path.split(license_manifest)[1])
         if not os.path.exists(rootfs_license_manifest):
-            os.link(license_manifest, rootfs_license_manifest)
+            shutil.copy(license_manifest, rootfs_license_manifest)
 
         if copy_lic_dirs == "1":
             for pkg in sorted(pkg_dic):
@@ -136,7 +137,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                             continue
 
                         if not os.path.exists(rootfs_license):
-                            os.link(pkg_license, rootfs_license)
+                            shutil.copy(pkg_license, rootfs_license)
 
                         if not os.path.exists(pkg_rootfs_license):
                             os.symlink(os.path.join('..', lic), pkg_rootfs_license)
@@ -146,7 +147,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                 os.path.exists(pkg_rootfs_license)):
                             continue
 
-                        os.link(pkg_license, pkg_rootfs_license)
+                        shutil.copy(pkg_license, pkg_rootfs_license)
             # Fixup file ownership and permissions
             for walkroot, dirs, files in os.walk(rootfs_license_dir):
                 for f in files:
-- 
2.17.1


