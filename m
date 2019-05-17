Return-Path: <prvs=033a92d29=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3AF7E01C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558137355; x=1589673355;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=mIqrJKV/mgobejYrkKcHUC5TZRImjReSVf/c0a5g7gg=;
	b=AjtnFHCGwc6ZBR3xb1zRfEu8/y6JvCbqezI3bViNMCLfGupXmICPIvLH
	M92PqW4AP9Qfrr/FArPN4ct1ILdSLMoYpJeOirieiecrYgISchPSOGPyx
	6DsUpyOxWc4S5nBVF31BZf0lHKFeSIAwhj41cAQm/N3yGRNx1zAHqNIEV
	K4D1aJbNmZnGeEoK4ZJF0OoR7T0unSJqhNoNMbizjwUgnGa+unbUoLC+C
	eNcllqUmF1v0PoEd7ikh/CbJVQrBSeDhwXz8hbMFKA2BD8qXevMJ452Ke
	mazM3qdxEr1reWkbBrA9br5adB395o7ThKvZFHeSfMu6hzOgAFDBNsj94 g==;
X-IronPort-AV: E=Sophos;i="5.60,481,1549900800"; d="scan'208";a="113496061"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 May 2019 07:55:55 +0800
IronPort-SDR: aMzmglBFFch3KpXXjUeEUrZ4481bZf1V1/Voxt+eFTFso5F/7YsRyCIeltgSJjU/JvDeQl8Vxc
	YWTfUP/AdpD5TZiDqg9JTdNW7F72+eEXL3gPK/tsFVZZry1gAIWX4jECfQRGock49sP5cFkeVG
	Z61WSiItACffrt+96Od7lgYnykDjbbH52O6jE3AGbKscne3yTj+WddmjCc8CU4E9ms/qmdSFRy
	ZdN91Eh6Fo64y3n/D9ijz71OjTyW6fmLkLjMjDpFQ3e9VMr6kHA8UzpXZFJM0jy247rH4yKwNX
	PNRyCx3pvaK5II4eFloXgdd2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP; 17 May 2019 16:33:46 -0700
IronPort-SDR: kI7dn/yzlu4pM7FTQXJ4jqwWo29tv3njvXQytzKP7L2cJnzyczsuvnwrFghYbk/cwBeCqUldrA
	UbTjJ3HIo1lWHR+rGlFjdM+TDcO21hlAS9w4dk4l1sUIQnZvXcdMQwka9kgcQDFNWFjzJtI8zC
	xq6EV++oGNMyDgnHrK0QLANkgKT4+ziYLOu80wwHVnOQaBA51QF2Ds8ewsbM8dm5bo9w/fRVw4
	Q5hJbf8zZR/XMJcqDcq+UJze5JdeoqzEhQAGEHl2yWqEqbrBe4BNV/+yqO4URLVHa3ahCodTDW
	J04=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 17 May 2019 16:55:54 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 16:54:08 -0700
Message-Id: <20190517235408.4450-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] gnu-config: Update to latest SHA
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
X-List-Received-Date: Fri, 17 May 2019 23:55:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index e597ebedbc..1630c12823 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "058639be227bbe8f03cc39f79f7ce84918012143"
-PV = "20181128+git${SRCPV}"
+SRCREV = "b98424c249119b79d3f709e26eb86f2fd4d5e5f3"
+PV = "20190501+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.21.0


