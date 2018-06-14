Return-Path: <prvs=696fae14a=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id B53EF7558E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529006278; x=1560542278;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version;
	bh=AxsoNiCOt7uSrdaEtqSzhRuBqgINgeLEe4+y/zs4vyM=;
	b=hxh5fl3PB4pKAHpe+EC3mEHPWxe05xfayQK0PtRJBSEtV/zlbGNW+rps
	s4nc2MUVNPkyOs36g6nB7JkcZHUQOiPEIXoL42l/k9820pcEOKkvNZ2NY
	7PtpKr0AidqMnF47uMufT1DX/KminHN3JsYQXZ2vaov/iSZnf3+s0BGaN
	TELwQ3n+7ZoGp9HdDZ5mQXpNnkrCHT+0SV9gC6xwvjNQGPv4B6gw8RMIy
	CY8y5/lJFr4yKi3tYb6bonkNttuwqIlsDI8xt0nT4AYulk5BbhNx7+28e
	3uD1uOl4JHcVMDs5eYf6h/jL9lFtVOMtP8VSo/WNGpQ9oTIgbOHzgC6pW A==;
X-IronPort-AV: E=Sophos;i="5.51,224,1526313600"; d="scan'208";a="177386686"
Received: from mail-dm3nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.20])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jun 2018 03:57:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7YaR03gQ2kUk4LmkJCcUTYbKZmEbtywZ2Lu8OQYUU38=;
	b=KRVI99uVkBnmJXr3mbMSjdmcJCHsEH5c1aTonBEHyDJHnTlV+uRWaFEigwE4cp6iX+hWMgFfs8aA+4mnku1RSeeJg9/t9bU+zxhOTehOata/7hRN9K4OdejfeLo1VUPAsAUEOooqZ8ALI2ax903EdGvCsgeqCTPsYNy47ky1bAw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0391.namprd04.prod.outlook.com (2603:10b6:903:b1::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.14; Thu, 14 Jun 2018 19:45:17 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 12:45:07 -0700
Message-Id: <20180614194507.93168-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180614194507.93168-1-alistair.francis@wdc.com>
References: <20180614194507.93168-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR04CA0113.namprd04.prod.outlook.com
	(2603:10b6:104:7::15) To CY4PR04MB0391.namprd04.prod.outlook.com
	(2603:10b6:903:b1::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f7ff987-d87d-4096-cd03-08d5d22f5b05
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0391; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	3:n05CZ9dYgzQb9PABoqIanRO/x4HF+LrtqVVYza53tE66qDwIlQ3wvF5NmtdK4HLekcf4QJXDizk9Uib9MJWANuS+AmKDHKMZZZt7JKRRVtzl8GOSEq9/syRKY+D4Lnca2GWxe2grkJBJCVgFXwJgIgR9/xsKkZ1+fnON94o25V0tqo8EVUuuBOvKFak6meJ+kKcbvRZPb5+kxIdKmQ/5mCtbMFsMwi3eOi0Os7GOU3ONyU9HkK9DWs3pcRrzlB8n;
	25:5O18d7P2tUM4sHcZRg9JpG+lOi3WqNuYpaCF3DpPeKowXUp3T/zfgEO/UlccweMW9emqWW7JEc212bJHk4Dr9CR9imIQqmN18sG8S4hUDuK08kvDwnApTvwkUVXN/jQXQFjplotL+whxzAchaXhfJnypMDnoy5VRruiPD7tCZzFjyJx4PmjhtcgAnRi61/7x9SjEBRPydBw7dBxdKlMGkeihOsS5LHmGcFPiS4CcY/5+Gp4heieHTCP+YeJEES4UYnFlv7YDj/296XZ/SbowWADz12O2NrAc9imUMkdvT8JiDFzEKqrjRueUbrLOA07zpi+pnhNmsTHYUUxoIxgnqA==;
	31:oabvEqWuKXD0I73whu+eRZj+ac0ByU7IklM0xVDhj6QbSwniz+sk1+/oSAtfOEyi1KZBpJVd1OywQ+lTEyw4D52G2aKHcIeJzxY25Pppdb4S/XzLajWjew7KgEChxKzACswm0yPI1ppOuw144Skrr+qG3juEud9X2Bx08yKnBGT7O4KvKpZa2k1XeDvvCr6lWGHDj2aeDvgt2c/rTCfITWwSSzghlivqb918/PUICro=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0391:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	20:ztcTc6qiUzEBYwetszSRlly1CEvRxRNasUsTjRjnixfhkawUy1u4OwK+Mn0mZlc2AozYjXYKBsNHYVKeaz5C+3F6Mr8s3YRH08GPiVCTWDLHHzuj/Uwi1dafu4fvvBFDsHbPJPswwpppkM5JFNhnACqhRyYdo3+cRc+MTJaKkPhj5sR7n3fQUEbYE+dtYJxwKz+g+LmTbKSKD79VfeThJITiSaeB94aJa3Fo6yHLIf+nhZf+kgOAuqJn/WMWZBrELq3EdX+9kapUSJ2NwWSnyp7JYehPiuZ946eSFQCwlfYc7QCLE3nMyUPbMjbcS5LQmxDBftfmbohAnCg6/lsSg3wfuBS9/Pwa6DfK1EkXtALUxe++UZ8vEGMfuAt9UW7N5hg66mtKWCUiqf+IZo51ey0EUtrML8IZXrx4Zuhsabx9CCq6C/fOzoT9mueCDUdTS56eoRY+fBjPy7WKwe57oWLQ2+xgWoZia2RzEM/KtJRAhzQTRQJthGT+PREZmJsS;
	4:zbF7iWb+W16yLpj2GFl8MP7DIzNMtDlc1hUvgF9gLZsudIaAo5aghn17UqWrZwXmGmtZPEXOoD5UZMv7euxd9mgfDxw2LYcuTMUwkSTcNQQ2yr+TEx/EWW8dH9m89+PAMzYMSyyUgMG1fZN2WYz7ABBLpoC8cPRemeBb/r9QXR9THgY/wFv4WHrGf9SyMUJ6Fdi+QSpnKM90uHpdFIj+tVcEHCWeb/R4m95+WuJHYBbMyP2VP1QTTEpSRco3oma5DCJDnaMsPcAQ89LwiXVAjg==
X-Microsoft-Antispam-PRVS: <CY4PR04MB039117ED73FCFE2008A89082907D0@CY4PR04MB0391.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0391; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0391; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(39380400002)(366004)(376002)(39860400002)(396003)(199004)(189003)(36756003)(50466002)(316002)(6116002)(2906002)(81156014)(305945005)(8676002)(7736002)(97736004)(5660300001)(81166006)(86362001)(16586007)(68736007)(3846002)(486006)(6916009)(6666003)(8936002)(50226002)(1076002)(59450400001)(956004)(476003)(2616005)(105586002)(44832011)(53936002)(25786009)(26005)(6512007)(51416003)(47776003)(186003)(66066001)(48376002)(2361001)(52116002)(2351001)(478600001)(72206003)(39060400002)(76176011)(446003)(6506007)(11346002)(106356001)(16526019)(386003)(4326008)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0391;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0391;
	23:XZQZW9LiRu4dnvnm6Vj97tJ6HMNsn8NzdBK/mHfus?=
	=?us-ascii?Q?/2VoLJrPO0pYR3yO5j05wEJHGvo0JI+6AiunTM/e3qEjytPnmn16ypc0zuN3?=
	=?us-ascii?Q?ZwAYe8kzGU0Stpyftr6/xwsCZ8g1TrqKmfDsN0tOZskejmrdSL8ctnjCA7kt?=
	=?us-ascii?Q?CzzAUf7lUgQwDlDGBnluWC8Zqut1yHi4XAycssPJVGOihYLiddBTKtZVOIKm?=
	=?us-ascii?Q?zAk/uTIj51S/big4gcGv5aYx159zOQ0gVPIBUM1ndZYWgh5R39EMdMa86u8g?=
	=?us-ascii?Q?zemID/6JG1i+nEZJt7eb1jvtdyXxqwchb/1YySijF4EeUkI/WQHZH+53pA7W?=
	=?us-ascii?Q?xjKwc+lddhPhzyXO2xPwlTlLV+qR/3ocfsdRn22g7gXAn1x/TiVFsAxLCqSF?=
	=?us-ascii?Q?vf9Rjh12ukQG7G6iD7aSjcPwUw1H+ivSHyI0TLJnficVGfCAX1nd+sdeVmZM?=
	=?us-ascii?Q?u6GMxyzvT/V2sFZ5SxBW5iVYu0HuFhfXwkBeXV8SdbudrRTpgI7+dM8tnlnN?=
	=?us-ascii?Q?kPPI13Rl6wg+NtCgH566keIYKm2dlK4Gyu+Cg9z7JlVkk0XtDimazjJslsII?=
	=?us-ascii?Q?1qtGFegiYzrWDxG8JOMTiVy7ej9k70FNOnEzXPvcUETIlTr1LOloW0/vvJLU?=
	=?us-ascii?Q?gQRA2o2dFusdM7mFesyq+JLIzFMGSXfp68B2QurMjAvGGjzRlSJsnFsOFIuf?=
	=?us-ascii?Q?5SI+RTnD3fThoGMzmOJTg7rBYVc2GWo27X08m8LjbuGSAEOg6233m8vfxZSo?=
	=?us-ascii?Q?iSREaSC7P1HbXYty+0OvzSw79f8yez+f81VSVEimTSQGONZz9/TC1WYyf2O3?=
	=?us-ascii?Q?RVme2QylWPzOjg7uMijYo/qNq6Bi19DLs5GYKmQDfgPZh5QFs9TOBhz+YQ78?=
	=?us-ascii?Q?NfpNb0THL8Nc81o24UWxc7u1oLaf22aSAOI3hKU+aUSipFTTjJUq+jRw3C0l?=
	=?us-ascii?Q?puwsQA/uk3VZCIg9k+wZddJASXgdPJEy1Gf9xPSG4T3AOLWSjdScP8kzyQZS?=
	=?us-ascii?Q?xhTBvArItzweKhNKoREdrwyQK5Iaz2PHDa1JimOUiDFQNlwFuQuQbT2CyR7y?=
	=?us-ascii?Q?AmdnkYCGyAuwKJmRIcC85s9yGcRrjNvx3d9n8JRJKYm8LwofxBDB5WsDmlAS?=
	=?us-ascii?Q?tNh3L04mPDAk+B1pOHI07gZ0kidfdogTrLUd0zC+m2MJWXM79MSTnPnIk6I5?=
	=?us-ascii?Q?QgSifetJaHcwQmCrS7uF0qTNtJLcs9NxqZSE+K+l7bAhKjrMc/T/vPJvQImx?=
	=?us-ascii?Q?/RC1se6ZTWWDiTL0g2iJp6GkdbqVWM9cS9yx9IGbEW+jpHWvh0D0Gkufcf8j?=
	=?us-ascii?Q?W+o+LeM4u1rhHWQSgprdcLhOsRqUyasoTJymkfp8vMp?=
X-Microsoft-Antispam-Message-Info: xaTPkLqAJXIBhOPbTGFSlg1zhAE48oXKcrhBn6Q6DtrXdL97P7LyBM0OJkSnej6GoYFGs9Wm/FomGYTMy3oUJBTYRUG4dAxUCygbD9thd6qvpFYRbIZMSpU74v7wteu8hwpumfZRk0A1iHqC0kKMB8uHfk8JyN1Kj1MeYYbJk3cj1Ehe7DTwQIgE2ovEeIOF
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	6:6eweawKHizE4N+YbTVA9eXJCZY81wZJyE1YX9vxZEuqiTsfdlxQf3C3xbE4A88cpEGP8/SrbbFmF1wd4mmqt0qrakh8kCjq664uRwdwjZoavelBCq+htioiO66I6cOdprl14uHHBdlDWniBeTF1HGeEqGHSsu7SKVkvRu8dUT6XnAelSWav+44eETfUk/+/cPrHFUoGiSX6Lt43o1hZ8aiXtuhMexLU073zlfaQ8T9tRdsLxeALWckOQzHzS4O3m1Ar5N0I5SzxyrErXWlQiKaOnbezKrZHgW15JbmK40OrIQm2PYpOI8FdQOg2xBMrZEZsRfgrFLF8wYON0PQCMtjiV0rfEz+8c7F6BoTforaRh0DnJEEKqaE+INiks7s6XHY1z1O/gglp6thCY18yOe8dUyJRxFeuoxifcy0sGOajWUfin5Xt7PA9HQt1AbnpWDcwJzC1ZCuDNwOKiMys5ow==;
	5:CyHQj2bMtJbafvpeRRxax9+jHdeaXDDLBL3IhShLrkGEiq++Ro68ZUCgSp6hQ8TfL6219Mw6MP1IbIvVbxV6FwW58TB6wAPKSZqhrJgg+bRRNiJ3luCHGlwEScFK3hNCBG99dPWhFLpUd69Je4oSdgW8d3F96uGab3jLLVPIMX4=;
	24:d1p4k0aT2BhFFrvh0cZ/2kWwexnLiMUzcx932JyXuohSpAVoAjDG8FGta9NL9i8NKXMZ0bQczMss6754SrwTUxLXEZ+SBsWbmrmIFIt75Zo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	7:I0QkAV8ZLedp+a5+SAHzWgumo2WupnN65HO5UBfXe0n/f4OU7awAwIUo/eB3cu8asUbWl27fY3HrvUBDRTCGtQ6nIQQOZ6KkM12QqC7s5rJm/kkLT9CWGaFqI5O8b0XsLE3THtbgz15j15UFcGdD4XNLokaM06uD8yULrsPYnvgJXi9Tl9B3ToIwxIpQWcAUvll3oE5HDi5CDuJo5s3BLiskaq70VzdL+GavkFRK8k0Om8BRnwN+OWNZRuPZeuqR;
	20:B8ZW0Yh9+NCQaZJpKRZJljbQjPq+IpPFTZi+Cl005hjlRoMRdJnQOnNjXdR+sjdRItnIhrKe9PkQQhZqLhGh0H6LccahaX/zmWmn60FImTQHqdmRV6JpVcEpjDrA8nHVircESd4X0ogB4z4+5ktEaI15eRH678oNzu6jQS2Nqww=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2018 19:45:17.2813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7ff987-d87d-4096-cd03-08d5d22f5b05
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0391
Subject: [PATCH 4/4] recipes-kernel/linux: Add RISC-V support
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
X-List-Received-Date: Thu, 14 Jun 2018 19:45:17 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc     | 4 ++++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 95ec2a2b41..70a13cdd1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
 KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
+DEPENDS_append_riscv64 = " libgcc"
+KERNEL_CC_append_riscv64 = " ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS}"
+KERNEL_LD_append_riscv64 = " -no-pie"
+
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 693670c613..4ea368a011 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -36,7 +36,10 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+KBUILD_DEFCONFIG_qemuriscv64 = "defconfig"
+KCONFIG_MODE_qemuriscv64 = "--alldefconfig"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemurisc532|qemuriscv64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.17.1


