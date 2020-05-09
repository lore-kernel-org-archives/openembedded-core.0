Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.72])
 by mx.groups.io with SMTP id smtpd.web10.7261.1589020963612519313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 03:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=BnWglXlk;
 spf=pass (domain: outlook.com, ip: 40.92.91.72, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9BUdvTRzKOfqJ4u2tl1R5V3qupoLzMdvltY037P3228FKuEuqOQglrub3pZ2SPZTL0+COnYxG3GBkEDy8+3qboirufInhK/mFhTtx9R/Z6mXEocFTxyDY8kZGNyRlwcEf979GyeVAvAYjMV8bppjYMPn1yRM8f/1gnskubnk4xVNl1nIR4v0bucHjJgQ7TCPYSysuYyquOqQ1z0JKt6b7edmM5NCF7S0PJnL2gopX5iXDwTYU0nnd82THi8FicOg09bbh6s+F2HFbmbJagyuHpSGqnY3Wo4sbW3kJCdFm8ICul4hGw7r5qtiKkhCty792bbzQRtaVa99zhQfh011A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XAb6I5OS9BmFAtQvpV1MfHEFrnX+9Vo2BReRBNodeY=;
 b=gF+c8vMXm0Jox1RvFUrUFy9ZHVar8NMCm9JkYMnFjcslHM35ABAhwTxEYFHPuku32SemzvmWFYWzemwEIWJh6U0UIij3Cus8c2Fr4xueCQI91n7QdmNoc8QX1gPDe3ud8oGw7yuku6/nXhbLXtjHsfnPdgXoLOfBQYPq+om1BTc71MCpsQfH5dZM5/OY8Iall8gKhs3yqt9NtyU0ZnwzrjuZp+/TrlqgNDMc5wNmGK3Nzya5zIY8PAr6rpHoVc75ZaLqxI2wrWu4DCsrJktBUavTDZ+6/Fc9j167kd86Ymrnn/E3ckuXrLYSvsfuqUVqXcP0RbXEpbENefVsC4NCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XAb6I5OS9BmFAtQvpV1MfHEFrnX+9Vo2BReRBNodeY=;
 b=BnWglXlkfktqe4IXYXdwduPd2lHRzwVeIgkmnCcVbQiQ0/6xhOl3mEMiyCu994NdSiddlLdqW8q2e+nBcFptg459vHGVHrRTF10LNyv2o3+M23sbdMANtWdEYeuaZTQTlE5xkM9lhRHgXwTH5W00Oz38LpVCMmAhqwpEUgR74EcqP+JRJJMXUP8mW8oJv9/kW7CLzOYz9uAzFWmOLjcy5AoJ1DJPDAUNNbQm2pA+5NZenIivapKNfWucHVPVGKV44MPOj9jyixZZ/jEzV3kT9XF9TcdH5knRaW8FWommoFo1RHHJlL2UA0tOmm7GJag812VipVFmgD2boLYsXEHgPQ==
Received: from VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::53) by
 VI1EUR05HT051.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::165)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sat, 9 May
 2020 10:42:41 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::53) by VI1EUR05FT013.mail.protection.outlook.com
 (2a01:111:e400:fc12::203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 10:42:41 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2DF0BDC52FCA6D72D249923030E02A01E9FEE43E583E96D204F7494CE8F2CCDE;UpperCasedChecksum:4E35CABCB553173AEF8FD136984C68A0927D0981CC0F0E509AD1E4D828DC93AB;SizeAsReceived:9304;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 10:42:40 +0000
Subject: Re: [OE-core] [PATCH] pypi.bbclass: mind package suffix on version check
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Tim Orling <ticotimo@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com>
 <PR3PR05MB6890A8531A904349FDA2EDD5A8A30@PR3PR05MB6890.eurprd05.prod.outlook.com>
 <CANNYZj9=6NLFgbPhVDWdCL1uKmEGLcF25uq17-mOkByq6VJVhA@mail.gmail.com>
 <AM7PR05MB6881D5974DC228C3A78A0F2BA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANNYZj-Gs0xH49tttypiJQMhz=OVf0Fd7mRBkP800vk9URWt9g@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM7PR05MB68819DF78B8E8CF16A936C80A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sat, 9 May 2020 12:42:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CANNYZj-Gs0xH49tttypiJQMhz=OVf0Fd7mRBkP800vk9URWt9g@mail.gmail.com>
X-ClientProxiedBy: AM6P194CA0082.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::23) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <acd30500-59ac-cfe6-e7e4-99e6ae2f94e9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (79.215.15.16) by AM6P194CA0082.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Sat, 9 May 2020 10:42:40 +0000
X-Microsoft-Original-Message-ID: <acd30500-59ac-cfe6-e7e4-99e6ae2f94e9@outlook.com>
X-TMN: [hFgmIZiTuAzo2uBGggO3ng4sJy/wTKnq]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6f756390-50a9-4bc1-903f-08d7f405b290
X-MS-TrafficTypeDiagnostic: VI1EUR05HT051:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kIcgo8JBy5N8gQEqrlYO/pl+cmOJ93R3YG1mNL03gu+YKwV9Sex7OfjQL2pKcFNfVrA5UI6xRo7cjUfX5hybUkF7AtisMwB6xDmvPAH+JtqPZkpo8y3yYcUyAAfcdz2v7/HdWfm2iWKBzvIS2iUxZzW51U8Mkm0Ct+/EmCy94qs0naW20x3WHklRjYkMXGhbMqPVrvu8l06uUalW+T4cUAb90n94lCMrQE7czFpY7MOoUzSz9n+eJTEcwcZe3Md4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	2QC7FjOHWd/s3InQ/r4PQ6h8e3IqtU89W3zOdM3tXYTq2QGVLgYZJl4zv5Qf7Wg9en6l54SPkQS7rQnmJA40rTLxyf+8XBMLwvJD8eVawkxU+8ED1kqgzE04QsEiuK9WX3bGhVksjUVOx7Mr5qMwGQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f756390-50a9-4bc1-903f-08d7f405b290
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 10:42:40.7790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT051
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Yep, a trailing slash should be enough. Will create a new patch - thanks=20
all for the input

On 09.05.20 10:03, Alexander Kanavin wrote:
> Then maybe appending a / to the regex will do?
>=20
> Alex
>=20
> On Sat, 9 May 2020 at 09:45, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     Well, I faced that at least on the following packages
>=20
>     - flake8 (current stable 3.7.9, existing alphas 3.8.0a1, 3.8.0a2)
>     - markupsafe (current stable 1.1.1, existing alphas 2.0.0a1)
>=20
>=20
>     On 09.05.20 09:38, Alexander Kanavin wrote:
>      > Can you give specific examples please? I think we can probably
>     add \.tar
>      > to the end of the existing regex, which will ensure there are no
>      > unwanted suffixes. This is already done in plenty of recipes for =
the
>      > same reason.
>      >
>      > Alex
>      >
>      > On Sat, 9 May 2020 at 08:55, Konrad Weihmann
>     <kweihmann@outlook.com <mailto:kweihmann@outlook.com>
>      > <mailto:kweihmann@outlook.com <mailto:kweihmann@outlook.com>>> wr=
ote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0Fully support that, it's same for me.
>      >=C2=A0 =C2=A0 =C2=A0But then the regex is also not a 100% correct,=
 as it will issue a
>      >=C2=A0 =C2=A0 =C2=A0notification via "devtool check-upgrade-status=
", even for an
>     alpha or
>      >=C2=A0 =C2=A0 =C2=A0beta or dev release - and most important witho=
ut the suffix,
>     so it's
>      >=C2=A0 =C2=A0 =C2=A0extra hard to identify if one should take acti=
on or not.
>      >
>      >=C2=A0 =C2=A0 =C2=A0And even when using the "devtool upgrade" patc=
h it will run a
>     build
>      >=C2=A0 =C2=A0 =C2=A0attempt, which will immediately fail, as the r=
eported version is
>      >=C2=A0 =C2=A0 =C2=A0present, due to the suffix being trimmed durin=
g the process.
>      >
>      >=C2=A0 =C2=A0 =C2=A0What I could imagine is to ignore those releas=
es by default
>     using an
>      >=C2=A0 =C2=A0 =C2=A0inverted group like (?P<pver>(\d+[\.\-_]*)+(?!=
[a-z0-9]+)*) to
>     filter
>      >=C2=A0 =C2=A0 =C2=A0out
>      >=C2=A0 =C2=A0 =C2=A0those kind of releases.
>      >
>      >=C2=A0 =C2=A0 =C2=A0What do you think?
>      >
>      >=C2=A0 =C2=A0 =C2=A0On 09.05.20 06:56, Tim Orling wrote:
>      >=C2=A0 =C2=A0 =C2=A0 > We should only be updating to releases, not=
 dev or alpha
>     or any
>      >=C2=A0 =C2=A0 =C2=A0other
>      >=C2=A0 =C2=A0 =C2=A0 > non-released state. That is why the regex i=
s they way it is.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > On Fri, May 8, 2020 at 4:37 AM Konrad Weihm=
ann
>      >=C2=A0 =C2=A0 =C2=A0<kweihmann@outlook.com <mailto:kweihmann@outlo=
ok.com>
>     <mailto:kweihmann@outlook.com <mailto:kweihmann@outlook.com>>
>      >=C2=A0 =C2=A0 =C2=A0 > <mailto:kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com> <mailto:kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>>> wrote:
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Some pypi packages do ha=
ve suffixes like dev, or a0 or b1.
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0When doing a version che=
ck on these, the version will
>     get falsely
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0trimmed down to a versio=
n without the suffix.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0E.g. 3.8.0a1 will become=
 3.8.0 which then also means that
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0a version upgrade from 3=
.8.0a1 to 3.8.0a2 will not be
>     detected.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Fix that by inserting an=
 optional suffix group with
>     alphanumeric
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0charset.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Signed-off-by: Konrad We=
ihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:kweihmann@outlook.com <mailto:kweihman=
n@outlook.com>>
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0<mailto:kweihmann@outloo=
k.com
>     <mailto:kweihmann@outlook.com> <mailto:kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>>>
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0---
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/pypi=
.bbclass | 2 +-
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1=
 insertion(+), 1 deletion(-)
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classe=
s/pypi.bbclass
>      >=C2=A0 =C2=A0 =C2=A0b/meta/classes/pypi.bbclass
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0index e5d7ab3ce1..7d0f36=
7a02 100644
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/pypi.=
bbclass
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/pypi.=
bbclass
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0@@ -23,4 +23,4 @@ SRC_UR=
I +=3D "${PYPI_SRC_URI}"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0S =3D "${WORKDIR}=
/${PYPI_PACKAGE}-${PV}"
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0UPSTREAM_CHECK_UR=
I ?=3D
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0"https://pypi.python.org=
/pypi/${PYPI_PACKAGE}/
>     <https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/>
>      >=C2=A0 =C2=A0 =C2=A0<https://pypi.python.org/pypi/$%7BPYPI_PACKAGE=
%7D/>
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0<https://pypi.python.org=
/pypi/$%7BPYPI_PACKAGE%7D/>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0-UPSTREAM_CHECK_REGEX ?=
=3D
>      >=C2=A0 =C2=A0 =C2=A0"/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0+UPSTREAM_CHECK_REGEX ?=
=3D
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0"/${PYPI_PACKAGE}/(?P<pv=
er>(\d+[\.\-_]*)+[a-z0-9]*)"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0--
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A02.20.1
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0
>      >
>=20
