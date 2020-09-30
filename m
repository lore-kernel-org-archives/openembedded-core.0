Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.12361.1601462930110063118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 03:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hlcRCkoN;
 spf=pass (domain: arm.com, ip: 40.107.20.46, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nmLLj6Ecg2lyEiDj4xGy58laoZ5PxOuprbVkCV1eRs=;
 b=hlcRCkoNb6jtD+KXaWIxCm5VVmNmWtIS6hu/hfSlhJmxfpY7AedTIMDB0TyRfCS3h4fBJ2K+Nihs/EPnG7gLFYJSGvFMQHO57YC8vp3EDz/R/dAORX1Cv6rphk7QZzHlt1epHx76mJXtI108e9i34zNd4Sy99GvfFgkueexkLOo=
Received: from DB7PR03CA0078.eurprd03.prod.outlook.com (2603:10a6:10:72::19)
 by DB8PR08MB4985.eurprd08.prod.outlook.com (2603:10a6:10:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Wed, 30 Sep
 2020 10:48:47 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::a1) by DB7PR03CA0078.outlook.office365.com
 (2603:10a6:10:72::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Wed, 30 Sep 2020 10:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:48:47 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 30 Sep 2020 10:48:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60140a668e9a35cf
X-CR-MTA-TID: 64aa7808
Received: from 97157b2cec4b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7D6CAEA-3FBD-48D2-8B2E-94349E4FA62E.1;
	Wed, 30 Sep 2020 10:48:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 97157b2cec4b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 10:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcR8wES7iRcqPdg0WwG6bfa7sHfxtl+M10oGj17na23i8JEm7tzXSJH4xZ/ck+XtuAE/6P7XbkY9TwmOoe4Bn2QFpjwM0r7AMJha1hnVepMWr03oZJbN38LC7BMLcZaJS5z1gDQBUUGS8fJN+qxUDTSTwviMvU5QBBF60BgvCCq588qdOpNEFsu7GsAArl/qAQU9LTx5UCO03Hj0WwH+30gNhx3eGm4lgI4rPDOZzepPpF1a6X4gwY4E+dYSwtvMFZvXmA1t7L9aQQ2pjNoXmVDbC9hJR5Luxg2Pr2bYZM3xnQM8dEpgSu1LS8GvGc399OnZW/sgnHe2aQlB1dK/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nmLLj6Ecg2lyEiDj4xGy58laoZ5PxOuprbVkCV1eRs=;
 b=UrKuHlXt4+CbC8fNtA4nSN/fEou7tWUvw3lCaUPG+meK7AJpUpVL3/0n/3W1DXmD0cHkmXHBIUjKPRFusWPEorQHbQhm/4/s951o9PCN5HXfFZtWdZ8aokCti1YEL4G5OsBq3UAjm7uaCGad6a1dQjZQGte6njHWDz8m5EipDozJbE9A5CkOMk7pF6fB3C0SJUeRuYcP8mwLYmkNahlSVIIOaF0QG3EHzwmc+ORHYn83Db3Fs/9v3DkpJCZ3rta9V8/JmuAfUvWDu70rACtmVyrAzXRQh2Vz5UwiY6IrhhVpf6Go7IcfdmK8awvyLL/YOwhOdVg0T4KCeaQgzgfFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nmLLj6Ecg2lyEiDj4xGy58laoZ5PxOuprbVkCV1eRs=;
 b=hlcRCkoNb6jtD+KXaWIxCm5VVmNmWtIS6hu/hfSlhJmxfpY7AedTIMDB0TyRfCS3h4fBJ2K+Nihs/EPnG7gLFYJSGvFMQHO57YC8vp3EDz/R/dAORX1Cv6rphk7QZzHlt1epHx76mJXtI108e9i34zNd4Sy99GvfFgkueexkLOo=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM6PR08MB3064.eurprd08.prod.outlook.com (2603:10a6:209:48::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 30 Sep
 2020 10:48:41 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 10:48:40 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20200908122835.38284-1-usama.arif@arm.com>
 <5e940f933da98f5546c1626e8f2ba0fd7b3c58fa.camel@linuxfoundation.org>
 <1636CF692A74423D.559@lists.openembedded.org>
 <558ac686-dba5-6f51-2b83-a226b5de6a41@arm.com>
 <1fc2b55903cd1762530f4cd65ba37c7a8e7b8b48.camel@linuxfoundation.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <44d9807a-57c8-33ca-1456-950331860404@arm.com>
Date: Wed, 30 Sep 2020 11:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1fc2b55903cd1762530f4cd65ba37c7a8e7b8b48.camel@linuxfoundation.org>
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:48:40 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a322222-5844-4918-75aa-08d8652e68cd
X-MS-TrafficTypeDiagnostic: AM6PR08MB3064:|DB8PR08MB4985:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB49856ED41BE528FCC03E53BE92330@DB8PR08MB4985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 j/eeQXIl+tv99wrt5CUrULQcwxMz1SiNWQVyBjuS/7X5Exh4HbXMeV25hkLJDIHiCjy9OJdqoHrw7Jr3ioADiQUXAokeellgpGNKrvNzIQhlYSMP5CkXM97Fh/f2KWgJaM1mNANFrE1jL2R+FtExohVHvSQAX5GomQ8uC6B0ChSyRMsl437nw1fPlRXkQ1kAtwDmN8KrJ/PySSIp3EfecKaDFzWGF0jhHnrV2MJGcCYSh0eB3BXzASRdrp1Rjs+Z2UzhHoKRRATpoAMltuaEa7xbfPwBqQleq8XZnhgJpNUkvLuOcl0K0qBn3d00wfRXaPjgXBDUdufVg7gWyDuitRzsLGsdo05x/nipC2DyBkL3fpP3XIQkpyo8Q1KWcOPcootvhX2aWovgi0q/tc1AH4vaU1r2QXW6C4yscUHRwrq1T2nJ0PAcGnVSTdKCzVvZvk3yjPpOEr9mAJzuzqmyO2BGyWU9SK7yojsB8QE3pYkZbAai3u83Og6r5OxcEOUr
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(966005)(316002)(36756003)(4326008)(186003)(6486002)(16526019)(44832011)(66476007)(2616005)(66946007)(956004)(83380400001)(16576012)(5660300002)(66556008)(8936002)(8676002)(31686004)(31696002)(478600001)(52116002)(2906002)(26005)(86362001)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 QMBfUIW73S799dd4FlI7w8enoVsZOOxakPWaQd52/2zctzMIZqio2ET+8AZSjR2xUu/DOOnmY93p1V6Enkrj8flDoYql4uNceda+VlKk/dYFcY0MR+65k3hpBfpssTQNZ7Z4NMUT3upV54m/Zf49jy9IsNxiuqG4dGfcOirGcyU7iCShhnb30Nael1DKRzZ+NWDCgy5JnDyeEuL5DrZgQs9fRjuHInBTy9rfs9IwDsN5W8qznXBWYdDGiSxMtbuVUkNyS4drvs/2Ji+/91SL1CWJfifxUlGc8MAk59eZs/9PV4fethPS3p4goMJ4hKRS0mEPjezrxNUPxqYLdO6qLhxbmv23Euw+dOEK6UG4IugIE0azktJrnSk50aZn+txaOGyQkOkTaKAiYfPQF5WRTkh6R/YsfyynjPgMQpvVfv1UQxoG3ZSlWX+4BtW0bMb3ct7TMldTLrWB8Fq69wfItwa49hrmZXQ6FfIcPbk44x1SdNTmK2j8UQiXWrVr1TJ27M/KRA9aBVUjpNNYTolQv0Vjg/m8PbgtiJJPxS271jrSjngGP43kv6mETY9cUFzbd5qENcDStfJKBWTuYqBYgjjMKbhaBOLAZMwxlLagrYUpEx9hQTfwpLjF4BqFkbJnUmd+z9qp2DQtDp9xvW43CQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3064
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d5162a34-c331-4a08-736c-08d8652e64ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sCSJ4ydB/sxLS89wnOu5qUJ1xmWgTbIe+9nlihu+MFkyQFT7dZreFTKOz55N9QqcCv1l3vT5B1686t7oGPjmw212Tkji6K1s9nWObBxoM9RcPqA0dKyHXEWPP+6dthuWAZ1KeNEZpJzSfcHmh8kyel8kR4shgVgeDsXCEXVS7hxLkUDFwYfRFlJcu14qZjXmjakQtY83ypxO9QvT4uh5fgkwqEThWgkoLZitGMaU7ate9wKIX3bhi2GjKpDC1BcwM0ArGVZ3KscG6UhT1Tcnl/8soD7bzeLcGNJxUrCQyu4p9HqfsBI2T5L3vAZSnuqzD7zJX0pvtYMpfF4a/soCNKfv0+/voQxAw2gLLLiwnhdJlZSYhuS3s+TvDs/a6YUyEVpyJxVmxtAXJCVC23NrdlY/JE8Vk2saPMf2qZZNNp3rHfXCd2KRsWvX8Jmum2iY/MH6Gff9q2xfr99dMsdm11Rvhn3muwfFSvpZJvSJK4Rk9E6HHS3yzFLjT4lvYxr7t/g5IQmwP5VcapA08gCEEcZIzSGrNiuNrx9pNg0G99K616TmSpUX4rDE7FJUllFR
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(8676002)(31696002)(47076004)(2616005)(6486002)(26005)(16526019)(956004)(5660300002)(186003)(53546011)(336012)(44832011)(81166007)(316002)(82740400003)(31686004)(82310400003)(8936002)(966005)(478600001)(70206006)(86362001)(2906002)(356005)(4326008)(70586007)(83380400001)(36756003)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 10:48:47.4051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a322222-5844-4918-75aa-08d8652e68cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4985
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 30/09/2020 11:22, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2020-09-30 at 11:14 +0100, Usama Arif wrote:
>>
>> On 21/09/2020 14:24, Usama Arif via lists.openembedded.org wrote:
>>> On 21/09/2020 14:03, Richard Purdie wrote:
>>>> On Tue, 2020-09-08 at 13:28 +0100, Usama Arif wrote:
>>>>> The keys are only generated if they dont exist. The key
>>>>> generation can be turned off by setting FIT_GENERATE_KEYS to
>>>>> "0".
>>>>> The default key length for private keys is 2048 and the default
>>>>> format for public key certificate is x.509.
>>>>>
>>>>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>>>>> ---
>>>>>    meta/classes/kernel-fitimage.bbclass | 44
>>>>> ++++++++++++++++++++++++++++
>>>>>    1 file changed, 44 insertions(+)
>>>>
>>>> I'm worried about this as keys are generally something the user
>>>> needs
>>>> to handle carefully. Making it all "magic" means that a missing
>>>> key
>>>> might not throw an error when it should and also, someone might
>>>> not
>>>> save the keys when they might need to.
>>>>
>>> To make sure the keys exists, we could check in step 7 of
>>> fitimage_assemble that
>>> ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key
>>> and ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt exist if
>>> UBOOT_SIGN_ENABLE is set to 1?
>>>
>>>> Perhaps this code should need to be explicitly enabled?
>>>
>>> By explicitly enable do you mean change the ?= to = in the below
>>> line?
>>>
>>> FIT_GENERATE_KEYS ?= "${@bb.utils.contains('UBOOT_SIGN_ENABLE',
>>> '1',
>>> '1', '0', d)}"
>>>
>>> I actually think that keeping ?= is a good idea as users might want
>>> to
>>> use some other key not generated by oe-core, so they can choose to
>>> disable FIT_GENERATE_KEYS.
>>>
>>> Thanks for the review!
>>> Usama
>>>
>>
>> Hi,
>>
>> Just wanted to check if there were any more review comments or
>> anymore
>> comments on above, i.e. would you like me to add a check in step 7
>> to
>> make sure the keys exist and do you think its a good idea to use =
>> instead of ?= for setting FIT_GENERTATE_KEYS?
> 
> What I meant in my previous reply was setting:
> 
> FIT_GENERATE_KEYS ?= "0"
> 
> as the default and requiring the user to set it to something else to
> enable the key generation.
> 
> I'm worried that otherwise, users won't realise keys are being
> generated and they won't be managing them appropriately. Keys are
> probably something you should be preserving between builds for example?
> 
> Cheers,
> 
> Richard
> 
>

Hi,

Thanks for the reply. I have set FIT_GENERATE_KEYS ?= "0" in v2 of the 
patch.

In both v1 and v2 of the patch i have the following check before 
generating keys:

# Generate keys only if they don't already exist
if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
	[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt]; then

which will make sure that keys are not generated if they already exist 
and are therefore preserved between builds.

Thanks,
Usama

> 
> 
> 
> 
> 
