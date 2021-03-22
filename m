Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.55])
 by mx.groups.io with SMTP id smtpd.web08.9968.1616402914348034500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 01:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=avIpeM+T;
 spf=pass (domain: windriver.com, ip: 40.107.70.55, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9Ar3KvfYRGSGgB5eoYu4tVgtG6xdffFTzQCDWF8BGTXSZBn6zRF2sLnP/21MAhuFlTJR1yLJCKKSOVRp26PjfUPn13uMJlo6cPJ47MGoH5cxN0Iijaypb1lVYwUhpw+GwiL6tNWwdA0oR1v9TlKdsYt9VaotO5iqHb9PD0zids8ZOVYY1Koelo645RN3Ym5UVybXNE5FdJcJq0Sp2ehimH9HHn9Vk3WjF4s8bFAfgAcI8sW5J7tE8KLzPuu2amGsWwl6H4E7EeZsP5Io3zsaMtdwxhKSwXemerqWHAmOoyaVhRtQmXuXj36rNP4QWyNNR2osAlrEoWCuWtZA/TVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zKEedvvCF7qumPPaqE+0eqBp4pV0by/nh8Bv3qFXsc=;
 b=JtUk6BoviPWo+ol95xn0zWCBG8XDwXci8oHlhgS7H6by7XgN8Z0DkVrEVkcMoRVAmE4jPmZCqyPm83lVqCsnjKAuzSEjgTGzrAxKMdRspXcZo+tSWiyMOpN2lzF+qfxAzFz3logGdJ38Eq7zni7YC0KgI9r5eRuLSuRWuVWFfiaST+0sXYpinr7o4kSVxjslywY0Bh9xXZk9pzcQ6qWLJDcLU78OFS+hfgZ7g6pHSpeixYlUPWGhK8mBLqQ0MNldOhkBKhu+LyRciixXOzc8f7Hn4VwQ2z86Sf7yNpO743/Hu9cPO4qsg8+zf7St4KXvlq7E/rPTFyIjzRySIvWkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zKEedvvCF7qumPPaqE+0eqBp4pV0by/nh8Bv3qFXsc=;
 b=avIpeM+TS5YIyfcJHwXolNjAomEwcFlA3FXYyKTBDuOziiRiqu40rF/pCFM9a1bcXIDcVX5/OlhL5r2+lLdyRaLQBE5kStl2YPAsDdZVYURG0SRMrxwAHSwjb0Zo8TPVvaMRgdtR/IDB6AQKDc8PnhtbGgjavMuDXYShoewTflM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Mon, 22 Mar
 2021 08:48:32 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 08:48:32 +0000
Subject: Re: [OE-core] [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <166D65C2E097270E.28077@lists.openembedded.org>
 <20210322075103.9694-1-mingli.yu@windriver.com>
 <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <05115d73-f33c-878d-0774-2d33c12746ce@windriver.com>
Date: Mon, 22 Mar 2021 16:47:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK0PR01CA0052.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 08:48:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03df2ab6-adab-4c2a-7204-08d8ed0f45b6
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4602FAE6906E1862ABD6AA7EF1659@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SkIEnCaeqLsfEtB0PjMi7rkZhjrXz/tVPaXLmiPXhnCzdSF//OTum2iQRDzCxqaqdMOJdY1A2acqdIfIUt+oe/mdJUQlbqdf1+zhixqBC76e0n6/OE77JTN4scXqFcZ4RaIaMCQR99dEbguSBwslripqMKJ1VjfFHYwMv3l5cL0tvfh2QSam4TNPspFyaGUdTpM0r1Z711KbrKhmT0EDVzjfXUjDLuqATceNMk7UdSN/ae0fkWRTOlGfRz8PHOG5oYyorz4cRXFbxbR7269tIVeFHIs4ETqZdK1bsC0quVexlUWPJDwqDQMUMiZ4dllnaAj3PPGGfmilnMWl04eVeXJsqU/te2ZrJ/53uSDy6tz+t91oY4TqNOJqUltFb+DD58LcNP3RMb/eQsUySDDw9Ww5WKSI2ZShBGE0NiLSwmbDIzsv357+b9E1FAGyseSuAzUsisghMSddou5kFHG5cnICnIOARl52/Hi9Yk0ZKVmMBNNoT1zWGVMldHflYhWNekR3dyumqFo1EbUAMF7OrbuRDnoX8Jr1wQCixCjCECUxTr+GdiwYeSn/zhkr/YgBzxv6t8GYkXNmMP1rv1s6oUX3PewYH+1CFuQeKql7huCvXLxkFRb4c27oeM33M1A1J0mkJk5hZUfjRbFJrf4X4m/03y3OL2CtO9qmNO/0maVBGDlvEufesIoG6M2JbZ8TZFY+PI9Nx68yzTIiHqB9VjJmG4pAdxm5UQXUF2h3v8RIkqvr0vCWQv+hRQeu4JIJSI6LKKovbelzN+pQZyRm6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(66946007)(956004)(16526019)(316002)(6706004)(966005)(8676002)(16576012)(6916009)(478600001)(8936002)(186003)(26005)(2616005)(66556008)(66476007)(83380400001)(6666004)(86362001)(31686004)(5660300002)(31696002)(38100700001)(53546011)(52116002)(2906002)(36756003)(4326008)(6486002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Dh0XXw2+Sb24Mb3jclNScKgs3m7vKIptgB4NfwAt8HGBJprhBw/2XNi34tsg?=
 =?us-ascii?Q?5Ly0O7HIgOZRXzvQIO4LCcyL9amq0GOX307ujitawlts2Qw6CM9mJwG+NTzj?=
 =?us-ascii?Q?0qa018ciNBA2WpBR65xMyW4CffmvdCjfzzH4otfw7ONk5HAWMgRdReAjx/YR?=
 =?us-ascii?Q?DkGzjKKVIFxr7lWiPrUhCRza1YWi5adgQz6mDqhAWtCEEPxKiMbOzhM+Mzwz?=
 =?us-ascii?Q?Qh244YPgYYs0o52Hz7DRcjQeK9BpbddigaPGyPoeTKB83i3hTZbp/xO+n+ff?=
 =?us-ascii?Q?6pT4YyI7HB771W97C0b41Cgg2PEvL4qvFOxXRfoKB13fybnk1hhWWsGFEaOs?=
 =?us-ascii?Q?w+2gyu6fp5vdwBmjSPhNFPrxcr7hhfzKECQTNLje6mwxy8pqXpttSxhxd5+B?=
 =?us-ascii?Q?7gPw894LiWIWqoxJfnEQnbXGYyp2ceS06gajMOvOGRNnwNzLw4lhVG8oJqcj?=
 =?us-ascii?Q?w9PnSgSOwtwe8NQJp+U330tjN8/Yy98XP9ePa8ytS58Tj5aP4s84gV9v2NYT?=
 =?us-ascii?Q?P6cb05slNkXbQu5MP7HSNywOAij0x2cVIm3lv8qD5RYn5wVAElM5TjWqDRlH?=
 =?us-ascii?Q?HrutYpvDWvsxIXWYyLKRfyMYH1mkPtZXyV7F1bO74BqTVoge1ef1qwcaC0JW?=
 =?us-ascii?Q?7DSS53ny2TCdVbFHvRBr2MovP1OAb1HYa4+i9ElOJLIT9XQTeHdg+WicnVfh?=
 =?us-ascii?Q?SdNea1maxe8WqhCXc4Rh8ErcxSSItmezvKmiN0z7rE33yECliS45pPpUIBXr?=
 =?us-ascii?Q?UxlPyToNpgSctTk3gN1Ou1ZUHmJxzbAGSsMbuz0/bqBm6kfTVseZTCelTsCm?=
 =?us-ascii?Q?ywKXS6MxQTvAEE27kNjD16B2l3rUZygEbIqW+TRl+MRJoyHjhMmui7hESulS?=
 =?us-ascii?Q?44dTuKIYWk6Fivi8SU5ihP5jfkZ7stvv8GATJ5e4K8LOCDgjAI9LA3i0PyhR?=
 =?us-ascii?Q?ACo8hHlxhX4LaRGuwD0PoiQsIQaCy2AYP+bKPxfrpf5HhFyhdFNy/19yAFxn?=
 =?us-ascii?Q?QlBhVG0LpKQMbiAD1HWxHwsRzeZIc4J97JBvZIRBlGkRfqDy+BEf/uZYn4Yx?=
 =?us-ascii?Q?zNt6g+BqqHuiO2D7R+fk2rt4LfrMHozQ/BUNOLLyF4QuF2TOWleHwsYWsiVP?=
 =?us-ascii?Q?gVQXeAJEsXqlhRGuxFbixsX12U52spSROxAE/iZfoCaeT+e3ovbIFt/l6u8c?=
 =?us-ascii?Q?5M1xKZMc235R9xK9xp/s0AJlHLvg7pZcK+lZybveRa8dtbdIVI0D0AO8V517?=
 =?us-ascii?Q?NIwaJ9BQ69wl2P6yUCiWOnALZdBMCfm+Z3nt8868DCS3Cs9b2T1SJVvdDw5I?=
 =?us-ascii?Q?Z2hOwkM/NQV3C+y8aQwzS7j1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03df2ab6-adab-4c2a-7204-08d8ed0f45b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:48:32.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKP08BuFm3J1AeJZ7fbAkMWSppUCPZor7sst5jrfJZfsNzr+LOF7jBYq80FzVliidRtUOgpufxuV5q7SVoODEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/22/21 4:29 PM, Alexander Kanavin wrote:
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> Note that this m4 file is copied verbatim from upstream gettext, and=20
> will be again overwritten on next gettext upgrade. You should figure out=
=
=20
> what=E2=80=99s wrong specifically in elfutils tree, and work with elfuti=
ls=20
> upstream to resolve it.

Hi Alex,

The reason why we care out iconv.m4 is because want to keep the logic in=
=20
https://git.openembedded.org/openembedded-core/commit/?id=3D3dd269e027fda1=
73ee40d671ea47da22300fd51d=20
which oe specific.

I think there is nothing wrong for elfutils switches to use AM_GNU_GETTEXT=
.

Thanks,

>=20
> Alex
>=20
> On Mon 22. Mar 2021 at 10.51, Yu, Mingli <mingli.yu@windriver.com=20
> <mailto:mingli.yu@windriver.com>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     The below m4 macros files shipped with recipe will be removed if the
>     recipe use AM_GNU_GETTEXT.
>     gettext.m4
>     iconv.m4
>     lib-ld.m4
>     lib-link.m4
>     lib-prefix.m4
>     nls.m4 po.m4
>     progtest.m4
>=20
>     After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as=
 the
>     commit (dd52d2ab Modernize gettext infrastructure) included, so the
>     above
>     m4 macros files such as iconv.m4 is removed and it's bad as we need =
to
>     patch against iconv.m4 shipped with elfutils.
>=20
>     BTW, the logic to Disable the unnecessary check in iconv.m4 comes si=
nce
>     2015 as [1], so move the related logic to gettext-minimal which prov=
ides
>     iconv.m4 now to fix the gap.
>=20
>     [1]
>     https://git.openembedded.org/openembedded-core/commit/?id=3D3dd269e0=
27fda173ee40d671ea47da22300fd51d
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.=
m4 | 2 ++
>      =C2=A01 file changed, 2 insertions(+)
>=20
>     diff --git
>     a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
>     b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
>     index e593b7270a..e04476bb7f 100644
>     --- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m=
4
>     +++ b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m=
4
>     @@ -166,6 +166,7 @@ AC_DEFUN([AM_ICONV_LINK],
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>      =C2=A0 =C2=A0}
>      =C2=A0#endif
>     +#if 0
>      =C2=A0 =C2=A0/* Test against HP-UX 11.11 bug: No converter from EUC=
-JP to
>     UTF-8 is
>      =C2=A0 =C2=A0 =C2=A0 provided.=C2=A0 */
>      =C2=A0 =C2=A0{
>     @@ -189,6 +190,7 @@ AC_DEFUN([AM_ICONV_LINK],
>      =C2=A0 =C2=A0 =C2=A0if (cd4 !=3D (iconv_t)(-1))
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0iconv_close (cd4);
>      =C2=A0 =C2=A0}
>     +#endif
>      =C2=A0 =C2=A0return result;
>      =C2=A0]])],
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[am_cv_func_iconv_works=3D=
yes], ,
>     --=20
>     2.17.1
>=20
>=20
>    =20
>=20
