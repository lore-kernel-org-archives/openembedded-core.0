Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.51])
 by mx.groups.io with SMTP id smtpd.web12.5422.1617950147037760678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 23:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=g96SmKd0;
 spf=pass (domain: kpit.com, ip: 40.107.139.51, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPicAL1j0X+Bork+Y70KWEr3dvEobbtCCLpTSyrg8E7JIjBQ8biRz120NuX/8wz4PhH92hRCUyrpiu5dL8dcDpQBOLmeW1tQM+WlDoecSBIzGmZFIA/RkaoJsYNEJonNnx7R74Hza420r6cyU19xp9A3KPh8xLMYohayz+Xtv1Tk9q77861asVuT38ldkQkIbMqFgENUNb4nporD4K3bBREX+C/U61WLml9kJAETDcviYZbBnQFwTbaT1e8jj1soecH4/xij9R+uT/gumzDcC9v58KKYEB7MwUYUOKXxOGbAAF5CcQYdWCcGOi+21PeeIEQswl9/pD+gtiuxHhrPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEp/ePjAKDnJH5dIb+mDe9wwU35MRM+QdMyvkdhUJAI=;
 b=ZxU0IxnFt213lwfRyLbup91H97McwYVM3U5sxlsC2niVjNnxmqEjbEh1IdA3WGep0WtWg+J6wkb8apZNbgjWDLF6np2DLqEhkAyRAoD+W6Np/3a7L1sQNvbWVqvnDWxTEb4UmSn5KiYEC30ar5Z5kLzH104SV5E9+hfFj8WGzlHrOgonHAhRM4VFON+NbPoyv3t3FoMI6Gw7V3KANpUIO1Cw/kirGglZuhRzrx7dTVogw4X4JOZipTLlhkUXp4g5guKkFSYsTatxPqumLOgRuhpk5DGRk59mqXTrbMXBqBVU0ZELoZv/xmUwcR1xGuHiBi3zVpflj0B46gXyFM9gPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEp/ePjAKDnJH5dIb+mDe9wwU35MRM+QdMyvkdhUJAI=;
 b=g96SmKd0DVfysrqxBHUs4vf9URmGSDIbgUdjJDjVmnHm8tXeUT9zfaB+1ziJ0NxwU74Z0BaEOr41vNlFEFEnv1QpOqBcZTHww2eHYxOQiPOuPPMfzx5GkMAaxyiWE+b+XWpbSMKrRJ3GwUUorrGYcK93UPVXrdc/JIHeHiRCS+k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MA1PR01MB2955.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 06:35:36 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765%3]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 06:35:36 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [meta-oe][dunfell][PATCH] fuse: Whitelisted CVE-2019-14860
Date: Fri,  9 Apr 2021 12:04:50 +0530
Message-Id: <20210409063450.10269-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:2c13:338c:2c7b:f305:99ec:f931]
X-ClientProxiedBy: MAXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2c13:338c:2c7b:f305:99ec:f931) by MAXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 06:35:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fd2fca1-a189-4059-2d3b-08d8fb21aee1
X-MS-TrafficTypeDiagnostic: MA1PR01MB2955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MA1PR01MB29556C27740BC1BA90798A9D87739@MA1PR01MB2955.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nC+lF/V3PldTqEZekt00aSXO0hy0TasBxYRL5ex76zYvWIIRt+PZGoTEkvCDEomNoQGHOR5KOaObRgMBCIyyRYbeayVlYx9iLxw/hhTmsoCN5cff+ymGgaoEuHwDeU85URZ10lAQMJ3m3aAxX/dTxJp+Xa0QOL1l7qAD3ygGPv5o7Al3dnHzGeEQO057WlE5HvT5V3rt3DwUUgcNgtEwhS5hF0hr5Y1M1MTwAkj8Eq5VRp5gauD4gP5fKT7FnJ+/nPhXlvRXihbXUl7HKRqrjWZ3WcNSTKp/IVT1zHjcHnjmNnDyw5yH70yfC4lgLsMZWRF7cnjH+Cdt6XF7RtD2H65vfVmQbOS5geBKDes8Z1HaFaNQpCeqW3I0Nt+ajQZD5YOr40hO/K5B8LZsQOt2IdnFIQ/tx2HYgsIvQOWLZhD6SANKXYuApMIrLNCg86OOR6hKBwiH+JibUqW0tgBiYCA4I3xdkogfCWS3FRj6Cecrm5G0aovnytBCXUAiiBnakoAsppZ1nRVuCj0/pgrXPbLXRSEM3kE/e0zP0l1z/a/xyfwN7sdPxDDT3no0dZFSX6RK8jrwyhE1P1o328FvBj80Dv6S9XTUIbuyUiqdAsRmcwX5ro2qz6m2+KrZoPrIbSVwZzTKZpbOLgnGokf4CJjui4hjVzkAN/44bssB99gOucNdTryQlgbYksat7MUhe3bfCSBh/jRveNaeTdpjpxmUBtGUefTkOWm2683/QJ6JeD0GjGYp8qAUqEjlL/JYYwghCoxqtjHQr4Jjhz/JFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(316002)(86362001)(66556008)(478600001)(83380400001)(66574015)(66946007)(66476007)(6486002)(966005)(36756003)(38100700001)(2906002)(52116002)(186003)(16526019)(1076003)(2616005)(4326008)(8936002)(5660300002)(6506007)(107886003)(8676002)(6512007)(69590400012)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Gx+lldppfAMwRbAgFm2dlT8MTlGKs8sOngAb7Ylni/srM/oqo+sjj5yeHNfi?=
 =?us-ascii?Q?9eCWsWA35fvbPdlxh4Nn5aPIjBa1/6Ub5UAMBrv/flA2pOYk3Fb70Lu/vBPN?=
 =?us-ascii?Q?9yBGhkF6CyQPj1TQ0tNhmg0I/SZ0Bf97fvQ3Rev+1zu3MBK348X1woT4fCaM?=
 =?us-ascii?Q?4Wa978oR9krj6FoIubCJQOL4T75SJYhGybVCsXoQnYBmZ++GyNP8Zd3D9+cL?=
 =?us-ascii?Q?8Vv2KyU13pgHjsxlQyVqu94u25ZC/N8WmjqC6dKec04g07MBkdBUgP+8PCLs?=
 =?us-ascii?Q?L9In7Q4yYLSnsaCoFYGjZ+rFm4CXCX/JcTyEPTUgopc8iq6lHKF4mfRImbFl?=
 =?us-ascii?Q?jmqK3Wyj5cIY9PQty9JgvADwvoQGV92/JYs8egAfRidL8+0UQnXtGUNmoo9R?=
 =?us-ascii?Q?Z1/qaqc27AQkZRNBCCPow7LAjXIi5bMa7YvBxXAph3w9dtqdeIoDEjKPFK6U?=
 =?us-ascii?Q?1sCdnjPkyiEQ3ZHcLVuPeeZU1K5amMlOVU82Kkm/5Biz4gmXNXhvme7+nzFL?=
 =?us-ascii?Q?caKcl9lJpCYo+rfnftZJUxJ0nFA6xqIrwRw7kw5BKKRvx/1om4I2BjlFEM7o?=
 =?us-ascii?Q?hcJ7m7KoAwwHKhQhxb0TH1/TlVAMYzbO+bWpSm1I8HWa1M9BDY2L/F56fUxX?=
 =?us-ascii?Q?LLgZsh+CKWUHwwHasR74rVRdN1Qvnl2RGM8shHefvYZJt4h0jiAYICP0cdUU?=
 =?us-ascii?Q?6+X+j+RAgNC+WIEsZBuvd4LY1O/jz4+OBJ0D7UvZhhh5H4ma4Aoz8GJmKSFt?=
 =?us-ascii?Q?qM4h5nNTbKrcHG9kac3oW2jhp1R3t5NDue8Hc9Wh6k5pzNQZUo6IZBuxIVpm?=
 =?us-ascii?Q?UkFRgcBqf+jC7LL3BOpr6mgoiqdK4F/8Zgb4fPsSFjPqtHIRvn995jeg6qKI?=
 =?us-ascii?Q?HTfeIqcM16knxt+ggqqq1KeG5DXJ6Cd+veoJdHXRlqRnvJJnyIFK0R67UbXB?=
 =?us-ascii?Q?PovkvIFTTigSKRDYi+TqiHoiWqlbt29zkBaVKvpv8NucBv0d5bJu9Z/pGunb?=
 =?us-ascii?Q?AaBdJ1RGgOXV27xoKQmBAYbWrtugP1AwJD33YYKgrXwirSZw3jre91onKe3u?=
 =?us-ascii?Q?mZ2noXzAQbfTSCdnY3a7RXZvZN+zrUnXVfE5Ek+PtGQxPQwoVoU8h1uud0FD?=
 =?us-ascii?Q?HHa7MmAQ8Zv+BjvYfgzxsknpAb8aX9slWaCwe+z1gxBfgNssSGi6PIEbLkJ4?=
 =?us-ascii?Q?6ah9ryn7KF/NRR/Ln5gTi2G2qne31GbuC9+Ppb8bn2gdFHTqjk/xo2B9SjDi?=
 =?us-ascii?Q?j+jJIIEA39Ohv0Y8t08QmtcF9PK6c4KMnCKE/jpu9nWDsHz4TX9i2zCpFAZ7?=
 =?us-ascii?Q?m1dXFnwhabod51jUiZfxcOs4KB2Fzphg5s7xKV3jZmkouER+rfkW1yo1VC9u?=
 =?us-ascii?Q?nKD71P3qOVOfzSTvIzjbdMZIr8I4?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd2fca1-a189-4059-2d3b-08d8fb21aee1
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 06:35:36.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQ54i4uhs4ZNjESMa/p0rjyEOPly2PkSK63KHlzxWvUhosEf2rp20E6x4FuzgEGhenrqKkgGJKM/q+U+bCFH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2955
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

CVE-2019-14860 is a REDHAT specific issue and
was addressed for REDHAT Fuse products on
Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
REDHAT has also released the fix and updated their
security advisories after significant releases.
Hence, whitelited the CVE-2019-14860.

Link: https://access.redhat.com/security/cve/cve-2019-14860
Link: https://access.redhat.com/errata/RHSA-2019:3244
Link: https://access.redhat.com/errata/RHSA-2019:3892

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-fil=
esystems/recipes-support/fuse/fuse_2.9.9.bb
index 2c272d452..601232c6b 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -19,6 +19,10 @@ SRC_URI =3D "https://github.com/libfuse/libfuse/releases=
/download/${BP}/${BP}.tar.
 SRC_URI[md5sum] =3D "8000410aadc9231fd48495f7642f3312"
 SRC_URI[sha256sum] =3D "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed763=
8cc6fea7c1b4b5"

+# CVE-2019-14860 is a REDHAT specific issue and was addressed for REDHAT F=
use products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
+# REDHAT has also released the fix and updated their security advisories a=
fter significant releases.
+CVE_CHECK_WHITELIST +=3D "CVE-2019-14860"
+
 UPSTREAM_CHECK_URI =3D "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX =3D "fuse\-(?P<pver>2(\.\d+)+).tar.gz"

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
