Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22957.1793117698742029570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 09:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ev5jbw/+;
 spf=pass (domain: axis.com, ip: 40.107.159.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUBtp98JvZ/3CTye8Eil+BuwGmc/iAZuIPtQ/eC//FV/eABewzp3qYEq6UrDGQwa4TS9qEkCRsVY1PbExgbSXIM+A0cDWdSmgm7aeFStojVDHuLTRAJ27EULkDAW5SOexm7Bbrojizc9WLD1mb3Hn5gCQzT6r+A8xWcgXTu+OSA0WL/4qdVt6AjCUcp+5ll6QTZzVCN7oDn1xEtVEnr+qYiQBTHkhQqTU2NVf0Qp6TBX87jiJcxWZRp3FnGEF0zGlDCu32yguvXGiNyS9CubvTtOsp+mDZevCTZLXmIpEM09JXBXzGNQSrx03aOWBBkmx84EoljUje1bzrC3JxSFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1ngi6kzsZfqIAXj/E6XoGojfgWP1WRJKqlNX1z/f4Q=;
 b=AvFK3m/el5boVy25D1DjfDErL6mxOgHi0yBqk6vZTLDQOvHl78OBHHV2ZcP1UQ3T9j+VuT8npdarzA1a9QAbTr1tN0SD2GwYumFzMve5T1dIV/C7+qOqFSoe0qF1MC3PuQRXL1d3ZgTx7MKXw82ptINVIvEYx+IneIdBh4Jrmr3y3XpwkYDKms5SlZaBxXEkwQZTDY9p83nF3HMe7vqAHaavNGGibPiLP53E0ijMVGW8CXUWYfPh20XCtRhPmhwhCg8RIYt06QFaGk5vgDTqiNjMgUiEds6s4Mz10RjwNuFA6QZXVc6tZTexQVSMCp1tIC6z2zXxIeCDW2YmygrKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1ngi6kzsZfqIAXj/E6XoGojfgWP1WRJKqlNX1z/f4Q=;
 b=ev5jbw/+1XuO3RDx4kb4aaXzZgbAsWhOYlc5AkaRUJlszpJBwovZAzKwQbtdjPmeHiWtiI9v/EKm6NXyeI/t4kBu8R/PMcZDSAcR4CyqaRIFFBnjcfODapWCCNR/9pVYaTNB5WLmdD1R1Nz8T7hHV71q2Mb/NZjCokjNi0Bq4XY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by MIYPR02MB12353.eurprd02.prod.outlook.com (2603:10a6:290:7b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:14:54 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:14:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Roshan Sivakumar <roshs@qti.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Topic: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Index: AQHdYg3pJli/jOkiPE27C6gnbLkqULcJeykAgAFEPzSAA4tar4ADS1vw
Date: Tue, 27 Oct 2026 16:14:54 +0000
Message-ID: <DB5PR02MB102135B72371D3429294D2817EF602@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
 <DB5PR02MB102132000280F19DBB82F92ECEF652@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <18E118B84815B8D6.4141359@lists.openembedded.org>
 <DS4PR02MB11190EFFE070BED87859F8A9B87622@DS4PR02MB11190.namprd02.prod.outlook.com>
In-Reply-To: <DS4PR02MB11190EFFE070BED87859F8A9B87622@DS4PR02MB11190.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|MIYPR02MB12353:EE_
x-ms-office365-filtering-correlation-id: fd108663-0172-4ec5-1454-08df34456fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009221227099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|260925022911599003|261022115727099003|261022075727099003|260925021311599003|260925021911599003|10067099003|56012099006|261026121527099003|3023799007|6133799003|8096899003|22082099003|18002099003|11063799006|5023799004|4143699003|38070700021|261026140227099003;
x-microsoft-antispam-message-info: HeaSFueHEItD1K/RBiEBJjm9jyDWqbnU+CVwPEsOm2jjiZS0pdCNYFGJ00NyfVW9/Bkp0tUk+wx5droVk5ias6ryIHH388MU8mfxb3VTaSf7eimL0Bxijmt+wNz//GZvgRK9KdQsdJ+6EAVXurMydqom3ngPt1mrCz1CIqZcFPYoLdKRQEfvEDLHD+w2KEGlv8WC6wDl5Ka42km+ZNef//Wsn3o6NfiZ5hzBGR/Gzy3y4hnwRRp/+E46xgki1y4lxCwefUZPp4m0o5IsstLZJ3fvpYBFzPnFufvl4wCcwpzX+RfHeGCBNflV9r5/9YY9xWwarzZ9ucHxXogI+kI/cjjiFD3fuSql0Or3df4uBExmwtrX74+afQPlpuRzurYQzmMUx76+AD5WBbmTiHulwBk3/JMe206hLovvOqPHBlEdbEWc91O8EGzUnSVBjm4BqY+pcUkMrUjKCMl8N8GGE/4Wh5/bJSR36EIfRUjr/4hysq+VEJQanAu0UU9JbPTBMd9NRO0IFirZ+tYGDag8deQoWEoJPEMZKaarIFJ7iCrFLksPXuy4aoL6GKldz5NWNIhCjwC16/KBRveqK6YUDwvJfNZCRrVDwWTgSiKVC7WAoNCUdbUSFU/TDutdMzKANauUFk01Q4vAX2tpLhDxh2bO61VqRuvFnfG6LZQbcKA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009221227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(260925022911599003)(261022115727099003)(261022075727099003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(261026121527099003)(3023799007)(6133799003)(8096899003)(22082099003)(18002099003)(11063799006)(5023799004)(4143699003)(38070700021)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PgD/Jyb+VT3odv6e7OXmiNYZHkz0c9PJhAxYTwiEOrV0kHODnV5Zj34+vFYI?=
 =?us-ascii?Q?7+GaR59DQcOY7IH31lajgvOopz6CJa36eVg596QUWj5i2dC8eSTeWChJtJWF?=
 =?us-ascii?Q?pHhzn50/XHB/N+VvcVXxuQXDdPEg+nZcRl9ek3/tI/xPUukaYPVHr4P+w6Md?=
 =?us-ascii?Q?hxXRLV3d3qsCnu0g3TPidbazgayODbOd1LtaFKe5OLfw6ffi0n9iZPnkTukf?=
 =?us-ascii?Q?AV8X1vc9GTHvoC38X92GpvNTXrXIRmavjb2433aDM0E3NkTV/z2xhBpEVHyG?=
 =?us-ascii?Q?FEkGCoUNDLuB4SldQcegtT04WoUgfxGzZ9san1wMWNR2vY8aTv8fPT/hk+5q?=
 =?us-ascii?Q?YZ2xjQ2+znVX4kOT4d6pG6GCFotbYcfULPOL69QPFzpWC7T9SYYGL1apinoo?=
 =?us-ascii?Q?asGz3C9tppPF1nAi9NBBFqDax78TXSjbnaZ5XLZXvVayX/fqK7FEWe5yL0yo?=
 =?us-ascii?Q?Zx3nmlR5ldCrCZwSx9ebHsXFoUtYgev1f8jDcUUPrzr76BHmKy1uohgOTAGK?=
 =?us-ascii?Q?kjbCl2pEUzM2bfu1FtLiBQIctbgqhEWBcUjIuS+aYqJ0nQM8sPIpaiCj7Eta?=
 =?us-ascii?Q?iz8vMMOPDnBdrWooUkUCgtctpB5Scb/dq3YBTxS1JT3596+6Z2EBZZynCRVb?=
 =?us-ascii?Q?It/0Oqj2GZxx6ZELVsi5mBxALFKOpHPifCG+XqLfsh3Q3kLqcOW1ttv8wOhd?=
 =?us-ascii?Q?T6VFz1EnBbrqzgh4yzwJ/p6o4OBxaES+3/XP5xu1dXviXtug4Larafkg1cxg?=
 =?us-ascii?Q?twj52S6581nI7IyBwAeGiQn/ynhzxuEWw4zqHhs0ejJUZ8hP8mh5i2DD6N3m?=
 =?us-ascii?Q?PQ0L574/3O87S9FLtfqIyU7Y7JW14cUdjV+oPk6AwBBdRfEAK55WCTx3oYju?=
 =?us-ascii?Q?pJoyr1eo54FUl62LI67CzG5fvW39ceSmNCDdt595vc+9EZIEsnylzlYCh46f?=
 =?us-ascii?Q?UP1G1wwZBJI5eZ2naBXAFSVEc4sHWUWjcP8jUWJ/lrqYM5lki9rkl4cWLWE1?=
 =?us-ascii?Q?98mZIQeh1eMG/ZkAuVxzKpIyitkZ2pJHdEN7g7zu7tTaEgrT+wTY3cHVDsU1?=
 =?us-ascii?Q?oO6p5kZlyDtsvr1jmPQDmN2nOYm/DyuMa+GdjisGMJfMofA/Dno3cilbhGPT?=
 =?us-ascii?Q?EO7mWHHMC9Vw4A5FSerFjcZOQFPoiwjGov9rQUPp3gZX/xXC4ID083Hwv4wJ?=
 =?us-ascii?Q?jabw09i29hw/OErefZYcki+lw8Lc7JCBJys4EoWpB3CmAqayazXXgmVnJTiG?=
 =?us-ascii?Q?eCRyYADNHg5WlYZ2gQmIpvrQ6X77/4viAl6u5IuIgaEgHWgrY9z5IzX9hyq/?=
 =?us-ascii?Q?EKiadwQMNEzS5dcDV36J2+ul3e9yMvAGrjub/RNG5zXiXgT8JA5RuzSZZG+t?=
 =?us-ascii?Q?UDagYK183u9whQVtNNwLFv/VNHvXMYCBbSagMlKMkkXA4cfcZmUvJEftCuaA?=
 =?us-ascii?Q?YDPjkiJORMFUjhg2ZxkBgf1TQwTy1FINuZCX/exG1tWlpLpEB/GBJNLvQ1YP?=
 =?us-ascii?Q?mbLN1m0h6NeI2C4QNiX64gFRn7l13Yn2CosSmI38KkFPC7tXM8CgdHsttQ9D?=
 =?us-ascii?Q?LUprICawPF7qqrHGFNNJ1RUQRclAlCWxt8JhZAG4RJzMPs8VwgOVQNzwdgn3?=
 =?us-ascii?Q?AH5/wliwanMyR7rNRv95lXrMYGkyieo48tohOfrbe2rirNsjV6RWTUNtg4E+?=
 =?us-ascii?Q?ZQut3AdJ5/oWZ0ypx+vtp2dHipM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB5PR02MB102135B72371D3429294D2817EF602DB5PR02MB10213eu_"
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd108663-0172-4ec5-1454-08df34456fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 16:14:54.3711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zzhsn3K+BggDleGpGbn2T2GbepnVXizYH3CIjq1hZ6H/o1Ee63n23dWjhILa5Wrv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR02MB12353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 16:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248754

--_000_DB5PR02MB102135B72371D3429294D2817EF602DB5PR02MB10213eu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Well, I just feel that we are removing an existing feature if we do. It may=
 be that it is only present when using DNF and RPM to generate the images (=
which we do), as I do not know whether the other packaging formats support =
dependencies on files. On the other hand, these kind of dependencies are of=
ten missed when adding them manually so if we are removing them from DNF/RP=
M, I think it would be more appropriate if bitbake detected them automatica=
lly, just like it automatically detects runtime dependencies for dynamic li=
braries.

//Peter

From: Roshan Sivakumar <roshs@qti.qualcomm.com>
Sent: den 25 oktober 2026 14:49
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@lis=
ts.openembedded.org
Cc: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dep=
endency generator

You don't often get email from roshs@qti.qualcomm.com<mailto:roshs@qti.qual=
comm.com>. Learn why this is important<https://aka.ms/LearnAboutSenderIdent=
ification>
Hi @Peter<mailto:peter.kjellerstedt@axis.com>,

Can we merge this fix and handle the dependencies using RDEPENDS in the ind=
ividual recipes that need them like mentioned above?

Get Outlook for iOS<https://aka.ms/o0ukef>
________________________________
From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lis=
ts.openembedded.org> <openembedded-core@lists.openembedded.org<mailto:opene=
mbedded-core@lists.openembedded.org>> on behalf of Roshan Sivakumar via lis=
ts.openembedded.org <roshs=3Dqti.qualcomm.com@lists.openembedded.org<mailto=
:roshs=3Dqti.qualcomm.com@lists.openembedded.org>>
Sent: Friday, 23 October 2026 13:11:38
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com<mailto:peter.kjellerste=
dt@axis.com>>; openembedded-core@lists.openembedded.org<mailto:openembedded=
-core@lists.openembedded.org> <openembedded-core@lists.openembedded.org<mai=
lto:openembedded-core@lists.openembedded.org>>
Cc: Sumanth Gavini <sumanth.gavini@windriver.com<mailto:sumanth.gavini@wind=
river.com>>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dep=
endency generator


WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.
>>Replying here again since the previous reply was sent in a separate threa=
d.

I believe this dependency belongs here: openembedded-core/meta/recipes-kern=
el/linux/kernel-devsrc.bb at master * openembedded/openembedded-core<https:=
//github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel=
/linux/kernel-devsrc.bb#L460>

RDEPENDS:${PN} +=3D "sed" in the above recipe is the right way to do it?

There should probably be a separate patch to satisfy that dependency.



Thanks,

Roshan.



________________________________
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com<mailto:peter.kjellers=
tedt@axis.com>>
Sent: Thursday, October 22, 2026 05:19
To: Roshan Sivakumar <roshs@qti.qualcomm.com<mailto:roshs@qti.qualcomm.com>=
>; openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists.=
openembedded.org> <openembedded-core@lists.openembedded.org<mailto:openembe=
dded-core@lists.openembedded.org>>
Cc: Sumanth Gavini <sumanth.gavini@windriver.com<mailto:sumanth.gavini@wind=
river.com>>
Subject: RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dep=
endency generator

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@l=
ists.openembedded.org> <openembedded-core@lists.openembedded.org<mailto:ope=
nembedded-core@lists.openembedded.org>> On Behalf Of Roshan Sivakumar via l=
ists.openembedded.org
> Sent: den 22 oktober 2026 10:47
> To: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lis=
ts.openembedded.org>
> Cc: Sumanth Gavini <sumanth.gavini@windriver.com<mailto:sumanth.gavini@wi=
ndriver.com>>; Roshan Sivakumar <roshs@qti.qualcomm.com<mailto:roshs@qti.qu=
alcomm.com>>
> Subject: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter depen=
dency generator
>
> RPM 4 generated dependencies with the external __find_requires /
> __find_provides generator, which OE disabled entirely via
> _use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> v6-format packages only the internal fileattr generators run.
>
> rpm's script.attr generator therefore runs for the first time in OE
> builds. For every packaged executable whose first line is a #! shebang
> it emits an interpreter dependency. kernel-devsrc ships
> scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:
>
>   Requires: /bin/sed
>
> OE manages build and runtime dependencies explicitly through
> DEPENDS / RDEPENDS and does not want these. They break real use cases:

I am not sure about the explicitly part. AFAIK, installed scripts with a
#!/bin/bash shebang leads to an automatic dependency on bash. Whether it
is RPM and/or bitbake doing that, I don't know.

>
> - The interpreter path is taken verbatim from the shebang. A #!/bin/sed
>   script requires /bin/sed, but under usrmerge the only provider
>   (busybox) offers /usr/bin/sed. The literal paths never match and the
>   package becomes uninstallable.
> - In the SDK the sole interpreter providers (busybox, coreutils, bash,
>   perl) are deliberately banned by target-sdk-provides-dummy, so these
>   auto-generated requires make -dev/-src packages uninstallable during
>   do_populate_sdk ("nothing provides /bin/sed needed by kernel-devsrc").
> - The requires are non-reproducible: they are only emitted when the
>   interpreter is scanned from the shebang during packaging, so the same
>   recipe can produce different packages between the reproducible A and
>   B builds.
>
> This is the same class of regression already handled for the pkgconfig
> generator; see "rpm: disable the RPM 6 pkgconfig dependency generator".
>
> Suppressing the generator from the rpmbuild command line
> (__requires_exclude / __script_requires set to %{nil}) is not reliable:
> rpm reloads the fileattr macros during dependency generation and
> clobbers the --define. Remove script.attr and its helper script.req
> from rpm's install lists via a source patch. This changes
> do_unpack/do_patch, so the whole rpm recipe and everything downstream
> re-hash and no stale rpm-native is reused.
>
> Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com<mailto:roshs@qti.=
qualcomm.com>>
> ---
>  ...he-script-interpreter-dependency-gen.patch | 72 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0004-Do-not-install-t=
he-script-interpreter-dependency-gen.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-scri=
pt-interpreter-dependency-gen.patch b/meta/recipes-devtools/rpm/files/0004-=
Do-not-install-the-script-interpreter-dependency-gen.patch
> new file mode 100644
> index 0000000000..8c3d1769c8
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-
> interpreter-dependency-gen.patch
> @@ -0,0 +1,72 @@
> +From: Roshan Sivakumar <roshs@qti.qualcomm.com<mailto:roshs@qti.qualcomm=
.com>>
> +Date: Thu, 16 Oct 2026 00:00:00 +0000
> +Subject: [PATCH] Do not install the script interpreter dependency genera=
tor
> +
> +RPM 4 generated dependencies with the external __find_requires /
> +__find_provides generator, which OE disabled entirely via
> +_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> +v6-format packages only the internal fileattr generators run.
> +
> +rpm's script.attr generator therefore runs for the first time in OE
> +builds. For every packaged executable whose first line is a #! shebang
> +it adds an interpreter dependency, e.g. a kernel-devsrc package shipping
> +scripts/mksysmap (#!/bin/sed -f) gains:
> +
> +  Requires: /bin/sed
> +
> +OpenEmbedded manages build and runtime dependencies explicitly via
> +DEPENDS/RDEPENDS and does not want these. They break real use cases:
> +
> +- The literal interpreter path is taken verbatim from the shebang, so a
> +  #!/bin/sed script requires /bin/sed while the only provider (busybox)
> +  offers /usr/bin/sed under usrmerge. The paths never match and the
> +  package is uninstallable.
> +- In the SDK the sole interpreter providers (busybox, coreutils, bash,
> +  perl) are deliberately banned by target-sdk-provides-dummy, so these
> +  auto-generated requires make -dev/-src packages uninstallable during
> +  do_populate_sdk ("nothing provides /bin/sed").
> +- The requires are non-reproducible: they are only emitted when the
> +  interpreter happens to be scanned from the shebang in the build
> +  sysroot, so the same recipe can produce different packages.
> +
> +This is the same class of problem fixed for pkgconfig.attr; see
> +"rpm: disable the RPM 6 pkgconfig dependency generator".
> +
> +Suppressing the generator from the rpmbuild command line is not
> +reliable: rpm reloads the fileattr macros during dependency generation
> +and clobbers any --define. Remove script.attr and its helper script.req
> +from rpm's install lists via a source patch. This changes
> +do_unpack/do_patch, so the whole rpm recipe and everything downstream
> +re-hash and no stale rpm-native is reused.
> +
> +Upstream-Status: Inappropriate [OE policy: dependencies are managed by
> the build system, not generated by rpmbuild]
> +
> +Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com<mailto:roshs@qti=
.qualcomm.com>>
> +---
> + fileattrs/CMakeLists.txt | 2 +-
> + scripts/CMakeLists.txt   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/fileattrs/CMakeLists.txt b/fileattrs/CMakeLists.txt
> +--- a/fileattrs/CMakeLists.txt
> ++++ b/fileattrs/CMakeLists.txt
> +@@ -1,6 +1,6 @@
> + install(FILES
> +       debuginfo.attr desktop.attr elf.attr font.attr metainfo.attr
> +       ocaml.attr
> +-      rpm_macro.attr rpm_lua.attr script.attr sysusers.attr usergroup.a=
ttr
> ++      rpm_macro.attr rpm_lua.attr sysusers.attr usergroup.attr
> +       DESTINATION ${RPM_CONFIGDIR}/fileattrs
> + )
> +diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
> +--- a/scripts/CMakeLists.txt
> ++++ b/scripts/CMakeLists.txt
> +@@ -6,7 +6,7 @@ install(PROGRAMS
> +       check-buildroot check-rpaths check-rpaths-worker
> +       find-lang.sh find-requires find-provides
> +       ocamldeps.sh
> +-      fontconfig.prov script.req
> ++      fontconfig.prov
> +       rpm_macros_provides.sh
> +       rpmdb_dump rpmdb_load
> +       rpm2cpio.sh tgpg
> diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtoo=
ls/rpm/rpm_6.0.2.bb
> index c27f58a0e8..6c80c839ca 100644
> --- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;protocol=3Dhttps;branch=3Drp
>             file://0001-tools-elfdeps.cc-Remove-format-module.patch \
>             file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-=
4.2.patch \
>             file://0003-Do-not-install-the-pkgconfig-dependency-generator=
.patch \
> +           file://0004-Do-not-install-the-script-interpreter-dependency-=
gen.patch \
>             "
>
>  PE =3D "1"
> --
> 2.34.1

//Peter

--_000_DB5PR02MB102135B72371D3429294D2817EF602DB5PR02MB10213eu_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.xelementtoproof, li.xelementtoproof, div.xelementtoproof
	{mso-style-name:x_elementtoproof;
	margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-w=
ord">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US">Well, I just feel that we are removing an existing feature if we do. I=
t may be that it is only present when using DNF
 and RPM to generate the images (which we do), as I do not know whether the=
 other packaging formats support dependencies on files. On the other hand, =
these kind of dependencies are often missed when adding them manually so if=
 we are removing them from DNF/RPM,
 I think it would be more appropriate if bitbake detected them automaticall=
y, just like it automatically detects runtime dependencies for dynamic libr=
aries.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;
<br>
<b>Sent:</b> den 25 oktober 2026 14:49<br>
<b>To:</b> Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;; openembe=
dded-core@lists.openembedded.org<br>
<b>Cc:</b> Sumanth Gavini &lt;sumanth.gavini@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td width=3D"0" style=3D"width:.3pt;background:#A6A6A6;padding:5.25pt 1.5pt=
 5.25pt 1.5pt">
</td>
<td width=3D"100%" style=3D"width:100.0%;background:#EAEAEA;padding:5.25pt =
3.75pt 5.25pt 11.25pt;aspect-ratio: revert !important;background:revert !im=
portant;block-size: revert !important;border:revert !important;bottom: reve=
rt !important;color:revert !important;color-scheme: revert !important;conte=
nt-visibility: revert !important;cursor:revert !important;direction:revert =
!important;display:revert !important;font-size:revert !important;height:rev=
ert !important;hyphens: revert !important;letter-spacing:revert !important;=
line-height:revert !important;margin:revert !important;opacity: revert !imp=
ortant;order: revert !important;outline: revert !important;overflow:revert =
!important;padding:revert !important;position:revert !important;resize: rev=
ert !important;rotate: revert !important;scale: revert !important;tab-size:=
 revert !important;table-layout:revert !important;text-align:revert !import=
ant;text-indent:revert !important;text-orientation: revert !important;text-=
overflow: revert !important;text-shadow:revert !important;text-transform:re=
vert !important;text-wrap: revert !important;top:revert !important;transiti=
on: revert !important;user-select: revert !important;vertical-align:revert =
!important;white-space:revert !important;width:revert !important;word-break=
:revert !important;word-spacing:revert !important;writing-mode:revert !impo=
rtant;zoom: revert !important;visibility:visible">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;=
color:#212121">You don't often get email from
<a href=3D"mailto:roshs@qti.qualcomm.com">roshs@qti.qualcomm.com</a>. <a hr=
ef=3D"https://aka.ms/LearnAboutSenderIdentification">
Learn why this is important</a> <o:p></o:p></span></p>
</div>
</td>
<td width=3D"75" style=3D"width:56.25pt;background:#EAEAEA;padding:5.25pt 3=
.75pt 5.25pt 3.75pt;aspect-ratio: revert !important;background:revert !impo=
rtant;block-size: revert !important;border:revert !important;bottom: revert=
 !important;color:revert !important;color-scheme: revert !important;content=
-visibility: revert !important;cursor:revert !important;direction:revert !i=
mportant;display:revert !important;font-size:revert !important;height:rever=
t !important;hyphens: revert !important;letter-spacing:revert !important;li=
ne-height:revert !important;margin:revert !important;opacity: revert !impor=
tant;order: revert !important;outline: revert !important;overflow:revert !i=
mportant;padding:revert !important;position:revert !important;resize: rever=
t !important;rotate: revert !important;scale: revert !important;tab-size: r=
evert !important;table-layout:revert !important;text-align:revert !importan=
t;text-indent:revert !important;text-orientation: revert !important;text-ov=
erflow: revert !important;text-shadow:revert !important;text-transform:reve=
rt !important;text-wrap: revert !important;top:revert !important;transition=
: revert !important;user-select: revert !important;vertical-align:revert !i=
mportant;white-space:revert !important;width:revert !important;word-break:r=
evert !important;word-spacing:revert !important;writing-mode:revert !import=
ant;zoom: revert !important;align: left !important;visibility:visible">
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"color:black">Hi <a id=3D"OWAAM948616"=
 href=3D"mailto:peter.kjellerstedt@axis.com">
<span style=3D"font-family:&quot;Aptos&quot;,sans-serif;text-decoration:non=
e">@Peter</span></a>,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Can we merge this fix an=
d handle the dependencies using RDEPENDS in the individual recipes that nee=
d them like mentioned above?<o:p></o:p></span></p>
<div id=3D"ms-outlook-mobile-body-separator-line">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div id=3D"ms-outlook-mobile-signature">
<p class=3D"MsoNormal"><span style=3D"color:black">Get <a href=3D"https://a=
ka.ms/o0ukef">
Outlook for iOS</a><o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists=
.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt; on beha=
lf of Roshan Sivakumar via lists.openembedded.org
 &lt;<a href=3D"mailto:roshs=3Dqti.qualcomm.com@lists.openembedded.org">ros=
hs=3Dqti.qualcomm.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Friday, 23 October 2026 13:11:38<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com">peter.kjellerstedt@axis.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists=
.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Sumanth Gavini &lt;<a href=3D"mailto:sumanth.gavini@windriver.co=
m">sumanth.gavini@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator</span>
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<p align=3D"center" style=3D"text-align:center"><strong><span style=3D"font=
-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;backgroun=
d:yellow">WARNING:</span></strong><span style=3D"font-size:10.5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:black;background:yellow">
 This email originated from outside of Qualcomm. Please be wary of any link=
s or attachments, and do not enable macros.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">&gt;&gt=
;Replying here again since the previous reply was sent in a separate thread=
.&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">I belie=
ve this dependency belongs here:
</span><span style=3D"font-size:11.0pt;color:#2F6FA7"><a href=3D"https://gi=
thub.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/lin=
ux/kernel-devsrc.bb#L460" target=3D"_blank"><span style=3D"color:#2F6FA7">o=
penembedded-core/meta/recipes-kernel/linux/kernel-devsrc.bb
 at master &middot; openembedded/openembedded-core</span></a></span><span s=
tyle=3D"font-size:11.0pt;color:black"><br>
<br>
RDEPENDS:${PN} +=3D &quot;sed&quot; in the above recipe is the right way to=
 do it?&nbsp;<br>
<br>
There should probably be a separate patch to satisfy that dependency.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<div id=3D"x_Signature">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"xelementtoproof"><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"xelementtoproof"><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif">Roshan.<o:p></o:p></span></p>
<p class=3D"xelementtoproof"><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Peter =
Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjell=
erstedt@axis.com</a>&gt;<br>
<b>Sent:</b> Thursday, October 22, 2026 05:19<br>
<b>To:</b> Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com">r=
oshs@qti.qualcomm.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists=
.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Sumanth Gavini &lt;<a href=3D"mailto:sumanth.gavini@windriver.co=
m">sumanth.gavini@windriver.com</a>&gt;<br>
<b>Subject:</b> RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator</span>
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">WARNING: This email originated from outside of Qualcomm. Please=
 be wary of any links or attachments, and do not enable macros.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org">open=
embedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded=
-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>&=
gt; On Behalf Of Roshan Sivakumar via lists.openembedded.org<br>
&gt; Sent: den 22 oktober 2026 10:47<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.openembedded.org</a><br>
&gt; Cc: Sumanth Gavini &lt;<a href=3D"mailto:sumanth.gavini@windriver.com"=
>sumanth.gavini@windriver.com</a>&gt;; Roshan Sivakumar &lt;<a href=3D"mail=
to:roshs@qti.qualcomm.com">roshs@qti.qualcomm.com</a>&gt;<br>
&gt; Subject: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter de=
pendency generator<br>
&gt;<br>
&gt; RPM 4 generated dependencies with the external __find_requires /<br>
&gt; __find_provides generator, which OE disabled entirely via<br>
&gt; _use_internal_dependency_generator 0. RPM 6 removed that mechanism; fo=
r<br>
&gt; v6-format packages only the internal fileattr generators run.<br>
&gt;<br>
&gt; rpm's script.attr generator therefore runs for the first time in OE<br=
>
&gt; builds. For every packaged executable whose first line is a #! shebang=
<br>
&gt; it emits an interpreter dependency. kernel-devsrc ships<br>
&gt; scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gain=
s:<br>
&gt;<br>
&gt;&nbsp;&nbsp; Requires: /bin/sed<br>
&gt;<br>
&gt; OE manages build and runtime dependencies explicitly through<br>
&gt; DEPENDS / RDEPENDS and does not want these. They break real use cases:=
<br>
<br>
I am not sure about the explicitly part. AFAIK, installed scripts with a<br=
>
#!/bin/bash shebang leads to an automatic dependency on bash. Whether it<br=
>
is RPM and/or bitbake doing that, I don't know.<br>
<br>
&gt;<br>
&gt; - The interpreter path is taken verbatim from the shebang. A #!/bin/se=
d<br>
&gt;&nbsp;&nbsp; script requires /bin/sed, but under usrmerge the only prov=
ider<br>
&gt;&nbsp;&nbsp; (busybox) offers /usr/bin/sed. The literal paths never mat=
ch and the<br>
&gt;&nbsp;&nbsp; package becomes uninstallable.<br>
&gt; - In the SDK the sole interpreter providers (busybox, coreutils, bash,=
<br>
&gt;&nbsp;&nbsp; perl) are deliberately banned by target-sdk-provides-dummy=
, so these<br>
&gt;&nbsp;&nbsp; auto-generated requires make -dev/-src packages uninstalla=
ble during<br>
&gt;&nbsp;&nbsp; do_populate_sdk (&quot;nothing provides /bin/sed needed by=
 kernel-devsrc&quot;).<br>
&gt; - The requires are non-reproducible: they are only emitted when the<br=
>
&gt;&nbsp;&nbsp; interpreter is scanned from the shebang during packaging, =
so the same<br>
&gt;&nbsp;&nbsp; recipe can produce different packages between the reproduc=
ible A and<br>
&gt;&nbsp;&nbsp; B builds.<br>
&gt;<br>
&gt; This is the same class of regression already handled for the pkgconfig=
<br>
&gt; generator; see &quot;rpm: disable the RPM 6 pkgconfig dependency gener=
ator&quot;.<br>
&gt;<br>
&gt; Suppressing the generator from the rpmbuild command line<br>
&gt; (__requires_exclude / __script_requires set to %{nil}) is not reliable=
:<br>
&gt; rpm reloads the fileattr macros during dependency generation and<br>
&gt; clobbers the --define. Remove script.attr and its helper script.req<br=
>
&gt; from rpm's install lists via a source patch. This changes<br>
&gt; do_unpack/do_patch, so the whole rpm recipe and everything downstream<=
br>
&gt; re-hash and no stale rpm-native is reused.<br>
&gt;<br>
&gt; Signed-off-by: Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualco=
mm.com">roshs@qti.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...he-script-interpreter-dependency-gen.patch | 72 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-devtools/rpm/rpm_6.0.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 73 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rpm/files/0004-Do-not-i=
nstall-the-script-interpreter-dependency-gen.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-s=
cript-interpreter-dependency-gen.patch b/meta/recipes-devtools/rpm/files/00=
04-Do-not-install-the-script-interpreter-dependency-gen.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8c3d1769c8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-<=
br>
&gt; interpreter-dependency-gen.patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +From: Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com">=
roshs@qti.qualcomm.com</a>&gt;<br>
&gt; +Date: Thu, 16 Oct 2026 00:00:00 +0000<br>
&gt; +Subject: [PATCH] Do not install the script interpreter dependency gen=
erator<br>
&gt; +<br>
&gt; +RPM 4 generated dependencies with the external __find_requires /<br>
&gt; +__find_provides generator, which OE disabled entirely via<br>
&gt; +_use_internal_dependency_generator 0. RPM 6 removed that mechanism; f=
or<br>
&gt; +v6-format packages only the internal fileattr generators run.<br>
&gt; +<br>
&gt; +rpm's script.attr generator therefore runs for the first time in OE<b=
r>
&gt; +builds. For every packaged executable whose first line is a #! sheban=
g<br>
&gt; +it adds an interpreter dependency, e.g. a kernel-devsrc package shipp=
ing<br>
&gt; +scripts/mksysmap (#!/bin/sed -f) gains:<br>
&gt; +<br>
&gt; +&nbsp; Requires: /bin/sed<br>
&gt; +<br>
&gt; +OpenEmbedded manages build and runtime dependencies explicitly via<br=
>
&gt; +DEPENDS/RDEPENDS and does not want these. They break real use cases:<=
br>
&gt; +<br>
&gt; +- The literal interpreter path is taken verbatim from the shebang, so=
 a<br>
&gt; +&nbsp; #!/bin/sed script requires /bin/sed while the only provider (b=
usybox)<br>
&gt; +&nbsp; offers /usr/bin/sed under usrmerge. The paths never match and =
the<br>
&gt; +&nbsp; package is uninstallable.<br>
&gt; +- In the SDK the sole interpreter providers (busybox, coreutils, bash=
,<br>
&gt; +&nbsp; perl) are deliberately banned by target-sdk-provides-dummy, so=
 these<br>
&gt; +&nbsp; auto-generated requires make -dev/-src packages uninstallable =
during<br>
&gt; +&nbsp; do_populate_sdk (&quot;nothing provides /bin/sed&quot;).<br>
&gt; +- The requires are non-reproducible: they are only emitted when the<b=
r>
&gt; +&nbsp; interpreter happens to be scanned from the shebang in the buil=
d<br>
&gt; +&nbsp; sysroot, so the same recipe can produce different packages.<br=
>
&gt; +<br>
&gt; +This is the same class of problem fixed for pkgconfig.attr; see<br>
&gt; +&quot;rpm: disable the RPM 6 pkgconfig dependency generator&quot;.<br=
>
&gt; +<br>
&gt; +Suppressing the generator from the rpmbuild command line is not<br>
&gt; +reliable: rpm reloads the fileattr macros during dependency generatio=
n<br>
&gt; +and clobbers any --define. Remove script.attr and its helper script.r=
eq<br>
&gt; +from rpm's install lists via a source patch. This changes<br>
&gt; +do_unpack/do_patch, so the whole rpm recipe and everything downstream=
<br>
&gt; +re-hash and no stale rpm-native is reused.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE policy: dependencies are managed b=
y<br>
&gt; the build system, not generated by rpmbuild]<br>
&gt; +<br>
&gt; +Signed-off-by: Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualc=
omm.com">roshs@qti.qualcomm.com</a>&gt;<br>
&gt; +---<br>
&gt; + fileattrs/CMakeLists.txt | 2 +-<br>
&gt; + scripts/CMakeLists.txt&nbsp;&nbsp; | 2 +-<br>
&gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/fileattrs/CMakeLists.txt b/fileattrs/CMakeLists.txt<br>
&gt; +--- a/fileattrs/CMakeLists.txt<br>
&gt; ++++ b/fileattrs/CMakeLists.txt<br>
&gt; +@@ -1,6 +1,6 @@<br>
&gt; + install(FILES<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debuginfo.attr desktop.attr elf.=
attr font.attr metainfo.attr<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ocaml.attr<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm_macro.attr rpm_lua.attr script.at=
tr sysusers.attr usergroup.attr<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm_macro.attr rpm_lua.attr sysusers.=
attr usergroup.attr<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DESTINATION ${RPM_CONFIGDIR}/fil=
eattrs<br>
&gt; + )<br>
&gt; +diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt<br>
&gt; +--- a/scripts/CMakeLists.txt<br>
&gt; ++++ b/scripts/CMakeLists.txt<br>
&gt; +@@ -6,7 +6,7 @@ install(PROGRAMS<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check-buildroot check-rpaths che=
ck-rpaths-worker<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find-lang.sh find-requires find-=
provides<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ocamldeps.sh<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fontconfig.prov script.req<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fontconfig.prov<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm_macros_provides.sh<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpmdb_dump rpmdb_load<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm2cpio.sh tgpg<br>
&gt; diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-dev=
tools/rpm/rpm_6.0.2.bb<br>
&gt; index c27f58a0e8..6c80c839ca 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb<br>
&gt; +++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb<br>
&gt; @@ -40,6 +40,7 @@ SRC_URI =3D &quot;git://github.com/rpm-software-mana=
gement/rpm;protocol=3Dhttps;branch=3Drp<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-tools-elfdeps.cc-Remove-format-module.patch">file:=
//0001-tools-elfdeps.cc-Remove-format-module.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4=
.2.patch">
file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0003-Do-not-install-the-pkgconfig-dependency-generator.=
patch">
file://0003-Do-not-install-the-pkgconfig-dependency-generator.patch</a> \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0004-Do-not-install-the-script-interpreter-dependency-gen.patch"=
>
file://0004-Do-not-install-the-script-interpreter-dependency-gen.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; PE =3D &quot;1&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
//Peter<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_DB5PR02MB102135B72371D3429294D2817EF602DB5PR02MB10213eu_--
