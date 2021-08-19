Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.109])
 by mx.groups.io with SMTP id smtpd.web11.70007.1629384659131380774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=c7aFC6gl;
 spf=pass (domain: outlook.com, ip: 40.92.67.109, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqDy4BZKmyWL47NVaMl6yLpKNtKJYhpwnCMLRmQ1V4JlAM2NXLF2yHfHBkS70dueldz9/3cxvBc/exhuNHPLHuPiQ5DGiHbudv+yflih1Y8mmFTr5P6JU8qvonPxqgW7vcPSeLBzupLps7wczrIyDtNiYBR4uNTf3AnAI2sRMBXrjtnEIuC2cpoVLX3kVERkapZbBEeg7IF4ywPneWBDuMH5utPu9sVvVkrkuN81aIYaGEKtqzQSSFmYfjfA4Nfla6i2vrT5u3VtHvfuiaPQQGObkOw0OH10rXcKqU6hH8j17TC6VKq9pPSI6DXhiRfoKoFdVSpWp9R39VEsRjla5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNwdFgZ/8wMiTY9Y0KAmFtjFH1D/+Y82AkOCDO1va3E=;
 b=XPyTxyhv5iEqWNc0qE4e9NMsObzm58Qindf9zlE35CpHQgT2FaCGZfwqbYpio5+SyLmrX3/6OEeAr6VSj6MA0b3nc5gg4FV9QGIQ/gZh0hLlyYmwk+t5TOBz7eiOA3p/yYvY6HsZnn4cW8izdzNNfVorAtPcPBiS1CoKD7Wy0p5b1BFnq+a94eIRHsrgqd1gCaEDlkUY41XtfwYYOzmLkNKOtSV5JGxF2Ir6WtZUsj2gZHfHm9nz/sF8XGm3HmdbX9WvB7b15tA1B3Dy2+xY4Wx8V+/nYBA4CFz4ygm6HOZSoD1fel1Txf4vekcLRovmbAYJBMQsqK2VMKOnVyuPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNwdFgZ/8wMiTY9Y0KAmFtjFH1D/+Y82AkOCDO1va3E=;
 b=c7aFC6glO5KTYn9tKWB586nnF6InOh5EwcMh69B548vX0Kq9D3DOor1V7Wjn0g1fD0sGUlXYKZ8hY2666YF8H6jEKVi489ueMDQvJUWMt5x5d/62nSD/yQ2wpDpLo2+npndmI5aG6GSIx+KAz8D6rtD1d47H5q7bgE6CptMqFCxU7KZopvftKbuxN7rT1qpvgV3QcDWBzjI5ypgCOqEHqhYWabsUAQFtx0A4MmEEyyIYsY4u0l4hMqJ8Yr3fjqVi9oxTp2jPNi7O89jQzpXw593vX141P1eLECu1chh+ZhpwEUrzOrNhWUhW/1xsT+6OwbGQTkuSxHyyJPib/PjKfw==
Received: from AM5EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::4b) by
 AM5EUR02HT188.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::376)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 14:50:56 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1c::49) by AM5EUR02FT031.mail.protection.outlook.com
 (2a01:111:e400:7e1c::83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 14:50:56 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F59E081B5DB129B6646EF103D41D14AD207704118555B23B5FF438E424343376;UpperCasedChecksum:4596EB3237C29DED2F26C39EB80B5A5CF7AC252A55D912A6E925C0451A36A22A;SizeAsReceived:8895;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e4c0:3ddf:e023:da7a]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e4c0:3ddf:e023:da7a%6]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 14:50:56 +0000
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: openembedded-core@lists.openembedded.org
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
 <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
 <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 19 Aug 2021 16:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com>
X-TMN: [gSDaccVwJ/s1RpN8FCXbph/KbaYs0UwPSl7bU/jbn+u0a5BK4uR79Vmol/H9cn/P]
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <baab2dee-c491-28b9-919d-c0b5bc232270@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:21e6:643:d458:fcb] (2a02:8109:9a80:3b94:21e6:643:d458:fcb) by PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend Transport; Thu, 19 Aug 2021 14:50:55 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9d529643-cfda-41d7-80e5-08d96320bfe1
X-MS-TrafficTypeDiagnostic: AM5EUR02HT188:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CH429VUEp4k9zUFNn505ci/vuQpFxgLaYV0FmSEOTc75+Abrnx0j28x35NoY/7qXI3JVcLueFyrebU84Rwly1mf1BZooS2GCxdiSxxqDaiMqeaUzncLz5x3b06dK9qsyF8POI5E+6Tc/eNzOf2fnm5wX6ZKgzjkMubWtwQKsGCKH4YP0F2JmBYeVu1XajJdssBlb2e49w7J9YxO/NAzwM1HHVzPcMS6elJY7nwBMb2zY+cr5oJCH5ZK066++SVZS8rmHXmWiJm9eYXCeOW4hlUfhV36jPpYuCjwc3xCgzv6pV7NOx9AW9npcIBynIajvE9G5NV45SqMJr2b9K2eqwCP2+DEIdOnHSzjSf0WuWqlHnfOhBWlqZvezVwMwBh/4sAQ0pI13AK2GWW8G3kf7O4JtOsPeQTblOm7rCiMgyavNXIIfUmz3SAxO4PRjVceQsf0xaK7tLVAX4L3xqSMnZI7yVrWvW1wBxVffaXC/Cng=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DUGv77w1BgNrrzMzRl0R/ZiAXpI/84z+b/q/pYvfTpmz6kze2+GsKiGxf/AWhKdO+cogcmy8D1xELCFvOD1fzpUHw3VbERfHlww5JJVEgbEqHr5CAgHkA6ToDhaSCwPYrjfRM8XmEe0xVlxjiHaHczib16dc/eFAdwg0IQUL2jiV2J3pa6was29jiuUM3/XgGhzGWyK0v47bwYz4PeQ6lw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d529643-cfda-41d7-80e5-08d96320bfe1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:50:56.3486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT188
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I kind of missed out on this change... but I got caught up by reality=20
hard this morning :-(.

I currently don't see a reason why zstd is required on the host - only=20
systemd is having a hard dependency against zstd atm, while the other=20
lately added references are just optional PACKAGECONFIGs (and there are=20
plenty of them which have loose ends - in poky and meta-oe)

So the question I want to raise: why a hard dependency? wouldn't have=20
been HOSTTOOLS_NONFATAL enough?

I mean this is the second hard cut in the project within just weeks and=20
this time it was host related, which is even harder to fix in a timely=20
manner in a corporate environment (basically rolling out changes to all=20
dev installations isn't something I fancy on a Wednesday morning :-( )

None of the commit messages somehow mentions, why we all of a sudden=20
need that on the host, instead of building it from sources (which should=20
be possible judging from the latest master sources).

And on that note: that the documentation wasn't updated in the same=20
changeset is very unfortunate (not even the crops container where updated)

/rant

Konrad

On 19.08.21 00:19, Randy MacLeod wrote:
> On 2021-08-16 12:14 p.m., Khem Raj wrote:
>> On Wed, Jul 14, 2021 at 6:42 AM Joshua Watt <JPEWhacker@gmail.com> wrote=
:
>>>
>>> Adds the command line compression tools which are needed by bitbake
>>>
>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> ---
>>> =C2=A0 meta/conf/bitbake.conf | 6 +++---
>>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index f451ba6a47..3801db7d42 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -484,12 +484,12 @@ HOSTTOOLS +=3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ ar as awk basename bash bzip2 cat chgr=
p chmod chown chrpath=20
>>> cmp comm cp cpio \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpp cut date dd diff diffstat dirname du=
 echo egrep env expand=20
>>> expr false \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getco=
nf getopt git grep=20
>>> gunzip gzip \
>>> -=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls make md=
5sum mkdir=20
>>> mkfifo mknod \
>>> +=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4c ma=
ke md5sum=20
>>> mkdir mkfifo mknod \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch pe=
rl pr printf pwd \
>>> -=C2=A0=C2=A0=C2=A0 python3 ranlib readelf readlink realpath rm rmdir r=
pcgen sed seq=20
>>> sh \
>>> +=C2=A0=C2=A0=C2=A0 python3 pzstd ranlib readelf readlink realpath rm r=
mdir rpcgen=20
>>> sed seq sh \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha1sum sha224sum sha256sum sha384sum sh=
a512sum \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep sort split stat strings strip tail=
 tar tee test touch tr=20
>>> true uname \
>>> -=C2=A0=C2=A0=C2=A0 uniq wc wget which xargs \
>>> +=C2=A0=C2=A0=C2=A0 uniq wc wget which xargs zstd \
>>> =C2=A0 "
>>>
>>
>> on ubuntu 18.04 we will need
>>
>> sudo apt install zstd liblz4-tool
>=20
> Michael,
>=20
> Can you update the docs for this change?
>=20
> http://docs.yoctoproject.org/ref-manual/system-requirements.html?highligh=
t=3Dbzip2=20
>=20
>=20
> I don't know what the package names are for non-debian distros.
>=20
> This must have been done for the YP AB cluster but
> maybe that's done manually?
>=20
> ../Randy
>=20
>>
>>> =C2=A0 # Tools needed to run testimage runtime image testing
>>> --=20
>>> 2.32.0
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>=20
>=20
>=20
>=20
>=20
>=20
