Return-Path: <prvs=722272e76=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5E2605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531182391; x=1562718391;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=V8yf1XRY6eI8KWjOajPr0eI1nVkN3tg7sNBDKp4gdvA=;
	b=MzbWkNHYSA09e+ourG/QWIdWX4XkGaxPW37kWncY7WarEA8V7tW/KDmo
	LRle0Oe5RfV3makQPQJOIEUhAgqGtmNEYbZObllELCVGn33GcT+fyCr86
	WPuyArQGyL8Sj3CNAEQz8yhqyLTpPsmJXKgHnCLU63qZshRWfeUuSYZUi
	97hBzoOdCanZi/KMV/vMEiR4kpFXGWxaPCG/74mzwueTFYHT2+3N7hHvN
	LW6Xhm0Z1Bo3wrXMes69hFp+Y7TmZyginHhSYqG6U0iGR8vaZVmljlOrg
	jtK7JPDVqOJm3xr96za4yKw1XHTFJHYa+iHGzfai+ksXwonR3P6VDA9iP w==;
X-IronPort-AV: E=Sophos;i="5.51,332,1526313600"; d="scan'208";a="180583238"
Received: from mail-co1nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([216.32.181.20])
	by ob1.hgst.iphmx.com with ESMTP; 10 Jul 2018 08:26:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K2/7LIY7gXZLuRXayfAHiqIueOOJrgykJ00FHaQC75Q=;
	b=GNrvSQBFf1ZXskISmGK2p2p8DZd2XU2Uke7mJodBezQFtth461wA4JL+PbUdEUeVPtjpbJDX4almj3POtNx/wiGo3IqtWI/JTdqdef5f02sOtcZOWd/MJmrAFxNzaOJMwYJTFRxMGoJIHoOyVFdV9/xMaEo/1qTTUvh5FcosrNo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0394.namprd04.prod.outlook.com (2603:10b6:3:9d::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.21; Tue, 10 Jul 2018 00:06:17 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 17:06:08 -0700
Message-Id: <20180710000608.18878-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::38) To DM5PR04MB0394.namprd04.prod.outlook.com
	(2603:10b6:3:9d::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f6383c9-9344-4076-1842-08d5e5f8f5b2
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0394; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	3:EUvXtCHFFcEqrBii8G3BSar1w9vRRis4IG3SNGS2rrVE0zfyT6OMjL3F3YKHPdvEIKO1v+5TOTeKucCLYsRw2mnVN9CV8SXqgUSrct0HIEJ90WRsYCtRSfdO30UIuDtoXzSsp38s0iL0vfrVBC/J1IWBvhj3mQm4vCcYdlBzBNSYFDj/Rqx/O684JUQc7fPPqUETPzLikL07RbXv6s39Mm+IF9DN9V6NxZhy3HIVFSRuWwM0FsJha1tjDN4jqrNd;
	25:L8paELxIDESav3k+S5kawfMx0EbyUzIFy589A0Xy5yq3U2BKT5NmybbyeVTk9PwmdGjIvsDCx8zLBPKuSYiDC21HXZhEusVKk97FO+KFa55vokmMnS0f3f746NdKDvg4bC9zKL0glpLl2o+LOyD8YMaM8UJcX9sP2NOv+Uqzr3L8sG0kBiEdb7XFTvp4MjvPRtbPieHtjYWXB1YqD9nS2qYdNrr7ji3otWc91zYBLIv1pcjejK8b4ZI4CPsm2HWoCgWlPo1Te4A69YBiIr7rVHgHnoY2qFJL7L05SVNY2QpuOZj7V6Dvmreu6VNowrxt7yQxyIvkkC9t950+Frp8XQ==;
	31:vwKA41PgLC0W50J4mdILFctm2z39ApxQ/bpa7Zb8b24wAe25L3HZpPP8TlcmptiuOzMm9pUc0BUGzQjnJWXl8qvCN49swyX5YzixZBnaIGkoPeUnrS1cV4w2qc+nZqibqMVvfMjG25kjy6BO1H5vA0zJOB/QKhu04AvBB9i4zA0+KPe3goC14q0WkNmXBsAonw2Nd6jn7N/e1Ez0f7dX4LoGIoo7rW8TSaHUossbgJA=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0394:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	20:XzGSTN8pYVUE9+mmWdROc5HAMfcyfnM3ueGckn9lGh2yPSg3EdCliI9d1sxLUsV5zfuoSkYTcO/oDXVFU9WkCIYucxv9XXZPH704Ti9faV0af8/azqxhagN5WQgWjUWdFAvvtQRJqM15FA2oNok3mVc2Vm0NGTJBwZbedi3UOeSRJtiNIcEYXDfl74Cv9hnDXpPR41N4bLa9n7rpftz6sUWQalHBsTEhzzgiEy4c7bXRIrr/6h5VvH4woinsWOH9G6JvOT19q5XJtHzy9oM+2LxmRtB4q7CmZNy8ZA5buLkgdh1dm47zauT7eXjM2wyqi7SkEKip7hYngqxT8gn5RxNyjCX5YLzJMirE2TTdnD9b0Wj1mWlcGb5neBMGUpIUa41PDjKRLdtTX4+arRSNBG7l+bPwYHBVvZh690kvqq416OYoWc6tOyXs89dAXSbo/hPnUDcqR0qDkoTICt5R9zPc4LJyqhR70wJcJQPn8Ky1si/p6/iNd7JTTs2cqpsX;
	4:lndQedys6wvQAB39EH/Jnr83EF5WnzWLDXNCJIciBMM1u8WRkRvXxGbRl/Rpd51nQdvFj59HjmYcK5wYgK1ZO0e3Ge4YDZcGUBEMBUOfh0XQwCwCsiV9iMse3T/nXVAu6YynDlLC88h3FGv0+ZvTezzpsSrUjVLeystXqoiyepI/MezfhjSp3BTQpfWZncDP4VAisWB2ASBQy/lTd+5mpaSUgq1KPifG51kLcQIB3VWCUURNw+EyXh24SlkO2Bs+SVjiff1yghsutIxIIDI+0Q==
X-Microsoft-Antispam-PRVS: <DM5PR04MB0394ED526A57BA2981FFE7D5905B0@DM5PR04MB0394.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0394; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0394; 
X-Forefront-PRVS: 0729050452
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(7736002)(6916009)(6666003)(305945005)(66066001)(47776003)(2906002)(8936002)(478600001)(81166006)(8676002)(81156014)(68736007)(72206003)(50466002)(52116002)(51416003)(48376002)(50226002)(36756003)(2351001)(2361001)(6512007)(106356001)(105586002)(6486002)(476003)(316002)(5660300001)(53936002)(4326008)(16586007)(26005)(97736004)(25786009)(16526019)(1857600001)(86362001)(6116002)(186003)(1076002)(3846002)(14444005)(386003)(486006)(6506007)(39060400002)(44832011)(956004)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0394;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0394;
	23:2hxLNAXq9W01XlQY8chXxQbuv3+5dj4ReNj5N6z67?=
	=?us-ascii?Q?6dEePo7I/WPzfvACX40qxBmUggRQ3SNP1dwnrylm+2Sp3f8j20/34oP/X8Bq?=
	=?us-ascii?Q?BwEMVCvcS8Nbt7t4nRJ2xOM1HBUIFeAWbyKh4TC/lwVntvdBNqS6AcwX+PG6?=
	=?us-ascii?Q?MkO0Fa4Zp5kX17vh0j8cXzQBlGIfMPVE1S0vKj/rQkQCFFdNVtKGOpj6E6z8?=
	=?us-ascii?Q?uS2m3xnMisXbfVKvPS4sQMl6/8xS9AEnRee9Oze7e9ABhHPzI7/kL1sGo2Qy?=
	=?us-ascii?Q?KJGDGNkcjmfoK5taPTRRq0e5stbT7T7Ej2G4GC6W+IbmYzdd6mfM/VKOHcq6?=
	=?us-ascii?Q?SB42hx1x9RBQwSW5gBsGNDbWUCH4ForYtzm92X2MNt4eyonXawNhXK7JFVaD?=
	=?us-ascii?Q?/2nuu/4mvMmRy8JRFjLuKJ8x4eQauGNj//czq2pqrZFaycRnBNEEKPlSzO/a?=
	=?us-ascii?Q?8lXpAFX0UtzD2Aa80CgvOwKYZXZso2IvbIfPmLpp0+YdFv7nJsiDiR90zUZb?=
	=?us-ascii?Q?vajT1j9OZ7HCM19wZ4t5WNFOM68XilRR+hcA0Yk2i972+9t8LVETc5v7m86d?=
	=?us-ascii?Q?ivjXJpyteDLDtXnB32fNhbijZiELRMzNDS/40qfj3y8gt6gyqkdQ0tCMPm5F?=
	=?us-ascii?Q?p0DqHpcxuEm9hEVju31/96pYHiApFkdVZszPXgL3dU8TN5YBHg/ZPCJ8NdP9?=
	=?us-ascii?Q?8EQOP1YS2pvCSb9ROy2QwWPGbju25sEE96qluVdcHNaFC6j07IRWDhFchaxU?=
	=?us-ascii?Q?AU1csHPgg1Z0qzvwlS/YPAqBUWl7ST8BomRioBeuX9HbAZPygn8HjpgBpkQJ?=
	=?us-ascii?Q?Bo3z7yeyPXka+am7OZaHOUmjfYcgzPEWY+TTxLqwgUW4bJTaA6vYVmrbzhKY?=
	=?us-ascii?Q?hq8vu9Wcbx3/ESTwKZfcd3W/vzk9p2Rn+2nL5sPBYZoz0EQwcleuw4uKR+dw?=
	=?us-ascii?Q?23L2hvHaqAqkh3Z21YvIh3SxUhjqvw1mHk6EaYwdHvjyiWu7vNsDRtKxb1K8?=
	=?us-ascii?Q?fDeRON5fg3IrjaICe1oiS2anpo1eEypYOc5JJxeH5dNylCEN056f4gTrmAmz?=
	=?us-ascii?Q?YuzvLmG6Aifu6X7zCWyw8sMY2KRP3lXuQysmkVEZ11+i2puWza05na2iV0gP?=
	=?us-ascii?Q?kDTlUAH3dmHjn8QOF6DvggGdd7LO1Z+yzN3DfcV6VbgQHSJQMmbmE4+F428q?=
	=?us-ascii?Q?7TVws18zHGKBOAUjYQGh8jaIWuVqsuftnFTYQigoz8hy0ho/C9xlK29Y5YC+?=
	=?us-ascii?Q?Rw6hD29oxJYbxqPvNm0/sU3xyfCC/9z8gMnYEHV?=
X-Microsoft-Antispam-Message-Info: x61J74uRx2tfKV4JwriRiz8a69TwOb5g0fF82kEfTaa0OL10Eu7C0790WvBowaxYuWAEoZBgIbUbOXKDi4TveZBUr43WatGjvnIA93uqX4PcmBPQEj9Cwpl3XorFHVD5DAmtEXymKSZNma0g4zZkNZla2OCa1QYWxLARAARBIAqlUhqiYRUZchMLzD2Y7q2HdkodXKPjp2lmbAT/vpYPF0QVPaHCRnc/PtI4X96im5mShBVtxuT62tq18qxQMQBl8r2wK0Htx35EECBz12m9IrKPUdZA3BahH+XCUeIIxzgxn5c2VQTChvi+eK0fKTmN6Q+APIn+5gZvAHfiZvVRILv1JINvH0pwo881NOfifHE=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	6:MpDzXKNcgtNQNGVr2JhDiHNjO0n4uPj9dktjtqAYkzFSPF2G7c9nkgkMf6xb0boumrhPcdnKu431LcAFnORbz0ZYvWtvJ526gF3BPoye0wXez8efw/5aBN/T9uUkDi+s6tFKbtPE14L6qLw9NKziea2vUM19W/DhT29iCEjE9JJWSxFB8XzEho93HIHr6d5rUEc/tzxAgF3BiP6gFfEYJ+9sJjvU7eBca7Xa9MA1Yx65I+cCdThU8a/30ZGYdhGV+k+B8uGeKWZnB05RdJ3jqpdEjpMJJimnuUIXpd2ntJbIdzkyBAEr/7f6ncz5ERQZHQoIQXyvYRhr0/GTfE4Bnl9N4AuUwKUwQ3oS+VD7hZNIyUqs6EKi4Xmo8sWllOJ3JDtNH8JDGHrkyYnDhBtp3i7uDk0uOAbY37GyAa2JORhXwWJBTh1Rlu/sT2IkndPaVurY9X7D0S5vVSG61oY8Lg==;
	5:TOiq2D4zjDz7qHZgahZba/wbRIuY7CLL9buT9JNYCZ64y3Tzncs9dtIaqbmbmThFpe1iMdcBgIRQ7ll61BkD+OomOAf6zLnIYxKtihIAemejUeudneXD5c4pm4g5gQ/i0iMwG+jQhSy65GiTZP2ykKjz/OE5VdSVK3EKzAWkreU=;
	24:LYZrJJZoZt8BlX658ZJp5Drerqztj59KNuFnUR55t7RU3jrs7lTyMLyg6ZBxtgFkI0y4KA+m+xk4gzu2of2mdUy+/JTUu3CxWoeRyiFf2OA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	7:+C93ZVttqGztk71JUYwLVc901zK9logx+rbBsgcQUNXeQAZJeTBD2ClRNxEAwWaumbl2oCujh3HTQFEgO1mfiA3lLi4XS7xrPIiJWXDbFO4vq50iiORB+csmNnVh3tj8kgzBC9DfUEykMToxqmdZlDY5R7O2/mxO4aTK4vWvlz7DiLxyYY6ioa328N1RSBw+WZLOPpCtFk/Egcr98lHlbbJWkTGkvLlkmGQbSIPyQbnnkynqF3BVRqcn2cu1a+pw;
	20:u6Wj4bu7mVGDVTBODvUXXPfY3+gqhXSp9g63UsDHjYn4dSUObM/KaefMXfQy2b9G8vJcMfdnUxrVRQWyPweVabr+hiFypCvtP2PJB1Q7SLhekv8L++CpOVtNSBrufeN2KaUuP+o+K/84M1LTglUDxXIkUOoijqcWd1g5o6sbDTU=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2018 00:06:17.7391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6383c9-9344-4076-1842-08d5e5f8f5b2
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0394
Subject: [PATCH] [meta] xorg-xserver: Enalbe systemd-logind is using systemd
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
X-List-Received-Date: Tue, 10 Jul 2018 00:06:18 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 882897bd25..89318e53c5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -123,7 +123,7 @@ OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
 PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
 "
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-- 
2.17.1


