Return-Path: <prvs=683e62043=Alistair.Francis@wdc.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Jun 2018 22:24:20 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id D0B6875065
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1527891862; x=1559427862;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=70Mkqf7e3sswHEP1nzor0mIr5gKbyEaxqdnXua6IzmE=;
	b=MjQTIm+Py1pUtu5jGmLiL6dPVgnulOxk+W6G7DPJwffZV80D1GFhNJ8J
	cD+TeJeH8nRUYht2QHI26dc0OirnetATJquKOHAak79rmfGnFE3k4mI7C
	YkmOe6IvvVzSIf2zgiwQSNBoD8MmmU8fdJoNClSrDPp7eyYrAsHYc2lQI
	VWrYDK5Asm1f8j2gHdJ/iHdtZSKATLjiSiZiV9R1F6lRnzBerbpgCxBbe
	WY8ot1qSNRUebykys0QZxsXPDopREd1Ec1bP+8inJRqmqqXHjpEO+FZfp
	SlgV4SmBh6sALvv9t0EbEzN01ws1PIMs9/STdxYW2xHeLqlt49H2+sy/k A==;
X-IronPort-AV: E=Sophos;i="5.49,467,1520870400"; d="scan'208";a="182763637"
Received: from mail-by2nam03lp0055.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([216.32.180.55])
	by ob1.hgst.iphmx.com with ESMTP; 02 Jun 2018 06:14:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2cGUwZ/nfwSXbL7czMH9prGMQfodVjVAtippQzDs3m0=;
	b=MInf2OHOKZd2+Lz192JPekgTtebembbn7Ua2HKu2eH/xe+FD4NfAJWYQ+BOrtzPJxIp1Ka8JfM+Es16BVli3h4CZaewYjn9I3TImWTLUhArgY+5BDZCGczvSf9OVjlquEvL/rT5KGVO3M/fwu84msOJNc7t3b35yp3Hx4olosQM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0392.namprd04.prod.outlook.com (2603:10b6:903:b1::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 22:14:48 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 15:14:35 -0700
Message-Id: <20180601221436.27162-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::19) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b1::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0392; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	3:nAj0MIuAfH+ZDlIx9FRSwbvhOoF+VQzFjLfBfeVE4X2wn/NmPrKovKNSqBF2sFKgcJtGfbW4kcOB0zmqnV1LAumwVtvN+LNxOVz81H/rUZ4vlVxLaw9BTVCdknC1jrcsqvjuxrgaf77nOyKbvGg5xBeduZ065xsF/jIDOkIZIJCo6WCunmg2zKImHATPCKoqiRPPmXNscmuLB0JxaCJ1SnHIqcGuFSRnVUaHffMe/0N1N9LfnvXUkrcI8JlBT2CJ;
	25:Pcj/596s5vsJ72YSs6nwkfXltux9rp9E6o+C24m7dKOU4MMEyqzs6Wuum/3qOt6T+vgFZrX47Xu+7eBX/aQYhDUl/rfwOR7EUk00cE49cNG4ZJDhtm1wDMDZMuhw8eJTA3g4HE2FCE97jQ3ASEvxaqvJ84ZtQgrlK8W3vDljMTcSoyldI7FDAM66DQZOk5WG/FOhXDN3AjGeUGq7hz0R8IAwqs32LHjLP01k4iGTjXtZUx95rUxgwSMk0XaFD5XFQeYvd/+3jiceGp2eBjD1hDBAywM1GfRM2j54PQmc2UadxCEtq8uvEsr2mpgpzaazhht0RsCzkemFTa9XZNXL+w==;
	31:rUpd1M8G9MWjA/gQKLNntnoRpRkbdFtYqhYkfLxOpw2wDpmBymBfwGd5BhT8n04/J32Evm44+or+NMWMTqzf/zjalW7w1nAlnfbedsKRBT4dhuctyXeOcHF8dGBzxi0mFqbfN5X1/lyWkX1nSCLr9RT03luL5HlNyzQaxPFtJP/EBWrZ8+/WBhrK3b6g90kN2NludmBTdg2lCYzB9U6qqTbFvjJeanWYL739muYeyX4=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0392:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	20:epLPrajW4pW5Sf71qfweLd4+smhJG+V/2JNlxg63BbbKOIOORbvU7BTk45SFW4Mk/GDef3mxVGmqpUGJUShw2zYiWweZrzRSjLy5pd2AcotmnpqyWdIdBLPo9Nymz3MF7Oj9oPikzworKW7Kr+qYhuvu436k7SyKtxfR7Rdx6jNKR613MiZEdw8ZRuRb6Qa3c22Ud4iVXoCKYwrsIuTl0DaY07ms3R5qHXiJgJyOZh4NoiHSYEbVREsi5xgPSrp6XLFkv9VOr9Cg1GDmrclIb8iV19+CJrOOQnP8kL/hlbIyk6PAcSGesB7laFq/AHJ2Fm0lR0PlKmqjqSYkY7Cb9lNli4IRMcEE9T+8950426lh3LEaMRnx6SPgSDBXFKLjc6e2rLg/Te2LmJsc1FoSeJlV8qd+zKA2kLpAOdJR/LxXOV4N1+9TNW+nspmCvoKOoebgWLJdGm2CEk6ZUiotQAcVkV3FAAF+WkINpK1kd5zXgI2yMFBj4auI2cbh7K3M;
	4:FP2jG20gZvux+NtDYBKV4e+maf8WoeWBdSOy37HXlteZ4Z6cVvOo/bJsbM0sGVBZl8eTpDQCUpz33wIsP1WBoNKu65zYgIaBzJRNM8YEWV9HTaxQ7lESw6tG+LllS5jDfg2MS4ysMWQTovRDZsqLg2iFNRv4J0PFyZMQXzCcAHNI9RuDxQ4pRwtbJF2YameztKfVZFign4roc+7PhHhvF7XhGj4mWouczY1jsJYIXOdhq+VuyKIZhGonQzxNH/flCU4FLql3GhY0nhruk10M9A==
X-Microsoft-Antispam-PRVS: <CY4PR04MB03925D7CF778094D0228407890620@CY4PR04MB0392.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0392; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0392; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(376002)(39860400002)(396003)(366004)(346002)(189003)(199004)(81166006)(81156014)(386003)(48376002)(50466002)(50226002)(2361001)(8676002)(2351001)(6506007)(6486002)(305945005)(39060400002)(7736002)(86362001)(6666003)(6512007)(8936002)(51416003)(26005)(53936002)(36756003)(478600001)(3846002)(6116002)(52116002)(1076002)(6916009)(16526019)(186003)(44832011)(4326008)(106356001)(105586002)(97736004)(5660300001)(2616005)(2906002)(316002)(68736007)(66066001)(25786009)(956004)(486006)(72206003)(476003)(16586007)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0392;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0392;
	23:iu2uBb1Kuc0OmTGwFmHxbCXiubsLWRHJgluwzz791?=
	=?us-ascii?Q?fmdrwq2BJZOQ8r5r0vjJA0KTIw3qQro9L/GCpTQssI3MGUopCx/K6+5CCYd3?=
	=?us-ascii?Q?0u4RV4FtNNE1G7GgF/t1g8N4J4LcH+nwzL7TJ6/DfsIlqw7LfyXyLIcMp621?=
	=?us-ascii?Q?KebqJkkPjBEOiwr970By24m56t7iC/9ak7PRDCFnH+p8Rd4FgdrCmSQnSlRA?=
	=?us-ascii?Q?E3h4yu0PnH5N57phUTwWXQ5beIOenpw9iIzfZi68o8rmwRFL9R7avXlgnqIj?=
	=?us-ascii?Q?9yIW9xXzdAYcQBunmy0Ro+oLENcjxF+WX9n9xsbxzYidq0w8qyMoRThp59Zs?=
	=?us-ascii?Q?1WiyrYOZ/YjEhx4f5e8bWBIxwoaIog45iljMuNE3HX6LfaFW4wdUknGmWwtc?=
	=?us-ascii?Q?C6sHYQRKcrlfStSOYipYUjViuVg3schJC8/1wg0+/525Tnk6WLvst0AQaT5g?=
	=?us-ascii?Q?ZPhng1lynB+5FL/1feXuziHblf/HNCzdc8n3Sn+h2lTF0qJrXDDq2KLqcLLA?=
	=?us-ascii?Q?2QL9SDFrSFmSvzAQTydZrhA2wYV9zg3Za8Zld+1zXsSS8BBq0CumQA1qUho+?=
	=?us-ascii?Q?CvVGftL5YNRdAqtL2mZKW+TIVKONToN7SfTa9/UU6ybBeQgUtUT7JwtS55g5?=
	=?us-ascii?Q?A4IfJ+4zItaIDDZnPuQKylnNv+ZalAxmEVEZCuai6vdlxLqHPfk55M/klA+T?=
	=?us-ascii?Q?ObrYI8fMtAPk4B6dSNsUx4IbIUADa9jbYuiG9z200rmjgrj+fPBtzd3Mz7AF?=
	=?us-ascii?Q?o/Fb8Vk7Vxj2M4Ffmo16OFk5Iz7zT7SPGmK5Gg+5DUmqC382BUFstK4HzMQY?=
	=?us-ascii?Q?LnY3IpFu6l3W5lYBbSoDMY728Em0NSrtHak61m+qRb7tdCRmFpLeHYKQj0Ui?=
	=?us-ascii?Q?lUWPxqohTLlcpq1ot3DJljlwPb6W5HEBXCZhYQO37TpPuxfXmJq16HLxc7Cy?=
	=?us-ascii?Q?lRKYtkVD+DE8qsG9gBdsDxuU79OAW44R/DZfEC94EST682cD19pQ6zf9Eh5n?=
	=?us-ascii?Q?e/XVBJcXoDkLn/lSXjmnEux2kkp8oEah1Dca9c5faSqjdfFtv/tvD8YrJAYV?=
	=?us-ascii?Q?vqFV2rk1+47nbXO0p/P7YukiVi1ddLC14lXHfTRUJ+jKjiPYQBS3mfg+f21T?=
	=?us-ascii?Q?FkQs+gK9wI3pN949PVgsXczCVodzR0qFtTYu4U7+k47n4uevVEd4kaVTApZN?=
	=?us-ascii?Q?KUTOEqYn1nFN9/JgDEZKrY5OyF1YqD7gS3rWCjeKYQqbgabprq7NxKjd3zJI?=
	=?us-ascii?Q?cw0byqVEDP22WfupNc=3D?=
X-Microsoft-Antispam-Message-Info: IqYbSMQhOfmg68SeeTdgE+eUN+sGIa385/tP/S2inzhSj6FX9uMVIBiiPd/QON+VkgLwPgJmjgxonkgixCO2myOeCB6mGw+jVh1Nd6omWqf2GI8s+LTj68QdNzf8CfDfkt2RZlZsEaTuQjzUkwwx/ZzfESLcNtSLUjmdTMVdvtUrA/kCynU5aWOL3R7fcqYs
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	6:ZD/SFzvD5+ucJoNvezrAtw7wYOqbOYjhaGVzokmKZhfwsKQqnQlayts5k0Jv6x+hPZtkFhF6wnMJcqdln4rqDXYPzFNljCRK5VO1r2/ymrTMbMd56SFC+fVuGq6A+gv8M+Wt+jHdkmbY1PcRyESKZbS2tD19IOrDnV1dVL1g32fa11do7JD95kt+p9KhP3wHo628hpAE9sGfQ5eEO9pScB3Q0Ozd3fRTdZOS0sdtx08gsirrs+5m9S+TaXhN25CuIag75NKSnH8XaGFLh8Mg2k3kEtscZjG0kUpWWKl4XTYIeB1EuvfAYoeHq6zFRiLULwhkyby6AIM5LHYaPZXvexs3gP0FlUkhgbDB3eLmCuD3mf491BEHX7RVYwSyg5bNtTriQeXf0JnoHuBHiZyB36ZMqe/CmLb4XvvbCCx+jiYRZcgPkrhHN6fgqi+Gg5NZjpFQ/qqKM+wnhSsMdNssgA==;
	5:Wyf/RTaedNOxSAsjYSWtk1ye4zpMCrxYU1kZf0r/+G789X1Txtz/FYEQ77NM6AAxHYf2RxPvWv9abxdgHYRqOp85eWSd1rsnUjlw60utew8oqElDqAk/8WHRF3cbGmQUvNhAaMnEQ+oyY/Fz330coCG66UAl/YhHR+c8GD3W4S8=;
	24:5Dy5RVdRdFrQyYoKLUQXW9dfef5PfXDnyLrLbaId2ND2XzCCYozuy42tdxfLLjAxjW6xgW+BH1nz0rWZxmekjO3hFRMOMTiEv+bWD3x2CSo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	7:v0XIpXzzIswSjukqBfPuOt0y719mqG+PmXbSdCfRTcNlqDrzuThPEsprs2MGl1dOFJL2cjOxoNcL1AFX52CcxvxThkQtg1BcW3fiYSaw++ENHJdXrN4732pk/pKtkdV+Nxef07ImZfsrYfbulH7cY6sABHRzLaot8KlUQDVrPujrOEcVhJSBAhCLjbl5IGsj1EGVHipVS2to08LUjoLA3kEgtO+I6f9omiViWZ/zZ3z8NpNVOPGPFvoWprk4d2XM;
	20:xG+tX9MNfJtstFU+idNPgK8vjxcQ1mAtFfFWAMdXkPAekpKlOFWx2eTwaca946H8Cx80WYjvO4LSw21DoOspGPw7haQhoDPaT/m9oav5SS8t9VtR1fkWDY6dvQm9YxlZABOGsIKZcBBq0QEW4BZOHBIIplF3frxbqpI5t3/U530=
X-MS-Office365-Filtering-Correlation-Id: d99318e2-f9d9-43fd-9cfa-08d5c80d1728
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 22:14:48.9339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d99318e2-f9d9-43fd-9cfa-08d5c80d1728
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0392
Subject: [PATCH 1/2] [meta] dbus: Fix X11 compille errors
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
X-List-Received-Date: Fri, 01 Jun 2018 22:24:21 -0000
Content-Type: text/plain

When building with X11 set in DISTRO_FEATURES we need to specify that we
depend on X11 native for building dbus. Otherwise we see missing include
file compile errors.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/dbus/dbus_1.12.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
index b3ddaafab5..40868628f6 100644
--- a/meta/recipes-core/dbus/dbus_1.12.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
@@ -6,6 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 DEPENDS = "expat virtual/libintl autoconf-archive"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-native', '', d)}"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
 PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
-- 
2.17.0


