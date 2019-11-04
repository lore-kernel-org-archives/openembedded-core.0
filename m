Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 786427F8C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 20:55:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476Q6K62lcz8b
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 21:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572900906;
	bh=Fcc9cHWDchiKygthq4D2Y5MtQmXLbsjmfs11tv81THo=;
	h=From:To:Subject:Date:From;
	b=S0CyWIKW5JgV2Gi/T54kOjUJi5cJIl3E6RkSHQick8IyPK/896GT5kYnYV4De6P+z
	CpTiF8BwYRpcS4ZRf87FoZ3aK57JaWzKkcaCmqL4MOJRpGf1OjF7VYuLTTDEViQWp3
	lZdTHa2vN/T6WIKKnv8f91fTAEPpf8Hxeqen1D8OCdlKPtC67R8EFZwDrJG6gnkYMA
	DrCjENnw6tX4GtnKlT/C/tErdOzvCnDWoJxjF1i3h1sSZXHbtji9m/kLBCcLvVp+A5
	XAO8Q8bH/q70a0KFtOJHCFdyhWgRXiAIzRAbQsGxDT8GRZQJ1QipULCM/UWqVLh83T
	aCRWhj/lTyG3pjreT6W+QyNe/pNOBnjn2y+bwPiwpKrLRzt72qNEO+m1/DpYhSFELZ
	JpjvWNWzTLadk6wBbS5CVRfwKSvTg39IBeVw2wB9mOtkf5es+o+m4BDiwf/toGrb8s
	gdJnVQYyYz5pHuIRUQOTECQI+8YnkWkoGRq+iALbVc32qRy93Gb14QgYdLI3SZ2p8u
	DWm9Lv3D/Xd3izjcZaKuGo4IytB2TrPJa058/huZQOB0NvP7wn19qDYyJQXqkQcvBT
	TaYGIB/e80ndYRGoxdANDEh5bRfSH/Jo8bKW98GyhRQLm12W8HfeOq/dG24AuUNhtq
	OiI17TDgPcPhSV5pciui3QHI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 22:55:03 +0200
Message-Id: <20191104205504.24428-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Mon, 04 Nov 2019 20:55:08 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/iputils/iputils_s20190709.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index d8f2470d0c..3f9e9917f0 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -17,6 +17,10 @@ S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
+# Fixed in 2000-10-10, but the versioning of iputils
+# breaks the version order.
+CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
+
 PACKAGECONFIG ??= "libcap libgcrypt rarpd traceroute6"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
 PACKAGECONFIG[libgcrypt] = "-DUSE_CRYPTO=gcrypt, -DUSE_CRYPTO=none, libgcrypt"
-- 
2.17.1


