Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.48])
 by mx.groups.io with SMTP id smtpd.web11.10479.1597133466518759969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 01:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NLsV1Vly;
 spf=pass (domain: windriver.com, ip: 40.107.236.48, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgAsc2nb50aEoOlIafkvsrh8hJfhLmj9EueIgM3HLVF/PzFCyyN4GBwMdtgYE4zwJ977afiRK88cH768pEzF9q/peCLpEZ7HSnaY2m40XjrqcImxDYcZKMjTzs3wk1jY4Rr2ihOaheaZskVd6bHuZZpfEeSNXBrUyRwOStC243WNnzaCFFg8Zri2Z3YiIc1Ju1UHajlGKY4JotDxbxW7cOzjgX/wbUof+vPkExH/p4aFUBEhhrcBV4Pvh3lep3uP/zirxWtuQYdAuelTWJdOLKdGuKuymOcCGMF+3u+4wEUPJKTKpriTDPnBJDL2gqNMLoBm9Hpby5HahEs8XS7X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8qEgIQLZ/+/0krUWP33l5zPBl6laAc/WA3YRTLp6gU=;
 b=W6noedWDEWMUS/xVfFISAd5NboxeEUbLJxXujazx47W1kgUJBAigwGgCPD7TxSnWH3HAIPWF6RbcvdxzyrqtMHAT8xsFFUUmieqFB9luHeHyLSY6hHuA1oLwscwKVRRSGxqx/1Ko55QKvGczngulEKHVLIB5wv3NBQe3/KdfF7OJCqqWiToIOTTorgHGXAxX8eO6dzR32O4W11kDJ3UhRfcWLRljc1zWppeql0y9vL64HwotNvdEyk5+2lpECFj6gQ1rmhCEpUJZMmas5nfUI+ggl2cv26d8Zu0lm7Wi51Y3UxrrdqYOMfzj5/RaGjo/JcxpX1NPv7L02iX1Bzl8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8qEgIQLZ/+/0krUWP33l5zPBl6laAc/WA3YRTLp6gU=;
 b=NLsV1Vlyj03s5ovRJW1nEo3v58V/GP8WIn9zx2xncB8VfutHzpjvz3b0CpeaNNi/o16EYAAD1hVHOjAkJxomAuhLt++1hiaP1LGOwOTgDyyZborlKsZNfzfgoHp2b1BN/Ddq8WPoV0uYSO01OW3/rr0dAA0VHO8+Nr7J/K2LavU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Tue, 11 Aug
 2020 08:11:03 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 08:11:03 +0000
Subject: Re: [OE-core] [PATCH] bitbake.conf: set the default pigz thread
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200811072258.4074290-1-mingli.yu@windriver.com>
 <2803933a96d0b791c8cad542bbfec3c3dd67eefd.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <ae3b1594-1a8a-4a77-e777-03d7c6d6060f@windriver.com>
Date: Tue, 11 Aug 2020 16:09:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2803933a96d0b791c8cad542bbfec3c3dd67eefd.camel@linuxfoundation.org>
X-ClientProxiedBy: SLXP216CA0018.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:6::28) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by SLXP216CA0018.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 08:11:02 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c117a12-9851-425b-d5c3-08d83dce173d
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB415052BDBCABFABEB71C5A3DF1450@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FEOiY8qRSihsPQjgVXQdE0HFQR9eCjghbmdc/X+/HJFjLrj+zkuFfcbfBD9izf//Qe3v6fqtqPVOHkBA5Bj8Gk/AH94rh0ahOnqkqybeIlXsBEuEFoEb15cvTu+VQgqp63LYD3d689eo37QuAzdPev5synHrT0ahnO/O+I4Ims4y5qXm3EGfHOJtVmsFZCGC29SDl7i12qg0Wcd7Qzot6kXpQ9dbRg3dNEaGxyrEQbBbZgPMl1jayOn5uaIz+rpBhpsrpk+NOPC5b5adXg0yz5+BJnadmgs3qzo75MwvqVY8cE6EsIrSMrBb4DXM/nDU/lSK0bDzno8YBAwpfB92PdnrBaMW51tpe0M8J3f+e8J27oGQRHReSOmrao8NbSL843KXOQM8fN7HbsCZ11a0asxCzAGT9mB6x+ERUnlB5ME=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(396003)(39850400004)(366004)(16576012)(316002)(5660300002)(8936002)(83380400001)(2906002)(6666004)(956004)(8676002)(2616005)(31686004)(6706004)(6486002)(478600001)(53546011)(86362001)(186003)(52116002)(36756003)(66946007)(66556008)(66476007)(31696002)(16526019)(26005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tZSdezkJwQb2f181PSKP5i9Gf7attbCKtYoZuUCUV01n9vANANIZhL4uKQ3Y/DrweyIaejSIRJmzNxPOYd63NpribqAB3lM8nWeB84wgsFcWqEIELaYt/AXOGudskFMFk+4N4fuHdcBUiQVzDLREMX484n8FjWVqutiz8iTgh6C2Zj6D4hYJ0ns8cJhAHiSRqarPxT1pY3U4OuVwLb2dinoWohqDuT/fL7bd1/O/Did3nBT8ApIHcQP4ZcPdv21HGxGu9Hn1x9/QFSjsVHgYFQp6EYVd3+aKtUpeal3JR3ncNSgE251LVknwVeH3txM8sSNi4CMzdXhkRKd6yc16YphPUpJThDiyIJNMHPObV/7mLNOVRdtcIbQqro9nwIKVKEvh8WyQx/mTTyRtHBFpFHpFWNcP3RItAh8MTffBrTD6t1SE8KNemP6jP45P0k0+/u/xKpYusVm7+k1wDt6KXYOC9vrJW6fZB7VkGEbeuA6xr+grZJvixiGgewo2bx2xSE5rWAHn0tcBQ3VplGZ+ShbyvHp9oPJKtnA7XnYG640F7Y3rQkdpMtJZRNB4QrzoSPULKqoqkw9BKj2WCGzlumEnHb9v5qgOjgA1TOqmnAViOVwvxUIVOZkgY9Rr/75Q2eGCkLNeYnIvhY+odhFI7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c117a12-9851-425b-d5c3-08d83dce173d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 08:11:03.6640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CboleBXZIssmAC4gCG4hl5OB4JZyGWLegB6xse3BvnnaxpvvEe1PzhzgbDzoXU8dflo3Ep6ZneihnqfZ9Of0SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 8/11/20 3:57 PM, Richard Purdie wrote:
> On Tue, 2020-08-11 at 15:22 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> pigz, which stands for parallel implementation of gzip, is a
>> fully functional replacement for gzip that exploits multiple
>> processors and multiple cores to the hilt when compressing data.
>>
>> do_package uses pigz to compress data to speed up the time
>> if there is pigz available on the build server.
>>
>> But for some big package such as clang, there comes below
>> error during do_package.
>> gzip: stdout: Cannot allocate memory
>> tar: TOPDIR/sstate-cache/20/80/sstate:clang:cortexa57-wrs-linux:10.0.1:r0:cortexa57:3:20808f8a746b00ec9470a81057c8595d878cfe8c565cfbcbbaa3ea870528ee34_package.tgz.QF5dss8M: Wrote only 8192 of 10240 bytes
>> tar: Child returned status 1
>> tar: Error is not recoverable: exiting now
>>
>> So set the default pigz thread and the user also can customize
>> the pigz thread such as via PIGZ = "-p 3" or PIGZ_pn-clang = "-p 3"
>> for the individual package in local.conf to avoid eating so much
>> memory.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/conf/bitbake.conf | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 353caacef9..bc87e78d78 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -804,6 +804,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
>>   XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
>>   XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>>   
>> +# Default parallelism and resource usage for pigz
>> +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
> 
> Why not just set this in the cases you need it in and leave the
> defaults alone? You can just export it in the tasks which need it too.

Actually I just want to use this logic in this patch altogether 
PIGZ_pn-clang = "-p 3" in local.conf to limit the pigz thread number for 
clang.

Without this patch, I think PIGZ_pn-clang = "-p 3" doesn't take effect.

> 
> This change actually makes the sstate number of cpus specific which we
> definitely don't want.

 From my understanding, the default behavior for pigz is to take all 
online cores, it should be the same with  export PIGZ = "-p 
${@oe.utils.cpu_count(at_least=2)}".

Thanks,

> 
> Cheers,
> 
> Richard
> 
> 
