Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 204E17FA15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjv1JsQz5d
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281283;
	bh=rBUiNuraM9otQUuxLL0Bnni3KvTPGdxktJPhmIOh1YA=;
	h=From:To:Subject:Date:From;
	b=E6daCnUtzk7kLAqGv2TgdfGK9PLceU6Wyb3YYaNMfWK0qufJzY+2kVTZZxmA12CCJ
	5N2+uIat3UVCGmE7lfHukYYMrVeVc9MyB1fUwbt5YCBTYWrnAEbm1J5U4OO30GLW2B
	FjVw9GMDv7gB1ThOaZngwqHt3EWMpYog7BUrqYioRxu39JkTQJxPwRZPPjtbiZaSPA
	a1HrWEi3k3KVArdXoOMc2l2UIEb4+YXTSy12tJ2ZjgsgdItqB4zTOuAzG9WjGtrTO/
	+vEnTUx3K7/mfzPHwWStPB+F0yGRPgy8XmHwq7SJBSyMecamZqDrCCKNGEMChaBR+U
	xzKoTZpv9jbA6RHDrLibqHIxBlbJHRdShJS2yNjMvyF4pn4XQxwloi0iV1VAKE1QZm
	3Az1DOSe/JtKHer1rmTs5w0lAZ9eKLQKW/4Q1r9Tcb5Pbvw4X4gLun5R666/9jeYEr
	0Fo+LqEcsdYBr3KUWtAQ7WUkBOapzQPwyBUPEKUxjEPTIpyzBCklaYjUj/PaPdBwB6
	+7Fkh/lPPgmZ1lW7SpjavgJ3vc+DRQJORaN7czJm3t+GDZV95UlFkv+Ah9NgvN9GNl
	GnZZJPEBE8s0N9Gh3SznwQGSKmxtCYYrzqwjgoGaFmnxJRUBgfhlNllnJ2k/kGODca
	/tWhoPmhXMH41nyDZlrMRHdU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:36 +0200
Message-Id: <20200117171436.17131-16-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:42 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/iputils/iputils_s20180629.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/iputils/iputils_s20180629.bb b/meta/recipes-extended/iputils/iputils_s20180629.bb
index eff44be1bd..5d11ced96d 100644
--- a/meta/recipes-extended/iputils/iputils_s20180629.bb
+++ b/meta/recipes-extended/iputils/iputils_s20180629.bb
@@ -21,6 +21,10 @@ S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
+# Fixed in 2000-10-10, but the versioning of iputils
+# breaks the version order.
+CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
+
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 PACKAGECONFIG ??= ""
-- 
2.17.1


