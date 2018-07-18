Return-Path: <prvs=730c0c5bd=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id C88F960616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531955077; x=1563491077;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=Pr9obOdek2bzNPykQEmqoX9KXrmJl3AqqDWj6mXqyIg=;
	b=kXJJj5LKYNmT22ll8Gang/ZrYOp8VtKlng6QdisBtwjm3o49KSMPT/CN
	4uOoWW7CIp9kaGdugjaoKKAlSwCIbwFqbyHTfS1JhRpsIWScknh5WWXK3
	gGb1hr4BgYzeEuxXLpFOkcJsIYTzhA4LjhvyJo/Er7v2rhxWHNBMpsSgK
	O9twTPWJFUm/UuhYgpVhIZrc7QSgAMkjWetmgLN6Y4qR5B6sSET9G/hat
	OEdV14J6XQ4bMhFkoYSwS7vAkhG8OI7NHDMK8Qzg69uj8U+ComgS0SBs3
	0LzBXaDLJTxFAmtvAWVfdf7WOD4LtTZ3DTy9q+tUKDP/0G/Q5YAKUN6L8 A==;
X-IronPort-AV: E=Sophos;i="5.51,371,1526313600"; d="scan'208";a="181417259"
Received: from mail-by2nam03lp0047.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([216.32.180.47])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jul 2018 07:04:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6FDuMxVZEvPwy2iiATsOk2uMhonPI+/LlDoJyEgbE+o=;
	b=KYHAFa7wAQjDiewRROhkJWm+/zU82XdtJF1LtwiY3Qk7rS/lO1r7LS9Mw0ShY7pwd3ZONA2JxlG6xyvjRwaUULTx5tT1uWnNG3z122M0HY0XNerXW8H9Opad7HKZrjnxs0IID6ZRwudaLOqzzlAvCc8XIpRc8oLJlLaRs8sdYoU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0397.namprd04.prod.outlook.com (2603:10b6:3:9d::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Wed, 18 Jul 2018 22:52:36 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 15:52:25 -0700
Message-Id: <20180718225225.28311-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR01CA0031.prod.exchangelabs.com (2603:10b6:a02:80::44)
	To DM5PR04MB0397.namprd04.prod.outlook.com
	(2603:10b6:3:9d::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5738542f-2d15-4bf3-8a93-08d5ed012810
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0397; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	3:BMvV4tER0iKAYt5bjH2xFxzXNlyY1E+BLMgimZg+x0maLAGGXBIoEWHmTG13xGhp9Fm1t1JW9Xnkz6ynwnzEwysBE03MEF6C0f0wyB2dtz8oCmPx4EC+5E0Sv7iZDMUPsuHrZfJ363D+0fyN4xH6f48Oxu+joDqdxOo1IXgKVLuVnx8ZoYCicDP7kZf5LYDEkECCjJ2C9BRlqNG/0SbzPPMuzmSplxeyj01RHrFZnz7Jb81ksPaGgc7pks6PjEa2;
	25:6vBombAj5JcNdhB/K4Ld3uG62V8HJKrAk1tzEOOOuiYogXiMprWweexUkt6dNTdn1RihTeyJROgnIDQcP4RG0Cjbem/su45oleRqd0Z8HLRNE4gu7b8j/B06cxFkFliUa+0whOEqULT8L8wQca90mysgmTesrvuHBMQftfr5bZPnh5KYIKkmZobdxoE7x1xS6QpsRhTM3M3W+oezom6+GwpP5R9Xmpkj0upefmSNz/YVwIjOfNm2wZa66L/q17eJSPap2CtGjCdeZDhdmL8flrPezEDxmU39wH8+yMeuehqDmz0reawQSPAGcOrxqYlnUFa8ZN4tZihrvEa6c9En/w==;
	31:SwaIbZ8NinHnTKV/CSzM+Dles28Y5yMJArC3Gy/0zIvq1mSJGKZOq4erFgaEyYsF0JrA3LFg7oWPPH6QXk6H1DgSis/+bgmshsOZDimIbY66I+jSC7S/Ix80e79bUzs5tGHoglm7L1RQpskR/b+5LZ0919YaYBE/pfGhykySp8pdXEKtLCX5Olbj9UPxu7v/gCNpipW2bMjVQhMZv3s3pRkrGUdllsiQE2f98LfnDf4=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0397:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	20:fTay0fncNDn/rMSK2fPjN/lnW9A7VQBPST8UkXKVlp8xkMatrvB0hu10G7zJ7CUh+ni+fJ4dC5tOIPTyC0wHyGCwGuRKTkLAfL6t+JeizPZpikveJBt2G9BwD+UNg8r0R4cxABVLXla9T1NF8PSQq0eLv7Efvty7mooZhbxMvktjPojTnYgugajYPGp2tK0eOVsmUFEWnSdkpT0UJJ9hJRngwystCNmjNsVRuoA8TMhxXBLunPgVxtuu6iBks919LHG5pBgth3EfOWpMWQBeJ0iJRSP29+51AMdE89oEBkoiomoaHACoAMNCPs/P6CcBmjVkVY7Cr1jQfD1e5blIhVsrYS6uF+wkxfEZtRp6QI1xtFrO9c5Ua1KtulWI8nnXq5Gg/Fdzp2SCudGrYPBotOrqVVCcpzwyZvo1JRK0eX7PZnPOqdhzKvYERwozks0DkMMiTAL2kkX+77TaufOYtnADJ20laiQZRPFYB1fI4ki0bY+k3VY5LIcZaVrBU+du;
	4:m6G9NiRf4hK0oQ6JJFab35963dKUUq6+f7A3mfwVoa8wbQZ8aEBgE9ulz0GrfhmdpWirhbGVs4B9SiG5+uPptTMIG2NFYnW5nxuwWY0TEsMG/ZUPdGHacJZgM6CS/2WhvANnnP9v9FDV1dlu7aToPKvTevoq+8B9ZK2XljCcygg83w7PKiUUeXSs8F9NQZgeLhJ2Zx4k5uH7PRGfNo6SI/fRrNAagA0WmSJBYRAuMqMR64/+58ToOGmclqAGekJ5/9ROSwUEFAHXutCiO4pTPQ==
X-Microsoft-Antispam-PRVS: <DM5PR04MB039715CE24361ED11504B12690530@DM5PR04MB0397.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0397; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0397; 
X-Forefront-PRVS: 0737B96801
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(6512007)(97736004)(16526019)(186003)(39060400002)(68736007)(86362001)(2351001)(6666003)(50226002)(5660300001)(7736002)(6486002)(14444005)(36756003)(305945005)(44832011)(956004)(476003)(486006)(2616005)(16586007)(6916009)(66066001)(386003)(50466002)(81156014)(2906002)(1076002)(6506007)(81166006)(47776003)(478600001)(2361001)(3846002)(6116002)(316002)(48376002)(8676002)(4326008)(53936002)(25786009)(105586002)(8936002)(72206003)(106356001)(26005)(51416003)(52116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0397;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0397;
	23:RTqEx4MJA6oF8FV6ZLAmMr9FYa2zcfRpgXtn7Oz/A?=
	=?us-ascii?Q?Y3320GRn9LETXsw1jQAs/f5AxdojrCGwakgQdzav9ggwr+w9FeEii20BOd+e?=
	=?us-ascii?Q?W0IMetEQZ8BpG8gxhNTh4H285MI1cYhN2gm6+UBRO9fIw5RSK7IOClNaGK2O?=
	=?us-ascii?Q?NmJZj9WAcGc+ZcvFGGqk7pikhYMrqpg1Wh1ix6rAojM0Phdr8oAcEFBkAA8w?=
	=?us-ascii?Q?VRWzy46whbpuVuFodykISR3n2LaF3SufV3GlXhWPVfoj0dNOwnHZ916AAMjr?=
	=?us-ascii?Q?zCwdHlJWGBwc4vRJsUKI6yXf9HsT7j7TPb9StKr0fvKOJkt7BoOMvSuZ2T5P?=
	=?us-ascii?Q?+bN5NVPrS1PI+Ansu9Oz2NIsuxRHnFrWYf9t5fsENfN5LhlUuUXjGjj3LJJG?=
	=?us-ascii?Q?3xF7D+MRyBDFvCMFJ1Lg0HzMZJZcwTiDlDwlZRsTMfUvubouTCgk9usmgj/+?=
	=?us-ascii?Q?CAkE2VTyjbFCP//OnVNJ/oDexNhOHk1tsPg1fj1QThbxvu2fIc/vSthGy1Ce?=
	=?us-ascii?Q?Nx3GqS3dB7fqZmNZ1meazbT65tSrT2AS25Lrqx/XHSUDfFPrjSSTI0nmcvyF?=
	=?us-ascii?Q?64b8wkju1mCvDaZcSE3w5Yw8vmy4SzWjKmtxIaKEgSZ4xfnNf2by4OeYw1a4?=
	=?us-ascii?Q?0CVc6wZwdpW54HkTEHkigvnzZA4szgsIruwYPnlKhqa0r1KyJtANthPoCwSo?=
	=?us-ascii?Q?535Csl7EVTcZ9DJo3JBrADGXALWLtgoj1W0dJWnToRJsxX6C0szSmPFmy3Pi?=
	=?us-ascii?Q?LZl6ha4smm3rJZKbvYPw2DChl16p/qsKLsLPt+DVAOpm08yA5vDl/B0BfgvS?=
	=?us-ascii?Q?MOqBxu3Yk7VSQ0rUiJv2ypXH9HkfEP/W+AOIceNpBvue1fj2aVnLU6hxCZjz?=
	=?us-ascii?Q?+kOyzRGg/k9C0PcMHFXV5u73rfPFEosWpqMr1CiApMjoopaHfCAgbBGitJQ2?=
	=?us-ascii?Q?cemUDkBThTETJ2xJNm6WjCl+DZs1SJpg8eQ6gDs+xsQWQM6m7WY67fL0raYi?=
	=?us-ascii?Q?1VvZs3OgzWA9Piyf51fw6io8NbFn/iM4BAswz6fYXBYTKtbUZ2zbTe51oxm/?=
	=?us-ascii?Q?X7SEsA+sxY6FPfiUVbDa1nil6vHUwklFVIcP+HseXIjl7glM54sRD/bnR7Yq?=
	=?us-ascii?Q?uLvf0X68dMbxMU5EwNakp4rekX4RBXTksqlESsMVlIoGC2j80+AgDfadNg9q?=
	=?us-ascii?Q?iTq2ADAmFtrx/mCTqqpwb6SYBeawPVRkJWyZC2huKB/d4RX+CExEajFDSx4d?=
	=?us-ascii?Q?6a42Tc39/j8YbkgiRo=3D?=
X-Microsoft-Antispam-Message-Info: xutLrscNNJW9+Obbo9VXQwLuRv4w2Vk7n7B25wi7Ww8zZyy7tD8moGSOVQv6JHYAUt2r3e/ut/4pg6fBKTCqDSeNBbcEy8sjPCTvYaFlWDzbggvPiUyz1EkM0aGlJHXUTa/aj8oySyOT/POg8ctbhwpniumGjbDGcu1Z2sKsvXyVLkqA+LWmb5sYlB/GXtryexbKhYCZgPXRdXS2v8UksHZWCjit3M9NlyERX/6ffX+xH5jTg3n+Qn5wSUBIOcog0rOhGN1oMiOqK06qQM95lcKcbHxtjChP9xSYZJe2J65HhC4cdMyw/UujPBqdCr1AVgP/ug0mruUl6xzIvgqa7QqxRlZCcSZU0CfCLDMcEWg=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	6:z8UBkt3oknrVuRvEKwa6YD4CuDzXpkZsVBChDGHILtZtepUlJb3m6/9SKZiS7ULs/eahAumHHSZrjJCoUOYdvZ9dKHUn+1X2Rgn2Epp1VEuiOGZgntWAFNxWW3plI1woeWL31mffvuA4FHWRhKRURvA85vhznPZpDIKguprCd5dM13MnbvssnSHjhOsneJegSDyj+OKvEETLTzskZShWb37W4d0ujJ8qkE4uhIIFL9OGW+aD1GhPjJaFAA/Znq9YnQfcznFu8/NY6pf97f0lPGRVrh1P0E51fweawARXmTZAKjTNsppJhUxL3yHRQosnSsJgnOGVno0ZAxjpgKFooCg3Ai3Rc5XRuGQEDoyEkFBPPvT0uyF4cCHVUV9QLHHn5jKZazx7yQWBE0qgA6HxtkdJa2rOcpeW2B6zp0JElZt3zA1f0tJlN7Nhb79kPvHz9Yg0+20DzERgp4XvBqQx5w==;
	5:n1c57ZTkrd38Pd5CA07FL0zyf62Tfe1CPghjY9CxKUQ2JADOnSrw4eyvu//2XwJFbF6v6YJd9XdH9iEQFL92Q80EbnThsH5pGueKyfAdlQjwec8hk9zMIByjvd9CjyBQ2YDwWwOPkEwFPNdYTq5X4jUaogEG3RQJMQ7YGqVlpns=;
	24:gNzRLww15OW5b3cdZ7GW2klGi8wKQb8rRBL041XFmIggwlGomh6XXu6y2ATHkoZYIjQHs4d5fOmZ9+3iyjOtcd6NBYGVv7TwYtEcMELF6QA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	7:H5/kzJCHrNaISJIFqWxG8/OCEZpFSdzY1wPJP+CYd8lpS4EQq50aF7iENvxmxI3nVoTg/+dBKgJqB5o6Ex7cmFfZ0oo8gdw24zwhF339KmKLNP9rmvZn1AQo7ua0GNXjIK1G2PYI9f4VPs1gfj0qphFqrLc0uYnkpwJIyQgBM3MYHXbqrcaw+Rt9dZC1amZq0qSgGEmD+ue1OgxpXGQm0CJ2Q/PIYrdLz9C1Qch1DbAxRUztFm+B00eN8RK4svit;
	20:0/XwP4JzwY4VMCW+lfgx1FC7oG+QCNyf6lQMsLUvGSg/bg0NvdrExsiVH8c1J2CPqOFekfXKfFY3QT4mQugQTKOS9EpP3rUSL7ucICLQoaF90IqPOotqyNW7RMgUMceWTQ9ZcFuoQ7dkOFSuHaLWG6aVHdEKhKmaMAHzynSQYcs=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2018 22:52:36.3584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5738542f-2d15-4bf3-8a93-08d5ed012810
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0397
Subject: [PATCH v2] dbus: Enable user-session package config
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
X-List-Received-Date: Wed, 18 Jul 2018 22:52:44 -0000
Content-Type: text/plain

If targeting a X11 or Wayland session the user will want user-session
enabled. To target both of these just enable user-session all the time.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/dbus/dbus_1.12.8.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
index b3ddaafab5..eec22f7db9 100644
--- a/meta/recipes-core/dbus/dbus_1.12.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
@@ -102,7 +102,10 @@ EXTRA_OECONF = "--disable-tests \
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   user-session \
+                  "
+
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-- 
2.17.1


