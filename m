Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web12.6795.1619581365866956592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 20:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ak3ItXVs;
 spf=pass (domain: windriver.com, ip: 40.107.93.48, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM31F2l8KbfJzKC0lHat0s0Gfl0Yfgp38etCjbH2zDJnVVMuDrY5dtMZd1V3utC/4oFWSmphgTUdMbMbsf49BTEtE0WdJAbe7ZrG+p793QGaezw4JOfGRkLrt5pKWlCaGd7oa356RKhOz8WlmLbmRw8yIcyL/gjSfRuU3Evu5SR4VfPvz0igIxQoL5Ly7H7PhSn+WYBdecxKY2q5WRZUAPBULGl1IdjJpn36X6dihq8GBPvU3vyQ5Vahwxx9dkXfGgkaHasMnzYuAZHZ9KnN3HsYHAI2RtPNuE9S4BPSDEO/jHL3uYq88cDg/bLQhy9B2M+ZOAHWRZzAw7MWvXRcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvN7O1mKp8XPaox+B5CbyahClriij542IGExCzJ2fQA=;
 b=BEpYuZ9NIStRvW13rEq0p2Ay19F0IJ0M1rotvcfx81J53nVMNaB8//wPsnAhEBFUiotzUXtj27qqHLDZigQDPMqtZabbailBHI6QBY/7VKJSQ42Z7XKjCnuFaJqZFL/7ode0zEKtcBFPDM5PZqc6ekqV2cGoRjlq1HWMzIzvGa9grzAc14YkQ18EaIGNZEvbEsE+3juUsagJ9xArnm+l422xA3z6M93c4m+lR/Ue0pbw99z57SUdmXmtMtImQkxHGl/ChiBtCTHI6e8O2UKCOAZmG3k3pXNOlllqtZEGkZeeImWm+vt03iRSa1UPndYmmTcZA+cX4jFJD3O8vtwMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvN7O1mKp8XPaox+B5CbyahClriij542IGExCzJ2fQA=;
 b=ak3ItXVs8xEDAkBPexYEUNiXiU6Y1uqMMpk9D2J8JrsxrSvFVZY1ORQvMHgFJp00wa6i5Rmh+WiTyfq7lTkQiH3yJpPqyIQZo+kqD015f9+GOUpcUSNL/Y0B6jhQ9bxzN2tsJC9l4Sx+HrhSVgdqhYuB/Qc6axsMv/EuefSKJt4=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2682.namprd11.prod.outlook.com (2603:10b6:5:c3::15) by
 DM6PR11MB3052.namprd11.prod.outlook.com (2603:10b6:5:69::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25; Wed, 28 Apr 2021 03:42:43 +0000
Received: from DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810]) by DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810%6]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 03:42:42 +0000
Date: Wed, 28 Apr 2021 11:42:25 +0800
From: "Kevin Hao" <kexin.hao@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	"Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: [OE-core] [PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
Message-ID: <YIjZoZ8mZ5bGlPJR@pek-khao-d2.corp.ad.wrs.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-6-alex.kanavin@gmail.com>
 <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
In-Reply-To: <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
X-Originating-IP: [147.11.105.121]
X-ClientProxiedBy: HK2PR04CA0044.apcprd04.prod.outlook.com
 (2603:1096:202:14::12) To DM6PR11MB2682.namprd11.prod.outlook.com
 (2603:10b6:5:c3::15)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-khao-d2.corp.ad.wrs.com (147.11.105.121) by HK2PR04CA0044.apcprd04.prod.outlook.com (2603:1096:202:14::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 03:42:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d751a8fb-d9e8-4653-0711-08d909f7ad9f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3052:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3052816059AE662A6B7918D0E2409@DM6PR11MB3052.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y19gQlutIXkDRybl/l6chtMF9goVD52Wl7IYRiRp1LaZsuDL1JBfwtOg3tjUC5rfmhPjRoELKPRYecNFlwKO5DpsLkH8cyImqUI0IbV8DlIpnSdJ2iqhjJJDU4ifhoZyL0rd0nkqsxB7Kt6L0YuGrPj5eH7Wyf0a7ydZhhkG9SfLHql2LchbSirXKxiSm3W+njE2u3v3RuErTs6oiVQzZ8RgGdLYC0puzpXbFKxlgWTbzRKZMnecBKw1ecFfru5+K6LDB7Xbk91Z74b9+5LPmQWvmnzfntmeIG0PuTl4zQDDL6VHT0YuDLgjMofrN4Un0/uqMolmYgeVy6+5Tv4cjluta7f1bHnAiq6u6qp8ft7fZdbqef4OaUYLoaOvuVZe5KmvLw2iwwYSO/a+prGqexv0ccypQUuNusbHqrRKKPBy5OcTIyEqJDzRrGer2EDDq282YpGuBaN0YNHL7iucszmYA5Tn5HWw60C3M4PrZLD/ObaOEO3O4/3aMir3ssOWzUzKMUCOnPFh7ASnX8gMP+C/lKbAaNdIXxfJXZgvXtZTGW0R/ThdPGXvf4EkVgMF304eZpb1k3A0WTdMxZGgx25YK3FzaKU/t/VI/tvMKEZLN4ovRTxbveWLpFD+dy0Zbri4BQ75WtbJJdideNWqw/2UVkkaL70PzRkOkApBszQ31UfD3kCLVTzaXIMb5RDTKSTawr2rnXm9+HeRy+ByYkloiC2cmejIZRyp5OJwlO9sSpXdz0oHZ13GDS5POhi3Ld04pWnpIFuxKxHvcj+MFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39850400004)(6666004)(83380400001)(66574015)(6636002)(8936002)(54906003)(86362001)(38350700002)(956004)(2906002)(4326008)(6506007)(44144004)(6862004)(478600001)(966005)(26005)(7696005)(38100700002)(9686003)(21480400003)(8676002)(66476007)(52116002)(16526019)(53546011)(186003)(55016002)(316002)(5660300002)(66556008)(66946007)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?h32wqBBIBFiRCaVl9JWCO8/nWItJGEs4VeAgoSZdRQTpKZI+ImiSFGR57GlY?=
 =?us-ascii?Q?RVAV9MUcpZ50OmQzfPwAgOEqet50y7NdQEqP6PSqQcNKBgYuholzQQsFX50O?=
 =?us-ascii?Q?/bJ6PZq3q/GnQM3/EeP409wea/gvPux31/mh9lQ7u/ReaFDEnYRHkdie/Xqd?=
 =?us-ascii?Q?esrooa8NDaoXIej5QJvT5gZ+rL4xYNvQAcAmldvkHk909J6YLlmi5Qm8X+bi?=
 =?us-ascii?Q?gpoPytJNSH5Ws2oIZ8TaEq2RRvz4Rjg/VunRl5LWiClzNbTd2WfBG0LZu6Vi?=
 =?us-ascii?Q?NrR9N0aCOrHggpf8pUMmGKyVTeEz0Fin4R8bicxjrUXRQvemxiFclsRb19oX?=
 =?us-ascii?Q?mNuR0exhK7tEbJbeuvBYhyQBzc1bB7COVorvX7svVJ5ZkNfYE5BKLSqhQX3x?=
 =?us-ascii?Q?iKwSmrB1nCkPLAUXdfU+0fVK9g4r4DDYGgJ0dwwfXfq9xg5+ia+AwfxgKIL0?=
 =?us-ascii?Q?oCZsyiFbVPmewOU+XZDh9dIFvS4jAwQFXVSwuSBqUyIcmEc6qg25eWqpTTPT?=
 =?us-ascii?Q?wMaEZv91tcIhAHe+4Ht6aUEt181VHQ48vK2P/Mxy7jAsBOaUtOXet80Z/9T6?=
 =?us-ascii?Q?r8qKJB6BAX6C0M+8ta6Ko6jrw/sCZrCQk23E3u/ulbf85kPlUe1FsPyQhx/E?=
 =?us-ascii?Q?5NpAtKU3EyP2PEtUcjJGUQAqR9VxfR+MOSaQ3EDepDuAe4dpsUcfgZ5VOFFQ?=
 =?us-ascii?Q?tt+ciHKFxH3jltHT+HiCJAO+y5pzJxlcbfvnxrow+e+OIx+Xxg2ZCAOweEuK?=
 =?us-ascii?Q?0rLgHSWtgnhEnHeYVS9nPzt3k3rBYtnsENXntkW3oJcuk9dlrd1USSqhAxkq?=
 =?us-ascii?Q?zHW1lpojjtC0+upTPyTRmPEcwFgJbn884Pn4Mx7JJIgrK93hzuzcxnK+Ifin?=
 =?us-ascii?Q?n9Ehxcrr0VlPl087aaw6OQYyUvuX0z6pXnQXJfzkh4xUQNKNbwyq82fBL2tf?=
 =?us-ascii?Q?XMkW6lI3Fo1Bv0LirA6JnqkKGbDp/njnZmL+lYwwOiIuWzkbIkR9KhpL28Ih?=
 =?us-ascii?Q?Jy5THy3aI09U3Qkgx+BsB+91LziDpXoE6ULNGZT6QpE6/G2fx1sEKiAAcRiM?=
 =?us-ascii?Q?O2lvzIJ0tp/hEsRydivxJDo7VDIvhv7oqcFiBhGWDbk7M/HMogWm2J5rWaBN?=
 =?us-ascii?Q?t8rS6dT/jCq4aaVKm6PtmP1bN58B36Jv3xYOLvqSMD/x4v7c1ddjaWN66BEs?=
 =?us-ascii?Q?jNvWS877l+a7h0xWk5vZoWxG2pTd+5nUGsT+sOVPMYOy6k8qiRhBdfVq6cU2?=
 =?us-ascii?Q?4eyu9LqekATsp9Iokjj2paCoSh9CNx2/fS7AW92q/Q+bteZPBi4IC96vK6SK?=
 =?us-ascii?Q?vz95KYYW+82Md1hHuAypRm3Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d751a8fb-d9e8-4653-0711-08d909f7ad9f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 03:42:42.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVVnq6ppkgXHBMbrCUeyFrlZWDmtWPdFfwaNBYFAIrQMLuj9lqcmdMqrOub/Ih1OWTSTLlXaSJbBRfQ7nXH0ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3052
X-Groupsio-MsgNum: 151050
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RVdPIw2zJrZr5ymz"
Content-Disposition: inline

--RVdPIw2zJrZr5ymz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 12:09:51PM -0400, Randy MacLeod wrote:
> Cross-posting to yocto since this is of general interest.
>=20
> On 2021-04-23 2:02 p.m., Alexander Kanavin wrote:
> > This puts them on equal terms with x11 distro feature
> > (which I think is due).
> >=20
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   meta/conf/distro/include/default-distrovars.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc
> > index 9fcc10f83a..384ee7fc98 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?=3D "0"
> >   LOCALE_UTF8_IS_DEFAULT ?=3D "1"
> >   LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D "0"
> > -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2=
 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3=
g nfc x11 vfat"
> > +DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2=
 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3=
g nfc x11 vfat wayland opengl"
> >   DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
> >   IMAGE_FEATURES ?=3D ""
> >=20
>=20
> We (Wind River) already drop the x11 DF from some of our distros and
> we'd likely do the same for wayland and opengl so while this seems
> like the wrong change for headless systems it is one we could deal with.
>=20
> There was some discussion about this topic on the tech call today and
> people were concerned about BSP support for opengl since the software
> rendering in mesa is horridly slow.
>=20
> Kevin, Bryan,
> Can you comment if you think we'd have any show-stopper problems
> with opengl support for BSPs?

Thanks for the notice. Hmm, it seems that we have done little validation
for the weston image on the Yocto BSPs, I got a boot failure with the
weston image on my beaglebone black board. I will try to figure out what i=
s
wrong there. But I don't think it should block the change in this patch.

Thanks,
Kevin

>=20
> Joshua said that weston has a usable RDP (remote desktop backend) but
> I'm not sure how usable it is especially for single application sharing.
> This contrasts with x11 where you can use X11 forwarding over
> ssh trivially for whole desktops or an application.
>=20
> In conclusion, I see the value in pushing yocto forward but we may need
> to wait for agreement from BSP folks so let's see what they say.
>=20
> ../Randy
>=20
>=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux

--RVdPIw2zJrZr5ymz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmCI2aEACgkQk1jtMN6u
sXEItgf+N4XVaE+7PK6tNBFkwU6ZIEVbqw92trANHi/WK1Y/Q8Wn9tUCmU8g1cWZ
Uwnj3FSI7sFu+TUlvrbZ3S6wxf1fFAHDBJUCfbYA0dUd7ODkxzrkjBXD4RVaOVQ3
gd188LIPBuqYbJ8Iv4x6e8a2k65dPGoy8UW2FFDHok/pGuAD0FPMrFpmWYd/JB/7
K0Ti2sn60BzqF7JqEwxOpKDvgvJyp7Cu1K0z29nsGIkK3R+NPc6Zw20XnZTsb3X/
DFpqzmN/4GgNs7w06D5XJyMrnfI/XU9NXoWshSm7X+IVpkfM/A5zOzszyBthoNXd
xTo/OdXoYTLDDo9pnHXNK5QdDwjgEQ==
=xw7i
-----END PGP SIGNATURE-----

--RVdPIw2zJrZr5ymz--
