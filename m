Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842BCC36008
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 12:55:50 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by mx.groups.io with SMTP id smtpd.web10.18990.1742556155095335579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 04:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=hZBrSdzC;
 spf=pass (domain: toradex.com, ip: 194.104.111.113, mailfrom: max.krummenacher@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1742556153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX70W6s35W25eiQJ5oOluRjc7e2ztBASt+oLYqmVkto=;
	b=hZBrSdzCbECiISqCaqbnh0de2Orzj9MNPKEp5FBNFQj7/z2I15J7mEwcwRZoFKg/QR9JQt
	6Vq+7AnjcI9U7iwauazc4r5uUM/NA/TCwu7hGyuvqG99TsvYNCTqL15ySw7C6ZuSsQm+q9
	OwwPLRvjKSb2x4awNsROI0PdB0TYE0A=
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp17011027.outbound.protection.outlook.com
 [40.93.85.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-74-kk4fqQxgO2yW6dl_s_2v3A-1; Fri, 21 Mar 2025 12:22:32 +0100
X-MC-Unique: kk4fqQxgO2yW6dl_s_2v3A-1
X-Mimecast-MFC-AGG-ID: kk4fqQxgO2yW6dl_s_2v3A_1742556152
Received: from ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::13)
 by ZR0P278MB1445.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 11:22:30 +0000
Received: from ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3e28:e686:94b7:cb5b]) by ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3e28:e686:94b7:cb5b%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 11:22:30 +0000
From: Max Krummenacher <max.krummenacher@toradex.com>
To: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "oss@ew.tq-group.com"
	<oss@ew.tq-group.com>, "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] Revert "git: git-replacement-native: depend on ca-certificate"
Thread-Topic: [OE-core] [PATCH v2 2/2] Revert "git: git-replacement-native:
 depend on ca-certificate"
Thread-Index: AQHbmYeqxdLiaAL4rUSHP7nezo24+7N9R/0AgAAqGS8=
Date: Fri, 21 Mar 2025 11:22:30 +0000
Message-ID: <ZRAP278MB0237C45703925BD4B172B9BA84DB2@ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM>
References: <c6dc4b6aead7933112e653982dccbb8f5db55928.1742467277.git.matthias.schiffer@ew.tq-group.com>
 <48cc62ab319e2fa89a9fcfdeeb84346872f99987.1742467277.git.matthias.schiffer@ew.tq-group.com>
 <CANNYZj-zOSLCn1nMwUD7oaMyekGKQ16cdEMCL8bv4mxLAXGpgg@mail.gmail.com>
In-Reply-To: <CANNYZj-zOSLCn1nMwUD7oaMyekGKQ16cdEMCL8bv4mxLAXGpgg@mail.gmail.com>
Accept-Language: en-GB, de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZRAP278MB0237:EE_|ZR0P278MB1445:EE_
x-ms-office365-filtering-correlation-id: 1dc7fa40-9ea8-42ff-2a76-08dd686aab3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|7053199007|38070700018
x-microsoft-antispam-message-info: =?iso-8859-1?Q?AfbjuBZcUdSpBzam9mAN3a0/hon3RE9IlpB3Jf3jbwgZTgkP4d+USYgt79?=
 =?iso-8859-1?Q?ZTna/tw6yiTkvJEsm/5RBQbJUgr6EJhzy6OCX2mrWQ7YMzhR1ZLIopOaw2?=
 =?iso-8859-1?Q?EIzspuk13B9TsgXjuRVppf2xhZQiym/zXmB1q2aSOiEuITfUSxYe7VDE5Y?=
 =?iso-8859-1?Q?s+wCVAebNIFT2nJSB0FoDxJnxCQSw53kjF+7M91TNzkAmbclx0pktA8TQ+?=
 =?iso-8859-1?Q?sLiofl6U+0MFB7kf8oYXGiIbFiC8WEkQ2Eyd3+r5EJFrdjVDFDpeRwEXBC?=
 =?iso-8859-1?Q?nQdSnx4Se4ZqASt4vFqeAC0c8fg3Zrkb8zXUk0kQpBKYe6hH24lZSubztL?=
 =?iso-8859-1?Q?C87ZghvhFWik6BiNmAfOLlgOmNzq0Pkbdkzy5MFN2Wxf78eGENZyAFlnlA?=
 =?iso-8859-1?Q?BGUKUQYecqq4QRUjCTOumgj7q3KTxdBf2eoQlV72PGhfzSSTx4gXKoMpjK?=
 =?iso-8859-1?Q?HF9ucoK1OETW4sk8dBptYbxwg6A98DydbrtCdSWPl/85ZobPd3wdeWgteS?=
 =?iso-8859-1?Q?PDqIRFhOBQnwG1QBeDyJbssUyiZxLAkVYzIx1Hwzxzf0dGu2MnWIJvRazh?=
 =?iso-8859-1?Q?wzo4KQ/aiUFMrVzo+h4GOlKo0IKKp4CnZ9vcEoeL2zyplKcQOYHLx+UUcU?=
 =?iso-8859-1?Q?T5MAn+Gp+lbISuIESk8mZfdHIoppZM4vyQTPwiij7kr/8ZvzQ/A6xdInu7?=
 =?iso-8859-1?Q?y5TDZS10MefwyIWDAgC+V2yiWqColK0vzlx6wegKcOIoBDCovEndUbKOR+?=
 =?iso-8859-1?Q?ZWh46x+iloKz/KsS0HLS9i1hb/ft9AH0MLUvmtZ5tSPHDwWNNrvoSeSoTB?=
 =?iso-8859-1?Q?2r9bKgQI9N5A4Gno6Hk67TcfJg2xmKiCpPUCHcnAHElfrpb63aL8HRYQkX?=
 =?iso-8859-1?Q?FVnxA4Kpf6kttUS7FCidpL/37nXJ+Nxdo+MwzOMcbEMlsYZN65IlOOHbZD?=
 =?iso-8859-1?Q?f3v+LrvyuaijSAu93yHAZEeN3M/OQ76kepZyt/RlIDADvZCwMY08DkN3+t?=
 =?iso-8859-1?Q?nxUH/Gf9ga4m5NF99DKHY3YOgJyLO3fD3EQvmI8tGx22a0C/IMK2EEmQOq?=
 =?iso-8859-1?Q?furObKH33vaUyb7m/8/8Gs+5FY4R1IDBLaW/cVcWc8BNC7R08Aq7o7D+cd?=
 =?iso-8859-1?Q?e9UmoTAjh6u6S4lo+NJKXxQf20iE8++aNJWnFY+vT+rh6bPzZ6mmibwNxb?=
 =?iso-8859-1?Q?HaC7sDGTrbax75aE0nkumDA43HpWMiQR4jZY1PxS4KLQUCNuLE/zagbN3L?=
 =?iso-8859-1?Q?BolRs4SWHsB3kmh/2elFdat3/Y18jWifLTk3U+kgAT9+WGr/SJumUAkDNF?=
 =?iso-8859-1?Q?DDjP63S9GK4T486UJtNA4oT1Oggfvpt/86B+8kqcjUETXNx5Ys3pxUiomn?=
 =?iso-8859-1?Q?aGjj7ZPWqaIiZ8Rq6pSHavXGSKRWrjVC4z3uipUXy8wFKTpPKidCAPdZsZ?=
 =?iso-8859-1?Q?Ti9giTPGVWGTbeHt?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BuLOSsU843/lCdGY0z5C3aCOvWEkdO2CRkBAY0k7spjrkP9gEZ4WW+eRVB?=
 =?iso-8859-1?Q?0tf5HbKaB354iyYlnHfRSp6CkFjMJdmkwjD+Z86gMD3EhyD49YQrLVqxzL?=
 =?iso-8859-1?Q?hOBQN8kcALKn11J3HhvX/ETRoML3msFRyohjCGTqESIUJRGEYih8lXmhCq?=
 =?iso-8859-1?Q?hQYKmkfmA4jWhh5obQwaUS3Mz/XihyWKCc/tIyiNY00bd5Hq0cPICBveJe?=
 =?iso-8859-1?Q?BiEvW7CLblvHrePWTTXnfSm8BQ+7o+ZyD3j3w1BDpfCxYzXOJ94KpSiY7M?=
 =?iso-8859-1?Q?kxqYWfaVQOD8+bNiMG52rOajvP0sGir3yUM6ZqmJQPirYvL2LXlRpdyt7r?=
 =?iso-8859-1?Q?hnDlhsy1FjIX0pwTxPBWicVmpv+n9NA9ZYAG6jdJ4sPeuw51Zf8cjN/9NY?=
 =?iso-8859-1?Q?fri11dy/udbnhy9VKBZTN8ubQU63+J9D1XNSjlbcXc17jSfRKAiuLQUN6l?=
 =?iso-8859-1?Q?yOZNKdQbm55NDruLMlTp00i9BOO0S4colyKDkCKey5FhBM3NLgyXAo8diP?=
 =?iso-8859-1?Q?QYlC8ExpszIqkYVQvNTZ2zQKT6QfdX7g1n/84fXt8JmIFXHBnQVm6gnw3d?=
 =?iso-8859-1?Q?V7vdnVfPP2WOq4cM+f4P6FmYGp+umdkXA3tPyF4i+Vzw0YoSqABt1/ONcM?=
 =?iso-8859-1?Q?lPCAyOLjm+e39+45f1jTOTgkOhNp9HqwP0wOjfjY2NJZXqoyUN778KKykI?=
 =?iso-8859-1?Q?RsG+21OMgbnU2d6ic6XlY6vFPyGGDWb3Q7jQjZ8JUFL9uisovavc+AwBLn?=
 =?iso-8859-1?Q?QbGfG21o2WzymgzJWvyz4cQzFHXM50mz4ScwcS/gdLxd64ldDipPBHimFJ?=
 =?iso-8859-1?Q?zjnvORwMqIq3xU9PS7hwUmNnA6zaqOwz5MGU1Uaxfo95E3E783wdx+0qcJ?=
 =?iso-8859-1?Q?GKhF7rOU4J1VhA+bnJ7BCvz+6pZrbYvx+19pkaDKgYEf5vhVXPt3p5daMw?=
 =?iso-8859-1?Q?QnQ0c6TTwmhKpeHuDlKmmYOXTaLYS4wvGGIL/iTn0TS1Pa/P33Lg4+hUFE?=
 =?iso-8859-1?Q?v2ZVfrWndum7EHFYxbueXXpgWi9qTYhVkoAlJiCc64s0dPdlcPGHCeWiDx?=
 =?iso-8859-1?Q?q3g+UyvGmCuAr2rRF3PU8L94Wr+ahHdH+9AqVJ7wBqo/pwHzb+rL0ZgXy7?=
 =?iso-8859-1?Q?kwnwJzLD5HcaogQ+gPTn3ZOAib9ovg0KGwXbsSpu78jeHe1c4EMHcdgdeU?=
 =?iso-8859-1?Q?8ouyAg16TxRO8Tsu7To+j1sstJmK6Z+kYH5roGIMxf8ifrw0fN5OaQ45bt?=
 =?iso-8859-1?Q?+xE09/1xDeio9EwtBXNdocwBOkPl4D4aOl2QvdRhviUv3Y6kZ4JckSoPB8?=
 =?iso-8859-1?Q?7oIzgWNkHDzRwysKGQ1x5+dtdEloHIAJSs0eQwaKnrmsL03AK4AAU8oox8?=
 =?iso-8859-1?Q?/pIgIcBgp1dpIH0YYymRo/NZ00i4B+WX486Iz86rC76BzpUpvR0Z9kBX35?=
 =?iso-8859-1?Q?J03R6QY9ydLDN06SfNOCzQzd3HbDtbCx3i9Xsq+EgcBF8beetCkyzjgWlv?=
 =?iso-8859-1?Q?/QEpAQ/W1GIu9WUUdzVQAuy4H7BuuYz4mSJ6Y2dP1cu0J54JCoJxbRxAHl?=
 =?iso-8859-1?Q?ZSStivzUCs0sJ71RBvJDqvIF1LvX5zSQGRijwzNcLeh3Q4D0iuUgxJGBwa?=
 =?iso-8859-1?Q?RIzUPpaJ7Ixmd8Dmn3RGj06CA14hCgxWalLX262twGTallp86cYJnnTg?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc7fa40-9ea8-42ff-2a76-08dd686aab3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 11:22:30.4848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avbm/tu/AbEk27hdfM7ib7D/JWOMTnDmT/BYeME0UdSrm6WPXEOrIHParAPOCWCJh/V4JM1fKLTnmV8c3hNTxnM7z3d2x141O/EAccw3fJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1445
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VpzZ39IH1zjmwdptQ3wXp6mHErtM4zONKX1Zc2NsLXc_1742556152
X-Mimecast-Originator: toradex.com
Content-Language: en-GB
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213444

Hi

I was able to reproduce the issue I had by just reverting 2e99ffda70fd.
Adding the change to curl you propose then fixes the whole thing again.

No objections from my side.

Back then Mikko run in the same issue and proposed the same fix you do now =
[1] but was then dropped in favour of the change to git.

Regards
Max

[1] https://lore.kernel.org/all/20240404132902.68631-2-mikko.rapeli@linaro.=
org/

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: 21 March 2025 09:44
To: matthias.schiffer@ew.tq-group.com
Cc: openembedded-core@lists.openembedded.org; Max Krummenacher; oss@ew.tq-g=
roup.com
Subject: Re: [OE-core] [PATCH v2 2/2] Revert "git: git-replacement-native: =
depend on ca-certificate"

Thanks, I think this set is now okay.

Alex

On Thu, 20 Mar 2025 at 12:03, Matthias Schiffer via
lists.openembedded.org
<matthias.schiffer=3Dew.tq-group.com@lists.openembedded.org> wrote:
>
> This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.
>
> git-replacement-native is used only to provide a newer version than may
> be installed on the system; apart from that, it should work more or less
> the same.
>
> In particular, it is using the host system's /etc/gitconfig; it should
> also use the system CA certificates, otherwise it will break HTTPS
> connections in environments that need local certificates, for example
> for a corporate HTTP proxy. The override had been added to deal with
> curl-native relying on the existence of its workdir to access CA
> certificates, which has been fixed in the curl recipe now.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>
> v2: extended commit message to explain why the patch is not necessary
>     anymore
>
>  meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devto=
ols/git/git_2.49.0.bb
> index 66082d0bde..2ca8711f75 100644
> --- a/meta/recipes-devtools/git/git_2.49.0.bb
> +++ b/meta/recipes-devtools/git/git_2.49.0.bb
> @@ -4,7 +4,6 @@ DESCRIPTION =3D "Git is a free and open source distribute=
d version control system
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-=
1.0 & LGPL-2.1-or-later"
>  DEPENDS =3D "openssl zlib"
> -DEPENDS:class-native +=3D "ca-certificates"
>
>  PROVIDES:append:class-native =3D " git-replacement-native"
>
> @@ -97,7 +96,6 @@ perl_native_fixup () {
>
>  REL_GIT_EXEC_PATH =3D "${@os.path.relpath(libexecdir, bindir)}/git-core"
>  REL_GIT_TEMPLATE_DIR =3D "${@os.path.relpath(datadir, bindir)}/git-core/=
templates"
> -REL_GIT_SSL_CAINFO =3D "${@os.path.relpath(sysconfdir, bindir)}/ssl/cert=
s/ca-certificates.crt"
>
>  do_install:append:class-target () {
>         perl_native_fixup
> @@ -106,7 +104,6 @@ do_install:append:class-target () {
>  do_install:append:class-native() {
>         create_wrapper ${D}${bindir}/git \
>                 GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PA=
TH} \
> -               GIT_SSL_CAINFO=3D'`dirname $''realpath`'/${REL_GIT_SSL_CA=
INFO} \
>                 GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMP=
LATE_DIR}
>  }
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
>
>=20
>


