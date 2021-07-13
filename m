Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.82])
 by mx.groups.io with SMTP id smtpd.web08.867.1626155829064560109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 22:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Y7u1m6MF;
 spf=pass (domain: siemens.com, ip: 40.107.13.82, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoosjsJRKgylQCqKq7yZcYHkFX8BA+hVhkfvhixpoV/NX/59hZzx6p0H3Wd6KxITAw0pak8g5F25OvWnfOv/G68BsNqRvmbC8vugyMGOoEqwmdOBOVlGsxgpt4vWxnGmnh7LnLVcXi9YjOgGK0JyzWiiAmlStPT5jljhtDsHhWOUeLpMqVDUHqn21SiGNplGxvew06P8YcOyxj/5MlC1p/lvK5ru3HRS46G6dmnCXolyqeRf0wAVfsNRwC1ASka9quHPxoq+mrJkAKudxv3X+GcRyVsuIAtoZhLzVg1h9vMuMs3wZk/zLLLTYznrLthQsVnBCFC+gStQXoCA6Y1SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBOMPCAbdC3D2JwgSTmp8/SMYWt/6atQE2SGZUY+rKQ=;
 b=B8Z8uaUkzrU/oMjhpRxg/MULfymGdc7Ot903XP660xgIoJT9Qnblv43UDoWWwTXzOiwd4XXvFQfzhn4ZRe73wKUkspMEvKolj6cPSnPDPs6acCTlVeZt5eJPTZ676E758x3uER6YAe1VEYF2jN3vXVsJjgN/a+OyawzF3ZKMEE1K38P2DInnRfVozr3BCHsBBCzPM10Rl5Zp/eXO+kOTaB62bByu6+6iv7kl9g5KgXNJ48D9vhrJ9cFytQKBaX9XnopAiPxoSOJq+SjQw8VQyU/rbUicq6YllIwM8nwFEs0jQzEM9avFZEdjoldg+FNVVpjOB7f24LQCIEUXmSDUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBOMPCAbdC3D2JwgSTmp8/SMYWt/6atQE2SGZUY+rKQ=;
 b=Y7u1m6MForCqbSm2bcufcer+Dl89wy7Ie0ZvWYcC4hBsaB1woZDLiRCFC/M734+oVXZok7zypmtsG/V1vtSOM+6meQ7yFp4UHEGk4R8/G9+yLBQP0fKNvQi7uLIRLa6eyb/DX7oH8OaxzOgWP2IPPzYzpTuytCGbpNEaSCje0cw=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3578.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 05:57:06 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:57:06 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] busybox: add tmpdir option into mktemp applet
Thread-Topic: [OE-core][PATCH] busybox: add tmpdir option into mktemp applet
Thread-Index: AQHXadid9WxOoimYtkSERXIlfgxm/qtAg7yQ
Date: Tue, 13 Jul 2021 05:57:06 +0000
Message-ID: 
 <DB8PR10MB39779534C416E7949A0AEEC192149@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210622121531.13424-1-andrej.valek@siemens.com>
 <20210625061011.10871-1-andrej.valek@siemens.com>
 <bdb3cd51-b2b7-f5d6-4353-287d339dcbc6@gmail.com>
In-Reply-To: <bdb3cd51-b2b7-f5d6-4353-287d339dcbc6@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-07-13T05:57:03Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=0d24bacf-28c9-41eb-b9bd-943a53ad8900;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91189637-b299-41ee-7e84-08d945c30b72
x-ms-traffictypediagnostic: DB8PR10MB3578:
x-microsoft-antispam-prvs: 
 <DB8PR10MB3578FACC86B8D9343692CEC892149@DB8PR10MB3578.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:19;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y8LZxoRg7oW2JphTDJDFN7pqGn1UafAJMS+K2bVgTlO3HGaFgv1b9l02GHv0ZCWhWjJcs85v5z77SImDLrnHWNdjhuPrbYCe3LSiyBNfRsVBtGMXL8cf9eKW8Qk7nXcgjzPCG3k6YpmipHVL8mgvwCX5G+28UE5bNyDMVtOFvl91mbzLmKwVocLmj7bg6nC45vAm2qh9mRkdd0vtlr11/VM7x0eLFI+/Gxf3J0omhpuAp7pf+Y2F2zYaMYocjc16nsdW8oe3U558mDNAQKU5qgck7FTzQILu2tDPK/9GhIKheTTwqfpKGkkPRo+dLs7Ito9bCA4++pz5n/zF3dNUceOrDdtpb5eokqQWPsVa3XLORNOk5Rferpbo6BVDk7+asnbLvWxcK+hAHNtpIoeGYIKEcr+H4nHccyS1TRQUaY8f3AvHwFOGqFd7HWd9K4Icwbvze9coNriHgZzicP6EPkLhdzOdRGupSsQDCg9y7cat1kE2fxoJuauXbaBc/9VS93xndw+73Yai4qccqZEpJ7ZL3PS7ihoSXlJEy0/Z2yC92T2/EK6EG4/oYg4zzpYZwtOHqDIRl5s0EyBdyIpe5fUWasV9XfNDP3y50/vLE0yPbZn/T4glBP9OOhESIOEDc3YgrYXJS1tyNAeUIX7hme/hzemJp4QJ2iMILu4n8RbEo5OGtT6ARkW/zUlKFPNIMiRNfGCe878BZ2Ytug8G+QTG1raEsw8CicvVMGXiDtG1qvbarFBawUE57QAh7bQzorTIQbZYDQ8mcn0zdpWXuQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(8936002)(83380400001)(316002)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(966005)(7696005)(6506007)(4326008)(2906002)(26005)(186003)(33656002)(478600001)(45080400002)(71200400001)(8676002)(5660300002)(53546011)(122000001)(86362001)(52536014)(6916009)(38100700002)(55016002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2Xjbl/KO4U3Jejz2AqHzJ5npBNAnV8FKiNZjrP8sGVzh+a5zAnRUss++VuAn?=
 =?us-ascii?Q?O2ApxkOUO6YUaWHE7mdVrHk+ruc/+7O3shkHGJezuQ+nIMc8oRy1kF+hN0Ep?=
 =?us-ascii?Q?hUzYXnJhIsu+/M8ES6BmhU0YFASoFsCkHXJqmtPqwPq/zam87Ho49a1JAqtx?=
 =?us-ascii?Q?eL6opBSiOzUuZFhwzJ7qIOyjGOWG2/Y1j3xa+Bf4ECVv6NpeJUJ2NVFuViO3?=
 =?us-ascii?Q?P5vKlH1DA2dK+hS+3nGexW8RmW0wf8IfAeMz7ZoH/9czESOSTypIxbjKi+6P?=
 =?us-ascii?Q?rAYQjygXw8A7vKRzxN+42kCdHVQJHrRldCgI6wApdADs/hZwcxL275zF2pJQ?=
 =?us-ascii?Q?WFZCzny4ohZXG8q/0eSKbRJS3c8baRNwWmgH0H7C/U9gcx3Hwyz3h56ua5Wq?=
 =?us-ascii?Q?XpNn5pxx0FduNGjcmbc9jGYOB2GXT7OGHIDXoVm2UiH/8n1Y7vb3XMZGHfF7?=
 =?us-ascii?Q?TXLMqNkJqd2SpvivhdnuOEGMXHAo+SnnvvXnLFuwzLJp+xPUb7Jk0XQVGvUy?=
 =?us-ascii?Q?GhhwZj1HhPRUw/6HI9KKF6F3VCganufbuixky/VuKumskjGxvf3xvpuXToX8?=
 =?us-ascii?Q?Rn2RAn55ZZ3gVxQKrWwzo16D5PSW0K2RQUmRm7zItTrW/Dg2ytzEjbNr6EGB?=
 =?us-ascii?Q?NPXO/oQXtOwDyF/A7SQBCU5oesId6nyaWbiELirzcmC2+zZfXbwUEzB4jrIP?=
 =?us-ascii?Q?45GYH23Dmde8hZtilvgsJ3wo0KYEQUp0+YraTq1VEk7lpA/TafsSlrpkdWNZ?=
 =?us-ascii?Q?VcpoDgJzcRc0hbZEV1nnYBt1l0OAEFUT7scNTbyYzlxFyzp9tbeBuOoVSl03?=
 =?us-ascii?Q?t9m2ecct0uO04aaTeEu7TjtowVRyvsibJqASg7VEdZQDNr2xRitQgeSMB8DF?=
 =?us-ascii?Q?tbHWYaH3s6Kl8RmyuraJQxOybTj4RQ55vV76S9oe40ewHYLN/yXK+N/Gv+Rw?=
 =?us-ascii?Q?babjKD2z0xPiFacRQB7WuAGHaj2MT+UXk5VlCoW2DeWVzTyIu+tmXAOLodrY?=
 =?us-ascii?Q?sTOr9KOqu+karPtyzPuKg+C3CFXeaEGa3n+dMU8ZtivSjbGGbtZqw3quxJjq?=
 =?us-ascii?Q?e2vI+DTanSIvQ4c2RPje4xMmnoinhrVcu98IwBi1JiIVmEgPfgmnURrcoy7R?=
 =?us-ascii?Q?vz/QX4cspSYmIEbagB783YJ8L1FWPLbqeGLPU0oV2RMfxHxODtK7lr/Wkke6?=
 =?us-ascii?Q?T82+h+6itpLdEHQG2DKx/czpc7g8VSmBVCS15ojzbFfJMCgUK60wri+HYTph?=
 =?us-ascii?Q?TUD9+fR5X/c8BJ3VIFqxo6g0rAgY3hMY7rZpBKc1u6oVRTLd4Df02/M8afhJ?=
 =?us-ascii?Q?kQA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91189637-b299-41ee-7e84-08d945c30b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 05:57:06.1891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zR2YCR2Zwa98iaC5woibFnOJPgaf1TaJGvyZQy0TgrmpKdqupPxf4Hfz2oB5X6GfIUNOftBBSbGKW5JfXTFis6r+JxkGM0HYATOZgRY5apk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3578
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Would it be possible to include it into dunfell branch too? Or do I need t=
o submit the patch again?

Thank you,
Andrej

On 6/24/21 11:10 PM, Andrej Valek wrote:
> - Make mktemp applet compatible with --tmpdir option in ca-certificate=
=20
> update script.
>=20
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   .../busybox/0001-mktemp-add-tmpdir-option.patch    | 81 ++++++++++++++=
++++++++
>   meta/recipes-core/busybox/busybox_1.33.1.bb        |  5 +-
>   2 files changed, 84 insertions(+), 2 deletions(-)
>   create mode 100644=20
> meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
>=20
> diff --git=20
> a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patc
> h=20
> b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patc
> h
> new file mode 100644
> index 0000000000..4a1960dff2
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.
> +++ patch
> @@ -0,0 +1,81 @@
> +From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00=20
> +2001
> +From: Andrej Valek <andrej.valek@siemens.com>
> +Date: Thu, 24 Jun 2021 19:13:22 +0200
> +Subject: [PATCH] mktemp: add tmpdir option
> +
> +Make mktemp more compatible with coreutils.
> +- add "--tmpdir" option
> +- add long variants for "d,q,u" options
> +
> +Upstream-Status: Submitted=20
> +[https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis
> +ts.busybox.net%2Fpipermail%2Fbusybox%2F2021-June%2F088932.html&amp;da
> +ta=3D04%7C01%7Candrej.valek%40siemens.com%7Cd0399684a66a4ee5460508d937e
> +fbf1f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637602325103746151
> +%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6
> +Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dljy4RuZ8pCX8keUHlquCLCJ1hojHg
> +v9qfY%2BcXPB6T5o%3D&amp;reserved=3D0]
> +

lgtm, this is right approach

> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + coreutils/mktemp.c | 26 ++++++++++++++++++--------
> + 1 file changed, 18 insertions(+), 8 deletions(-)
> +
> +diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c index=20
> +5393320a5..05c6d98c6 100644
> +--- a/coreutils/mktemp.c
> ++++ b/coreutils/mktemp.c
> +@@ -39,16 +39,17 @@
> + //kbuild:lib-$(CONFIG_MKTEMP) +=3D mktemp.o
> +
> + //usage:#define mktemp_trivial_usage
> +-//usage:       "[-dt] [-p DIR] [TEMPLATE]"
> ++//usage:       "[-dt] [-p DIR, --tmpdir[=3DDIR]] [TEMPLATE]"
> + //usage:#define mktemp_full_usage "\n\n"
> + //usage:       "Create a temporary file with name based on TEMPLATE an=
d print its name.\n"
> + //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXXX)=
.\n"
> + //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
> +-//usage:     "\n	-d	Make directory, not file"
> +-//usage:     "\n	-q	Fail silently on errors"
> +-//usage:     "\n	-t	Prepend base directory name to TEMPLATE"
> +-//usage:     "\n	-p DIR	Use DIR as a base directory (implies -t)"
> +-//usage:     "\n	-u	Do not create anything; print a name"
> ++//usage:     "\n	-d	=09	Make directory, not file"
> ++//usage:     "\n	-q	=09	Fail silently on errors"
> ++//usage:     "\n	-t	=09	Prepend base directory name to TEMPLATE"
> ++//usage:     "\n	-p DIR, --tmpdir[=3DDIR]	Use DIR as a base directory =
(implies -t)"
> ++//usage:     "\n	=09	=09For --tmpdir is a optional one."
> ++//usage:     "\n	-u	=09	Do not create anything; print a name"
> + //usage:     "\n"
> + //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
> + //usage:
> +@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
> + =09	OPT_t =3D 1 << 2,
> + =09	OPT_p =3D 1 << 3,
> + =09	OPT_u =3D 1 << 4,
> ++	=09OPT_td =3D 1 << 5,
> + =09};
> +
> + =09path =3D getenv("TMPDIR");
> + =09if (!path || path[0] =3D=3D '\0')
> + =09	path =3D "/tmp";
> +
> +-	opts =3D getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &path);
> ++	opts =3D getopt32long(argv, "^"
> ++	       "dqtp:u\0"
> ++	       "?1" /* 1 arg max */,
> ++	       "directory\0" No_argument       "d"
> ++	       "quiet\0"     No_argument       "q"
> ++	       "dry-run\0"   No_argument       "u"
> ++	       "tmpdir\0"    Optional_argument "\xff"
> ++	       , &path, &path
> ++	);
> +
> + =09chp =3D argv[optind];
> + =09if (!chp) {
> +@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
> + =09	goto error;
> + =09}
> + #endif
> +-	if (opts & (OPT_t|OPT_p))
> ++	if (opts & (OPT_t|OPT_p|OPT_td))
> + =09	chp =3D concat_path_file(path, chp);
> +
> + =09if (opts & OPT_u) {
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb=20
> b/meta/recipes-core/busybox/busybox_1.33.1.bb
> index a71ff530cb..4c2bc1106d 100644
> --- a/meta/recipes-core/busybox/busybox_1.33.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
> @@ -38,6 +38,8 @@ SRC_URI =3D "https://eur01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fbusybox.net%2Fdownloads%2Fbusybox-%24&amp;data=
=3D04%7C01%7Candrej.valek%40siemens.com%7Cd0399684a66a4ee5460508d937efbf1f=
%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637602325103756104%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3DN3SXB3FD0hAF7wAV7Hv4AgT5f%2BEHAQr%2FRVNv1KcZqxs%3D=
&amp;reserved=3D0{PV}.tar.bz2;name=3Dtarball \
>              ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_m=
anager') =3D=3D 'busybox-mdev')]} \
>              file://syslog.cfg \
>              file://unicode.cfg \
> +           file://rev.cfg \
> +           file://pgrep.cfg \
>              file://rcS \
>              file://rcK \
>              file://makefile-libbb-race.patch \ @@ -45,9 +47,8 @@=20
> SRC_URI =3D "https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fbusybox.net%2Fdownloads%2Fbusybox-%24&amp;data=3D04%7C01%7Candrej.=
valek%40siemens.com%7Cd0399684a66a4ee5460508d937efbf1f%7C38ae3bcd95794fd4ad=
dab42e1495d55a%7C1%7C0%7C637602325103756104%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3DN3SXB3FD0hAF7wAV7Hv4AgT5f%2BEHAQr%2FRVNv1KcZqxs%3D&amp;reserved=3D0{PV}=
.tar.bz2;name=3Dtarball \
>              file://0001-testsuite-use-https://eur01.safelinks.protectio=
n.outlook.com/?url=3Dhttp%3A%2F%2Fwww.example.org-for-wget-test-cases.patch=
%2F&amp;data=3D04%7C01%7Candrej.valek%40siemens.com%7Cd0399684a66a4ee546050=
8d937efbf1f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637602325103756104=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DxHlfVfFwwfCPyRhSt%2BjwIHpJHxpCW8T52kPfw=
JZyo3U%3D&amp;reserved=3D0 \
>              file://0001-du-l-works-fix-to-use-145-instead-of-144.patch =
\
>              file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-s=
ys-ne.patch \
> -           file://rev.cfg \
> -           file://pgrep.cfg \
>              
> file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch=
=20
> \
> +           file://0001-mktemp-add-tmpdir-option.patch \
>              "
>   SRC_URI_append_libc-musl =3D " file://musl.cfg "
>  =20
>=20
>=20
>=20
>=20
>=20
