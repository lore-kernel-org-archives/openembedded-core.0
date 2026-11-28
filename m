Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7804.1795876939845960319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 06:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VkIPzXcN;
 spf=pass (domain: siemens.com, ip: 52.101.70.51, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Von19Wpwr7SnyGYTRsKbBAPk3+FwpoPQodnDcWf6YbputxRsCRwejL7CAKHUBxqbh6CUxbOde5EH0M+8eFObrvIvTM11e66LBy+8Rl3LKlMvzc2HQAr5cNeLfZsZDDxG+zR5RTf1AziUcEsNlpIm1/fw/b3LVZJdYnJZioNLFBOP3RgUv1OpecDPXksXDSxrCN60e6UjDdrogduBLNRAN3aLgy5owxt6xzD9YPurtAQwUqI+cT/XeW5JE2DIARgQUBHNsto/73o8oV6L68FNDlIIba36LFl+XT3tNgTlVfRI3z0vdQA9tSPoaTuP1IZAdIduo2h7trBJpWNrvhoMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5DVyknu4iaN4+WmynVn/JLnyMVJDTLg2tIEdh1KYVc=;
 b=ppDz0S7l+dW62cQyYL85rLfCCEkL1jG+qPu6rWjO8G2MwD/yrvE9gL/g4EDmusDdk3IULrVJcKphLcmVyW5Mz3G2pSsBINfonGwGZr5SfkhMKDUTkR2NouK2kOwRDojCFT1A0BBF8awUCRWAa34E+R8CL+F+VDqy+xXfOKVl363BdNTD4iWMl39/nd5PIbE3JePGvxHKRjo+bg4evrjMzihn1gyoLXuhSuZgekBX7jhsLBKCzn70xrE0KiQ+La/rNuO3d9UAiauIO6GblPD7fFQG9lrNprvTccjN9WD8EjTRgYnEdljKgYDAvAgjlxZnV4CEAffwA0rtr5smiKZ/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5DVyknu4iaN4+WmynVn/JLnyMVJDTLg2tIEdh1KYVc=;
 b=VkIPzXcN2vruDBeHuTVGmMbYvqGBYBCZe0rNtBIRd/fnT0Y+nUtwXjnuH2ZItd9I7q73E8iMc146GBvsju8U6NnsExlafjrPDCAKER9TmAoAR07pIo8gVwaLgYkkkr8m+fbk+VhkpEZ6AbUPSpxmdrTWwG4XtUTGpnU0pdlXcsD3OuCklBINEnP48UuPMYvSSIRU3cIG4PVtTugZi45sp0o0OWQKg56mEi9bdFvOSS/BrHW6vTJ/lHDlTVLT5NLpwiJaLkGeuHcruKrBnpUQA7iudppZPJ7h+Pv8DCOt52m84PknIfDCxbAYKiTmi3NFbJ1AY4E348iPPf/0chcP2w==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by GVXPR10MB8413.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Sat, 28 Nov
 2026 14:42:14 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0688.004; Sat, 28 Nov 2026
 14:42:14 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "vgharaee@gmail.com"
	<vgharaee@gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/6] kernel-fit-image: Add support for
 multiple kernels and FIT configurations
Thread-Topic: [OE-core] [PATCH v4 0/6] kernel-fit-image: Add support for
 multiple kernels and FIT configurations
Thread-Index: AQHdbV/2xtTBUZ5kX02v8ozy7NpdZrdDrUh/
Date: Sat, 28 Nov 2026 14:42:14 +0000
Message-ID: <AM7PR10MB3745D3AAA754F10125BC8CDA8E402@AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM>
References: <20261105164826.1340446-1-vgharaee@gmail.com>
In-Reply-To: <20261105164826.1340446-1-vgharaee@gmail.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-28T14:42:14.496Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|GVXPR10MB8413:EE_
x-ms-office365-filtering-correlation-id: 899c5693-5694-4c88-c7b4-08df4d5dcb57
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|31052699007|39142699007|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|55112099003|3023799007|13003099007|8096899003|10067099003|261022115727099003|261102123227099003|261021121427099003|56012099006|11063799006|5023799004|261021123027099003|261022105027099003|261026121527099003|261009221227099003|261022075727099003|261026140227099003|38070700021|261009223027099003|261028144727099003;
x-microsoft-antispam-message-info: bNH5QYbvRRS4tQzPC6iDwmZVYFBw3S2WQ33HNJPus8+hGbEusX/7G8i9Wz+w6HpNA3rZrme1CZ/jog7ZBeSL+MMUKH96FqiabDhsRXVf02J5kIARMu5iWrVDQqhKzXYLRBfsws1x4adjbzneOOHGMzdIwkMhNeALV/jgRptx3gYiJCSfhuFiuXh1uOgGhsCE6zTOszRH1BRaoUGZDwnv67mIGZZDCzhXMAvXB+IBrXDao/tOZC0e2xMRD09bv6XBodGqkSKMeyfcR2p4b7cZfUo6nlN5dp2Pz90XzOMZXFcWFINEQgKGlFpQyftlvQ0dix683DEfyV1o/Yfwcb4Mxbfg1mFy07rEpCddsaKisUy2cw7r2/Rd/qEjNP6mJqjZix68/S5K2zUVKNaFetZ2Ybr5dnCe0+Uv8mZYtQWtkwglfAVMoKx8DpQ6n0M6YUgvHaycA6x0g30xliH1v6+y46xrLy3tLD3KukqmNe2nWmsRkhwA9uiIGoWlLh6HcRMZVOZ+9Oalj21L5yDu1c+Ygg8ze6vxxaAHWCdALW8kBGOwb1R3cAuhkIt9wxesAGOcRsHLjNpp2gu00QgN8qP2dIxoXttUhZ7hv6l0QHvPE0O1tzHamzVF3PnF6KIzFCuC7jv+yEtPtRspcLXLqEIGMMNk7s69Qr77F+Vi1UjGwmM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(39142699007)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(55112099003)(3023799007)(13003099007)(8096899003)(10067099003)(261022115727099003)(261102123227099003)(261021121427099003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261022105027099003)(261026121527099003)(261009221227099003)(261022075727099003)(261026140227099003)(38070700021)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jLAywjAcdYWN0mM3wE86PrhqHsvUTJBdohkzUE6VwLoXLgUiUuxzWI3KCH4f?=
 =?us-ascii?Q?ddDf9XTTamQPOJnXiIed+3FTapHeBQCm+CKrkYVohG0/iOv4qCfuvp5dezdu?=
 =?us-ascii?Q?iMttnVbuXyu54Mtpk43jtzA1iI/f+vfuVOmzIcBJRJ1/OUpFU85EUb6Jy0GB?=
 =?us-ascii?Q?Ov+Z/msrKmCBF/M3F4Mpp5q9oTuKESHZmfRZpHugCfzrh17qCwX7Ow1ghSsc?=
 =?us-ascii?Q?ntRRwnL2YeurLBRmnGBowLVh18V5TkTceHFki/HSyFiN5ycKJEPN0/Q2woCK?=
 =?us-ascii?Q?AejXU5ee0l32zG3mRU6U+l1jRgBMPRFTvbSqwEaGcGM1+vYHdEIYeY7av6rH?=
 =?us-ascii?Q?MK7+BnUdAJTBlJ4iDd0n0Y/fRgcBhkDvZvQKmdj35Z8GvA6ERtXB3a8lKeDS?=
 =?us-ascii?Q?pRA8Jdw/cbFIKSmR529A1PUoCPhqVvZ7I7lRh61gvV8xof4gIbxhpWxfiQc4?=
 =?us-ascii?Q?BWcssgXmRCvZhpPsTRlHhSQ+BusuGKc0PnTM9gMgvV5OcxHO9KwfNG0ev212?=
 =?us-ascii?Q?2ciXEUMTyKbqK1AZS+y6j0cHesxXX1D78ccCc6tFLgqxXgaBXWezPB1r/BTB?=
 =?us-ascii?Q?jQYihu6WcBjXH5WtO83NqcAB/1+T0cgYbVy9cm/+lZpJwtxPkYnCh+/kDBLS?=
 =?us-ascii?Q?Js2yksrU5lgEAxMOmcDlSWKKXY542Kv1Nz2KN6EfLC2eLWgcQZEYpVw4U7QT?=
 =?us-ascii?Q?u3/tWBAPkb5SOKV4vOOb173/I5KIc5W5+d6QvP8iAlJNjZSFC+uUPHCSWfFU?=
 =?us-ascii?Q?3Wl1G9nv8IliO15ER39SYwLaLMbHr/VNtlbU0AhhLeoQPufCgc1nL+XIoNqJ?=
 =?us-ascii?Q?O7NzQYzUO6kIwMVv6LdemG4wuDB7gVc2fkeWepplky4aT7zKulF7D8bCcfc9?=
 =?us-ascii?Q?yzhubk1B2/iSF1WaGMXeFGGBD1DAVcsA7p/sjLdvhV3bG4ETafvFlH+ZsZYP?=
 =?us-ascii?Q?kLAo6x6wrCKzzOoG1ttJpf58DicJYAzg+ntKXQSP7ZDkrECwrnOqJS3vreXJ?=
 =?us-ascii?Q?Ecpp+yPARLD2jafzViynzo10WL8hkzD/zD5t2knhLqYKHCdf+EpgkT2K6GFP?=
 =?us-ascii?Q?nfEL5wFOm8aQhocUlqsSGtjLJRsSa2kyAxsyKES25Zj6bg8nifR9M9adLldp?=
 =?us-ascii?Q?hHs4Z49jPWhRCj9sMV3kSWPjXCOXFawhIWBAjG2+ANMMgfizSQ6STnGbldFl?=
 =?us-ascii?Q?jYN5s9VfTaSWQogD7l4qWWPbj50LSAlxnsDmmI85R9h6bqlL6vHuCH7Qrhaz?=
 =?us-ascii?Q?BwJsDX+x9xbwawb01ba/w/Iyxe1+UqwsEfixDOFGlWyxdzogqo7+9gkBnRZu?=
 =?us-ascii?Q?LD5RMqvo//nQavpXV0s1cliC4F1MDIH2VgRN43C/vbdbh0OeDsnjqfMQEui/?=
 =?us-ascii?Q?xFPPrwWgUKzP3TZ/4Roc14yrc+xCwDrxlM8pcV0d4y+td/3xvg26GDmbK9zo?=
 =?us-ascii?Q?ta2/OWK6z+z5zJ2WJXuFguWHqMU0AepLiKaPR1zeiG4ArsT8+g9+67YbVK3p?=
 =?us-ascii?Q?QkLDgLC88K7qgn5lKy2Y8TyoKJAHj1JQS+9YrrLBegk79l4s9jtYuy5rWjTy?=
 =?us-ascii?Q?7S4IPJ9beP+K8W9Q/l89U5MO3W3nS3uSxRk2osStYvuW8qV6yQtGVVdDvDEQ?=
 =?us-ascii?Q?ZStYrixPBUo8aEq4PpAyWLvCtVtm3cOWKCXRMJDi8eO7Mi5XSY4ja5YA+CuR?=
 =?us-ascii?Q?TiEHv9ATk3UWvsU+vbAkeza/cW9MDSLkCm5TWNCpZV1Iv/82k3Cx4eMw9SnV?=
 =?us-ascii?Q?UUN9ZZ5z7Q=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR10MB3745D3AAA754F10125BC8CDA8E402AM7PR10MB3745EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 899c5693-5694-4c88-c7b4-08df4d5dcb57
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2026 14:42:14.8327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttRS6T4Zvxjtk33OlbrZMS8LkOvs7ygNVp9Syz0ZdXWS7BAW1VoJp+542QhytrmCE/AFFnbLO2x2ciymiMPDiwupgy10hkQ8Xclv33ixKRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8413
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 14:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251499

--_000_AM7PR10MB3745D3AAA754F10125BC8CDA8E402AM7PR10MB3745EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Vahid,

Thanks again for working on this. I went through v4 in detail and have some=
 findings as well as a proposed brach for a v5.

Series structure

  *
The series is not bisectable. The selftests (patch 3) and the documentation=
 (patch 2) come before the API and the class changes they use (patch 4).
  *
The FIT_CONFIGS/FIT_CONF_DEFAULT feature is split between patch 1 and patch=
 4, and patch 4 also "hardens" code from patch 1. Fixups like this should b=
e squashed into the patch that introduces the code.
  *
The vendored DTB fix (patch 6) is independent of the multi-kernel It should=
 come first, so it can also be backported.
  *
Patches 1 and 2 have no commit message body. Please explain what changes an=
d why.

kernel-fit-image.bbclass

  *
fit_kernel_deployed_files() parses BB_TASKDEPDATA and sstate manifests to f=
ind the files of the additional kernels. That depends on bitbake and sstate=
 internals. The deployed files are known from FIT_KERNEL_FILENAME and the d=
eploy directory, so I would drop it.
  *
The anonymous python mixes bb.fatal() and bb.parse.SkipRecipe for the same =
kind of configuration error. Please use one consistently.
  *
The vendored alias for an overridden kernel DTB is emitted without The conf=
igurations of all other external DTBs get the compatible string, the alias =
doesn't.

oe/fitimage.py

  *
Trailing whitespace (around line 636).
  *
Packing the flag values into "?"-separated strings in the selftests is frag=
ile. get_bb_vars_flags() already returns dicts.

Selftests

  *
_python_only_test is a test-internal switch passed through bb_vars, which i=
s meant to hold BitBake variables. The python-only tests can create a tempo=
rary deploy directory with the files they need instead.
  *
Nothing tests the prebuilt-kernel path (FIT_KERNEL_FILENAME without a recip=
e) or FIT_KERNEL_MULTICONFIG.
  *
test_fit_image_ext_dtb_vendored_override only runs on qemuarm64. It largely=
 duplicates test_vendored_dtb_with_kernel_dtbvendored and test_fit_image_ex=
t_dtb_dtbo.

History check of the vendored DTB fix

  *
I went through the history of this code: the OE 5.0 kernel-fitimage.bbclass=
, 05d0c7342d (new class), 4297b94c37 (vendored configuration names, Marek) =
and 3bceb2dabe (FIT_CONF_DEFAULT_DTB mapping, Ryan). The fix fits in. 4297b=
94c37 did not cover kernel DTBs overridden by EXTERNAL_KERNEL_DEVICETREE, s=
o their vendored configuration was lost. That also broke FIT_CONF_DEFAULT_D=
TB and FIT_CONF_MAPPINGS entries referring to it. The fix keeps the externa=
l DTB as the override (unchanged since 05d0c7342d) and only restores the co=
nfiguration name. The commit message now references these commits.


To keep things moving, I reworked the series into a proposal for v5. You ca=
n find it here: https://git.openembedded.org/openembedded-core-contrib/log/=
?h=3Dadrianf/fit-improvements-multi-kernels
For now I dropped your Signed-off tags, but if you agree with the proposed =
changes I could add them back and send the patches as a v5. Alternatively y=
ou can send a v5, if you like.
Would you be able to test and review these patches again and let me know ho=
w we should proceed?

Regards,
Adrian
________________________________
From: Vahid Gharaee via openembedded-core <vgharaee=3Dgmail.com@lists.opene=
mbedded.org>
Sent: Thursday, November 5, 2026 17:48
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [PATCH v4 0/6] kernel-fit-image: Add support for multipl=
e kernels and FIT configurations

From: Vahid Gharaee <vgharaee@gmail.com>

These extends kernel-fit-image.bbclass
to support multiple kernel images in a single FIT image,
with custom configurations selecting the required kernel
and device tree. The main use case is to package different
kernel variants, for example a standard and a real-time kernel,
into one FIT image. Additional kernels can be provided by
another recipe, through BitBake multiconfig, or as prebuilt files.
The serie also adds validation for kernel and configuration
references, improves handling of DTB aliases,
and extends the FIT selftests.

Changes since v3:
    - Rebased onto current OE-Core master.
    - Adapted to the upstream removal of synthetic FIT_LOADABLE_* variable =
values.
    - Updated FIT configuration tests to retrieve BitBake variable flags th=
rough get_bb_vars_flags().
    - Preserved compatibility with existing Python-only FIT test fixtures.

Validation:
    - bitbake -p
    - oe-selftest -r fitimage.FitImagePyTests (16 passed)
    - oe-selftest -r fitimage.KernelFitImageRecipeTests.test_fit_image_mult=
iple_kernels
    - oe-selftest -r fitimage.KernelFitImageRecipeTests.test_fit_image_ext_=
dtb_vendored_override

All passed.

Vahid Gharaee (6):
  oe.fitimage: Support multiple kernel nodes and configuration selection
  oe.fitimage: add metadata for multiple kernels
  oe.selftest: Add tests for multi-kernel FIT config
  oe.fitimage: Add custom configurations and harden multi-kernel
    handling
  oe.selftest: Improve FIT DTB alias validation
  kernel-fit-image: preserve vendored DTB aliases for external overrides

 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  11 +
 meta/classes-recipe/kernel-fit-image.bbclass  | 136 ++++++-
 meta/conf/image-fitimage.conf                 |  55 +++
 meta/lib/oe/fitimage.py                       |  95 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 359 ++++++++++++++++--
 5 files changed, 607 insertions(+), 49 deletions(-)


base-commit: 35d103be8b1a2346b7d0a7ff83745ad74d6817e2
--
2.56.0


--_000_AM7PR10MB3745D3AAA754F10125BC8CDA8E402AM7PR10MB3745EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
Hi Vahid,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
Thanks again for working on this. I went through v4 in detail and have some=
 findings as well as a proposed brach for a v5.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
Series structure</div>
<ul>
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">The series is not bisec=
table. The selftests (patch 3) and the documentation (patch 2) come before =
the API and the class changes they use (patch 4).</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">The FIT_CONFIGS/FIT_CON=
F_DEFAULT feature is split between patch 1 and patch 4, and patch 4 also &q=
uot;hardens&quot; code from patch 1. Fixups like this should be squashed in=
to the patch that introduces the code.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">The vendored DTB fix (p=
atch 6) is independent of the multi-kernel It should come first, so it can =
also be backported.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">Patches 1 and 2 have no=
 commit message body. Please explain what changes and why.</div>
</li></ul>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
kernel-fit-image.bbclass</div>
<ul>
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">fit_kernel_deployed_fil=
es() parses BB_TASKDEPDATA and sstate manifests to find the files of the ad=
ditional kernels. That depends on bitbake and sstate internals. The deploye=
d files are known from FIT_KERNEL_FILENAME
 and the deploy directory, so I would drop it.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">The anonymous python mi=
xes bb.fatal() and bb.parse.SkipRecipe for the same kind of configuration e=
rror. Please use one consistently.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">The vendored alias for =
an overridden kernel DTB is emitted without The configurations of all other=
 external DTBs get the compatible string, the alias doesn't.</div>
</li></ul>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
oe/fitimage.py</div>
<ul>
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div role=3D"presentation">Trailing whitespace (around line 636).</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">Packing the flag values=
 into &quot;?&quot;-separated strings in the selftests is fragile. get_bb_v=
ars_flags() already returns dicts.</div>
</li></ul>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
Selftests</div>
<ul>
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">_python_only_test is a =
test-internal switch passed through bb_vars, which is meant to hold BitBake=
 variables. The python-only tests can create a temporary deploy directory w=
ith the files they need instead.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">Nothing tests the prebu=
ilt-kernel path (FIT_KERNEL_FILENAME without a recipe) or FIT_KERNEL_MULTIC=
ONFIG.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">test_fit_image_ext_dtb_=
vendored_override only runs on qemuarm64. It largely duplicates test_vendor=
ed_dtb_with_kernel_dtbvendored and test_fit_image_ext_dtb_dtbo.</div>
</li></ul>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
History check of the vendored DTB fix</div>
<ul>
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">I went through the hist=
ory of this code: the OE 5.0 kernel-fitimage.bbclass, 05d0c7342d (new class=
), 4297b94c37 (vendored configuration names, Marek) and 3bceb2dabe (FIT_CON=
F_DEFAULT_DTB mapping, Ryan). The fix
 fits in. 4297b94c37 did not cover kernel DTBs overridden by EXTERNAL_KERNE=
L_DEVICETREE, so their vendored configuration was lost. That also broke FIT=
_CONF_DEFAULT_DTB and FIT_CONF_MAPPINGS entries referring to it. The fix ke=
eps the external DTB as the override
 (unchanged since 05d0c7342d) and only restores the configuration name. The=
 commit message now references these commits.</div>
</li></ul>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
To keep things moving, I reworked the series into a proposal for v5. You ca=
n find it here:
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
adrianf/fit-improvements-multi-kernels" id=3D"OWAe053c13e-a856-38e2-3b10-7f=
f5c417ec69" class=3D"OWAAutoLink">
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf/fit=
-improvements-multi-kernels</a></div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
For now I dropped your Signed-off tags, but if you agree with the proposed =
changes I could add them back and send the patches as a v5. Alternatively y=
ou can send a v5, if you like.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
Would you be able to test and review these patches again and let me know ho=
w we should proceed?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
Adrian</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vahid Gharaee via ope=
nembedded-core &lt;vgharaee=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, November 5, 2026 17:48<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [PATCH v4 0/6] kernel-fit-image: Add support for =
multiple kernels and FIT configurations</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Vahid Gharaee &lt;vgharaee@gmail.com&gt;<br>
<br>
These extends kernel-fit-image.bbclass <br>
to support multiple kernel images in a single FIT image,<br>
with custom configurations selecting the required kernel <br>
and device tree. The main use case is to package different <br>
kernel variants, for example a standard and a real-time kernel,<br>
into one FIT image. Additional kernels can be provided by <br>
another recipe, through BitBake multiconfig, or as prebuilt files.<br>
The serie also adds validation for kernel and configuration <br>
references, improves handling of DTB aliases, <br>
and extends the FIT selftests.<br>
<br>
Changes since v3:<br>
&nbsp;&nbsp;&nbsp; - Rebased onto current OE-Core master.<br>
&nbsp;&nbsp;&nbsp; - Adapted to the upstream removal of synthetic FIT_LOADA=
BLE_* variable values.<br>
&nbsp;&nbsp;&nbsp; - Updated FIT configuration tests to retrieve BitBake va=
riable flags through get_bb_vars_flags().<br>
&nbsp;&nbsp;&nbsp; - Preserved compatibility with existing Python-only FIT =
test fixtures.<br>
<br>
Validation:<br>
&nbsp;&nbsp;&nbsp; - bitbake -p<br>
&nbsp;&nbsp;&nbsp; - oe-selftest -r fitimage.FitImagePyTests (16 passed)<br=
>
&nbsp;&nbsp;&nbsp; - oe-selftest -r fitimage.KernelFitImageRecipeTests.test=
_fit_image_multiple_kernels<br>
&nbsp;&nbsp;&nbsp; - oe-selftest -r fitimage.KernelFitImageRecipeTests.test=
_fit_image_ext_dtb_vendored_override<br>
<br>
All passed.<br>
<br>
Vahid Gharaee (6):<br>
&nbsp; oe.fitimage: Support multiple kernel nodes and configuration selecti=
on<br>
&nbsp; oe.fitimage: add metadata for multiple kernels<br>
&nbsp; oe.selftest: Add tests for multi-kernel FIT config<br>
&nbsp; oe.fitimage: Add custom configurations and harden multi-kernel<br>
&nbsp;&nbsp;&nbsp; handling<br>
&nbsp; oe.selftest: Improve FIT DTB alias validation<br>
&nbsp; kernel-fit-image: preserve vendored DTB aliases for external overrid=
es<br>
<br>
&nbsp;.../recipes-test/ext-dtb/test-dtbs-as-ext.bb&nbsp; |&nbsp; 11 +<br>
&nbsp;meta/classes-recipe/kernel-fit-image.bbclass&nbsp; | 136 ++++++-<br>
&nbsp;meta/conf/image-fitimage.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 55 +++<br>
&nbsp;meta/lib/oe/fitimage.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 95 ++++-<br>
&nbsp;meta/lib/oeqa/selftest/cases/fitimage.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 359 ++++++++++++++++--<br>
&nbsp;5 files changed, 607 insertions(+), 49 deletions(-)<br>
<br>
<br>
base-commit: 35d103be8b1a2346b7d0a7ff83745ad74d6817e2<br>
-- <br>
2.56.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR10MB3745D3AAA754F10125BC8CDA8E402AM7PR10MB3745EURP_--
