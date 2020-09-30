Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.43])
 by mx.groups.io with SMTP id smtpd.web12.12177.1601460918131935932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 03:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=i7AbSp0j;
 spf=pass (domain: arm.com, ip: 40.107.3.43, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r60tZwVg7yBDBPcn3LqyFVNUhds0TBDgakKBGMSo2rs=;
 b=i7AbSp0j7DrNRX7P/glwBGJrZtM3BcDJOSXo4omP1kXzxBbk9f0/lduYKq/w5XMTQnGTZLblCiVWT1iFjnjvSnzRKZ9eI4rMxIFPQCK4NExX7x7Zf+RkN3Nua/yo6zuXTmakTpynZPpY1pRYNUQwuaVd8tDAkh+1eE2hrk/jSGE=
Received: from DB6PR07CA0053.eurprd07.prod.outlook.com (2603:10a6:6:2a::15) by
 HE1PR0802MB2410.eurprd08.prod.outlook.com (2603:10a6:3:dd::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.24; Wed, 30 Sep 2020 10:15:14 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::be) by DB6PR07CA0053.outlook.office365.com
 (2603:10a6:6:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.18 via Frontend
 Transport; Wed, 30 Sep 2020 10:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:15:14 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Wed, 30 Sep 2020 10:15:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9218b69932f4469f
X-CR-MTA-TID: 64aa7808
Received: from 125a2839662c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1A46A033-7B75-43BA-BA5C-ACAE4ABF0E3E.1;
	Wed, 30 Sep 2020 10:14:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 125a2839662c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 10:14:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIJ6pAKTN2pvMQOGy8a1BbhUK2Ft4l5W/4JcmMQu7su5WPgcIWxLru4tfZqRKyyyxRFp8LORCqguRkjbq0BrqU9Fq2Aw1pVA+nfsTbjVEPWZel8IVRWaQkY52luPuNZ2DQN2/aUVDDl4iMrJzfhYuPackQhZcB5LE5eonDT+TDCfDmKOkS1x4dFbNcQEuDCi4mOiG91yrou5Z4y3LeJGcRf1bUCE5XYG9fLWljp/nxEhSj/wl7j5ro6+6mfQK4YAEWKs6JBgpaLpOrXomIS9hjL562puESYWHPPoICuuBvWKfDAjBPuPIhwBv06MLTzudqhuFu24L/4s5kOFe7citA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r60tZwVg7yBDBPcn3LqyFVNUhds0TBDgakKBGMSo2rs=;
 b=ToHi+Bqq9eICNCEx2WMTYhY+iQwE30cxpCMyhtwISomJohxXej1KX4Mj7m0jWRZEW6q7rf6kq/utpgJ/uAYHpwD34RFmKpwIPzKAZHpkdfr5JXp0aKRCiy92/BHqgzhQcmmkarQG/yB0o+MAFifldI5Yr/NDdjE/tHTn4yGmaoS+r38sgHfRwLmBU4H8QiYW+5/eYjKlAsfWoij8VKHVz8WOqgSolvgPZgMwhSnpMoeeYyNbTWB9DudJd+QE+YeRtU9k/BRAx2P2+GBeDjgksIlkm1Cv3+kNkrY+t61HmA3WqgKI371Dopmu8bo3bIilYPJYCeDIO5SFa2fsmFEG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r60tZwVg7yBDBPcn3LqyFVNUhds0TBDgakKBGMSo2rs=;
 b=i7AbSp0j7DrNRX7P/glwBGJrZtM3BcDJOSXo4omP1kXzxBbk9f0/lduYKq/w5XMTQnGTZLblCiVWT1iFjnjvSnzRKZ9eI4rMxIFPQCK4NExX7x7Zf+RkN3Nua/yo6zuXTmakTpynZPpY1pRYNUQwuaVd8tDAkh+1eE2hrk/jSGE=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM6PR08MB3127.eurprd08.prod.outlook.com (2603:10a6:209:43::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 30 Sep
 2020 10:14:53 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 10:14:53 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: nd@arm.com
References: <20200908122835.38284-1-usama.arif@arm.com>
 <5e940f933da98f5546c1626e8f2ba0fd7b3c58fa.camel@linuxfoundation.org>
 <1636CF692A74423D.559@lists.openembedded.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <558ac686-dba5-6f51-2b83-a226b5de6a41@arm.com>
Date: Wed, 30 Sep 2020 11:14:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1636CF692A74423D.559@lists.openembedded.org>
X-ClientProxiedBy: LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::25) To AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:14:53 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d7e385c-e6d9-44db-e473-08d86529b918
X-MS-TrafficTypeDiagnostic: AM6PR08MB3127:|HE1PR0802MB2410:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB24103A0DBBB4EC73CCCD77EA92330@HE1PR0802MB2410.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NVq+1ec87HzYiCqkgdBPcEF93U2cXRKXgx5fZYC7/O+ZSOi1wHTQCmNBlIzefislaDhwyS34PGmQzVNHceJEk7zfSNUNiofikKd5JbIcqLqoqdsQ38N8Z0TVSLEwBSBIz2qhCZdXZkZu+vSBueSQA4w3ujMSjY1zBymU/SzK2uXBAyGS9YLxIeZWNgBOvbDjCsXd3w0nshIYRnzCf9l7pDghfH0KcfB4nRfduf7Dh3LpKdKPOE1Nm8Ud2b4BzVrgqt8MhVNooOYrHEhyBOFXRV4tzJaXHRjfea1yirvnqvqC5CIUywcAgWAVQ3CX1SstFlWtvQv6FaXLTt+2A7NbyeRK5eBR2jvKzmkau20Vy6/kCY1ko4KDQzXou7VAw8tzKGlS2s1ZcYktHVWkkzlnuMxk/VnSCcL+z+xb0Yua0XOkRWozaHk1v+MdDLzF5TW3gD/1gr/MwG5klxKIVatxXn+hv3jtBxI6m/hTtlPeNoqoVxnfrVYREEUdu5TQ2iyC
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(8676002)(478600001)(31696002)(66946007)(53546011)(31686004)(52116002)(2616005)(956004)(186003)(16526019)(26005)(8936002)(36756003)(16576012)(6486002)(2906002)(4326008)(5660300002)(44832011)(66556008)(86362001)(66476007)(316002)(83380400001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: izWE37RKgvqqbU7p9QA7KSGp23E8xD16Bd4bHNlCQeforkhT0JQtaPU6K7HheQ72I7RvQFAdv+aWbtV/1iRHCX00ge2j6OY38deFeIznrF5JgK/si4g6mI1BXOffVZffhDI98tBxDWiwyqicXU67dXSXA5owxil3/rtoWFX1Go3FtzFeCJ5q4ynY6H1XjTX1HL8uke6pctkMVqykp5fp1QoHc1vrb6RuxvLSyBGCamyxn0J3Qet6pgiv1bMrKhaZyjNqWjdsXlvOln2n0VL/yrCK3B6NF9yySYMa37jPo/hxkVLT82U6s0rh71cIBtXm/ahh9d3T1+tx9KPfIHBKLshljUr92keqzWf/iDw0zG6YDZKuFHRLGCgc2ojUo88iA3D7J7drZrTQdhAXP2ihHBV5XpM89cLhjrLb1A1R4EjiRwiI5wEcoW+DASd8PEXa3V8AaRVNeGNTnLYE8djVR0QSE+LclCwMgdOHrs8rpiwj6spmBvumUZSBcOExRGsivvxk/BIhUg0ARUY69ZggoGvAbmy8TKim8tgixlNuJfIvmnJikfvSQPG5iJn8PbW/JIFQW0Hi8wmrFbW8PrrsS3dNpoEBwVgNPDzJbEtBvnUoTjmao8dfPbg8LJlfmI84NVUVfde1yT+ZslGV1ojgbw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3127
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0342249c-190b-4b27-7a5c-08d86529ac68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EjeAIfQdy4IaVuKKE8oRlaQH7YRX15cRIY9kua7kDkzvpuKaIJxw7sePZu/mpySpBe4BTqOvXfhNTgpEEQVx6Rsv5jzkVywBiAlFOahkvk/Cnk8SGoYb4Iy2PAxnTkQukoZYI47sCpliMZokegWrFcI3RTLfCbbRyQIteyMVXIaTMXJHyP+Af/H5XkxmzHg1kidbmEapqols8GTK3RnwEImPEAWGcPpQZ37T7Xl9e0trKZFboJ5vMYZkO4ot76WroHDBfrXuHR995bvKos+dS2CLxWXfgqLJV1D/pXS9QktMC0nHxWZjWiuPDVZtYQH3oDr52StYgDH6mSXbHAdM4fGupiLle2OKYDNDrLuU+TiQOca+2DformzS+r1KUGLPxg5hkVVsvs7u4fg4TjyrUUTHcxzyv2DOJhilf0TEnS0Eig2xzABzEhziJeF2e5QDfK5W71A8jNtp2GlOphV8S0PpGytR2GRlTEZoV26k/8aaULNHbMVoPMn8+Vbr/VyQL3qyYrfZ78HOSx9kL84sXSgsGCwbn1CF2FKwp8d2svOjOqlDtj67iJxTc7G4CauU
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(26005)(82740400003)(47076004)(6486002)(82310400003)(8676002)(70586007)(70206006)(44832011)(478600001)(83380400001)(86362001)(966005)(356005)(16576012)(316002)(186003)(31686004)(2906002)(5660300002)(81166007)(36756003)(2616005)(8936002)(336012)(53546011)(16526019)(956004)(31696002)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 10:15:14.6336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7e385c-e6d9-44db-e473-08d86529b918
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2410
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 21/09/2020 14:24, Usama Arif via lists.openembedded.org wrote:
>=20
> On 21/09/2020 14:03, Richard Purdie wrote:
>> On Tue, 2020-09-08 at 13:28 +0100, Usama Arif wrote:
>>> The keys are only generated if they dont exist. The key
>>> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
>>> The default key length for private keys is 2048 and the default
>>> format for public key certificate is x.509.
>>>
>>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>>> ---
>>> =C2=A0 meta/classes/kernel-fitimage.bbclass | 44 +++++++++++++++++++++=
+++++++
>>> =C2=A0 1 file changed, 44 insertions(+)
>>
>> I'm worried about this as keys are generally something the user needs
>> to handle carefully. Making it all "magic" means that a missing key
>> might not throw an error when it should and also, someone might not
>> save the keys when they might need to.
>>
> To make sure the keys exists, we could check in step 7 of=20
> fitimage_assemble that ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key=
=20
> and ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt exist if=20
> UBOOT_SIGN_ENABLE is set to 1?
>=20
>> Perhaps this code should need to be explicitly enabled?
>=20
> By explicitly enable do you mean change the ?=3D to =3D in the below lin=
e?
>=20
> FIT_GENERATE_KEYS ?=3D "${@bb.utils.contains('UBOOT_SIGN_ENABLE', '1',=
=20
> '1', '0', d)}"
>=20
> I actually think that keeping ?=3D is a good idea as users might want to=
=
=20
> use some other key not generated by oe-core, so they can choose to=20
> disable FIT_GENERATE_KEYS.
>=20
> Thanks for the review!
> Usama
>=20

Hi,

Just wanted to check if there were any more review comments or anymore=20
comments on above, i.e. would you like me to add a check in step 7 to=20
make sure the keys exist and do you think its a good idea to use =3D=20
instead of ?=3D for setting FIT_GENERTATE_KEYS?

Thanks,
Usama

>>
>> Cheers,
>>
>> Richard
>>
>=20
>=20
>=20
>=20
