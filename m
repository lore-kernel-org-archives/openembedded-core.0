Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.72])
 by mx.groups.io with SMTP id smtpd.web09.36866.1615215026038419621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YZyG8zgk;
 spf=pass (domain: windriver.com, ip: 40.107.95.72, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTjtDAfIxbcW+qjLgB8DgqiNYfnUe0rvzEYsg4MfyMFhhkC0UdMELyXp/nqrC7w4jjKNg9Rob6OR/Tn2SwNx52ZbjQ/eznHaOmjEJLjVDD4jiPyMfRX342Ql7dUA27mojgsRe+BxL5p8HavADf9DAwTDJLG89RZ0TFQNJsm73v5LGFCb3/7q+khnKF9IOhU6Qw6ijt83RQFqZzAbwaHzGNTKnO/63P9Opc0an2tTbLTsRvnAUbB90bhBh79RS/tR5OehZb5CmFZfMvrukbDF5Ro402eFOm4+1eAuUhhxsfUzHzKWpNlf1ZFI6AH+1Ut3lxIbi2jiNdzF54NFDWKCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYLzOZgaCrCzU3gOuETc42Ev6tELh8LuDIXuwkFtK98=;
 b=En+szrv7IgP0qYbgKrPR0zWd4DBjHdewtf/mLuBIwYStw5zLZOsa54rF1bZh5LyfzXjKQzSyS4N/QdYu58Gt1o778FGe2xQJuPGuBf7ayvg4j1APm3xtIsDLO0soE/q/tLDj96xtwWM5I4d6gRhWHVOhIrE+In8LOPIcEm85Ip/gc5e9QF67Icg5vawaOLW1Pgrot88BoviU0+FjGg0Nax3UMIZ7dgXPpmQWT00s0FrgbfIj2FllSdbQc4eu3uYtmZPFGTwM7vsI560QoPDnq+8h69lZ6QmVIbw5Yya2xHpX01SVptv0PRGmzVT5uVEJMZFZfwWY88tZAYb7ScAo2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYLzOZgaCrCzU3gOuETc42Ev6tELh8LuDIXuwkFtK98=;
 b=YZyG8zgkRYx5zzeBJHHO/TMFLdAzQEu/yBcBc9BmbVy+WTjAOskOstr9Kqm6Zb7SLdtk8pUOyGDig6NAnuvrNo1qWbf57tligd+1sa7+2/lDm+6TkhRFZjQ0h/cVSf6G7bVl5KyzXHuhoh0kNp9jQ3XcouSet6BONJr1cXfJHXQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4075.namprd11.prod.outlook.com (2603:10b6:5:198::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:50:23 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 14:50:23 +0000
Subject: Re: [OE-core] [PATCH] scripts/oe-timeout-dd-test.sh: add script
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210307205817.5679-1-sakib.sajal@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <a8d69435-a6cc-4daf-a22a-cb190c04f781@windriver.com>
Date: Mon, 8 Mar 2021 09:50:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210307205817.5679-1-sakib.sajal@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR13CA0090.namprd13.prod.outlook.com (2603:10b6:a03:2c4::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.23 via Frontend Transport; Mon, 8 Mar 2021 14:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb2d02d-f378-450e-cd05-08d8e24180a6
X-MS-TrafficTypeDiagnostic: DM6PR11MB4075:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4075248D12E804CA5B822085F8939@DM6PR11MB4075.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tbh1pVvLghjbc8GzVS/IstuyFD+wvkZtxxE2zWdPM+YegrBAHPTArSWMtytqMVTOQJJT/cRblkjbNmKwPMMIsXYxbA2eZZ5xLqT8e0iTSVxxDgVcf3HZLFEiJKfCDRwavrseSjkNh+iaRKb8jUjD/+1jRc6cReEiSqlRk9sS6klhgqRSUG0nLO5YH6rIRf3HLOMNsNadKzCY4U5tItkZ1pu2aS0I+4E+y0zFdwFiSW6NHHsdZs1oQErqJxOi+MyWhfC1wOab4p2UcT+ABSJKOZiMDSuKqVNkzDPmm3ZtcL9LtGuRZpHpEORvgXmJGcgKMAYU77ettI0C5SfTOH2FOFcP+h701RIILpuFEurQOoiukGyf8mg98sDFunC6dTVseaHkEdhu3PVMebghuxOCq4AYRO2FlUsM05djvw5zfF8dOTXCJF1mTg+i/iez2T0jCk1NvJJe/X/SeQB4T01CinnCld5oXI93z+mgu8tMTJGz0yxT833/fXhk1qx5SfR9vrTdDD0waCQ/cCoKqok/gaiQbGIF4hhL+0SL3MDrZLoZWUCEuNAYqfY/Y/XL+JjjUDcS0PSHvT/YiepjXdw1jsSVRW9wjrKaDXh1x/mplVH5lEErkv0Yo7Y8daiRYR+OkjQCSX3Sku5EvhH98uzUY9swosw0gAVTpwffuBaflHlJ3/vU2WpPQnTs0GaOs4H1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(478600001)(8936002)(8676002)(316002)(6666004)(956004)(83380400001)(2616005)(66556008)(66476007)(16576012)(2906002)(66946007)(53546011)(31686004)(16526019)(5660300002)(31696002)(86362001)(186003)(26005)(966005)(36756003)(52116002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QzRtNXlLeVRIT0hYWGJQWkNyRUdBTTZKZjFnSmcrZUF6eEJFcUVQdVMzTnBu?=
 =?utf-8?B?Y3EwVElrLzNyVlU1bWx0M3ZNS2Z4MjNTZ0xIeFVQTE8yT1MwSVJqMk5nQUdo?=
 =?utf-8?B?Y3A1eXlENmV2bDZ3RWJBeUlNT3l1OFc1TVhHWW1LNkNFbVFjZFNjd0VoTEVO?=
 =?utf-8?B?Mk1UeCtYM0tTZUR3SGFhZWJLMUJqMjNzUmJneFV0RkJMYmhjTTMxVGorVlFB?=
 =?utf-8?B?NXcyN0pONmpaOU1LRUNQTlBXdVUvcmtSdUU4MWtMbkpIMHRsZjhRZHpqTzA2?=
 =?utf-8?B?a1FKSFJlWWt6NDYrYlpGYjhXYmZDbzlidFBHTG5ueVFmTXc1U0NKdGQ4OGZr?=
 =?utf-8?B?SmloZENCaFF0THFOL2crN1RhY0pkamdIeTEwRTN3VE9KWGN4Um81MlorOVg1?=
 =?utf-8?B?R21rdnlBejNkSHJjS2luQUU5WUxERk5oRnNybVNvWU9TZi9xQ29ia2ZnK1N1?=
 =?utf-8?B?RXpyNEozRVpUbys5aHl0bmt3cGZzK0JBZXpYYnl6QkpLTTdrQXd3OWJYMDlu?=
 =?utf-8?B?ZWJtckFBSENpc3E3OEhBbkNiYW5NZldhQS85MWR5S3FlMnBSRkZJN3lVNjU5?=
 =?utf-8?B?aVJKUTdDSUtNNXl3OUR5WmdSbVkrYnlpZDFHQmQ4V2g3WDZrRzRYTHlOR1hE?=
 =?utf-8?B?K3IvaXVSZjJRMTJpQ3JmOHlFS2lsNXh5MDlpbXluTFl2MzNTd2doOHRiNGNY?=
 =?utf-8?B?dmVKUW1xWlM3aTJ1SURUb2ZGdTZMZlY1QUVjcnMvbHd3dmF3U1M5S1RjUUlH?=
 =?utf-8?B?VDRnWDFOaWZ6aVB0WVJNMnBzb200ZmNQUFlkV0Y3dTJMcDFydlZVS2ovSUZK?=
 =?utf-8?B?TXhpb0tYb2x2YXN2bklMbFZ1RFk2QkdIaG03Y2xqNXNtdzA3MHpwamYyckcv?=
 =?utf-8?B?dzM5OC9MSTZzMUtsc2tzcW9xTWsxc0hVTldXSk00Z29OdElSWjhhQ3dtWnRS?=
 =?utf-8?B?Tzg0aDNEblQ2M0F2ZGVNL0txamhVSlMvM2pDclZGVlRwcWIvM01ITTZqMC9z?=
 =?utf-8?B?Mi84djFsUVhLL2ZtcGYzMkJ2NjNzU3lxSmdjZWVEejVTaHN3NEw5Q0d1YlBa?=
 =?utf-8?B?cUZJcGZTN3B5OGxmQVoxMmFGYWJ6ZkJqQ2hkc1pUQ0xIeEtTOFhjcUFOTEIv?=
 =?utf-8?B?NjVYT3ZScnpXR011bWJqR0tEVEN3Y1hJR2EzWWI0Rm5zS3VndW5HTXdzVHgy?=
 =?utf-8?B?b1hGVlRWWHlHTUZRRHRTRnR3VUVCYXZtUkxiRVhkRy9DNWo2K0czZU9HM01q?=
 =?utf-8?B?cVkrQThFcnBlODdRNkxuYkNKRG1XR0N5RWlwNW9sUUtCOWNqTlVmajJZOEdl?=
 =?utf-8?B?LzZGb0lWbHM2N3BNbUdaOVJrQ0huVDBRcVZnL1phem5RTFo5dCtWcE8vQUZU?=
 =?utf-8?B?Z25vak5jZTV4Y3BNNzMxSFNEcTJzeFNpV2p3cWZTaTZabHdrUWI4eHFwL294?=
 =?utf-8?B?ZGFoeHE4ZVZHa2I5NjR3UUxDYXlXd0tFdjFuM0RxRDhWZjQvZHdTRUNMdmlj?=
 =?utf-8?B?UnpBSThJTElyZjhMTXh4R2MyZmExQi8rNmh2Nmhod3FTelZ4bElBazBtZXU3?=
 =?utf-8?B?S1ZNajVQRUlsOFV5eW8veTNLYWNsNERUVWxIYm1tRnN4N3FxUmx1UE9kdzNw?=
 =?utf-8?B?cXRpeG5Oa0xnUm1sS0huM1Z4eU9WZzJXL1JmUUZxSmcrak90RFo0dHlDczJs?=
 =?utf-8?B?bGxQTVBVbWI2NFBsbm8wcjNSTWlQTTdQQTFXMnZ6TysySndmOFo2REgyUVEw?=
 =?utf-8?Q?5DxRnl99kFGL8yCO2GH7uuS8y7EP+2OtXOT4uWD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb2d02d-f378-450e-cd05-08d8e24180a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:50:23.3740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL3nsUdxcVaBqRTO3FVkMn6wL4OjMLWKU4mUVqvxmsjRJY0ZYCKCzl7MWFWrEH2N3ZHt6VrJsx9Ja1cG/bHXEiBh1wSn7IMh8L1C/23xu84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4075
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-07 3:58 p.m., Sakib Sajal wrote:
> oe-timeout-dd-test tries to write <count> number of
> kilobytes to the filesystem within a specified
> <timeout>. The purporse of this script is to find
s/purporse/purpose/
> which part of the build system puts stress on the
> filesystem io and log all the processes.

> 
> To use and monitor a build, add to local.conf:
> BB_HEARTBEAT_EVENT = "<interval to log data>"
> BB_LOG_HOST_STAT_ON_INTERVAL = "1"
> BB_LOG_HOST_STAT_CMDS = "oe-timeout-dd-test.sh <timeout> <count>"
> 
> Log can be found at:
> $TMPDIR/buildstats/<build_number>/host_stats file.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   scripts/oe-timeout-dd-test.sh | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 scripts/oe-timeout-dd-test.sh
> 
> diff --git a/scripts/oe-timeout-dd-test.sh b/scripts/oe-timeout-dd-test.sh
> new file mode 100644
> index 0000000000..40b3948c32
> --- /dev/null
> +++ b/scripts/oe-timeout-dd-test.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +#
> +# oe-timeout-dd-test tries to write <count> number of
> +# kilobytes to the filesystem within a specified time
> +# constraint. The purporse of this script is to find
s/purporse/purpose/
> +# which part of the build system puts stress on the
> +# filesystem io and log all the processes.
s/./when that happens./

It's probably worth pointing out that <timeout> is a floating point
number and maybe provide typical values such as with a HB interval of
15 seconds, and 0.5s timeout and 100 KB IO, the result is
no triggers on an isolated system whereas say ?0.1?s and 100 KB IO
results in several triggers. The idea is to give people a starting
point.
> +
> +usage() {
> +        echo "Usage: $0 <timeout> <count>"
> +}
> +
> +if [ $# -ne 2 ]; then
> +        usage
> +        exit 1
> +fi
> +
> +timeout $1 dd if=/dev/zero of=/tmp/foo bs=1024 count=$2 >/dev/null 2>&1
> +
> +if [ $? -ne 0 ]
> +then
> +        top -b -n 1
> +else
> +        echo "success"

Do we need this else part? It'll just fill up the logs?

> +fi
> +

What values have you tried and how did that work out?
On Friday, a build with 100KB and was it .5 seconds and didn't
see any event exceed the timeout, right? We also ran several builds
out of a shared local sstate-cache and didn't see any event exceed the 
timeout, iirc.

../Randy


> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
