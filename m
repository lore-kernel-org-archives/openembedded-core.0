Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id B320C7DDBC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 11:54:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id EAFD322540;
	Fri,  3 May 2019 07:54:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Fri, 03 May 2019 07:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm1; bh=e0a2yICHHN1AMNdJ83PI7begPgLhJdmKDHp8m6kTDeE=; b=wYjKCfUu
	BEqxM1HPeaKW5su5Gpk3Nxc6zh3qyNhr1b5YLbYFvX1rZEJQGNo7nJ4DXF9NIwYS
	KqpJBgLEQMm70TMVzgVcu/v0rCyOyIcqTVmvlKHsCViF0Y1mTFSqn4tK9h1cdEwY
	Rbvxw8aC0iLS5apCJgWFM6MCFGGPp1YPYV6ylWlmUPMQNCW7hRZ2n05QI1FnFkVd
	yHGLAdFKEKdlDTUujOLMZMOyQ6GowcZ6OoLbmR62UiK2/Hm0G2OGB5HIJqct+clv
	bQU6dgm+YMdsXqVCj+OKhpYu3Lv6cnLzuXxP5IpsLw1Z1pSQCUJjjO+SuTplqOgk
	PcfUoRDsdccIRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=e0a2yICHHN1AMNdJ83PI7begPgLhJ
	dmKDHp8m6kTDeE=; b=TGgG+lxzKHb0V1Z3de2A699wc779NDB3MY0BvcbX0qxit
	MFy/MXXOLkksSvh7kJRfwu9DNAWoDlye5ninBnJhIyDSuRmxzYmj9a34l6t+n5aP
	VLkltu5E8uMnvYqk0pr7BSQtvszeJtV4C2i9TggwczEPRljuq1tZdTIXvEAFI4L8
	Vf3ezDXJXZmZImRcyVz6GhIryGRQ+vyGeQe0S4dDUXBfhRKczqOzea25hImki2F0
	y5msdC1e2Xud/wzOOlyfojr4vGYMfHppsOzOdr/hB1pexnv0ZTb5rDUdKMKdp0bZ
	0Dv4Ak7NLJABPbidnCMZtuQ7Vg3HYHHlknwPoVYIw==
X-ME-Sender: <xms:EyzMXBd11KHXuX-eE3e4Je5PE_j3T3Mdp_gd6Xx8aTRIpacLIah8CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedugdeglecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofgjfhestddtredtredttdenucfhrhhomhepphgruhhlsegsvght
	rghfihhvvgdrtghordhukhenucfkphepkedurddukeejrdefvddrudefkeenucfrrghrrg
	hmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhu
	shhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EyzMXF4jCLWkWJ8PaVb3cSyaXl6TLH24Fp5Hfrrx9BuzLCLT3Qg8CA>
	<xmx:EyzMXF5e_YXRYI2SsFXjmdqkazPqQ9YTOsKBD0LfqWuhWGXGint7Ag>
	<xmx:EyzMXBPow_zOSVZuaxYirA3TQzW_1OFu5sJmH5infmfYebFaXD35uA>
	<xmx:EyzMXOBYvWWqxjLRHwa3VqxWfVnxz-Z18ijORglRp3cgSY2YA-dE0w>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3E7A5103D1;
	Fri,  3 May 2019 07:54:59 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 11:54:48 +0000
Message-Id: <20190503115448.10130-3-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503115448.10130-1-paul@betafive.co.uk>
References: <20190503115448.10130-1-paul@betafive.co.uk>
Subject: [PATCH v2 2/2] license_image: Use new oe.path.copyhardlink() helper
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
X-List-Received-Date: Fri, 03 May 2019 11:54:59 -0000

From: Paul Barker <paul@betafive.co.uk>

This change allows us to support the placement of WORKDIR and DEPLOY_DIR
on different devices.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/classes/license_image.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 67500386bf..6fb76be48e 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -102,7 +102,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
                 os.path.split(license_manifest)[1])
         if not os.path.exists(rootfs_license_manifest):
-            os.link(license_manifest, rootfs_license_manifest)
+            oe.path.copyhardlink(license_manifest, rootfs_license_manifest)
 
         if copy_lic_dirs == "1":
             for pkg in sorted(pkg_dic):
@@ -136,7 +136,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                             continue
 
                         if not os.path.exists(rootfs_license):
-                            os.link(pkg_license, rootfs_license)
+                            oe.path.copyhardlink(pkg_license, rootfs_license)
 
                         if not os.path.exists(pkg_rootfs_license):
                             os.symlink(os.path.join('..', lic), pkg_rootfs_license)
@@ -146,7 +146,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                 os.path.exists(pkg_rootfs_license)):
                             continue
 
-                        os.link(pkg_license, pkg_rootfs_license)
+                        oe.path.copyhardlink(pkg_license, pkg_rootfs_license)
             # Fixup file ownership and permissions
             for walkroot, dirs, files in os.walk(rootfs_license_dir):
                 for f in files:
-- 
2.17.1


