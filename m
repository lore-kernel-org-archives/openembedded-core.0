Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054DECD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:41:30 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8549.1779270082184520865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 02:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=nPPg2ArI;
 spf=pass (domain: axis.com, ip: 40.107.159.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FH8lvwOL7rHEgkZPETt0Uj2TFs7Onmm8+w8+lepa2SlN+s3P69XG2LbjGPLo7n/Au/Gd3XX0zF0zVywRMHwVDNvjx/dOo2GtvvetyPwTHvc/20/cNACMe8MUgMjHko9mvv4ctlxSyojtTz9M2PUYceTt4Uyy8JOZ0dGTp1szEkZUhjt/T0fNlBhHLSj+zT/yJo+gDQIEkaPDY5NnSHrK1IzFZ3igYOiHSUPpQ+W7e+1EgZMQRoPpi6I2nwIfTvevqUCm+H8TmhPXog64+RSo5AqBCumDr0WlY480raTzyfZmZ4hqlLyA/eUOFeqpIqEqkOChmHKkTZM115hBurFPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RDCYm3iTB15iarDni/UpN+oxWG5HaZPaDPIECksk1Y=;
 b=fMadw/JURVSxEQiP3OgRa7k4QZhKJgyaCW+RRTpxnI8fmUAB38VAqP2lqjwufmda6cXxWyfuqF8NL68wOQ+efMDkKpWKLQZhf5oaHH0F4FRIlMtb21HIRFB7EJ4qUr+GOVs1U79ogcRc1+tVmVOhR2qbWihhWpon5SnKqooG+w7FXzN3HqVoaXunEsMjFcKxlpPgweH2TMa4qqdXOtu9mnR+Fq+gwGDkzWuvPMgfz5cvP03DHoOKRCLgHbAZL75inEArNpzm4wL8PY3qjn7DpOAvrnS26AUbfOSVVsIRYybppZzfcEfzVL/6m3WvVzHZvmKuXY0t2LEXQ1y/+ldY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDCYm3iTB15iarDni/UpN+oxWG5HaZPaDPIECksk1Y=;
 b=nPPg2ArI0NtaHRBf8KxVVlNr2G1hftpYRuVeENdXVA3rTfKQkoPvTwvOL4uJiRZBKuAKUtjf6Gw/34zqMbG40JKbNiI8SxyRrMvaah2J56GWM3zAtEyG0ucKzbp2oXU0WMK5aRP8MxBOFrecE02Ga6tLdnyjFEJVCh30ZGGuPxA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9041.eurprd02.prod.outlook.com (2603:10a6:20b:5bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:41:17 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 09:41:17 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/4] groff: fix whitespace
Thread-Topic: [OE-core] [PATCH 3/4] groff: fix whitespace
Thread-Index: AQHc5rHDXj1l0Usgd02VLAq8BdzRirYWq2TQ
Date: Wed, 20 May 2026 09:41:16 +0000
Message-ID: 
 <DB5PR02MB10213130D4C46BBE37E4184D6EF012@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260518103249.592747-1-ross.burton@arm.com>
 <20260518103249.592747-3-ross.burton@arm.com>
In-Reply-To: <20260518103249.592747-3-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9041:EE_
x-ms-office365-filtering-correlation-id: 420e55db-7eb5-479f-4fcc-08deb653f0bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|18002099003|56012099003|22082099003|38070700021|11063799006;
x-microsoft-antispam-message-info: 
 tSKydUOi1XiMjgbKdk4+qI4vFg6IKtz197Dqy5SokoXvFLjy33rAPiTSea2BbH2wVvFshztbZVjGd3GP+DPpmb0MmktQ+egRDTaJloLqL08gca3jbAh0hEyI0LtYCYbbT/zO+G76HoW8MWtyfeL1NRghrIIECZeRE8AruGL1yL4dyafywc7ao8cJymI0OW47IY10Hyg7IAV4sB1I9Ij+boHOTSuE+PRPFaOxAp5p6Z6IeAGC6fGQklVlU/MY//6BF37xjMHFzBbWfQ9Oje8nawYkMJo83ueTeQz44A8lNd763PYQVjA5udjROAQzpFkK9ZRG68sVgImpFLcmQ9P8IMyncjWT4+UKC7V/WOj0ilMJufsL52LIGUb+b+6dgipz2t0AAQAQeHQa4lBb8C9tZSX7/ZVJlFrvqkxUB1QaNjJHwW6iF/UmXybvAFLHgzQ8dawaZiZ4ZCMWnVj+BJM8mGiu72esEfSRu30NpMvXsdzKgiU7D0Rk9ywrCFXc4Cgu36tMN28UmD874UJ3xJC59HxX1f1DTVjP6aSKr9UjT6v0tp+3jfHeoGdwmherNFMM2vTF6Zfdhym+6n2V1JlqOJRKZRcTCcjqm2K2dNkjXTZrWmBC1No1rm6pEMBG0HITTATJIFZJqTHEjHv2dZ08/Uu9ajjHJtm0/F2xah0VoXpQUKt0hZODywQCQs9iNutFjprtQ3qOKDiuF+IN7N6y4Dtw31OXnVgCWkfqE0H1Er1qjXCKc5Fu/HUFwp/Dcw8t
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(18002099003)(56012099003)(22082099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?w+i7yendjplz8BIvO/BEvSxN/PpS80qwE0qgsa2sHpldEPVgMfMQPejlQgTy?=
 =?us-ascii?Q?bPegfqDikITYz5c4tD7djXfMewkb3SShWJ4SwRLbMP9bY2K7jwBDnBt3ykM3?=
 =?us-ascii?Q?8c+7w+EAz8RZBP4cx1AvsfPFPKljAnaVw2eTfJQ0jLjYOTbiLhlp3nh08rKd?=
 =?us-ascii?Q?Id5SS2GuLs2gL+9k1OT57osl+LyxnuPlPIHAwDK47fX4taoag+AhIl6lH8mL?=
 =?us-ascii?Q?bd6BdS9otXlvaEdpSo/lx2WUCJwmZSRlQpLVI4f5tdCKdhzWAxsPkx9wdGnU?=
 =?us-ascii?Q?MrbLPXG5woITGYPcfQ3F0Of3Ka/zGDm1vFrG43+fdIyeUhZHJog5QwDCtttU?=
 =?us-ascii?Q?3bRju/Zk7bmduG8PSZ6qvDAYiDaEP3N86ALUNjHwzJvcsirK+lltZE0MllWA?=
 =?us-ascii?Q?J1r/YSCoxxTJxAWVDy/rE5Vu8tONyMyUNCuQmwLS2MOz60+DaCTn6jcfrbTv?=
 =?us-ascii?Q?G7NFZ5a6bIyFvcfkb2if9pH0xgyp6LVtwdraYvsoJ3Kotalq8HTCpvnJAM6y?=
 =?us-ascii?Q?lTLYnYUFOxL2ko5iIjl4AVx/+CxiVapCKjlOLyCm9d4SQ//92k6UbOyvGdIN?=
 =?us-ascii?Q?iKSTsQXOYkmc59WVKYiG54Gp90rbMLDTDcrTTshHbtSNsBnDsffyfaAA4VeJ?=
 =?us-ascii?Q?y1Rj4o1ukwfmuAiGsW1K1kMJISHwM8/EoTzpkpw82XXMrTSrJNXc+H1fLwIS?=
 =?us-ascii?Q?gN+vpmdHXxIoAm6lDhnQLboIgVUkF/Yxr8k7mKpgLhNoFsEI1v5GecgfOU6m?=
 =?us-ascii?Q?9gP34m9ZCVZ2BRda8fPt6+DT50NWOtTNYbE/0AJJaqDrkrgT0WiFcVWZCLzp?=
 =?us-ascii?Q?tzNpqjf5pxMzlz4RcovFj+xJ1JFSIEzam3WydT/C8FZXUn0tu0084w89pXx1?=
 =?us-ascii?Q?2Gwyyp97awo2I8l+ntyJVTxbGvNmbW8JQtvJTSbaVk2S8y8zIwZ92UYl0B3d?=
 =?us-ascii?Q?xh9FTN+MylvwfDHzYt6nxbnydmoWa9tyz96u794wOqvayQPiGUYosdVn16mL?=
 =?us-ascii?Q?Ddu3ylLC3NdCLgGW3bXwu42DJRgZxqPQ49Q9pJqaTU0wCfSAMHhFAutAnUT/?=
 =?us-ascii?Q?uNHY07OZ9OFZXlKOywjm4HLxOxIMpx/B0fnaRj2+Nkdt/jbmw5tDwwx4vVVc?=
 =?us-ascii?Q?PM//dtJarSvH7bYhHkWZoicYU/3gxYuN6R9JB6ddoRZ4+xvBr7IwTInwPnGB?=
 =?us-ascii?Q?Bbtcu9otkPg6bWLji1xs23pZcHLfyaBA701a1wJwBjjsXBiGG+0R6L3iP5i1?=
 =?us-ascii?Q?gun01LN6KuBj7pkorCLFwRfzP0zN7JGjfIURnVKu8HvQLfycdn82tM2dphQS?=
 =?us-ascii?Q?0IIhfDxCFZMk8FO8iRD5ZKIzjvOBHMypE2rMJ9aYAe9x9Y5FlKE9uV253AHG?=
 =?us-ascii?Q?OYMsKfikqiKu1sIW2gd3I8LaxB7VdytGP0KHKGZwt8lz7QewFGqCUn4ta77Z?=
 =?us-ascii?Q?Ikr1tQYh5NSPFLY5XW+J4DYPHb7Uwk4yUO3uQsgyDNPCWSfXNWziscQYaZxi?=
 =?us-ascii?Q?v+frLEJKaaRyYwWtgrQoPvjrwvrxV+aarMg6L/HaA4bSDh35WGSXUrlLZlhP?=
 =?us-ascii?Q?79LMSiBfqkoOsaXXLONZwMHE5hjwPDTwXVXxoUXC7AhgWxOQ3S+/Pq8uFPnv?=
 =?us-ascii?Q?J9GcYASdEy82EhgsyoOlArRelG66ArG/aHJ1oJFwHUxyTqFHNnByGDTMEUOA?=
 =?us-ascii?Q?S4T6D+G9UVawOlrF4MqWkqTmywI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420e55db-7eb5-479f-4fcc-08deb653f0bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 09:41:17.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rZhemHBl9JTdIrvL3uYNn5OOdS2AZBxP43Ltmj+Cy5fq51mkA2nq4VzgIflBAXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237439

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 18 maj 2026 12:33
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/4] groff: fix whitespace
>=20
> Fix bad indentation.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-extended/groff/groff_1.24.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-e=
xtended/groff/groff_1.24.1.bb
> index e780603b1e6..74e422c6af4 100644
> --- a/meta/recipes-extended/groff/groff_1.24.1.bb
> +++ b/meta/recipes-extended/groff/groff_1.24.1.bb
> @@ -65,8 +65,10 @@ do_install:append() {
>  	rm -rf ${D}${bindir}/grap2graph
>  	rm -rf ${D}${mandir}/man1/grap2graph*
>=20
> -        # strip hosttool path out of generated files
> -        sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/=
hdtbl/*.roff
> +	# strip hosttool path out of generated files
> +	if [ -d ${D}${docdir}/${BP}/examples/hdtbl/ ]; then

This is not a whitespace clean-up...

> +		sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/=
*.roff
> +	fi
>  }
>=20
>  do_install:append:class-native() {
> --
> 2.43.0

//Peter


