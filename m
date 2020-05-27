Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.68])
 by mx.groups.io with SMTP id smtpd.web10.3399.1590576011226836921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 03:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dR8Slqsf;
 spf=pass (domain: windriver.com, ip: 40.107.237.68, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnsmE4q8rVU9DaB5F2qgG00GMq6rIdBa4Ccp3VSwbxH41EcDyogrW7Ug8QGJ/+cPmMikvYpo7JQkTdGjeMVhQn/M1jDU00S+vUXoDnCymUDfSpzQpZCOcRZ1QNYb1mjXRRNk2UGnvs0SAZLaMh6VZywhLjilDw45RNny9Cy8gKbTfXVYLTtuEm6XhKYkW77FOdG/Dc+Yu8pH5wV9S7QJw9HHApqpqCmtQOam463k2L33o99wOu907RdDgA4HpcHQjy8hw3waOAah6HIwEpurfaCqSntS8VbSr5NOwvsU7JmqZHvn9dXjQoTs31bhCzAPF/rfhjsSf78MTyN7NmqJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Davo21tPBbF3HYeBSz6tKZgd/K7RhDDMI2X6yy9P0E=;
 b=UdK2nVRRyNTTbsDJSMzGpvllZQ8cuzs/C8+Xw7C9zLNJ2hsj1jvbvq+nyraLHDF/McodzGwVpvz5BY9hwzAZ1lX0ZoJGpVcWRu9Dqv1KcioqkTzzIbtJIRdrEwQNzIi6pb8Igk7MiuGplTnZ0jUyfCqk3ZuZXi1rZ3A/xCTejhXzhamEQJmj5jop3ZEB3DVp5vwZkUnJaW5YIpaPM2EM9KjFQ4xAqMjNith42L3pPnQHQ1KjeYJV1csJTdmWKpqL41HCsPsR6bRDhcQPBTQXaWukVKC68co/FunqP7LSzNIKJRV6rwer1t2L6SVKtZg8sX5pu4E+aJYJPFoOc0YBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Davo21tPBbF3HYeBSz6tKZgd/K7RhDDMI2X6yy9P0E=;
 b=dR8SlqsfzLx5g5YJGlIT5jjljUzWODraXMp7Z9eVnRSFhpOmxkAm6xo122VwTqy2qKw+ZzVATt0ZMB7RacnSInhEzJXEVeYhHUDcB1pxjchrICIgsgrADDI2AxOxwvlrZBcff027+Bf81WO2intmDjcifltrnhLlRW+2rVXXfhM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB2713.namprd11.prod.outlook.com (2603:10b6:5:c4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 10:40:09 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d%6]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 10:40:09 +0000
Subject: Re: [OE-core] [PATCH] initramfs-framework/udev: umount /run/media/XXX
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200525030622.28426-1-hongxu.jia@windriver.com>
 <b86fb730228c5c66dc33111de6d9628ab88badfc.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <55841f70-f33f-4f23-8a93-d15caaf91efd@windriver.com>
Date: Wed, 27 May 2020 18:40:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <b86fb730228c5c66dc33111de6d9628ab88badfc.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR11CA0041.namprd11.prod.outlook.com
 (2603:10b6:a03:80::18) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by BYAPR11CA0041.namprd11.prod.outlook.com (2603:10b6:a03:80::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 10:40:08 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20c6c65d-b035-473e-8d2e-08d8022a53d2
X-MS-TrafficTypeDiagnostic: DM6PR11MB2713:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2713627AB3F5B5484609DDD594B10@DM6PR11MB2713.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gLW41wp0snpe1GU8fK0ceLgB/mLQ6okrFnmDOT1CLhbX6/I72S0rnVT4w6UMUwp85BThe/V140KbV7WsB/l1lekLdkjbDrlxMPoZqEvKIeQignAYj6IEhdnSDoq9We0b9q0KhLDB/siBjrzsGDet+2CJIX5iqK23TVeysKVXaUI/qNwKArEnDpxSo5ugfxMSOn2F56xIp/V+1UFsEYB0LxrUcQgU0WUDGoSqVmm97fadYg+2skB+xVPcJH71v/GSXQ3gfArePioO2mMNgtu2nj1F3yMzpHUxDXeaKila7Ct5oEx/F648k5DnWkpY6tsVmKWTV7z+kuSnUw0W9ReoLJMreRNto7gI9zTLxM3PjMAB+8MGBfEy12oe0kH0UXJvMlfHp9GKZLJXLZdVus2dAVArujlYIbzvnDNfMbwoNopzw/jHOZXfQlRoPNhOWxZEUpQDASiYWIrbEJbz1XE07ba/cm67eBYh3YIkbfbK7V6mvTaVYKm3Gki8azaysqLS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(366004)(39850400004)(396003)(478600001)(8676002)(53546011)(31696002)(16526019)(4744005)(26005)(52116002)(86362001)(6486002)(2906002)(956004)(2616005)(6666004)(186003)(44832011)(16576012)(36756003)(66476007)(8936002)(5660300002)(31686004)(66946007)(316002)(66556008)(6706004)(78286006)(13513002)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8YzRUwCvUtVtcV6db91jMnmDV33Nc7qLlZiKlseXd4gJraYEhWd0KvL7wI4i08ZizT/kOdeHGl98EsMJNKJucAk/vPNQSF54SCQFfrGjlDIVaqSSD08VsdNKbD8VDA3N8APQliKRtw9v4QFbF5Goij2W3UUlJ5HdZydUJ9XyF45ztIvvfEiDM6rJO05mm3onozYfMN0DD2rm/73mkzkzVV9/x0FdKcBdDBV8UQg/Qjt5LyiVZ3xAzoF+Gd6yt5mL7smexkZhOq8d9oZRBzEdCEt/JvWt8Q3QEFtAmey22alRjlojxWP9uGPMiIbLjWRelTah94GPR3/HMI0pqKYz7w0Wt5b1tLJ9K1XjKPXC4lLhlDd28spqpBVPeVzhAroOc2daN715elijsAyR+cJTC/eYrP8UIwwVlxg/Sf+zXC/fSOPlYqXd7wBJacFNVIKaejVbdVzL7sj5lrLZ3AYS+iWydpyK31hz2v5OduV/qoY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6c65d-b035-473e-8d2e-08d8022a53d2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 10:40:09.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6GE/8h7fP3FOCCke/E+JWgz4MB5kaFksFMTVSQL6THL8QAAccLOllTjrYmXWGJJYh5FiJ9bePbkXkaTjRhHtNE+v0//QedqYK9f97DPxX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2713
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/27/20 5:52 PM, Richard Purdie wrote:
> On Mon, 2020-05-25 at 11:06 +0800, hongxu wrote:
>> In initramfs-framework, before swith_root rootfs, if udev have time
>> to
>> run (before being killed), it will invoke hook mount.sh (which is
>> provided
>> by udev-extraconf) to mount /run/media/XXX.
>>
>> Release the mounted disk after udev being killed.
> This feels like a workaround. Would we be better off not installing the
> mount scripts into the initramfs in the first place?

Follow your suggestion, I just tested it to remove the script, and 
everything works well,

I will remove it in V2

//Hongxu

> Cheers,
>
> Richard
>

