Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Oct 2019 00:54:04 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 926717F2B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 00:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571100846; x=1602636846;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=CPmk9r8Y/wBh5lAGLBritzf527tDoUpljB6rkuS+AbU=;
	b=RPzdde9jZJvdSyJUfM5Co4pT3DvoBL83G7xXV41XL3jyZjOKdo9FQrn1
	kKVO8dth5Fxlm3GKXkUtk14v8Px2pU3EegTMAE3xYps7CMcVCQentI6Et
	Vxsgo65Lf37ac4aoLIsFJRVLVk+PYSuSgrSkGl6TJYJb3E5hoBZK91JLL
	R8pmeZc+q1d9vhatwVZMWQoKtjbnO7gn8A7xyuG5fv3x/VELKHtkWPE90
	5aUyDi2hD7trKxEOGOiCAOEHZwXK3EYVh4A7mujpymaqKsZg6PpMU87Q2
	hGy7AHx9y/KBZ9DK7EKylINJIyLOCnFRSem9VluQ51Q5mISh06VFWTooZ w==;
IronPort-SDR: 7KCxnNEOpadT/1C1O+UBkMqOulNbHjRqDcsTCV24xEn50tnsJ3LuxwxQoB3yEMxfl+xxJcLqda
	VLWsPy///rtXDAwcDqrRLzquthLboCiX6bao/40NN1ik/Ibi629SWHW+fC0lRlx7sHRWk/tzSm
	pQyhCmUGtdKEAUdMuBzw6o/oaTZC3/diQiA8p+1yJcFtXdvwdvPvAZpeMa6lX3H0qtIwsm0JXC
	uQ0xXriSvZksRiOKxUMRivcwP8O4s+GFtmhTjUzRKFj+GsCKnFZohZsJ4/EwQFUa4Prj8VTIMc
	oEw=
X-IronPort-AV: E=Sophos;i="5.67,297,1566835200"; d="scan'208";a="227576777"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 15 Oct 2019 08:46:58 +0800
IronPort-SDR: IiZ/aEJg3q8hepTl7m6idQpb5X+qNv4dS2tgOq38v6YwJpejU1CAbuNgWfUejBiMNaa7ifVMtH
	XNRnJ+DMuDnK0afL1EecjUnLsAGXujsZlh1AoRsJBS9c9tvLD3zxXcU4dA63UR3fQ0ItIT3rii
	9tms8JXe10PSRFY9nGnCwRdkiqMIz19IP4UQQc09SQtfQEoUDge9YrU5m1kR1/xyQ1NipUbPw2
	jSgHbSUtVqUN3uSic8yzZ6TDXKpZixFC3ygDousJ6ALqYNSgcr58AIXt0+msaQzzuGf3HjDSu4
	tupkpvRHasKNbhbh1A4m2yl5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	14 Oct 2019 17:42:43 -0700
IronPort-SDR: pXaEpPyGzXc0P/YjG51XBYcxegb9lC4HDRprm9EFk92pElu2UIwJDaxOWmMJBZv6Nkwqlttb3W
	k8nqaU+kh4GV9oTHFAoz3Ha/rQyABuPo/wh56OkGgp1C0oHIONjVst5Vd7g96oCOk3IEoB7G4D
	1ja0TJhwV+iCMumCHVSTliQKTrYQ5k9WE6SNtLZ7Cv+aSBUUmzTnVPowzzveDYkw9yuYv2P6Xx
	X9OAZ/pP7179PETRsJ/+Pk5yTmbv0rQva6UprbJCKEpPVyXGmG3PH3QTXgiWKRUhzXc+gin9IO
	Yfo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 14 Oct 2019 17:46:59 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 17:42:19 -0700
Message-Id: <20191015004219.18478-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] opensbi: Bump from 0.4 to 0.5
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
X-List-Received-Date: Tue, 15 Oct 2019 00:54:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/{opensbi_0.4.bb => opensbi_0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/opensbi/{opensbi_0.4.bb => opensbi_0.5.bb} (97%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_0.4.bb b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
similarity index 97%
rename from meta/recipes-bsp/opensbi/opensbi_0.4.bb
rename to meta/recipes-bsp/opensbi/opensbi_0.5.bb
index b030436688..759bbbfdaa 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
@@ -8,7 +8,7 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "ce228ee0919deb9957192d723eecc8aaae2697c6"
+SRCREV = "be92da280d87c38a2e0adc5d3f43bab7b5468f09"
 SRC_URI = "git://github.com/riscv/opensbi.git \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
-- 
2.23.0


