Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.67])
 by mx.groups.io with SMTP id smtpd.web11.6212.1589010356833266152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 00:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=mxVYdbff;
 spf=pass (domain: outlook.com, ip: 40.92.70.67, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrH6WfO+E3FXBzUOXPNNFQl6VWTUPfCSjrqHzQdFUodCDjObeGYZ/aUA3s53IHoyHFOsHLNuxGbPEVQru1lyyxbWXscpbaflQuAZlTU9P6ky7RSwgCiCuSBSVine+++omKi15OVr1NIhdYjQ6CQuLXgTbRlexvz7/WS6f0/cXjYtR9j8OJCXPkLxvsHAM6feX70ew23s6ywx5zLWsZ2Q61LjuBhJppRQ4M/cYHIHXqxO6xUIgckehM9eRcDgweBHxbr98TICaUFUiAVJvrJFdEVvwUzdGUYqeKJZLxN7PsV6rEPNraE1BUIphccgI8kZEDos6LIL2Gs+gzCKn8VbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L60d4tCnx4R+rVXSTBOI8uow+/MWQTPuEnQFgxBYAsQ=;
 b=Q9ntn6QfQ4bd+D5gZp4tRePpLgXYO/ydV1cTeQfHWSwd30Ja6IEEQovxjsnTPc+s4qLyO8tqgzaB5p1z5ZbPdOfevvoZnmOolTa3YbrrDvVsY/TJjTJy09N9BI2uZMldL7N29lg+fx8738nLUPd6EpbvdZTqTKrUGOKZgpV8JeHRId9VWDgOyTIx0T3+bQ1CAIOkWBywS7i+0Fv+c5s2YWBaMTSVvs73CmFp9qzC3X03U34P4KI0YGTOxiEIAMH8Op5GVswW+UskpU3hlvJAFlzfX1RWSh2KctfKVmnS0XllRStztYFSJs9Kf4pCm6ouP5ZxZBhAwTxOWwdFIQYTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L60d4tCnx4R+rVXSTBOI8uow+/MWQTPuEnQFgxBYAsQ=;
 b=mxVYdbffUMZ4HY70MeuXPp2+qJ5moACodONWWR4+Jy531xoGwRQYfxdNVpT02yAGeI/B0Zbo87nhL6fG953NFzR4LMbUuOinkRDTtOWeKIxxtNi01mm4+WhOMZ+UeC8qeJpm0Jyn0+AQm8w673hDmGsOh5FANH3OgpGvKXKP2aIToFH935bnCUXopemyC862SA0jcIyGkqrz0M3h9Nzw3n4gqQ1oQs2wiHVNN7ES8ReGhnjW8P3la6Ig9Lp1zgLFHPEcVKoDkEZUunOC3+NV15Mxo1767OdP20G49+o7qI1Id2YG5on7todbt+072A0q0TFR/Lp0L5ZgfWfKhpuF6Q==
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e09::4d) by
 VE1EUR03HT123.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e09::485)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sat, 9 May
 2020 07:45:54 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e09::49) by VE1EUR03FT024.mail.protection.outlook.com
 (2a01:111:e400:7e09::87) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 07:45:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:4125B8799BB63421633BC85340A10F242C9B9C033EC75115A85198219213CAB8;UpperCasedChecksum:48048E54A5A87D00C3554BBF2A8BD656257BEBD359ED495D4F6F850D80B3945C;SizeAsReceived:9156;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 07:45:54 +0000
Subject: Re: [OE-core] [PATCH] pypi.bbclass: mind package suffix on version check
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Tim Orling <ticotimo@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com>
 <PR3PR05MB6890A8531A904349FDA2EDD5A8A30@PR3PR05MB6890.eurprd05.prod.outlook.com>
 <CANNYZj9=6NLFgbPhVDWdCL1uKmEGLcF25uq17-mOkByq6VJVhA@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM7PR05MB6881D5974DC228C3A78A0F2BA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sat, 9 May 2020 09:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CANNYZj9=6NLFgbPhVDWdCL1uKmEGLcF25uq17-mOkByq6VJVhA@mail.gmail.com>
X-ClientProxiedBy: AM5PR0602CA0021.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::31) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <a30b89e5-2f1f-17b0-96d6-c4221ac109d8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (79.215.15.16) by AM5PR0602CA0021.eurprd06.prod.outlook.com (2603:10a6:203:a3::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 07:45:52 +0000
X-Microsoft-Original-Message-ID: <a30b89e5-2f1f-17b0-96d6-c4221ac109d8@outlook.com>
X-TMN: [BINDfKoXODTNzpE6nI/knT5LQlNiV+Ab]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 820397b4-7522-4846-9b7c-08d7f3ed0016
X-MS-TrafficTypeDiagnostic: VE1EUR03HT123:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aFz/76gLpwL4dMt43UshOQp7YVwVjmRPKOA7u7MbXzLBHrIidTf3R1r+18qRd/7mm1iEZtKPLM6nsMdi+jeR1pO9mqw9gb0BtIm4fZ3Zy/Vil7GKVplwRUevOjX7icRo9jqpnvSdoiapkkYYmgPen5a2mtYLzYLEaPKKaeE97wftuMb72FjBjcMBtG4NLDm331T3yP4ZJjFLSuwtJJu3jVVwetKeLEsGYWxOjGiNfnKlxYHHgd4mcYkwEjDJWYMe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	soaXDMbLO6qKqGgQxFPB7ZuSnmoBFd43Hs1AeE+G7KWsV2S5ZgKbhCB2QO1MonRENlGWPJYqKg9X9dchu1oTT9RdxhZ6OfS4zSNSIEFUxK0HoRhwaat6nMrdjkAFe/EO+adNocHWHQrZkXY75Q21fw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820397b4-7522-4846-9b7c-08d7f3ed0016
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 07:45:54.0460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT123
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Well, I faced that at least on the following packages

- flake8 (current stable 3.7.9, existing alphas 3.8.0a1, 3.8.0a2)
- markupsafe (current stable 1.1.1, existing alphas 2.0.0a1)


On 09.05.20 09:38, Alexander Kanavin wrote:
> Can you give specific examples please? I think we can probably add \.tar=
=
=20
> to the end of the existing regex, which will ensure there are no=20
> unwanted suffixes. This is already done in plenty of recipes for the=20
> same reason.
>=20
> Alex
>=20
> On Sat, 9 May 2020 at 08:55, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     Fully support that, it's same for me.
>     But then the regex is also not a 100% correct, as it will issue a
>     notification via "devtool check-upgrade-status", even for an alpha o=
r
>     beta or dev release - and most important without the suffix, so it's
>     extra hard to identify if one should take action or not.
>=20
>     And even when using the "devtool upgrade" patch it will run a build
>     attempt, which will immediately fail, as the reported version is
>     present, due to the suffix being trimmed during the process.
>=20
>     What I could imagine is to ignore those releases by default using an
>     inverted group like (?P<pver>(\d+[\.\-_]*)+(?![a-z0-9]+)*) to filter
>     out
>     those kind of releases.
>=20
>     What do you think?
>=20
>     On 09.05.20 06:56, Tim Orling wrote:
>      > We should only be updating to releases, not dev or alpha or any
>     other
>      > non-released state. That is why the regex is they way it is.
>      >
>      > On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann
>     <kweihmann@outlook.com <mailto:kweihmann@outlook.com>
>      > <mailto:kweihmann@outlook.com <mailto:kweihmann@outlook.com>>> wr=
ote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0Some pypi packages do have suffixes like dev, =
or a0 or b1.
>      >=C2=A0 =C2=A0 =C2=A0When doing a version check on these, the versi=
on will get falsely
>      >=C2=A0 =C2=A0 =C2=A0trimmed down to a version without the suffix.
>      >
>      >=C2=A0 =C2=A0 =C2=A0E.g. 3.8.0a1 will become 3.8.0 which then also=
 means that
>      >=C2=A0 =C2=A0 =C2=A0a version upgrade from 3.8.0a1 to 3.8.0a2 will=
 not be detected.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Fix that by inserting an optional suffix group=
 with alphanumeric
>      >=C2=A0 =C2=A0 =C2=A0charset.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Signed-off-by: Konrad Weihmann <kweihmann@outl=
ook.com
>     <mailto:kweihmann@outlook.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:kweihmann@outlook.com <mailto:kweihman=
n@outlook.com>>>
>      >=C2=A0 =C2=A0 =C2=A0---
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/pypi.bbclass | 2 +-
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+), 1 delet=
ion(-)
>      >
>      >=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/pypi.bbclass
>     b/meta/classes/pypi.bbclass
>      >=C2=A0 =C2=A0 =C2=A0index e5d7ab3ce1..7d0f367a02 100644
>      >=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/pypi.bbclass
>      >=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/pypi.bbclass
>      >=C2=A0 =C2=A0 =C2=A0@@ -23,4 +23,4 @@ SRC_URI +=3D "${PYPI_SRC_URI=
}"
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}=
"
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0UPSTREAM_CHECK_URI ?=3D
>      >=C2=A0 =C2=A0 =C2=A0"https://pypi.python.org/pypi/${PYPI_PACKAGE}/
>     <https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/>
>      >=C2=A0 =C2=A0 =C2=A0<https://pypi.python.org/pypi/$%7BPYPI_PACKAGE=
%7D/>"
>      >=C2=A0 =C2=A0 =C2=A0-UPSTREAM_CHECK_REGEX ?=3D
>     "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
>      >=C2=A0 =C2=A0 =C2=A0+UPSTREAM_CHECK_REGEX ?=3D
>      >=C2=A0 =C2=A0 =C2=A0"/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+[a-z0=
-9]*)"
>      >=C2=A0 =C2=A0 =C2=A0--
>      >=C2=A0 =C2=A0 =C2=A02.20.1
>      >
>      >
>      >
>    =20
>=20
