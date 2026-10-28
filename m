Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37396.1793171037963472767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GQCbr/tx;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EveOeZEUboP9DKSVhqxv+ZgBRU/Qdc2livzDawwh/QxGcnXW2n4Pq/0fCspd/oqsPb6euhKftEke/ypWaB8s4giXe677gFgDppXpnLCM5huwyyIcUQ/BhJNm3jgyZnVSR77QuWERbzALLkwvPSsW6PTrVrArhpqde28sBM8RzROStYThGxdwQjWaXXEhceSeazibORU3kbycrtGeZ0cUq1tmq5Unodg4bBdSAscEZ02qX2BhZfScuGS5xGz4/8bJ3Tf1lyshvXWrx/B3pFwla22kTDw/E6Yc6sRZDETNFwZ8E1LmPcRuubB2TRPvKuxONC0o5t/uMfAclMvG3DoocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTtf2YQXmt2CmHqKkl/0wzbc68HXUJUVxsiGI1vNiHM=;
 b=PDbFjlQ0PpRIwGo/hxw8bwtAMQu3mvTgVgH+aHZM0gRhwLTnroxqiW7SXzKoliTzdtP9bvIc1fEN8ILDPdGrZg/pw14zDlWrqfzxkbSvdSXa2D2scgTutRCRp3DvRYF8pSsiN8KcMsaH4KCd99F6Qaxu4daeZ36NCX2l8/XQo5jHWnEOMGkNUnwHCWRDPkT5B2z7ZnE3p+CbnglIBHXX9WboKdkqqo0CWsGd0BpZ1hXmIurCGZQ7Ov3t7uTqm2QnPmZccm23TBVyaobsM/H+FdZhrDkjRJ08piuZeO686P0V71VTrCrw92BX9abs9dY/bLwWHzwcwuPhr03PL5ZwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTtf2YQXmt2CmHqKkl/0wzbc68HXUJUVxsiGI1vNiHM=;
 b=GQCbr/txYk1cEwaUA7edDDj/2I+nco8F2yHviQaInbaZGwX0HHWsCvd0IHevDcroGB2putGLtAz//F/slDti2CmRtBEeY+6Yox1lCk7+pKfXZbWhFi5MjmQVM5wzPsv0RtMvE5I3t/aIjyj3dWAHi15DMPFjKjhdtxD6TMppu5Ql2G36V3rhHD1xvQdDlhQRn68wBftfeYA7DMFSWD5wlWDMeJzphnphWQjsgrqr/G/hOYHRRoi3BVL+EClnCvT9AiQRO4fmsQkwchTwPOdsI/sm4wV4t5z+KElswakCyr16I545XlRpyAjL/GtMCdXkgWIxq3CczG3QDpoKpv7Esg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB3470.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:04:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:03:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] python3-pytest: upgrade 9.1.1 -> 9.2.0
Date: Wed, 28 Oct 2026 08:03:46 +0100
Message-ID: <20261028070350.13243-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0306.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: 8893b654-4f89-484e-3196-08df34c1a431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006|261026140227099003|6133799003|18002099003|22082099003|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info: Bp3GFhgw8Nxoc5o2JBL0GD6gDmZoFYCgml2JeMuCtlzUl0W+RNQbTi/eFXtaMdPGA/G7wvmGbrJ24aajIGj1CAlqoDIBFpjbQeevjKWna/bvTQrAG4N0iJBP3cQpAbg2dJTTh5SBDpy0qPBN30qEGIteknVMn3XxHPeoiXIqKY1umokJQPmA2w0X4csM2kpjWBuaHtgrQHmI3LWqDQq699hEfEJIS/X0/F/bdJwAgdvnjUbl9smacR1D5l5Tffltu7rYo3G1k3SHxQsTTo1OWzO4qZx6CjfqE/ON7NrrxgxhzPchGjbrQGiy7un46FaSPpEnwcIMG4P0GevdX3LUO5lcVhEg56c/UOo/Kn1Rv8LM277gwILaC0RuCZ4xrOllJyq5gkm0KeDmJwJ0zQ0YfWDGG3Z92SiToeHqdv7VJqrKmprdoXUN5ag6/gCeVneV3luX7Vyx7qH15lZfHalOz4lEGdxUx/2NEHXDDHMVTU2VJYS0X3jksGGX0Ti1RdwHAo/J33r0qQuLLXxbfXTNbWEadLGILxTVhWIuSGapmvw+MR0ZKA6a+ZJXNGpNGN/eUPOPZPHhma1ufJiicR9C+MwJF5bzeyeh3VdIPPxRkQFpNlH3guDP4lBLeToOuY3c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(18002099003)(22082099003)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HgyI/1MjSVmjE7yqXxCY5ayBZ81xdHLg4RSFpLKbUz0m/J4KIMAe8WLOxnrV?=
 =?us-ascii?Q?kcDu4r5wJfD8gIDoaIXtB159iUPBQZaOFIDu5+IBXp/gKQaVTSQIiBuHzzTU?=
 =?us-ascii?Q?U8upBd4i6P2Ughwm6EvG4MuBZX9e1GXLQzH/9CFaZepaMFYGlbzmvRkoseDJ?=
 =?us-ascii?Q?hoPHogZottJkqxt+prl56ApFU0imQNahqEaJFCxAXct47uonhkAGUvK7weVo?=
 =?us-ascii?Q?KArZqLBkEfyQYjl+CVvUt0mHfM2HLQU1aBqmUri1i5miVzM68UGolBXAjgrv?=
 =?us-ascii?Q?JqIaLOQrb9AjyEvXALHYveDGfH3Dr/NoYhYpQh9aZ9hCRKXQi0WuyOQyd6Nx?=
 =?us-ascii?Q?P4aOx3XRlPpdBCM75tNRA3PDY9ULCikFsRbdj09m+WCjNQ14NdlF51T0hF5S?=
 =?us-ascii?Q?3EqAFGl1PezaRjRWGpllAT1bO5/GtYmRsEqnxJwSJBZVuO49XD9t7VJv80gz?=
 =?us-ascii?Q?wYnLaJuc009OZC73o1KkQMmAqfzp77jOHpfC2YForfLb5i+XF4yiHFPaK8zt?=
 =?us-ascii?Q?/8BfXrS4Y+jPaaXRd3Dqu6zV6iHel7LvML7j9ppkRwDfz19VG0S7h1nkDLqa?=
 =?us-ascii?Q?cWPgJrbwOMPB0+sc/H9h3ypQj4WCZuOwtzzAxP+klZc5gZhT4O//VgiGxBOK?=
 =?us-ascii?Q?Ftl2l1LId6M/cqVECMPucuReQIikhzY85do8kwCG18SLTUyF0jSWzdU6AebY?=
 =?us-ascii?Q?iqBDdFKCB3axV26Wp6rknVoKkcCC+473qJihdP7+6PjSEevW9daqFXSPbYsK?=
 =?us-ascii?Q?ORFiBs01uKde+iYmX3HH1Ovc0dlmK8hMC8pkk8v1RTKRb9kocMeBSpHsM9tw?=
 =?us-ascii?Q?zMoHBCl91WuhCGjbli/kH1pwuJpTO5NcrAk7NE8mgxdRI6S/l3jGnZ9GbDXM?=
 =?us-ascii?Q?55m10hrUUmrMUVEXjRry4yURm/tMgnNhU50gZLGDmsRL7l3uXl0Inmt1LEq7?=
 =?us-ascii?Q?cVzIN65ou602xxbjKspYOfIfNmiHoRy6ha27Z5gV0AqbtQjDz8U8KaE45glu?=
 =?us-ascii?Q?yS2OFXsWEquMeGV3gj4CXM1FV8goxQgUs2eYC4MbTKNp76PQZjTf35tVU54s?=
 =?us-ascii?Q?WI7Xfeadg7f7TTjtE5l/+s76DbJxcaD7Rye3N/ZfkP3Z1K2b0/sIrgQW1RtA?=
 =?us-ascii?Q?myGDqgUN1/PfgIZCu69QTyUbBFuCw55UrSraHr3tTDmizbpZkE9xmW7VgUC9?=
 =?us-ascii?Q?vjkuucONA9w8/atLNDoFL8ho4cy8+zKQ+dg8zDkEG6wA6O8fKTShOhSsBggo?=
 =?us-ascii?Q?42XblXYRJUVp2kzgzbRBQuE/Ov573NpTnkbWU33Fe5i40cKRXAEtkaqwJSmy?=
 =?us-ascii?Q?CX/8wsyU0Uuf7QKMpv0YOtazJLq0eymNA5OlZjZzdeml+/3UROoZSevQLhby?=
 =?us-ascii?Q?gRi6n7vJC7B2mwZkgCXQ+5l5yIo1Vaid4b6jBq7Z/KgRTWhw6rxphUBTtV/y?=
 =?us-ascii?Q?etCfB0ePHOC/PAiX035kog49W7JFjSpi7B6qbe2gc3YggS7VRnONY8Of/Sxx?=
 =?us-ascii?Q?W2alm2tJ0xHOklmTRJRYcSm/XC59yEc2SvnP4wnetGEGQMyu/ouoKg5RGvLk?=
 =?us-ascii?Q?SBgGy26IMD+9fqO4I3t4gv+TY8SCDKW4jtB6/Mi5KHTTK6rw2SQ8UsYgnapR?=
 =?us-ascii?Q?psK4EbGuGFHvcwP9hyFBHKe9oPW0Wobe+dlNqeWBcb468aeVOUksN1WQ+RaV?=
 =?us-ascii?Q?jdkKvxRRRGL9avVffm1W/SID6OB+q1Bi/zu7fxeKrLp49ss1pxoiDB66S8Zx?=
 =?us-ascii?Q?lmLm92GPHw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8893b654-4f89-484e-3196-08df34c1a431
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:03:59.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPXeCpqFqRyhhCe3h4a9czzxTvKQsIqkNZ8hd+Npgo30z112Ntxxh9XT+ZgFjXm2ZcN+dTtaMpuL0xEDwhcWNFMZkX8CP7TA1YPlmPE5D68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248788
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://docs.pytest.org/en/stable/changelog.html#pytest-9-2-0-20=
26-10-27

pytest-9.2.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The pytest team is proud to announce the 9.2.0 release!

This release contains new features, improvements, and bug fixes,
the full list of changes is available in the changelog:

    https://docs.pytest.org/en/stable/changelog.html
For complete documentation, please visit:
    https://docs.pytest.org/en/stable/
As usual, you can upgrade from PyPI via:
    pip install -U pytest
Thanks to all of the contributors to this release:

Happy testing,
The pytest Development Team

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-pytest_9.1.1.bb =3D> python3-pytest_9.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.1.1.bb =3D> python3-=
pytest_9.2.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.1.1.bb b/meta/re=
cipes-devtools/python/python3-pytest_9.2.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_9.2.0.bb
index 8c97596ccc..bd580dabd6 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "The pytest framework makes it easy to writ=
e small tests, yet scal
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbd27e41b6550fe0fc45356d1d81ee37=
c"
=20
-SRC_URI[sha256sum] =3D "1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d=
71f0ffda5fe313"
+SRC_URI[sha256sum] =3D "97c4f3b1f3c7414aa36465e09b8220f1d03627993bd51b1282=
e193753c80557b"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
