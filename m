Return-Path: <prvs=2065966fb=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 6952171B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573064630; x=1604600630;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=o1xCOaX9+7bCyFrstScaO4nzmFCL592Wl8JLXbFUvvs=;
	b=f1It29EbTnVxtAhMaC1c0aFEq9NuO0PhqWhR6lMoXB/zG7BrLZXmQaOr
	43ll2ssIHQoxs8AhJ1f8+/+4JcxSPg3BzAM+bsJRaZVy001WBQJfGviKU
	4wPOf/DlIwzFNSD4orcqEAbD5zuuV4i5azIpOgBoBlD+HfVH7oRuEujIw
	3fzpYx9GYZVjMVCwH9FKt/FTsmH1X2P9WAlIfiyEl6tDVquq8GQrngj9p
	GUQ3Re7wudDZlGMfQilOlRaPGb1ae9hhOPfcCkiT3RlKpsj79FbXSenIG
	CWz7pwVLoeD5g8um5FMuEfEqLJ1iymQkiPPx4RFV7qvDhsW8Ow1OVt3gJ A==;
IronPort-SDR: l7kz4UZ5wVvg5J3XrISjuzb4WepRRG+XbaXjNg04UotLCCWXorIXkAdB40PvwWSp1Y+97ZsrwK
	Vym5oae45rFWZs9VK7oppjyEkTOHlnZvLGmkLITXQqZdVVCRVwHD4B37QEuTLQ7Q2lxeZMnKU6
	OVvzV0HL3sHj6+NiZOvC+PJjJOKu9BMfDNai0LCXSAXAoLyoB8jQlynyYwKnC1oi4J4vE9ViOX
	Seu0Ypg7e5KWyMedbnKi7oXrXy+Y/TRUrs7bVyMNS70liATZVfSdqYSg39H5QxIiBICSnQsd3a
	Z0A=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="123048687"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 02:23:35 +0800
IronPort-SDR: clcQ8XcN8TJneVd88Mh1CJrxQd1W+LvdNitr1iQjeiSk6WfMh7CFBAdM+q1g19R0M9deJakQAP
	x9JN/K4VSirIMzeJMp0J6hg4IOOcrl2qmfFIClbJrTMM+w9Ggre5MjdF861cy/maiHDIb9riPX
	r7LIWNJ5Ok2nQUBQq0NakvspizTdyy+7V9QFUq1FfMBgSFxtDXYsrWqRpMtetW5RDaC31vv19m
	6GmSbyXWlU4xNVjl2UMEhxFzZtf4FRwVs/Q3c1wsmDmdCJCN6od7yh0aB292T67ta5OpDpANyT
	G5+VPnAsOd/06tjhl6a3xTu1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 10:18:46 -0800
IronPort-SDR: pMLiegJo4TBQSBqa9yA+DAoTB5Xc3ZxAxrXyHTDKuUW1deiA6VO2ikytgsqHaxCgAo4d0pn2Db
	mzdnSnB//0OOhnFYCg3F4xk9mOlFnfUW+BC+yFzP7PAWAAOKK0pRqw3SgmeyvmgJCPGYPXMCmb
	5y3IJBAf469xTwvJ9MVCNov0jS593BgrlVH5CNLuNpM7zsH8zJFF6WPzPeX/bpmD+yY3MrERSN
	I34PxFo5A5YlwgkX/YEwqRACHB6q5DOX08hJeUuFNXTlYV4WIWFfHFtdOzp+g9kse9c7q+lS9d
	8zo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Nov 2019 10:23:36 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 10:18:19 -0800
Message-Id: <20191106181819.12517-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106181819.12517-1-alistair.francis@wdc.com>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] arch-riscv: Default to hard float for riscv64
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
X-List-Received-Date: Wed, 06 Nov 2019 18:23:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 6737545e00..8d72e6d79e 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -1,6 +1,6 @@
 # RISCV Architecture definition
 
-DEFAULTTUNE ?= "riscv64"
+DEFAULTTUNE ?= "riscv64-f"
 
 TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-- 
2.23.0


