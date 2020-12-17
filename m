Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.88])
 by mx.groups.io with SMTP id smtpd.web09.6095.1608202058495238017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 02:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=mLDyBlH6;
 spf=pass (domain: outlook.com, ip: 40.92.91.88, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alms2OyokFJ1MELS1+eWwgiqbn29gzsDTWZlYpx3BQvjoIwU78xSQnXkjuaiJJsqCaO/CaUlj+SfaQGCLWP9sR0wHGnAGMntkDQdr32IA1v1oH1nMgK7jPJwrGPLVm65HBpmXDT04gvs6nrDdvBS/sDppemorIQ0bSW3bttc4i41tprMg1F0igRFnK2mcOqO7gsDlyg29RRZY9k0U71vxFFwa4WkGZP6dF6AWVJPcj6jeJvI0LenHJWqUMeXPzI1JS/qqsMftVFrhjjPaA0CpY5S3tKgUvweCvjHdSmY5QQ2UnY43qvdYxxUUVBRWE5I4TEPRa73h07OzHz+X0prxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opZM4tiHzMpsPe3PFvRD3DjVuVAgunbiyx2yGPzeZL8=;
 b=RjNiHAxuy7KpHjelFs2awoEtLVTgZ7GVoWhOHcnYen19xVRiyMR4uL+UnSP7k7A+BdXwtcr7ZfQIjjA05DYrs7u9MhtJOdqs2sb7WGS2NIVHbjNAxZJFowKjj3QrS8oqtfaLELlYtq6AVdlIltaFOTgxgmIrJCG11l55b5Tg4KWyur2cEcRoYUPAFfpe4uP0QIYEbNsNel/xrIYyw3pNyrAn7Q7gu1wXddRir+bMS705SceYcgHRCvbt4Ocio/ZSgAzak98SINgp89XJIBsLWC6MvYg9aqTGo0hwBZ7j9HPu/T8s9yY2k76hAWVn1tESkkPwo4R+M8OOAUtW8qs/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opZM4tiHzMpsPe3PFvRD3DjVuVAgunbiyx2yGPzeZL8=;
 b=mLDyBlH6XWgw++5lQlFvn8PVTyGfpAbG3coNJGq7F6PFhjGaetkQPeLdumEFB7P/PaRMYEqpNRt9QM24qeiDyuvRWGiRvUCyiA1mdf5mmIyQXSBFhc+ZuJw3/dBo4chHMHlKu/RuFHboejwfwegLa6BqLMh87c4ufY2RuLNnLdjmWLPaikIFJShqjtgoAF4q+ool0ZcnaQiK8qqMERDMdT5qo7KNBojk/cXjIDWGhSFEgZf5hlQmY23wZStdRc/IOuvNmi+atDHa4LFyna6Vd8NrO+CxWsIOyjqx9EL/t9HU7W4pEkPp8lvJZYNLJtnJmKH0OawYEeqWQnn8yTrAyw==
Received: from DB8EUR05FT026.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::43) by
 DB8EUR05HT158.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::352)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Thu, 17 Dec
 2020 10:47:36 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc0f::4c) by DB8EUR05FT026.mail.protection.outlook.com
 (2a01:111:e400:fc0f::269) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Thu, 17 Dec 2020 10:47:36 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B47C70CFE6E8510C0F5BBBC89AAB8F3E440033E194E29E4533E956972FF9D3E2;UpperCasedChecksum:8669AA4C9921DC70756953CD8108A064F0FA9C0AF4A914E54762EE028368F61B;SizeAsReceived:8814;Count:48
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:47:36 +0000
Subject: Re: [OE-core] [PATCH] ltp: fix rpc build error
To: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>
CC: openembedded-core@lists.openembedded.org
References: <20201217095506.28531-1-kory.maincent@bootlin.com>
 <AM9PR09MB473969D9F9FE59640D07DBEEA8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
 <20201217112542.7f5c38f4@kmaincent-XPS-13-7390>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB47392CA46D5F3AB23F893F62A8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Thu, 17 Dec 2020 11:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201217112542.7f5c38f4@kmaincent-XPS-13-7390>
X-TMN: [XfLrlRyqcP9OeF9nPjQ/SgRITofemsI5]
X-ClientProxiedBy: AS8PR04CA0081.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::26) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <ed0286d8-268d-8737-d231-1baea43f6f92@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.80.121) by AS8PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:20b:313::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 10:47:35 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 18ff0590-3c1f-4531-5150-08d8a2792aa1
X-MS-TrafficTypeDiagnostic: DB8EUR05HT158:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zUtH/TZb2mVHO9fzWMVpAxuAZ+caln9EKwT2OVb9NYuOHteMEoDQ/I9anZ3FgNq/FV50t02LId77sSHKHQusfUwXlFj/opM5siSmLIIXO6Qozk5W1YEGlxo3J58UO6HwAxEE8dTViHKaE3UUFL75PVGWmGD7HFZIJOUEaPr2geg2nJQ4A9cgzFlyhmsWQmLVAKzVgHcPNvbqjTxUCc5QVXZnWztTXAryAWJunzSgrWwDexzchI/o3JaBMYXDCBs0
X-MS-Exchange-AntiSpam-MessageData: 
	yyid8qEc8tMpqyVJAFTftH1mx+OdrP788NDizYUdZhty6iV0uroX0OW0TRGXFExKZSy9hqWmTgahg1RIKb5Z+q2Di5WsUd9iVy1d1H+YEBbiZJmFYzCYxsUV2jA5pWlca0d+wuzhlJibl6S3lI5yAQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:47:36.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ff0590-3c1f-4531-5150-08d8a2792aa1
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR05FT026.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT158
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.12.20 11:25, K=C3=B6ry Maincent wrote:
> Hello Konrad,
>=20
> On Thu, 17 Dec 2020 11:03:39 +0100
> Konrad Weihmann <kweihmann@outlook.com> wrote:
>=20
>> On 17.12.20 10:55, Kory Maincent wrote:
>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>> ---
>>>    meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb
>>> b/meta/recipes-extended/ltp/ltp_20200930.bb index 7acf15b360..9b17d68f6=
7
>>> 100644 --- a/meta/recipes-extended/ltp/ltp_20200930.bb
>>> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "\
>>>        file://utils/benchmark/kernbench-0.42/COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f
>>> \ "
>>>   =20
>>> -DEPENDS =3D "attr libaio libcap acl openssl zip-native"
>>> +DEPENDS =3D "attr libaio libcap acl openssl zip-native libtirpc"
>>
>> Can we have that as a PACKAGECONFIG entry, please? otherwise I think it
>> will change the behavior of the existing setups.
>=20
> I assumed the tirpc was disable because they did not manage to build with
> it "# ltp network/rpc test cases ftbfs when libtirpc is found".
> But if you prefer I can add it to PACKAGECONFIG.
>=20
>> Also the dependency has a `PROVIDES =3D "virtual/librpc"`, so I think
>> depending on virtual/librpc should be the safest way
>=20
> Ok
>=20
>>
>>>    DEPENDS_append_libc-musl =3D " fts "
>>>    EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
>>>    EXTRA_OECONF_append_libc-musl =3D " LIBS=3D-lfts "
>>> @@ -44,12 +44,12 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>>   =20
>>>    export prefix =3D "/opt/${PN}"
>>>    export exec_prefix =3D "/opt/${PN}"
>>> +export libdir =3D "/usr/lib"
>>> +export incdir =3D "/usr/include"
>>
>> Those should be ${libdir} and ${incdir} if I'm not mistaken
>=20
> The exporting of ${prefix} change the value of ${libdir} and ${incdir}
> therefore I set them up again. If I don't set it, pkgconfig can not find
> libtirpc.
>=20
I see, then please just export ${libdir} and ${incdir} before the prefix=20
export and it should be fine
>>
>>>   =20
>>>    PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl,"
>>
>>
>>>    EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
>>>    EXTRA_OECONF =3D " --with-realtime-testsuite --with-open-posix-tests=
uite "
>>> -# ltp network/rpc test cases ftbfs when libtirpc is found
>>> -EXTRA_OECONF +=3D " --without-tirpc "
>>
>> Should be part of a PACKAGECONFIG entry, with `--without-tirpc` being
>> the default
>=20
> Ok,
>=20
> K=C3=B6ry
>=20
>=20
>=20
>=20
