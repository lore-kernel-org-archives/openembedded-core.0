Return-Path: <prvs=06826f79d=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8AA7E862
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 21:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561154204; x=1592690204;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=gBsSLCmLQdwa86GkU8vODcMRI9xw6NOVQt418zacjhI=;
	b=gblXXTDMa7pstNliLAE00dqJlmOsAvI0pqC0uGmYL0xZJ/bmqWhCv6PC
	zysB088zGoJrR4VrqTrxcIG5CL65Mlw2h/vtTpv+eBmXfqk/6uFuInENv
	PKvXp0/95E6ozM1ogPsfI+idtGZcCuI2Pw+nCYY5eD+VI75Nw9VTt1VRm
	eAWL/jbmaLt1CXPtTee5UUj/Zs1qoRWTXVbWtKsenKCeWjYxw2ToT1a5X
	bXt6Wjjfsw3oWMWgF4e1jwJdrAyzJZf6CDNpYAVssjzysQ2KL5O3UJaxO
	R1xz3KwFXrebh4esd4nKMqWiaSH05IGoHWg5nzM0WisrPVoZ+nROMrltY g==;
X-IronPort-AV: E=Sophos;i="5.63,402,1557158400"; d="scan'208";a="116082495"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2019 05:56:44 +0800
IronPort-SDR: NGcgY3uX/9P88liGJIXnTwF0U8HgiNwFK7faekS6Ig+cTatzlcK1W9CbKTE3YFIA/aklKrVThT
	htYH55W1rn74gTHGnAs70D4TzMVCRH3QJRqChpgMUaP4Ri7Ms9gyIoX+rqMxz2lEEy+LNoXpkE
	KUJ0BZvPq166uVwYe9BaHY0jChOCuFepGuEjH06n/qnfLL1JrOjzTwTPOWYylaUckUw/Z8gA2B
	UxFzSXNwasfQCJIj5BI12dsnnGeOpW3vNed18SKGb9HHckCCRhyyXnwsbl/hSJ63842lcWb3vr
	bQlCxyRvLKMfFBzACWkF6o4o
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 21 Jun 2019 14:56:00 -0700
IronPort-SDR: YjU2MsZdm42lCN1aP2OcHbojVwsjm6TsdJK7vNiQVhQT5rrsgmc0gCVCRYupyGs43ofElFbIxd
	vk/IZHX1d1+/rDY5iK9EZTZqnv/kaDox2CIPHYSaXFyAcVoIhLbxyojmiucwhrnYnh5w1o3cm3
	7Wri0TxpoPi2aPuDP7urA3HtwD0lPyfQ5jbrQ/2xEcLQODBz0wEc+XS1L0ikn03AmtyWSerfJC
	Nc7mAUJb5M917gi+upeC+N7sYhRn4T2uEcKdLecw4Z9VkzHBRh7Zw47GemlD+3Ju4rQupufcYJ
	rc0=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 21 Jun 2019 14:56:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 14:54:15 -0700
Message-Id: <20190621215415.23856-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] recipes-bsp/opensbi: Fix the u-boot payload name
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
X-List-Received-Date: Fri, 21 Jun 2019 21:56:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index 7df168325a..7828599ce4 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -31,7 +31,7 @@ def riscv_get_do_compile_depends(d):
 
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
         return "virtual/kernel:do_deploy"
-    if 'u-boot' in sbi_payload:
+    if 'u-boot.bin' in sbi_payload:
         return "virtual/bootloader:do_deploy"
 
     return ""
-- 
2.22.0


