Return-Path: <prvs=138ea0b3a=alistair.francis@wdc.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Aug 2019 20:49:37 UTC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id CD7777F45E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567198179; x=1598734179;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=HV+qjj65oiKPZPn8PijzsXcdNtC45lObuB3V30MHkFk=;
	b=WDyTtaaveoxCfeijQGyH5dinQMdRvuhDjMddVhQkCmPmlV5LdjIBUctv
	2xn35yOnHwkyVoiKGKFd1YAVBZPDHVErZAqylQejuEIpdbG+wb0DqhgXR
	2oDEMR0ceog1MkLlEXNzjWFz+GcpXCHyOdj7K71kP14zWML3LPYiD0W6Q
	rGxPebAIFD5HSn8JSuxHi307L2F+HqpKJ5XMDAMXb214Vjq+c+gil6E/F
	+4VKuiYlJcgsy3dlW6tVOUwKFzuCGf9KQE04dpWupCTmynU7HTyqpFEvh
	jOEqXoW9wAr51tABz0BPzn5++WXJg+tQsAU+Xn8zOaoQ91z0PP5t588xi g==;
IronPort-SDR: y9o5WAOhI1/nmsbH3nbw8jH0rHl2crpyNX/Mu3jfqMkizAWa6RfCWAaBBc08cUGyrQOgwQMcuP
	vScPkOLx8jS82gj2ZU9DT7qO/ApmEN+fTVSJyrqypMLIZStsb/KPm90fCZQoWiWpOJ/SDAUbOt
	HWQVGPN9zDCrmV7STO8zJiCZIFSIOENagkw98QgTfCmBAPfp5PkO0XLUbqY7RrN+NxOhKTmysS
	PI4DCIYmBnRPqjxCVTfP+fbnGaaiaC89vgn+fnWGvwpIA/+QQmZbw3lbaB2cXtckDeHhsi628E
	4mM=
X-IronPort-AV: E=Sophos;i="5.64,447,1559491200"; d="scan'208";a="117068851"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2019 04:42:31 +0800
IronPort-SDR: V5lSbahB6w97XW1e94FbInCNasyMqkkXZqw9Nl7T08FEhpuQZWeS5eXLLnDTQ//P3/0lHmTwNN
	g5Ka10Ym/0b2v+Gvf4nK7sRFTMAWMcnAaFsW+1WZGpem8anR4IEYesivBHPou77n1kskfh0BgZ
	JTe2YccQSk3/0STy0H0CKfRGl5NmD6N7lwVmVJthvg2CIQUWZoMoQhC5o0YRwu5yRn5PPP0+91
	hgEk6b37Wv1ODRsYIUjPlCBLbYjLXsb9UPNKKm6RN5tgtExIO3WWWN5tcZBHF0Lrh4kccJCtSC
	0bEPWQ2l4P3utp2aKkiTl1wS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	30 Aug 2019 13:39:37 -0700
IronPort-SDR: 7pe/fp3qQiL2rLw86tMaS8Y2NLmhpSb+EGd1NUir0tJwjUkbCoIYEk8jP+dLjstU2ah98zSTjT
	OAX31UlXEHG9edgcTGBqftyLdBjfyLEE0Dz1RpkISrrLAWt6uRWurmhPB0sgx3Fp8LCr+zmjV8
	uRV6j/OTNGTJNr47fKLCVoN7zsFaMFxSHdokJiOZ/TyHcBBLEYDxi2ZhACT1HioLSisyx0Dn+q
	lxpdjyAytcJVZE5VCPrthaiLOLdLc0kP46AxoOCYZMyY6geeC9aLRhrPeA47+9dV4QSRrG3jaB
	dhM=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Aug 2019 13:42:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 13:38:45 -0700
Message-Id: <20190830203845.19512-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] linux-yocto-dev: Mark qemuriscv64 as compatible
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
X-List-Received-Date: Fri, 30 Aug 2019 20:49:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 2268faf512..163f280560 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -39,7 +39,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
 
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.22.0


