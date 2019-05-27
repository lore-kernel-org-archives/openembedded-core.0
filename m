Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8A62F7E25C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 20:39:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45CTNS0q79z24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 22:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558989560;
	bh=QarAF+2iWz+BSPkGxUt8Wwx3drXYqrCHykCmp1KThiA=;
	h=From:To:Subject:Date:From;
	b=R0Kpqhi7tcHAB6185RVj5M0U8xNk/Ttzgajn+trhbOUqPzX5s/5Ej+ZhL2o4ikXLC
	UNYNShKhHLaNb7iZ9OC2ngihJwA+JHH7tSSzDDRW4erPcl8BPMLaxypSMMQoJHwMP8
	gN+dydsZg4ndLDCpYVywFp5udiqsii8HvIXVTr6xYbPd3sR3gmJinbLEDKVk1/bmGW
	D+eHeCRqVj/OQJFH9iHs5UDjdpZ6FA11PlfkHFMJDg6fSwghYVLbdu2nuPePxBCg0I
	1H2mIbmI5A6l7X6K9SvnMsl9TdsoAtwhI8kTYHVPkHJEZWOLsDkEjQ0b3Gfgp8okPF
	G9S3fLKPA9Q/Rny4wcE5EzIIvRPRVAzV9OH5G2Qqly7FHUrywZ0nIyIDz3o5opd/J/
	ixDdb1DtfXz9wSOrynqnQT1wYQPqYN8dIp3XK28JNyRg308ueD+DFtEQsBCHBiECWW
	KSm9vLR5VBO2P4c2MCMIZB6MnSRmWqGnE+HfIfwGGKm7Riykr8k1jN60myPhKR94Rx
	Xj4gbehDKMTmz2eIliP0gd0LQXfzr2Afp/g1abY3HpYFJ5wxIDN6N2u9ea1Lc2WaYA
	T1qKVPT1b5VigCDOs4Bxe9XHdi/HpJdqJrUlkDIL3wNhyU0Xz52xxeXnjLRcI0AC+F
	eDLG8s95LoKPRMIhBAAJJhtE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 23:39:17 +0300
Message-Id: <20190527203919.26326-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] vim: Move PACKAGECONFIG[gtkgui] from GTK 2 to GTK 3
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
X-List-Received-Date: Mon, 27 May 2019 20:39:20 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 433f233448..5f9f3d79de 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -52,7 +52,7 @@ PACKAGECONFIG += " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
 "
 
-PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-- 
2.17.1


