Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.39])
 by mx.groups.io with SMTP id smtpd.web10.6232.1608202417723543232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 02:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=nZdXhk3j;
 spf=pass (domain: outlook.com, ip: 40.92.89.39, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV3c/ziGOofjuJ1kkUidJCp3ActQSuN9Iod5ceVvLjen87bJlVj0r1W79AdXjd7+qXOf4Vwwo6zqjXfZP5bHXT2LXM2EP0c4ld73REEQbpGltHRJhoQsQ2SKsYx9PBWQqTZsmBFR7J9Yc9ziDFarcBvGaXv7eK2ap2qWiDBrwf4BTuJTUPq5EH3fB2fjNjWr5dVjpHEySQMVyDVHWv6SV4oy7YTSxZ++QHSWQO3YC0mWrJdlNkmO2KPct82VS7RFWZJvqNIFuVyrB2i9FNhK3kXt1EuQ5AhFCRhmob+vAs+Drju8jftUcxipzVyj5sa09OaK7oZBRkwfKPMRWjgFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlq9qWOmnX3g0cJMfFTuWx01ho37jQY/NcV/Sf6tjUc=;
 b=Nyw4cncy3I9fWJNpHZndyyXV1/PgwxAzOK84IpPbYNLi0YNPAs6zOj6VKjv62Jz/jK2pl9EqBUkIAGDtnT7AUDNfSHmsWHO566T65/eNEWyn+a54L6xYZ6HnyGwPEVr+2EKsx9C6NP2KQFwygFjmcD2pbmhnJjfEwOCPQ5bwN29yvYKnD0gnnNTh0Rs2ISE6gzpfFTmwHRoC7qgwfdBq6hlWEFbjWpWfJMaiQ771b/L0v2b8RZmurnxeiYAP08apsoU0dA9tBVRb8XsbxsuY3Rk8SmlI3qDhaNLYYK+z5uCCqjXfpy4BiE0naKk3d8S41SXsBPKmIxa2ncvNTKNG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlq9qWOmnX3g0cJMfFTuWx01ho37jQY/NcV/Sf6tjUc=;
 b=nZdXhk3jy1785aCSgnblsBU4Ww8EvmiOJLL2KsBpY2xckDBeh0d9/uW3gPBQIL6fI7C8TBs64nzSRrr5K/FsxOHpdBEJmad38d8Qetkk3GRPNtrxLkrfDMiylrwmLO99MZ1oRyRYRmRyYP9/mldhbTwVc5vtrzoP55SBTS1MFPXVkSxejp2mLiW/sW9TUx00fgFsm+guHo09nNVjL8+YWi0F4oi9VDADHxATZe6aYU6Z8qagVmt7lrXj8vGRz/ZEzz7MbX80Di68FadhocHPdBS55p1dBimSn7wWxWnBnuFgR5VQrnyYN1/6qvcj19wL1eVM8eDKtJcd402OIUdHIg==
Received: from DB8EUR05FT026.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::4a) by
 DB8EUR05HT009.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::415)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Thu, 17 Dec
 2020 10:53:35 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc0f::4c) by DB8EUR05FT026.mail.protection.outlook.com
 (2a01:111:e400:fc0f::269) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Thu, 17 Dec 2020 10:53:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1D5349E90CAE8D586A6479998D9AEE0751D29082D2830F85A70DA691F6AA8B8E;UpperCasedChecksum:7EB41EF8F653787C21598EB5507DF7ABB789926639D482D9D6B96398F956496A;SizeAsReceived:8865;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:53:35 +0000
Subject: Re: [OE-core] [PATCH] ltp: fix rpc build error
To: openembedded-core@lists.openembedded.org,
 =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>
References: <20201217095506.28531-1-kory.maincent@bootlin.com>
 <AM9PR09MB473969D9F9FE59640D07DBEEA8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
 <20201217112542.7f5c38f4@kmaincent-XPS-13-7390>
 <16517B4086903658.9537@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB473965BC1CD80297EBC1F55FA8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Thu, 17 Dec 2020 11:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16517B4086903658.9537@lists.openembedded.org>
X-TMN: [gQwDnl9H1y1ClaCzWxAskgM/uzc6cn6z]
X-ClientProxiedBy: AM6PR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::33) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <5dd79e21-a070-3c90-7e93-2ce7cae98bda@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.80.121) by AM6PR01CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 10:53:35 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2b2c3a6d-cd61-4fb5-5809-08d8a27a00d4
X-MS-TrafficTypeDiagnostic: DB8EUR05HT009:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Li1PWVDYhz2R+LAbf2c7HnAbRXwqIQudxdRlSsHCAZ/PgmerWj69tIgFuzYsn8NdOMJ/Vk6yvMa0h8cuQy6fasYYiZi+LtYo4FpX73PF8sr6oS47tadE+DSlU0qOATE81qD+sqM7+kqnyuqzviOJpweKF178Wh4vXcl5mCP2+kTxiOk9jPznPlXJ2wlwpKdAHen1wQaJ/ycrOi29ZSzLvtvFS1NmD5iD+zQl1wmoeiANDi8HhkinyiCQtoYjVhMpVdjE6j7hHn5ZWF3FP2BM6L95IY1RfXzU7wKva36to3I=
X-MS-Exchange-AntiSpam-MessageData: 
	ww1B5LTUc5xW6N2fyZHEdKndQsi6bZb+BwhEazZg0akfmrHgxgqOioC0GNLWWszLuDbTnswzPUHKrEkbeAXb0xEWOzoXFcomiG590Iv1RHXOO3+Y7epr0ibLyKyGydwSfKCUqOiDR5Ca5Nv5CypJsQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:53:35.6272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2c3a6d-cd61-4fb5-5809-08d8a27a00d4
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR05FT026.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT009
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.12.20 11:47, Konrad Weihmann wrote:
> On 17.12.20 11:25, K=C3=B6ry Maincent wrote:
>> Hello Konrad,
>>
>> On Thu, 17 Dec 2020 11:03:39 +0100
>> Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>>> On 17.12.20 10:55, Kory Maincent wrote:
>>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>>> ---
>>>> =C2=A0=C2=A0 meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
>>>> =C2=A0=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb
>>>> b/meta/recipes-extended/ltp/ltp_20200930.bb index=20
>>>> 7acf15b360..9b17d68f67
>>>> 100644 --- a/meta/recipes-extended/ltp/ltp_20200930.bb
>>>> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
>>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "\
>>>>        
>>>> file://utils/benchmark/kernbench-0.42/COPYING;md5=3D94d55d512a9ba36ca=
a9b7df079bae19f=20
>>>>
>>>> \ "
>>>> -DEPENDS =3D "attr libaio libcap acl openssl zip-native"
>>>> +DEPENDS =3D "attr libaio libcap acl openssl zip-native libtirpc"
>>>
>>> Can we have that as a PACKAGECONFIG entry, please? otherwise I think i=
t
>>> will change the behavior of the existing setups.
>>
>> I assumed the tirpc was disable because they did not manage to build wi=
th
>> it "# ltp network/rpc test cases ftbfs when libtirpc is found".
>> But if you prefer I can add it to PACKAGECONFIG.
>>
>>> Also the dependency has a `PROVIDES =3D "virtual/librpc"`, so I think
>>> depending on virtual/librpc should be the safest way
>>
>> Ok
>>
>>>
>>>> =C2=A0=C2=A0 DEPENDS_append_libc-musl =3D " fts "
>>>> =C2=A0=C2=A0 EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
>>>> =C2=A0=C2=A0 EXTRA_OECONF_append_libc-musl =3D " LIBS=3D-lfts "
>>>> @@ -44,12 +44,12 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>>> =C2=A0=C2=A0 export prefix =3D "/opt/${PN}"
>>>> =C2=A0=C2=A0 export exec_prefix =3D "/opt/${PN}"
>>>> +export libdir =3D "/usr/lib"
>>>> +export incdir =3D "/usr/include"
>>>
>>> Those should be ${libdir} and ${incdir} if I'm not mistaken
>>
>> The exporting of ${prefix} change the value of ${libdir} and ${incdir}
>> therefore I set them up again. If I don't set it, pkgconfig can not fin=
d
>> libtirpc.
>>
> I see, then please just export ${libdir} and ${incdir} before the prefix=
=
=20
> export and it should be fine

for instance that here

export libdir :=3D "${exec_prefix}/${baselib}"
export incdir :=3D "${exec_prefix}/include"
export prefix =3D "/opt/${PN}"

worked for me

>>>
>>>> =C2=A0=C2=A0 PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, nu=
mactl,"
>>>
>>>
>>>> =C2=A0=C2=A0 EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
>>>> =C2=A0=C2=A0 EXTRA_OECONF =3D " --with-realtime-testsuite=20
>>>> --with-open-posix-testsuite "
>>>> -# ltp network/rpc test cases ftbfs when libtirpc is found
>>>> -EXTRA_OECONF +=3D " --without-tirpc "
>>>
>>> Should be part of a PACKAGECONFIG entry, with `--without-tirpc` being
>>> the default
>>
>> Ok,
>>
>> K=C3=B6ry
>>
>>
>>
>>
>=20
>=20
>=20
>=20
