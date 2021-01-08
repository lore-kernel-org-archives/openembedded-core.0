Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.40])
 by mx.groups.io with SMTP id smtpd.web12.2897.1610074128910940646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jUEEPPhy;
 spf=pass (domain: windriver.com, ip: 40.107.220.40, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0xphc/w4ttBCcUn89flt8yHpi1eNPQWjC0xSitE+9DOaguCvVDAnlgiBCi6IWyemZVgbn+Emo9TixToySIkYjlaHwvBGCWMGw+NABgPAJSyr6X2p1Ir6ZmVUXj5Zr8Qy+1tNqAYizbRZXltZfqnDv+YhPya15CkOt2vzgTkn8Hv7AsiMYZTHNqBb9gWO+HBYgOBNCmBWoTqTXJ0PO5TnRLBUDSBohM2czFciqq+ITv0coXVwtlXWI8Xn9+QeiFwR9/JviksJt0nH50iAnUTZz+OD2/H3dkXPpWA5eU31i+XPavANuUH8DIb6pbyE9BHPCF8h8Ca+QgSuNev+n1a5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5XyelnrAKaYxdzg73v3UTsrTt7HQLiUPIMK7+qE1fE=;
 b=DJnthTgHkwwq2k+3N1EYbtWKzfLTx6KwQB2FQy1z0T6va6ATcAdA+ZTfAIBRkQbPY/72mctN2mTWKOBvHpvENLNdt68CDbvAtKizOt4wqcCGwMHSUOaxRW12QTkMkiQvZoWY1mXoXo1ZhG2PRmbaZlGBtllJZkGaKdtP+3yEmhQevzItVDQ6Wfz+TQ3iGPDlx4AT+YYJFK2OWcMf2iZeEQjOiaH8sf+BI+gyxmCAFJcmXvJ7YnzaWrwkxopCOKn+C3/8le2nvBkGhJ8kRkL1XfDBLLNy8Yi9arBoduIFobdiBvQR7BRYQrX9oXljMSh3DaefiraYw6eO42poYBpKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5XyelnrAKaYxdzg73v3UTsrTt7HQLiUPIMK7+qE1fE=;
 b=jUEEPPhyvMtMOGLMPTiV+9ROQbN9/gPRhf1nVrv/ynUvF5BxkGNUzE+36F7BzQa/K/wN211d8VCSKACPPq/Tx26O5UIzzZAtrJPwyi/I3NHMoEY4L+uH3URtCDYF7oF8EqsT4zjgFhB9mCzu61Lvsyii6lLa4l9zk5PfHHw2xV4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SA2PR11MB4970.namprd11.prod.outlook.com (20.182.119.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Fri, 8 Jan 2021 02:48:46 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 02:48:46 +0000
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
To: Joshua Watt <jpewhacker@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
 <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
 <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
 <CAJdd5GYhJPMBc3nfiAA5aBm0wZyzYUuab_gR2pRCtcGfss6row@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <c006856f-e30f-146a-434e-38cc2b77d146@windriver.com>
Date: Fri, 8 Jan 2021 18:48:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJdd5GYhJPMBc3nfiAA5aBm0wZyzYUuab_gR2pRCtcGfss6row@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:202::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 02:48:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca4cfc85-1b14-40f6-5f77-08d8b37feb27
X-MS-TrafficTypeDiagnostic: SA2PR11MB4970:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB49709B1D671B23C32236475CFFAE0@SA2PR11MB4970.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AjWSUspcUG5ObJv6Js1lrLtrQABMETZgLk+goM9h6eGsy/UktNwGXPxmVv030bL/qbWi9z1b3+cFhQ1RIGXSxQgai7Uu03anVuolKeolOOnpCCvKT+ECBZurrYo0gI9jPTWjis7OBuhcGqqxcqfwaEfsGhvAS9ymQm3xMa08qt92aNTCdZN8TE1wypnb5UszfYrGS8M2RSMsIm5yhigos0YfMQDk+lK76w47tzZQLtr+V55J0/x7+KT0bg8EqzW6f0cxWqpKFrMhB7iTl29bn/6AMXi1jGWNU+Nos5mpNT7M2VY1ZXgj/MKC9ZYVC1/A/AIOZYA4t1FkbOaaL1EAYqT+W+UzJaePv4CX4ScgNTNDlCJO6sY05XxCKC7//bkKl5Arbju7a/+Slrx66nmIci6OgxVvkob5NNZER95Q7EnDWtj1EFaj9jPPO2xTCyRUaW7slzmZIPxAZW63Ip82KxgymTRfQAFwcVtCCOc3+1l/hADUQUOSXgeG5OrSWtYCuqm2JGJltuls8rWCU+EbHWmGpdKCA1tmO7Jo3ju19K7XXdkosjp0btenhtQazBLrSvVm2ARD3HeoPQSKvH2DUg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(4326008)(66556008)(186003)(316002)(66476007)(16576012)(31686004)(83380400001)(6706004)(26005)(478600001)(54906003)(66946007)(6486002)(86362001)(36756003)(6666004)(53546011)(16526019)(2906002)(31696002)(8676002)(8936002)(2616005)(956004)(52116002)(966005)(6916009)(5660300002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?8jLLaVUelw4KacPaZoHk8aN5voV5Ssqf79WIcoseDLkz/QD/JdNWlcdtHHbg?=
 =?us-ascii?Q?flKhSYTeajVWDBhRxtmYpe0oeqmDHlSF14D0VcpbysMLNi7rTsA02dzlcO2t?=
 =?us-ascii?Q?KPpLKwedO3Ipf97PyMYe1sr1krb0Sku5adUGsSvz3RiL4OjolM1+wY3Jc/Uz?=
 =?us-ascii?Q?0HozbGHuWMgZ7pt+hmM3iPmOYnidizZAqNNiAN/hpoOg4hL970BnA2VML3Li?=
 =?us-ascii?Q?Hf6CnALUo6e+nSMGKTuWK6lyosrtBkyu//DOuCu0jTfKyz9FTraRrBjR563+?=
 =?us-ascii?Q?Weiv4vdoOr2UH3f7s337PJx6n7WsvUnlcVW0BV/PzuRc/ciDNyK9185br3kp?=
 =?us-ascii?Q?zPi7ggI6yrmeWnHZ9yDDlqjV22IVNMe14RTqdX0rXsifBdlrzoyodDkSeWgS?=
 =?us-ascii?Q?IpO63zD2vecX6DW6omr4jj+HjenTw/23S8KC4ZI4MWRK/p0oQg90GCiwpVju?=
 =?us-ascii?Q?r3fr6adF4gUE9bMo/3vK1sZwNZW5dAXCC5HqeEUSZxWLowZ3438Oi8LF2X+Z?=
 =?us-ascii?Q?AInTYfzIL+kIBoPJKBDyUuK6xJhhB3Rx8uDLp2i+7eJUKO2I8KHPX2FYfp0K?=
 =?us-ascii?Q?AtHGGMCJyEVC0qpYDy/HF6EYwWb3WCp2aFAxbMgGV0lmf1mHFxatY3HXoFao?=
 =?us-ascii?Q?ooi9OiPRRvKnWjagq4AClCan8lvTFCAEFYKrGNuscw5KHqd8dRv9qwAwxxzx?=
 =?us-ascii?Q?jCnm3zR50lUaX7GFQnuXWQnpsrlebgVjHY5rCe9IKh/vorGphpH4c6Az9Q1y?=
 =?us-ascii?Q?cAUQhxs/BMogczqHdfyyIZsB3fzOyCX6NxI56uaUEpVjitxIg2108jWyp7ay?=
 =?us-ascii?Q?0TyWRRmYegKUOhWFKT0pZ2Ukth950aRTjlcs1na+GiCuVmxSGhNBB3jbbnte?=
 =?us-ascii?Q?5WliQ3dS+Agb2Od7+l3EYKoBGAYTqtW3wEWk9jy1GoRUHAvK4RacEMxdHw6H?=
 =?us-ascii?Q?LEKxW9CoLYjQWghaywOgUVt6/LU2qJeHs3Bw1ZNeGr3tmb5Si1P2oWZExPTX?=
 =?us-ascii?Q?TQCr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 02:48:45.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4cfc85-1b14-40f6-5f77-08d8b37feb27
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd0i3vgD02+YfxgndyAX5aX73LjIjVtm6WbE7VbqY4SQ2eLODW+bejKnF72fE4gzEqXfTsy+IhGVb+qMsjrUjvxMHFTrR1U8JdOTxH2k6hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 1/8/21 12:12 AM, Joshua Watt wrote:
>=20
>=20
> On Thu, Jan 7, 2021, 5:00 AM Robert Yang <liezhi.yang@windriver.com=20
> <mailto:liezhi.yang@windriver.com>> wrote:
>=20
>     Hi RP,
>=20
>     On 1/7/21 6:40 PM, Richard Purdie wrote:
>      > On Thu, 2021-01-07 at 10:44 +0800, Robert Yang wrote:
>      >> Hi RP,
>      >>
>      >> On 1/6/21 9:56 PM, Richard Purdie wrote:
>      >>> On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:
>      >>>> Add it to buildtools-tarball so that there will be a unify ver=
sion of
>     ccache,
>      >>>> which can help avoid various compile errors.
>      >>>>
>      >>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>      >>>> ---
>      >>>>=C2=A0 =C2=A0=C2=A0meta/recipes-core/meta/buildtools-tarball.bb
>     <http://buildtools-tarball.bb> | 1 +
>      >>>>=C2=A0 =C2=A0=C2=A01 file changed, 1 insertion(+)
>      >>>>
>      >>>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
>     <http://buildtools-tarball.bb>
>     b/meta/recipes-core/meta/buildtools-tarball.bb <http://buildtools-ta=
rball.bb>
>      >>>> index 9da81d55235..2ffdd7c7253 100644
>      >>>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>     <http://buildtools-tarball.bb>
>      >>>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>     <http://buildtools-tarball.bb>
>      >>>> @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?=3D "\
>      >>>>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-rpcsvc-pro=
to \
>      >>>>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-patch \
>      >>>>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-mtools \
>      >>>> +=C2=A0 =C2=A0 nativesdk-ccache \
>      >>>>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"
>      >>>
>      >>> My view is we should not start to ship ccache with buildtools b=
y
>      >>> default. Its something that the user can install if they want/n=
eed it
>      >>
>      >>
>      >> The problem is that user installed ccache may not work with our =
recipes, for
>      >> example, we found the following recipes failed to build with cca=
che on
>     different
>      >> hosts:
>      >>
>      >> cdrtools-native
>      >> fribidi
>      >> rocksdb
>      >>
>      >>
>      >> So have a fixed version of ccache can make sure the recipes work=
 well,
>     it also
>      >> helps us to reproduce the errors easily when user reported a bug=
.
>      >
>      > I really do not want ccache in buildtools. If this is such a prob=
lem,
>      > we need to work out how to resolve the circular dependency issues=
 so
>      > ccache-native can work again.
>=20
>     There are two problems to use cache-native now:
>     * ccache-native depends on cmake-native and zstd-native which makes =
it requires
>      =C2=A0 =C2=A0more time to build, so it might be a bottleneck for th=
e build
>=20
>     * We need disable ccache-native for about 20 native recipes to resol=
ve the
>     circular dependency.
>=20
>     It seems that there isn't a good way to fix the problem, or we have =
to disable
>     ccache for native recipes, only make other recipes (cross, target an=
d nativesdk)
>     use ccache-native.
>=20
>     Host's ccache isn't reliable from the history.
>=20
>=20
> We had the same problem with icecream and solved it by building in a doc=
ker=20
> container with the version of ice cream that we wanted FWIW.
>=20
> Alternatively, I think it's possible to roll your own buildtools that ha=
s ccache?

Yes, thanks, it's a good suggestion.

// Robert

>=20
>=20
>     // Robert
>=20
>      >
>      > Cheers,
>      >
>      > Richard
>      >
>      >
>      >
>=20
>    =20
>=20
