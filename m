Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.64])
 by mx.groups.io with SMTP id smtpd.web12.54736.1600064944663491411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 23:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UUTXLnFm;
 spf=pass (domain: windriver.com, ip: 40.107.223.64, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwi/J0PT3Nr/KKf3gUY4hvjvNSWDvbhJKqP4zt/ndOUfrq0sw5DT72Rx6Qh56OyTFv1yjCVILsAymMuDZ+8lAUUUNJfzD8JT4DwPxdIyYDzijYqYRzXnP1OU1oUGS05ihr05Ffapb0XeOLOP0QRUUJs7JabwwHYw5ae+8k9Xb8YZPqYmIkKTWPPvqxfZ0AonOp08yXt5/8830YIUyReOVQ51RbgngykNVaQXgTBAGT/gNOOUD9MlYQ9MisyWIUM1drI28QYxrW0GlMgRFROtu8KzhTfckc/sJ+hLJAy2wxpaYOtA20AOzF5+CXEOPskN36qn7fmBQzy/AL/ST6bOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0b/VT9gKIoje08PIcqIBappIGKEYwMhjdlePoEmS78=;
 b=jXpgwTkt3N2NxSNCmzYK2B9q8EWXKgrzVTyKOEt61F1bOMqZy0wUx5s9gigQMx9vNplghDe4403eZmvBdiSuANtAlEkKZWJpDvrXeoYfG3sbE+S13LI63y5TViJWS4LRjss+xfA2LWyzcWsjfa2WecY/fMgvswl+K4OFkPTuuOnr4cgRNJRimYREuWz4lbAQCCsD9IZKCglli9m8NtoELw25/+Dri2VX+m8+9ZdVGyOU+E1F89BBURqkiOOKy/IkMZUKS16rAEBsyjzTRh3XCGAM5mZRanNbz7ibQpJo06W/1VJ6DLp1ah9mRiFG5uEkzl7p15KBFKR1N0F2nl6a9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0b/VT9gKIoje08PIcqIBappIGKEYwMhjdlePoEmS78=;
 b=UUTXLnFmqVZmFZHFJJ3znvg8U5wa/ndcb4n1QBllDptvrwA1voOfRSxd3GOo9dHtNPbh5k/VdEpy7ylJHKhZ/faSAS73pTFP+ORNvvePdzTSF6o2g5bO80FMt0BMemfE4+XjOkE4uMego3eEbo2e7V6sUGafrjMAo1+NC84wNqo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 06:29:03 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc%7]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 06:29:03 +0000
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
 <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
 <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com>
 <eabcd7ed-88a8-8453-18dc-af4fcc92c9d8@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <dc5035a2-5051-ceb5-310e-ed6d7dff8fd1@windriver.com>
Date: Mon, 14 Sep 2020 14:25:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <eabcd7ed-88a8-8453-18dc-af4fcc92c9d8@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::36) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YTXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 06:29:01 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e340d09c-ad39-48c0-332d-08d85877792c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4241:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4241E03EC84F1357FC264730F1230@BY5PR11MB4241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NdjJxFAX3a5ZH25bEFAgjj7i6V1eLrn2dKXbP9OtGPo4WOkAKCD54fetpWTtTjSTcUIDdel2DUynJXYJf/N7LyjGJ8Dy6i9+5K6hTUqWRrcPboTck2TIAkaLD99OwlFybXe7EdTawen4rajUH9+aUsjvEqZ0nEit4LzpX1EmJ8kSZW3fkgqHM0nGuyXzayO7YFuOIKYcHPv/At5mb0aqzib5oCGP35mveItMF432rdmQqLNsQhb93WIuZV7vDq5GaA3pqpU/SS6vR7BabtRklwEUIGuNLGn9S76oIwC63li+LJJXFFseOfsn4Rc7pGty/aY1Hzg1w3qHPW7VxyUvt4z+1gYTiF75BjA0rKrdRPFpJYaFVMcSOklBZ+ft+FjARwh9XWvXjsbBkkTqdOqXL2VKvZBZRsPbPleb3EPGzgUaOuiTDn4UqhMKoAHB9P3SJuVaEoUSE6SSep81AMWSh8WcCXJW05zLPaq/ACIy8C4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(396003)(366004)(136003)(376002)(6666004)(110136005)(478600001)(6706004)(86362001)(31696002)(5660300002)(66476007)(83380400001)(66946007)(66556008)(52116002)(2906002)(31686004)(26005)(6486002)(16576012)(316002)(186003)(16526019)(53546011)(36756003)(956004)(8936002)(2616005)(4326008)(8676002)(966005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	M24Wcy4wdp35+5KdiXpe16ZE+ssR90akOrPL9F1vtXwGsyCROnskcM4329Cdvk64zIfUEZTytJ3jqNn9+zat/lXgNaOFz9g4XNTiYggmvLL0lg5uNUBDhxRlICBkHWv2Krx0D0cLtzwEg/jYtjpcRy1yvjNmrU8npNmz4lgPRAqCLjLW0nBRfpLftm9oOthW6fQtsxaBI+mJwtF38eu4EyEhcaWHRui1UDDrZecpayjJZKBZMyQmbhpTS3tUAJl1RxRt/dwhkh2S2yzOMcmXyN67HujvQ3efFiS+Nfwd9sG3WTxiPvlIPt2FOHmEvhwK66gvkGVphNXLyS9OgDP0yTQmMkNBTo2z+vroZD2hcEP7QfQxp7T0hgO3Q17dhCHguIFpLp+qtfag8yDI0xjSq+uQQFIYDyJP43mJY70rWP7GgAsVi6gZl+thxd6RERlb7h78ZBc7j9v/9gYcjX0tJshjiPRnOZNo92PKXzEmIH9YSOutk6+dxGLQUxmzbiZb6HJRTw6fN9aRJ8BAf6Tihu6qTBH62fBXXm1puf2ZocBHucwzRjkFog7Y5z4sexTO1WVqsbHoBTi96vOn5d4lVEOFakV8+ZlcV0vdE03yWhuAZ4HfuHzINjkO3quLHGqkTtZ1W4yRMD3ipbn0tF3X6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e340d09c-ad39-48c0-332d-08d85877792c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 06:29:03.2116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/LcfCLqHgMoygSJYKlLYpmAlvCHrpra7ztHXlLxcN3Vy/rdglzbwPXauHVdXA1KZkr61Nua6qY3Ue4IDM4kwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/14/20 2:02 PM, Khem Raj wrote:
>=20
>=20
> On 9/13/20 10:44 PM, Yu, Mingli wrote:
>>
>>
>> On 9/14/20 1:26 PM, Khem Raj wrote:
>>>
>>>
>>> On 9/13/20 6:50 PM, Yu, Mingli wrote:
>>>>
>>>>
>>>> On 9/10/20 6:41 PM, Ross Burton wrote:
>>>>> On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com>
>>>>> wrote:
>>>>>> +Upstream-Status: Submitted [qemu-devel mailing list]
>>>>>
>>>>> https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=3Dunknown_=
lock_type&submit=3DSearch%21&idxname=3Dqemu-devel&max=3D20&result=3Dnormal&=
sort=3Dscore
>>>>>
>>>>>
>>>>> doesn't find this patch, can you link to it please?
>>>>>
>>>>
>>>> Hi Ross,
>>>>
>>>> The link is
>>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.htm=
l,
>>>> will include the link in V2.
>>>
>>> are you compiling without __OPTIMIZE__ defined ? qemu may not work
>>
>> Hi Khem,
>>
>> I didn't especially customize something for __OPTIMIZE__,=C2=A0 could y=
ou
>> help guide where to define it?
>=20
> perhaps you are not using one of -O<n> option ?

-Og passed to the compiler as DEBUG_BUILD =3D "1" defined in local.conf.

Thanks,

>=20
>>
>> Thanks,
>>
>>> without it.
>>>
>>>>
>>>> Thanks,
>>>>
>>>>> Ross
>>>>>
>>>>
>>>>=20
>>>>
