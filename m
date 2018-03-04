Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 008F478A11
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 22:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19D0C20855;
	Sun,  4 Mar 2018 22:58:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fPkzhANoChsv; Sun,  4 Mar 2018 22:58:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C138920B2C;
	Sun,  4 Mar 2018 22:58:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 23659163309;
	Sun,  4 Mar 2018 17:58:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 17:58:14 -0500
Message-Id: <1520204294-38993-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520204294-38993-1-git-send-email-denis@denix.org>
References: <1520204294-38993-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [rocko][PATCH 3/3] maintainers.inc: add myself as maintainer for the new busybox-inittab
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
X-List-Received-Date: Sun, 04 Mar 2018 22:58:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

(From OE-Core rev: ba2eb6237497494e3ec0296485ded61b024c5ba7)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 38789b2..d0e6450 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -88,6 +88,7 @@ RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfound
 RECIPE_MAINTAINER_pn-builder = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-byacc = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alexander.kanavin@intel.com>"
-- 
2.7.4


