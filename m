Return-Path: <prvs=085e8ccea=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8E47DD69
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562618485; x=1594154485;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=ANJ+0kcfZ8tuFeltO9MfNDZKXY1tytNFbYF/lZfTE00=;
	b=iW5tfA2z5ZoOeF1lviFyi5YHPCcpMK6HG/707SwJ1eQzkOR9xqzcB6Mu
	xSTwwqqu3SYKJ0RiaxiD44JQ9HJHCSPvAaVswF11J3YjOtD7K6Seh/9Lb
	/osP+UaYhgeoUOtO2xLph/HtXXrzLGO6x2UsdEPhnirywZ2SMGkXQR72g
	4cipl85jIMwZVPn0WLn0QI1DCsKQ6BeQlhLu+I1WCnB0XMo1rjNVOifR9
	F6aVqxDUZyx9ZvRZ4z0TL0tOL1wCOPbf+d9BOTla4Gke5vR+dRAvKKfQc
	1qcyG5Ib/gPrz69Txl8uTYOVdhESKzBnoDJi6XD3otYW36ykRw83r27HT Q==;
IronPort-SDR: Ufbi1ThfEIZUf8YRw/tLX7AkosP8jFOSvaK1lOaAz9vm07kQa8LKLdO311M19ZrrCcYB6/WnwV
	M0N8E3uU73sOHpc/FEpKsIyNHZsgtO4IFTd9nD1Mo99Pe7tRf3WECCVTDCvDR4FrijjErv4kto
	17lLRIGtY9qB3hSW2EG9vovi9klazd3dxTfOjVSdgJ/fB3LK3Nn35v/k4oneerCA/4wUKDFwWj
	YBcjOaev6eSqGoLZ1B7zmyuKMsYCIZUsWl8GvLmiaRwiMZIgB+JiJfz7VLq7dJPuNFrXRKNcXr
	5ig=
X-IronPort-AV: E=Sophos;i="5.63,468,1557158400"; d="scan'208";a="117305035"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 04:41:24 +0800
IronPort-SDR: f1Spy8ImDM1knOBSeJaUZxe+Oki/NgeK/TMf9VdDdFp6/vpEAf/QhsUXxl3lmG/3NE2xTPg6nn
	PLRVGqcuO68S54MAbq77UKlxAHJ5qAJoWGMeA9sEOQHNdbrYGd+1xGDxs3OkNCSPkNfKOTC/SY
	2wFMZwlan+tqnh48zc9Ulo2vz3cJaAaNLaqlc9/77z/9IbRBv1YbnE01TGGGLzTETkR23p46RL
	a4pwW+0aDAuO6pU3Zq+0YptAayg3MGRJH41iiTSBKsv5EXJBTTpD/ZdbcOEFFghtz/Vi3dEnvb
	Z90NzuPtJTP1EG0g9jklitEy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 08 Jul 2019 13:40:12 -0700
IronPort-SDR: ftfqBVTTlF9ui5WrzKR2wJEUJMCLO6izqI18a7uOreXgmBrBzX1t/QiWko4gBWD95Qe+JVsRIR
	xTCsIco1J8CFEbUaowcWjhRJ/GaFzqpoMdoZdvEZ5HyRIGBpOp3Run6BEuX4fxTKDKrXXfRFu9
	Jemup2+XhQfz/10RX5HmLgFV74ybHxfUZFoijdvU3z0cr3c0iA7rfDO7Y7THmDaQ9fWLEJkQ/p
	UGiiNR7b5QWdocBiaFd3YDxrAsV0uxEQpN8+ayFG6zyuQH/yN3Mz2WToIOb3PlRq4pWmYyDXu6
	Rr4=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 08 Jul 2019 13:41:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 13:38:41 -0700
Message-Id: <20190708203841.17922-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] u-boot: Update to 2019.07
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
X-List-Received-Date: Mon, 08 Jul 2019 20:41:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../{u-boot-fw-utils_2019.04.bb => u-boot-fw-utils_2019.07.bb}  | 0
 .../u-boot/{u-boot-tools_2019.04.bb => u-boot-tools_2019.07.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2019.04.bb => u-boot_2019.07.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.04.bb => u-boot-fw-utils_2019.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.04.bb => u-boot-tools_2019.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2019.04.bb => u-boot_2019.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a0212e1b6b..ad043dbcde 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -8,7 +8,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "3c99166441bf3ea325af2da83cfe65430b49c066"
+SRCREV = "e5aee22e4be75e75a854ab64503fc80598bc2004"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.04.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2019.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2019.04.bb b/meta/recipes-bsp/u-boot/u-boot_2019.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2019.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2019.07.bb
-- 
2.22.0


