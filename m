Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.53])
 by mx.groups.io with SMTP id smtpd.web10.23556.1593614764576851795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TlJkTZ6z;
 spf=pass (domain: windriver.com, ip: 40.107.223.53, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnf49W1scXhDwNKlCr7sIvUQQbGdSKxwxJ4jlrmHqsoOIKuMr7HdBoDJCcxX5jpHBqR/Kk9At7YrA9ikNupG9awaX/9yqC9uTMK2/P9TfqmifK7euY4WGq52BI/4OvBrs+NJ2i+cJ5AxHXfJVZgZE4oq7MIR/ibyKphkiFGXKra7dGlTNq18yKtTjq45nsP3pTEotkIaTHMn/VtzYA3LQTUzw9SmG8lbDkM4zP156qUhNSsDc2EdvT4kN34IJh/8NxznyCFwPutWLm/smKQo8rnEq0LxdgZoUPrHWgcPHMZ18aes1i/uyOICCgKzCby65y8FAYw7CJ8RK+Mq1T/yPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5XA5gszufodOY5ZUunfdP3GXzLdyjBLuePIwfj+kvc=;
 b=TWgFfuGw0ssSKT5KXBl71rKrbsYI4qBDN3Vz79Zu2Qz1wb93g5iSLpf5tbJj+/D/POs/7jnFn65c7DlD+3Xu+Hoq6E/2BCLH783mJes3HFXa+odFv+WyNxetgFw8KeqRF+vz40hhZiVhaPj2xhEJ6m7qZPCmjcstojA7RmfAdvGww7Cabuen7wAFHOWW9DiOWsOwuPrFnOr5Ju3OOy6ZXBbPE2S+tGETgwRu2Ka3qm7U+e4HGwavDOKnKkeRbutwBXV9GxyIpAoDi0Mr2WDA+y4Iv2ipl1PPGyE76zN1Le3jVwKIN6OlrEiY97IrPDY85g6EUmlTA5lf/OIJmfGjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5XA5gszufodOY5ZUunfdP3GXzLdyjBLuePIwfj+kvc=;
 b=TlJkTZ6zr0HyJLydrsQd7k4q1+82GXbjutcowr2GNWvwWMRtFpORrhbApE/h8rXOb+R4k7wAG+xpp3msIidb+8SIl3XZjmTwxAE6bADwG4N8ui1DnDYG/jM832U2OqMTMpPyhHkO1z+3q8NkE4PRuq9iQoG9cuEEGPCLmAe3hzE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB1259.namprd11.prod.outlook.com (2603:10b6:3:15::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Wed, 1 Jul 2020 14:46:03 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d%6]) with mapi id 15.20.3153.021; Wed, 1 Jul 2020
 14:46:03 +0000
Subject: Re: [OE-core] [PATCH] cpio: add nativesdk support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200701134341.2894-1-hongxu.jia@windriver.com>
 <e54cb280ad6ef4c7fca308919769da26f115017d.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <bf8b63c9-0207-d525-6b73-579d237a120e@windriver.com>
Date: Wed, 1 Jul 2020 22:45:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <e54cb280ad6ef4c7fca308919769da26f115017d.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK2PR02CA0147.apcprd02.prod.outlook.com (2603:1096:202:16::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Wed, 1 Jul 2020 14:46:02 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aca49246-4bd2-4b33-3103-08d81dcd7a6d
X-MS-TrafficTypeDiagnostic: DM5PR11MB1259:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB12594D77DB5755B4B31B442D946C0@DM5PR11MB1259.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DLGr4DQwEKYYHf63FypBYXgIdnuetc8Jcjw8FHQqzq6fP/pPrABzWRL3smp3lGiiElLc8nxJA3rtTCfHZmRvtSpg67VT2AbRCECg5pIHJJHlpOH8ZqkVNorT0Y1ieEtpnJvyNJzS5d9zrp90MwmOwxyuIm1+NRTn0gwQy2b2pNuW35dMcliJtg56X8uLi36CS/Q8arb7CMI0rki6jbn8dR7c/yz/iOHTczceKlxrVxy4LS2SgJGANMny3M8Av4ulAinDVeC2ianJus4307DJ5iLQaHY+jxtE3Teryf+o90wHRQr7BrdIMNnx5rkom1/yAppfRV2SGcHqF52IRYPMhosPJXY4essPOaCExvYysJqyy50WQj7qCDNFrzdvi3GrDrxnRsOjy4Xbn/wu7l5w/b4/MjUjRNVQcwUlyR2YMQ6PDJ5qVKsyCFSbpV8uBbjJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(346002)(376002)(396003)(136003)(36756003)(478600001)(52116002)(6706004)(44832011)(8936002)(956004)(2906002)(2616005)(8676002)(31696002)(316002)(86362001)(83380400001)(16576012)(5660300002)(66556008)(6486002)(53546011)(66476007)(26005)(31686004)(186003)(66946007)(6666004)(16526019)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pon1Kx7UE+N5VnqhULNxOfdNpDZ1j7M4LbXEbXZja9yMe9sd2qc4RufuDhp9aOiruMcAjct1dQDNqiZAEciRDFdZw6RexZGVvIUbmVTTthf+eMX8MwVN3Yq5c6UyZm8eRQoAMYb0cLRg7jafi1ocyihJAfzzK67ZqmQcXCR4JWLtnIixl3EDFJAxh8mS2xZsPsja2/MI8y4tn/1VZJ27L0qsSUYGNuDq4Rxrep1cugfoKbHB1JyfPUAskjoVrxsbt7P/YXTAQWn8j1LqEMxTljOXGO4Y75x5GtazRUxwWajZsKQG95Kbx5E22s0soVuZHKpzpXb3VeH9qju2CklOy3ngF0Ghh0gNgIHz69KL1R/g8YScswGGIsYau0UFsNUKlBjS6IKaGCEHS3kqrTkv8RoTCopH9cHeQrZ54Q9YjmO1yqMN7cDCmyCBvYR5cXRBAvvD95mXnXJYvpyJYml4JynJbeqvglzQyoRF6rd7m9I=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca49246-4bd2-4b33-3103-08d81dcd7a6d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 14:46:03.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZQ+o/uH8roptDmhFyZ3pwfHtAH10E9509epMl+ccUB/huPRJ40cXVWebW5m+EbIV1D55wFTTwEXA+Lx89eZiB5r7TPqgk/fmEmeCbuziyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1259
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 7/1/20 10:29 PM, Richard Purdie wrote:
> On Wed, 2020-07-01 at 21:43 +0800, hongxu wrote:
>> Since commit [24b80d211f nativesdk.bbclass: set sbindir to bindir]
>> applied, sbindir = bindir in nativesdk, then routine `rmt' is
>> installed to bindir which break `rmdir ${D}${bindir}/' failed with
>> `Directory not empty'
>>
>> Don't rmdir while nativesdk
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-extended/cpio/cpio_2.13.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-
>> extended/cpio/cpio_2.13.bb
>> index 9e35a80f8b..44036f07f9 100644
>> --- a/meta/recipes-extended/cpio/cpio_2.13.bb
>> +++ b/meta/recipes-extended/cpio/cpio_2.13.bb
>> @@ -23,7 +23,9 @@ do_install () {
>>       if [ "${base_bindir}" != "${bindir}" ]; then
>>           install -d ${D}${base_bindir}/
>>           mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
>> -        rmdir ${D}${bindir}/
>> +        if [ "${PN}" != "nativesdk-cpio" ]; then
>> +            rmdir ${D}${bindir}/
>> +        fi
>>       fi
> Please make the check "bindir != sbindir".
Got it, V2 incoming
>>   
>>       # Avoid conflicts with the version from tar
>> @@ -46,4 +48,4 @@ ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
>>   ALTERNATIVE_PRIORITY[rmt] = "50"
>>   ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
>>   
>> -BBCLASSEXTEND = "native"
>> +BBCLASSEXTEND = "native nativesdk"
> So something which was never enabled broke? I guess this was hiding in
> some other layer?

With a simple search, there is a low version cpio 2.8 in meta-gplv2

without nativesdk support

//Hongxu

> Cheers,
>
> Richard
>

