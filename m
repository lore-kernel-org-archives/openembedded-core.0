Return-Path: <prvs=696fae14a=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7FBCB7558E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529005416; x=1560541416;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=dKKs2LbdiZY8RJCVoBH9Oqc9DcL8mR+zwP5izT3sxKI=;
	b=lvgxDLuDBU+WQ9H+/fL7VCOpJ0wH9qiSOIWyz4Cl0KUdmtkqu2kg60Ib
	XxMk4Rqd98/z2SteSydoTIE84oILWlvZ1E8Cbzyg+3rCeVpB4V1Xt0YW6
	N6oZxDVgeS0A81JYNBe6wD4qzVejp7L7zpnUIDdOCm6kp33YjqalxXarw
	0aK64/rC4tthnMPy0+KSQBs03tA/p1roMZicp789cH3eVwmaWo9vuBYal
	+JlPQRF8EyeLKLDwAfWtZAwV9EHcAWgN8ZauLXIuziCPNnyFtpZr6U8Sl
	70d6+PPWkF70gtkx3FvESwaFvDjz5XlQ1wmcvv5/pgbQzzwga5Zq3Q4Ut A==;
X-IronPort-AV: E=Sophos;i="5.51,224,1526313600"; d="scan'208";a="80433863"
Received: from mail-co1nam05lp0085.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([216.32.181.85])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jun 2018 03:43:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wlRFXAjimGQ0HiuEmgfL1xbgy042cfZA7zAU9Ihyfes=;
	b=NUsBlmBqtou8/6no1pdUTZP4X18415GY92/vDcbe03jCphQqM/LlWeGogUfz18PnR0t/nyy1+bVMyajD9QjnRhuAtxgqY5AKml8ISehSWkxAhh1ia9JGZvS5kZ4C+Xtegk+KUZUww36XWRQG4plLq2gHfbneIwgl5/sm3CeJzi4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	MWHPR04MB0398.namprd04.prod.outlook.com (2603:10b6:300:70::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.17; Thu, 14 Jun 2018 19:43:33 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 12:43:19 -0700
Message-Id: <20180614194322.93009-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO1PR15CA0106.namprd15.prod.outlook.com
	(2603:10b6:101:21::26) To MWHPR04MB0398.namprd04.prod.outlook.com
	(2603:10b6:300:70::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c9ca1a5-4566-4ef3-04fb-08d5d22f1d49
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0398; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	3:kY2ND/6A2NuYmHwTBd/Ek78xl5xUPxfGA8J7UP8wkPN0EbjLK7HQ2u30xQct6DBWu70ki3pSFgq4GFp8iKj7jKDQWZbPP2IbsKYBkN77eKdAWrzw+6EIBn/G7pYSd6A5yIS6sUFbY4982G7JYyh+93tKXHE5JpRvd4BJVDxttfgQiN3CvrhK8MjrYlakLhzQ6H29rrbYpvHFdqWOm3Qq4S/dn9kT0z0oG/GA8zn39ErwpXGUtTLP0bq5TT2gRbF+;
	25:wZyOtXLQwbIHVwsvIYejh6rcvP3H4EV9+npzfIN8/Cir8llVHEHFbApp35fNr8bJU7Ei4AliFUKBYo84fwarbzGMVMF1lUxVXbmNo5O9SL48ldi6blNNJ68BCZcFv5cU2E1nx1pbvBj/wPbtvBT0sBSDO6iGinVLCdQOKU505HXMhyON18SpZsj4PocYrNUlCoxaOXF5x+HH2kw/oORNxy5HdarIxFMC7+TM+pp55mjy653Vj1X5eguAVMOkJqtiRYC0EwBEhwIthhq7WxUxxplC6EcscvIc6vX0Dd0HMD8zwzUiDjvpbmd//mutOYRfrWxr2U8NRnepWfMMFNoLdw==;
	31:2axJZghSHnIAda5zjf5yZqJ3Nc8WZF0PEsdShnevyQorAdj2GYu6vGCkTlY9BdmFj7ttoPa+twIJ+ksD6GtKJgVKNojCLQIc2H7ae6ZBQbe2U+E92bj9SWF2+1bt91M/D6Ir3Ow4vmQws17N2glqXQVG85aG9UmEWYvoaFu/LIldYOXMZZM7jIy+JUuyC+/D5X/ejHWLq0J1dJME/BifPcvcVuN1gkVAe7sDT2nz7mA=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0398:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	20:hGcoBRHUQiF7pB8196aU1juJbQzrfNb3Hq+X2P/qqaMtI45vF28+UioKtio/kkFDBA+TxEbrsD4W5Eg0H/7o+j3wMySIl79PxOJFHAFyPuaieZh2v3vmvTsCMG/XiGOADS5bBYScGxdmvvR+YBCDXbHmw/wlj2FX+NOb30ABVOtDgVsTmrXUXY+oQtVFrKMZzfow3cVSdAOa9tJmU0JT9mpVXF8jE49KLZ24UfwkkCIO4IMU/WzBN867WN+pO7TD8b6al81agMc58BHYpS8CPKzNzZfBwMVMAK6QSbEgKBOyaDkksKFuQHfJDLPNO/Z5uRtTX4+RRlDXWp16NQozcDvE0gqrtxdg/XAPo/sI0SufYiotE45350JTPdmVDc4FsOVz0FZFu9NccAoQ9do023m0tLeVyu+yyuiZMvi8RWDx3EzyFD24kMrys26WxkfGWIg/05TCeWhL41fMj4ZI+YCJ6VK9sZnFBU0plc1Xm3AGgkaqn0I0uZbfQv2+WT5V;
	4:SwgMTQDp5a/iyPrBpWA0tYZm0CpXhCkX8fT6pd+dxwoNgmO5F6ywPOpMl/SKthVa85kercAbArVUExc4UAn2sRjMObPQItrB+8BcReF4uWcY77W+iofrA9jBTrtyOJZ5c52JdeOJ+8YGot4LjlxSp6hHrXGZb4uxkQusRao5RxaKqdnsuvEVRldHg7IKQaFrP7W5OkLgP17MagDy+unolASgfzeGf2XA/vefvpHpFUc76ZAm0Dwyremal9CIw5Kw0UhnS7t6lNDo6WEQOJd24g==
X-Microsoft-Antispam-PRVS: <MWHPR04MB03984745E9D2356A35778EA4907D0@MWHPR04MB0398.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0398; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0398; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(39380400002)(346002)(39860400002)(396003)(366004)(189003)(199004)(25786009)(50466002)(6512007)(4326008)(39060400002)(5660300001)(53936002)(6666003)(2906002)(6916009)(66066001)(106356001)(36756003)(48376002)(47776003)(105586002)(68736007)(2351001)(8676002)(2361001)(97736004)(386003)(6506007)(8936002)(1076002)(72206003)(59450400001)(2616005)(26005)(476003)(81156014)(81166006)(956004)(16526019)(86362001)(486006)(186003)(44832011)(3846002)(478600001)(6116002)(16586007)(50226002)(305945005)(7736002)(316002)(6486002)(52116002)(51416003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0398;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0398;
	23:WmLBYHfPGoERd+MarFt6kyI6wI7MVMdfNXjS7ytal?=
	=?us-ascii?Q?XUFhqsZwuzb6O9Ovuv9F8xo2r3K2mh58DgJnC52J/CM1Ak8CM4Xh06eyxFHw?=
	=?us-ascii?Q?KpJ9pl0bUA5kAKedGWpBZ7ezufSieKYS2ZJ9n3OXZln7gGjbCGTA0Sj9bnbF?=
	=?us-ascii?Q?3zH1x2IyNNt5I+gaNsAdt//mM0/5a14r/1oFUO+iy/DIa0hyjjCA1o0YSQc/?=
	=?us-ascii?Q?YOwNYzAZsKCqHPDodEybT4DEu1lgjf5IqSuTUdFyBsPg2UFHKwvIOhDk5b5Y?=
	=?us-ascii?Q?PZWLJc5ithJamPUnaRgTnx1WJ1cIb3tecwP8EscGGxXOwYnctp9BD0SN4k5Y?=
	=?us-ascii?Q?GeMHXZ7IjrA5NF18yv3043LTQb//OZpNM/WcrR7AywCZX1yLvdsD9S2QwaXn?=
	=?us-ascii?Q?FRwYP2hYiERbRgbAXSah0piMoPNu/SewV5oyJkHuw3kxRPXzUCVzwa9omP+q?=
	=?us-ascii?Q?rpwpe3KiGyyQVlgPNsERx1ozIKod3765sm1GOuILeVUcRkAwS0loEGMVqAXq?=
	=?us-ascii?Q?XqDaWY8p+sLU8dQHBjKO0sya2EmQZ5qagN26c1LXE/hw2yoTVckLptddmj8Z?=
	=?us-ascii?Q?veiv7tMiAmDX9r4k6sYB2oFRgS9wVe0DI+Gs1+IrLq9ibTd+reQph9aYie3U?=
	=?us-ascii?Q?O1T0j3LxnABZuveWgPnSn7sTtE22DPOF2wK9GHhr3S0P7xXjc/VM+IpP7TbA?=
	=?us-ascii?Q?2WTgS/xnY+IsvtWetdyujJdO+V4m1I2odH+3Y9pdVm3c2UoPPId+iqIEP1sA?=
	=?us-ascii?Q?/te/V014l6Q0n/cZIT4zyWNkO6C58g49zkOZxBqPWI0A8izhaohQorj13EGq?=
	=?us-ascii?Q?ezIF3a+eRFIugbUm4Xx019T2+8n1bm7QemRyq0zNOuVgaUB3TkoCCQT8SMB7?=
	=?us-ascii?Q?VEo0AJrqIF47Nn9ouBbUlC6eTh4H5vlUyd9F/umXu5c01PdVBkspuQBRx5ae?=
	=?us-ascii?Q?VeOdLx2lCy00pTTBoet2CjK8WavFrqmjD5IrXvCy+K19S0gdLL9iWbsdpsl7?=
	=?us-ascii?Q?Ekz/vyVzN6H7XfAhUAeWURMgF8jaglI/HcJUZG5UhshuLzml0CeNIasSYxr+?=
	=?us-ascii?Q?Pux/fxrNSK9A8iYPzBLzJYIC605ZUxZ9ujwy0WuDMJ2iBs8dK1XV5yqy1XmD?=
	=?us-ascii?Q?L/Kg179trjYKNboe71kg7M9bUzv/QSpCZt87rHzhfDCAgIDrg7Goh7Rj9kVs?=
	=?us-ascii?Q?49jfVOmdhpvBxFlIhQgGgMdO/vrROovizKt6KkuCu9EmfhzZ5liwF6XAGfE6?=
	=?us-ascii?Q?TSm5r5i0nU/g5Z75D71pKfJW5mPGXu2nT2OfgvW?=
X-Microsoft-Antispam-Message-Info: XNIgJ19/TY7NEzc1D1dVXhtJtPq03Rg1hcz+TCBX3x0R0I5hPpxpPCcrQQSccj+cma8jIx9H8B848Ked4Lw8yTIRGdC0RSv4fBiMY19qQrp0t7uSa3/kHalx/Qv+9mYgcBTCms/jPqTa4w1vy/T2FDnSYPuidcFB/mBi5J86sPyGAjv1q98mFGlWl5Jjxg0T
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	6:kEryc2wzLcJ5Ax3X21RLAy/TyP+Ve84H2q7hoG4vD9hTDj3iCRAx2dqUCtC+vFu94pNkvjRxR2H9cYxq60+ONJHl1X9TQc6nzgib6qQztLUvYoTWCS+tJtwwjapFTL7ljnLf8tWdu78AjK1o8CmURNIJPpV7oocvqvlSo4h+LkDSNBCHQRnXwUwdM5Ef+0hKVq62OQ9CSKDdTIgy2HQ8ZBFjlFuNQ1zArG4f0S/msSL4a0GDLwkaFqIzdU3mIfg+xyCaXr5OP7Fcpm3wK/B9lGiMfu9fFKpYAcLjEB7KrjJlsrpd+Cyl4Mtfl6BocK67K0Dmua/oNQBx5+K22hPC5a4B8/tvHD3/fgSJQyssHarIY3JSYULJnkdBDW7m9f18LVkx2bMLJzV28ODOgE3f/gVuH4oaFITHpJ63ezi33aH5l6CvWxpt98Al/bwMLaEtorlpP7q9sgM560GY5n3jmg==;
	5:q85xLlaqh0rraAVAtYhVK7kJQaFsunFR0ZpUr5uwoE7pH9Q6pJbEnjEFamRZWXmZMsbbUdXnp1zWaR/NKTFG/fRxJK/NeCpO453M4q5CgtuzwG4qAVt4CB0aSxf/HEccbR/mnfUZFnOq9hdkXD0Db7QHQbOXwUbQ0/RG3btEL2M=;
	24:eP3BlFZ6jZMAXV3jes+BSRH5bytVnm9hzbjz1eK3MESHfVkWxhdzLG6K5U05YK95VgcPTiJj7g+LlxUs95bdS4QMGfNyPgHY+qM5Lx2umO4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	7:KUEPkKx5u7VXMc/AMiJkSC7sft3Hi6ZxwjRsQ9ZKI4UBaIjYSU4R2S4q0qtHqqG8yuQDa1vKBhPs7z1aK6xO9THjB3n9dWj/103iP8DaGCDXrc2Q3p7vrRAD2DFF1dbm875c1jE/KYwyv5VTOACu6qdssHWU2FtAO7o8N3udy+XPlnv9sPXsBFHRfAjDR7LtMKrprzWd9L6ikKpCZk3tpTu0RQI+akv5AjB62fW9mP58y1AD3z0odNUranmXLl5x;
	20:L/xdeIDCAa+CqdBehJOEK10GEDhc61y1Sj5W1eFNErvl+v9vLiAEwyZkwYSMJn2hEKi96d2AgmykF5ScVRPr7olVAoYigRvX04vMjw5Pd5h0XievpNPlTVYWpP+QhwM7MbTF0auchZIqbjBtwABAbeg26wfJUIPgicTPYIG4W2Q=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2018 19:43:33.8132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9ca1a5-4566-4ef3-04fb-08d5d22f1d49
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0398
Subject: [PATCH 1/4] recipes-devtools/qemu: Add RISC-V support
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
X-List-Received-Date: Thu, 14 Jun 2018 19:43:34 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index faaea781cd..d1543b81f9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ inherit autotools pkgconfig bluetooth
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64 riscv32 riscv64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
-- 
2.17.1


