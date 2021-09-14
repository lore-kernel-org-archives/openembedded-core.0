Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.13])
 by mx.groups.io with SMTP id smtpd.web11.11768.1631633260034918225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 08:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=WsBfQGX/;
 spf=pass (domain: outlook.com, ip: 40.92.89.13, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WijuSTiCj9yzcmk6uWZXfJaw1ahnv9XCmPcscZjrnEk6znxPRifavzsPX4jrV41WwfOYzMacF+vdQPeGfI8llvXU9Q6jDMwPt92CygZpmpb1f7PycMfvnUV93AQehuD7fxVazt8hOCAoWNHEHvl2etru5T98z35R/0ieVw8Wq7Wzou1zZOJ0QBQwedv5kTwvvLx08S5KJYPIryHOVAH8IV0DQSs6wvdPraK4Tdmkaa5EynBQ6v55KQeGbxsSnYFc7UGgTCZgdvpeAjS4kLIAnelRxBZfQKcdtIO3CNICbFmNviDE+R86Qm5YIOu4Quu+nrlKXBLfvYzN/j5hj6xOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=da3jAt3egbWft2X/k/ULs01tHnAzFLJnoQpJVRHfCo0=;
 b=YKnBzM6jHeAZl+72vxlpa1Hg32x4RzSNoXzoyrfZ6rgXgKOrZ7xf+YDPjCqGkyhS6786FaQOhhmDA5DizwMzPesH1pstz3G147GbFh8PAFKoSDMl6onLSrWHGJtgMGJfn1Mq6sxlYdK03X3verGGefMN3J/SR+F4pkF0DTdGtKr5wwJkmbYXgQuR3NlG+gnfyMu3hVC0voZx51Ttp9JfHP15mlqeVy+m2oEOvNQTd2BSxeJa6P82VXwPAucDwQaEXVULEWJaCu9MItpFDpg6gXPVPPUDKk+e9kSKBI2fdSZ4bEsd3C0nOOwDgcTYgYE2D/Nc2LLHLTltNbScEL+9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da3jAt3egbWft2X/k/ULs01tHnAzFLJnoQpJVRHfCo0=;
 b=WsBfQGX/a7Hh+a/Ysbz0ucMlIpnNrK97kyql4p0Gr4RsRRuugsQ+3SNgQPCBT0T2v/LvnsXeyJCkNhx7at6Ol1hwl5P0EXg9GihPHtHFpotVz0kSKkLZFoizK1Src5iExKUI5ji+Df3BZ0W4M/XNufZCH3J9i39eTzwdaXQUVekDkdncMcb10+v4ix1HyhF7IDSS4loQgOAhfi0CKML0QjZE771vchSTUTs3RtV2P9jpkaDGlkTpA5EZBR/9p06xVUxBtroIJIb3CMOvEP+tboPX+u4sSd54moBHHeajevQrE7sYorgbFynaiJH4ruxT3IkJMA5e+rtwNY9MP/x5Hw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2641.eurprd09.prod.outlook.com (2603:10a6:208:e2::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 15:27:37 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 15:27:37 +0000
Subject: Re: [OE-core] Public project sstate/hash equivalence mirror now live
To: Joshua Watt <JPEWhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: akuster808 <akuster808@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
 <95bf1261-eb40-cafa-3153-0c472142fb98@gmail.com>
 <2f7b629ba49f76ad80461d00a3322a3fa1dc1b19.camel@linuxfoundation.org>
 <CAJdd5Gax1=zFWNRqG4O5z9Xu=QvjuNuRNAv1NWp5=WX7yiK17Q@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB4642D948515CF977444F9B17A8DA9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 14 Sep 2021 17:27:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAJdd5Gax1=zFWNRqG4O5z9Xu=QvjuNuRNAv1NWp5=WX7yiK17Q@mail.gmail.com>
X-TMN: [f5u0zcb+0i3Ob8h0gQUaOKhlDhBOkKCEAQd4q3Tj2SEXH3Qwx0XMdmcR9Q1eq2rT]
X-ClientProxiedBy: AM8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::13) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <d64b2527-c5dc-d94a-91b5-652b2043f1d6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:a1eb:75b:510d:e742] (2a02:8109:9a80:3b94:a1eb:75b:510d:e742) by AM8P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 15:27:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add5bd8f-5f4e-4cb6-6b9e-08d977942ed7
X-MS-TrafficTypeDiagnostic: AM0PR09MB2641:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Hw0dsYmz532aV1TqyHIal5QvxI6p37E7QFUlEgoMYkHup8EqBw8hqsLFg2vIqXqHpcVbIyk4RZjDYVM/w4cHYnZ4i8GV9UzgRjh/IEWPxHmhvNtllw7HRhTXwp09C9z9+Mw8KoQaN+OH/ws/oGJHS6jBBYoMSueKsyHuq1itLyr+fBxuMsY2xR7kZg4F623uzOYrixZwMK3HwvyfPDt3XXWmAyJ4fKGzNh9Awrdr71UklIeLP9Yoz2VchiFw9cdCYnEuiEDzAjoIrhEyJKURbGUzEulCbkZhmfBvpXSYvG6I5NSDYd9OUb2jp7m8h8O3gPYh3x5yEyyhmEqowq/hYDEIZYqKG4g39jNkuvx1rKaXciDmxM69C4W929S0RXApzTHiFLa4AD26YB/KmqNRAYrlusEiaVzBlPoioJ2FjoZ+ZsCcn9R4zvaMwap6Xf0GXT3GLzL+lBIh5Jzcm1X8H1d6rzOLPUhDSFc/HGAL10=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2O/IF4c7YJSvhrgqTWszNOLjouyl36I3fKqSc3tQW6OoXm/wIJq3Z3pETUqx1Vmv0qD2JAt1XU4upyC/yZgnoem5HaO4GkcWKysEr8puWEuSTT/iYl3ENmpTxnMI8LSRjrZwhx0AoXUh3kpXlSNYQfqjnOEgN9ucKR3bggZ/a2v6MNDUMQzPjgvUvlqACRh8JTJH0KWuCEViVQ5jGOTrfQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add5bd8f-5f4e-4cb6-6b9e-08d977942ed7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 15:27:37.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2641
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 12.09.21 18:01, Joshua Watt wrote:
>=20
>=20
> On Sun, Sep 12, 2021, 10:58 AM Richard Purdie=20
> <richard.purdie@linuxfoundation.org=20
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>=20
>     On Sun, 2021-09-12 at 07:55 -0700, akuster808 wrote:
>      >
>      > On 9/12/21 4:46 AM, Richard Purdie wrote:
>      > > We made the autobuilder sstate public a while ago but it wasn't
>     useful after we
>      > > switched to hash equivalence by default. I'm pleased to be able
>     to report that
>      > > we now have a read-only public server for the hash equivalence.
>     We did have to
>      > > fix a small API omission and a couple of sstate related bugs
>     but I'm pleased to
>      > > be able to report it is now operational and usable. An example
>     config would be:
>      > >
>      > > SSTATE_MIRRORS ?=3D "file://.*
>     http://sstate.yoctoproject.org/dev/PATH;downloadfilename=3DPATH
>     <http://sstate.yoctoproject.org/dev/PATH;downloadfilename=3DPATH>"
>      > > BB_HASHSERVE_UPSTREAM =3D "typhoon.yocto.io:8687
>     <http://typhoon.yocto.io:8687>"
>      > >
>      > > I've included an example image build below where it took 11
>     minutes for a
>      > > core-image-minimal image build. Obviously this is only of
>     benefit if you're
>      > > building configurations that match the project autobuilder
>     although hash
>      > > equivalence could be useful alone in reducing some build times.
>      >
>      > What branches that support hash equivalence will be available
>     other than
>      > Master?
>=20
>     The question doesn't make sense as hash equivalence doesn't have a
>     "branch".
>     We're sharing any hash equivalence data generated from builds on the
>     autobuilder.
>=20
>=20
> We should (?) backport the=C2=A0BB_HASHSERVE_UPSTREAM patch so that the=
=20
> instructions to enable it make sense on older branches though.

Yes, please - I'd really like to see that in dunfell and hardknott too

>=20
>=20
>=20
>      > > I have updated the local.conf sample file in poky to match the
>     new release.
>      > > We're not widely highlighting that information as yet as it
>     remains to be seen
>      > > how well it scales and what the hosting impacts for it will
>     look like but it is
>      > > there to experiment with to a wider audience such as this list.
>      >
>      > The should improve the out-of-the-box experience.
>=20
>     Ultimately that is the hope.
>=20
>     Cheers,
>=20
>     Richard
>=20
>=20
>=20
>=20
>=20
