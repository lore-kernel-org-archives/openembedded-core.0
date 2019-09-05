Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6736C7F2E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 17:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46PS994RLDz3S;
	Thu,  5 Sep 2019 19:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567703966;
	bh=n4J9Ql6ZUibdf9M0byKtsajiWsiEEtUPJkVXVSWFz9M=;
	h=From:To:Cc:Subject:Date:From;
	b=U5ckwVUHRtd6aZVYVqV2IXYgzmc/U5hJc+Mq5XnTub/gEghqJGLpvqWVSG4sO56oQ
	DtJt9ruB1tQS26ivmFFMAWcBeg7mMb2NhWUnPmtxjaYmLFx04gIfR1hcW0S8EK43rM
	mDSs8XAQExrhBn9Kln08a+bJ+JcPf2NnXPijxo8miUeKhx+BulcGvh6l3DVd4hZiaU
	U+HfxX+UUJP2dmqXDxiZdlu89QBVzuBxbodL9L6M8rNiaV+vBW/oVFQrhe7D3IC3ZU
	NE+yIPiyju/OEKMU4yr6+sDJ/r1mvI/656TNle4h3lP8rTEjmVtbrKlRRZkQeM8qJf
	letfCXTV4JJ8kTx1kfzRQv/U1JyeoWMe2qlKRMB57I6GCv2htpnQaH+eQtNop/8aE8
	9CrGQ2iQR79q1Wdh+1ha+916YD3KLumVEoLJbfKn00CYrBu5Fvtj5w8aUmaInexDCE
	WBY9IM9VtCUHPKuIl8zc7zJDGv1iZzHbZtEZhhQ7TyarsgovRrYM7b69e6G0S99B5l
	H6hp+jiULBJW4GMX/HYene1vsr6Rne8YANLmCIWpnEK6ZDEnd1M/PpF2a2vJQNa+Ac
	0Eg9yKTYuX59JpgcSlL5Fu7oWh3EwkUEYtqEAW67wOVB73CudxT3K1HwgEiwa5IlQM
	7Szr6jYr4r/BEBmotUYg/pr0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 20:19:24 +0300
Message-Id: <20190905171924.26806-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove leftovers from the eglinfo removal
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
X-List-Received-Date: Thu, 05 Sep 2019 17:19:26 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/conf/distro/include/distro_alias.inc | 2 --
 meta/conf/distro/include/maintainers.inc  | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 7ab3b12cd5..e314642b9c 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -77,8 +77,6 @@ DISTRO_PN_ALIAS_pn-docbook-xml-dtd4-native = "Ubuntu=docbook-xml Fedora=docbook-
 DISTRO_PN_ALIAS_pn-docbook-xsl-stylesheets = "Fedora=docbook-xsl-stylesheets Opensuse=docbook-xsl-stylesheets"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
-DISTRO_PN_ALIAS_pn-eglinfo-fb = "OE-Core"
-DISTRO_PN_ALIAS_pn-eglinfo-x11 = "OE-Core"
 DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodings Debian=xfonts-encodings"
 DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base Mandriva=x11-font-alias Meego=xorg-x11-fonts"
 DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils Fedora=xorg-x11-font-utils Ubuntu=xfonts-utils Mandriva=x11-font-util Debian=xfonts-utils"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 566641a895..5f21f98b2b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -165,9 +165,6 @@ RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-efibootmgr = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.17.1


