Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 1085 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 23:42:11 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0089.outbound.protection.outlook.com [104.47.40.89])
	by mail.openembedded.org (Postfix) with ESMTP id B01E174752
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 23:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qxDRagE8xw8r1YSXGZfVCNjXVKlEMzdYjEd+3G6Twfk=;
	b=cEPFgwvTnvAsxCnp7zVd1j+A7P6bwKLa310TNo9fkxXrhK7Vh9hAX21YI0Ygw26s3s/hkVKA6TxPksVLAPKlEZ/JjEMn8SuYwRGQDKLID9qSFzPu2yWiTs3J7h4NOz2tHvISwwPbVBAk/94prR4aPzZk8xNrI/LSuurHmRxuC0Q=
Received: from MWHPR0201CA0084.namprd02.prod.outlook.com
	(2603:10b6:301:75::25) by DM2PR02MB366.namprd02.prod.outlook.com
	(2a01:111:e400:241e::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.776.16;
	Wed, 23 May 2018 23:09:41 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by MWHPR0201CA0084.outlook.office365.com
	(2603:10b6:301:75::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Wed, 23 May 2018 23:09:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.797.11
	via Frontend Transport; Wed, 23 May 2018 23:09:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39488
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLct2-000060-4o; Wed, 23 May 2018 16:09:40 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLcsx-00050g-1O; Wed, 23 May 2018 16:09:35 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fLcsu-0004zo-1R; Wed, 23 May 2018 16:09:32 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 16:09:29 -0700
Message-ID: <304c3b9b71c18f44d09a4ce4a1e42e75bbc26e4d.1527114300.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527114300.git.alejandr@xilinx.com>
References: <cover.1527114300.git.alejandr@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(396003)(39860400002)(346002)(376002)(2980300002)(438002)(199004)(189003)(2616005)(476003)(50226002)(8936002)(36756003)(59450400001)(77096007)(8746002)(2351001)(426003)(7696005)(336012)(9786002)(486006)(126002)(48376002)(478600001)(26005)(186003)(118296001)(2906002)(36386004)(446003)(11346002)(50466002)(4326008)(106002)(107886003)(54906003)(47776003)(356003)(5660300001)(305945005)(81156014)(5890100001)(6666003)(81166006)(51416003)(8676002)(76176011)(63266004)(106466001)(316002)(6916009)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB366; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT047;
	1:4lXmqAnOCrRXTk6wwwFZee9e8ga00zxWRKTW+K+uwoOgjtIrHBsFI45pblBkM0Fz+vNoRk2PQRqh083U81S/l7VeOAYlJ4G6wCRnghhR42H7aqOwF53Bk3rMGNxLYtTe
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:DM2PR02MB366; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB366;
	3:r3/GWq7Jib0NpVlgh+jnRHzDMcCrVATNmtYiLCzPqqvJrRc5DZ6osdPhnDVz35DPnQuikDOt1WYTe2g8hO5wbHAMOm14/vSdaHXBwQbtfng0yw1ngpzRQ8FLAnY18MgeUVIrCcgRQDKe2zHaxfLf8EcWgwkAa/AFsm2BJER5mXVI21wCb3vTxm7v59b5+QLPGHljPZ1Q3ilQhjACjX/0ZkF6AKQZcQM3E/8a2EBJgG7n4/YHVRgtGofqWiOehMEfa/WHQlsMXeCnQrQ6QB1To+Le24Avv7rnPjgnExKa7ju1xUBBPwdv4FkC6dyIIcwAy0rCbBY5KmXcKuSA8dyZs5yLq3EHuuWnug+/nW09Gr0=;
	25:gJ/xBjmgx9d3Oneq2lULcSINZ3ieyF6GKOyflxrxNQUJAnzAaWC+UbRjHLMrDCjCMIjF+PNqHsndvCru4UsN1TikBNgGoB3yNKriAroUxPnJY8D9q/4Mm69wPYQ3yR9jv0cZt1xHXE3U3a9fQ1UVLkMm2Xwlr7xL0mRvEkAcuNo5FVOmvyZ+wQ1+TZU6fmoZU/VFgVSc+FErWqWeoqPsRcvoEdHCP1BNrHtCxBaFR1eI+cma0fsIfY0GeQ8bcr8kIPjJKhZDFfV+aaGUzZ3BlX7qAPRwZHodLYT33hm3bpJ7PEON7vYoZjAm+PIl61sm1dTNoluLbllJaqgVogK4BhsI8CJ/sTwd5/O4/kWiMng=
X-MS-TrafficTypeDiagnostic: DM2PR02MB366:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB366;
	31:OmgKJ2bDLvjxhP0HbBY2h8HOgOvB/lEZszdIy01VDoIJuJKVR9lXt8dkPIcEDUEKyG0nDDmgTTxsd2VX/5Au9d2kD/df4CeXEbOI8uXspXcvBNj5Swx+KTSRkbMmPKlpg6HLS97GnycqILhH/oPMJ65eGITO3QApiWNUglFqfYJXMDZHG5KhSKX28+RrTokwV50RBdHw5800zyF+jLqooAoWWcWLaniMh18ZL9deGsk=;
	20:6GF68GiibEqiYINT0WosHClVY/LckF58BxGG7c9dhpw0PxhaWIAZsDLStxF8Rq9thSlQI/VbpcDZ47TigzgtXaYfhACLlfA6xjzDOP0UR6/edmCbPCXowO6VmE27GgCTBsFEa4p+2b1vzZRZxm1FXee44ZSXTH155ECGyAXPND9785iq+cMwsbci+bVDcoff9tQ7UVE/vKkr13uoil65nxayu+KUwTuSY7Q+YaH8PT+w2RRP4cX34lwA//PYwj+6LCnqvqRiKfmAQGX5E6gGbetYjIPxPx+pfDD0qeBFTunFEqpPPYuJvINeXytfsXLfrWSb/+zeIX5GCmrO1bmt4sggTYUctEdBrc9kf+2K1BrfoIQzNr/7KuWDIbKJBiZeon45XB7HGZU4BZ05LHc18b38CyPvYd7v3Ve9fTKBOj0X/lHX1z4m5IS0xvjPCZ3bZlhbvJV5jTW6x3eS4rHoQO6n7dvdLcAbRHmQY5Ar/6U8PwNZKhdOB/MLsjI3nEEJ
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB366E11788D48EC4C5EB7B12AC6B0@DM2PR02MB366.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM2PR02MB366; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB366; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB366;
	4:nRR3G5Pok/xxL99WuUCM2aPvNek6jU4dA1mjbuMbjqC8F0vaqDfoTdkI1JKUHd0Xq01mYnKzc66JVxLIkviLj/bnEiHmfMWmpGsp90B7SCYla1ZoRvgCZTNUAuJgbNpyu0poLzgiN6rO602XmUx7UYCNcdcZXJO21m3CXRh6Sx1syiO9sXQoWMtMrUCCEPxZJKhGyugCNi0GxEbMltsA4dBpoKrJymJhHednP4EijaSMHCzOlZBKTDkfrkuDTEQmOFkX/cA1plsFyMsg527wY1/F63Rymc/Ydb1+BB6FBciq5HIISNfJeUG1kkMpLkbVmNKh7xBjL5JDOPqVeFVBKRGucjqbYUg3wtoH2zmXYd0=
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB366;
	23:Y4QK35CDZuDEJrdw83REU+aVkw5Qv5xU4TRGGz/3Ok?=
	=?us-ascii?Q?nZJIv/DruRW2BDpKcwZM/zVxDihp5zzhfGHs4V7Y7s3ivGyylgmpZevFjsz0?=
	=?us-ascii?Q?1bspN2supcQanORaS7wAp0xOM8QIh20KiTlXMXk0da6aT3qUZAYdkvYGR2/5?=
	=?us-ascii?Q?vKoan71aNR7TC3Z2t/lYkDyVp28nxeN1ggdJOQN/WR66SQd/PT498Tz95SV2?=
	=?us-ascii?Q?JzZnKth6zRLU3Oas+DbdQLl/72tiNV/ORdroS+SmaNV0LTwse+arYIRZQJTK?=
	=?us-ascii?Q?Y5/FK2tBhFTII2gQvLNziQ39QPV2PS4idqF/4dp2QsMmK5bMQaNNbl/uhq2T?=
	=?us-ascii?Q?5Z5zeZ5kOmfRKhkzMRbJGkZbappy6HFQBvD2VJ+ubaw1W0b4YqOaOHuw1cSa?=
	=?us-ascii?Q?BHSO8wCZBsFnwECD/ouA+a2m6kM0R5Dpr1e55hYv4pMtN1eJB7hCFly8s6u8?=
	=?us-ascii?Q?arkwzgPABbi2QAeALwiKZht3bldno84JrRTChTsM0FJffWm55tuqptQUva+/?=
	=?us-ascii?Q?Zrx3HrYLJ4mgBxqC8yju9KWc9yiQwGbxiR/sl0b1rFWP5LcLNVGpTmrQ57mF?=
	=?us-ascii?Q?jtULwJxAG2V3nx/VUQYr6Km9wRryRWN4GHvPRkB8NFvklPI9uC70rJWL5art?=
	=?us-ascii?Q?hbb6gDtWWL7ttuYDem/75qRaQcG7GYdzmy+94ggNlCB6h0q9ci389b1IW9AN?=
	=?us-ascii?Q?uKNGntuaR4DgtSEXhaL6XAeAVejDEVm/V0dNBOep4VVSdCj1KqcOhg0BHztK?=
	=?us-ascii?Q?q7+5mNCEHmjwyAVzUXGZGOTAWtyMvZoVQapgVCsE/ljQ/N4TE6QHOAC3+Ic+?=
	=?us-ascii?Q?iD6JPp5H1romQVUhYtmfJKOts96Lh8+A8ifSW/gE9CWDiLTxgZCtks97BMJq?=
	=?us-ascii?Q?zRFQO6yv6eWoXDYBCzGWGP4FIbDKKQdmxu7V02CJjYFKYCarDNtt0JijAZk9?=
	=?us-ascii?Q?LYNijsNAUUC4cpZDD5fmA7YXJqCJIBD3RQ0TNAtyCJYsOo74sCuB//GQDkm6?=
	=?us-ascii?Q?bjRNU013p0EnpcIk1i3t6Clk+CUL3pBwj/qmkIjFqbUbnYONKO8yyJ3b26Yd?=
	=?us-ascii?Q?p1O6lHzmSS8npZfkkfkFokxYBEXbhmXXF+2J6WfnCUnx8pIQTkV+nhZAmHqR?=
	=?us-ascii?Q?yXG4JCfru2YkA4slgKNrVR2FxDkSA6htINwIYPbjmvw5JJdz+QBsQqJ505NL?=
	=?us-ascii?Q?JsY8mMEXPIR9tsEX8sz7yOqGcwH7X2aNgSK33Im1PauRFbMrocLSC2TypVWb?=
	=?us-ascii?Q?bvQJ0b3qECYcMDTKo=3D?=
X-Microsoft-Antispam-Message-Info: KGpndqfMmCpiIb9WHhrua+xH8Sz9iSgG0+a4hrNfjcj3K4WN3CUlDJOJQyPfzZbZ0nm6UaFo5BG5tvn2aLnCfrhSxHubUVYwXQhbDHjs+qXc80b3R/xQkG6zs1OXPD2B5uQHKXNN42UmIRdDNzjS2dVcNKNh/2V5CgKOLbI0dZYsNGX6Ehkcv3OnoYiit0Ih
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB366;
	6:hmWbUnB8Sly+jxwkqP0pSxlkib33gUpQyWKYuwf6auQzFw0lXIyRLYVkJhBAWFU5g9Ujev+Nd+7oQzskf80DkRC1wkfz1eM0ABK6FfFoUiZGZ7R5rgp/V8HGCa4mPVhE5ty1vgSd7W7Oq/kDOjEJBPLyM4/am1xteD2hiiW7J62aiE3OKeWo7rU57MHlo4Q09onpstQUrSe/2xZPGC/m7ltR7vIwpIhFBdsNC5zTf53ufUoxrDuNCA1ZSCzFVg84cV9GscEZE+6g6UGaKSeGWt2WI9tUIaAoxX1C6s5cM/kfza9P75Ji/Ilsxpka40rd+XZUIZuPZpifKR72IABSxyrPjA0dLDIe/Jb1BPUJ/4J8tCMmaVU3LfSYgcAAUzS2DpYOmQ4J16nvZfaX7ZCFDScMGr4qbaftMOAaeBSZ7pNZZ6dnF1Safi+Ecm0swBCFz+IU77azGfozwMJ2j/I1WQ==;
	5:9Vtbx2s1kzdCk9zrZ8GrNA9EtR3KVBk9vnjk1NWDpyWrQRlNtiD3YXxoxlurSvIjyVHtPaj5oVdKDYjhCuf1bdMwZvDsqWxkuSm3t2MBzAD/W3XEnIl+zg+n7TvCxQfyH0vMxP0DK6NhNvPSXKWMfa15G3s0lgdaTsYUjvJpVgo=;
	24:LZ/6LodmAo4DJIkj752sEsGDCs1IU9z0A2M9hqjX8QM1kmI+uOFXfJQGuah4rkvENMDoxz2InlNTvc5G8ZXX3g8i0HBj84uk0AbXduNxheI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB366;
	7:ksg1bvuZlR8r0bX3KsizPt/2RPUB39m194ZR9WvCiXnHTT4LqcelcK6l2zbkjNiygT7JVCCIhLXxNx7tK1PEWrqSLgvvCahhPPG/HQjLNwQCv5Lx9vzDU5MCbBVaaSJiMXgFCjvGsMg3NjrSMspAFawyPro8Aa4VwDiNrPx8X2PaApo3roT7yt+A9ampHGqqQqaa4Tteqk5zdD/rRELZOZAPnH+t0egcE/VLLCvYbOAesBKRqyishgbBm5mtmy2c
X-MS-Office365-Filtering-Correlation-Id: 41cbae68-f316-494b-13be-08d5c102434c
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 23:09:40.4385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cbae68-f316-494b-13be-08d5c102434c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB366
Subject: [PATCH 3/3] tclibc-newlib: Adds a new TCLIBC variant to build with newlib as C library
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
X-List-Received-Date: Wed, 23 May 2018 23:42:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds the posibility to build using TCLIBC=3Dnewlib.

It allows users to build baremetal applications with the use of a
C library.

Newlib is a lightweight C library meant to be used on embedded systems,
it is meant to be easily portable for new platforms and to provide
basic functionality on them, by design, it provides stubs for some of
these core functions declared as weak, so they can be built correctly
and then linked against some other library which provides specifics
about the platform being used if need be, libgloss takes care of these
in some cases, but it can also be extended, this patch also allows the
user to easily add other libraries to it by adding them to
NEWLIB_EXTENDED for this specific reason.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/cross-canadian.bbclass         |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc  | 47 +++++++++++++++++++++++++=
++++
 meta/recipes-core/newlib/newlib_3.0.0.bb    |  3 ++
 meta/recipes-devtools/gcc/libgcc-common.inc |  5 +++
 4 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/distro/include/tclibc-newlib.inc

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canad=
ian.bbclass
index ee8aa61..7f9a69b 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -30,7 +30,7 @@ python () {
     if d.getVar("MODIFYTOS") !=3D "1":
         return

-    if d.getVar("TCLIBC") =3D=3D "baremetal":
+    if (d.getVar("TCLIBC") =3D=3D "baremetal") or (d.getVar("TCLIBC") =3D=
=3D "newlib"):
         return

     tos =3D d.getVar("TARGET_OS")
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/=
include/tclibc-newlib.inc
new file mode 100644
index 0000000..a5e63d0
--- /dev/null
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -0,0 +1,47 @@
+#
+# Newlib configuration
+#
+
+LIBCEXTENSION =3D "-newlib"
+
+# Add newlib libc overrides to the overrides.
+LIBCOVERRIDE =3D ":libc-newlib"
+OVERRIDES .=3D "${LIBCOVERRIDE}"
+
+PREFERRED_PROVIDER_virtual/libc ?=3D "newlib"
+PREFERRED_PROVIDER_virtual/libiconv ?=3D "newlib"
+PREFERRED_PROVIDER_virtual/libintl ?=3D "newlib"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
+
+DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
+
+#USE_NLS ?=3D "no"
+
+IMAGE_LINGUAS =3D ""
+
+LIBC_DEPENDENCIES =3D "\
+    newlib-dbg \
+    newlib-dev \
+    libgloss \
+    libgloss-dev \
+    libgloss-dbg \
+    libgcc-dev \
+    libgcc-dbg \
+    "
+
+# compilerlibs defaults to gcc-runtime, but we get runtime from libgloss
+# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
+# for compilerlibs since its overriden by tcmode-default
+ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}compilerlibs virtual/crypt"
+
+# Its useful to be able to extend newlib, but we dont provide a native var=
iant of libgloss
+NEWLIB_EXTENDED ?=3D  "libgloss libgcc"
+BASE_DEFAULT_DEPS_append_class-target =3D " ${NEWLIB_EXTENDED}"
+
+TARGET_OS =3D "elf"
+TARGET_OS_arm =3D "eabi"
+
+TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove =3D "zlib ncurses"
diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core/n=
ewlib/newlib_3.0.0.bb
index 3380576..09238fe 100644
--- a/meta/recipes-core/newlib/newlib_3.0.0.bb
+++ b/meta/recipes-core/newlib/newlib_3.0.0.bb
@@ -14,3 +14,6 @@ do_install_append() {
        # Remove original directory
        rmdir ${D}${prefix}/${TARGET_SYS}
 }
+
+# No rpm package is actually created but -dev depends on it, avoid dnf err=
or
+RDEPENDS_${PN}-dev_libc-newlib =3D ""
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-dev=
tools/gcc/libgcc-common.inc
index 848a476..d959566 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -47,8 +47,13 @@ do_install () {
 do_install_append_libc-baremetal () {
        rmdir ${D}${base_libdir}
 }
+do_install_append_libc-newlib () {
+       rmdir ${D}${base_libdir}
+}

+# No rpm package is actually created but -dev depends on it, avoid dnf err=
or
 RDEPENDS_${PN}-dev_libc-baremetal =3D ""
+RDEPENDS_${PN}-dev_libc-newlib =3D ""

 BBCLASSEXTEND =3D "nativesdk"

--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

