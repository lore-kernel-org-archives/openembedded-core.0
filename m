Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.76])
 by mx.groups.io with SMTP id smtpd.web12.2098.1618793684423832347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=REK9YciH;
 spf=pass (domain: windriver.com, ip: 40.107.94.76, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqc7dWZcQpoQaRxk6BszB8DYVaBVA/yamBTxtRy6TcCaexyq50bve0cVOVnxsedw715oEUaXZOd2axV9Dfk0pOHGcqoOfTsqZsbnaeSvz184qBrwddvSaqfvONn0roXVtIqpurMRTrG/FDo9O3sFre65WA8uCyrcRadc+A7lfgQBnSH4RDpQ8dY/4MyNuvu06IX2nw7VVSABjOUYQGNAVQ8/zxd8+FP2qYVKwIuYhOK1DoSqj5FQ8Ac/u1+CcByPTZymkCWywVG/hujNI0catQutjl6mnfoqc7f6AY3tCCHMfVJrLpr6T6QmPlkJhwAWOFSjcHKsPaRLnqcLmUonnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INSO2Kjax6VXjpAkev1lmgGXQ0E/ODUmNVkU/VzKh0Q=;
 b=hD9Akx4oYm41kT4BdG/ByfS7P1iZoTH0tMoUBKuLbX/Pd6R3g+841jznjtyMYL5HMiP5VPF6d5DLq1cnZOHHAECtQ1ebSwG8WV66RSiGd5XgYRVZRZc4YdzsqLeB6J/FwqM9csTIDziRE1qR93f/09tvDZ3QM62QbJ6TgLZ+XCZJeCzWqW9TajTamaApJ8duMtPQzmFb21PsA54+3/N+Xl8V6VizY886AQ3BrB1JbXxHdrnCTPdd2PVze5ySDIomW6g2z77blNDpFhfZR8fWoPwFPzZBYmKA5WnG2HfTVdUbt5wVYOrdA5UQpKW34v+Hp2B3Zhc1WK9X04b81H/L6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INSO2Kjax6VXjpAkev1lmgGXQ0E/ODUmNVkU/VzKh0Q=;
 b=REK9YciHfc9ACXIDGg4n9RCDtWezhcTrGziVQINrwRAdT7OBYnGI1NkVD0VhyBJxsGdn85v0CN8ZGFbyt9hHXq4xILk4ebW3tbVYHwdOJvkQaGFJHOsSbgINPTc725kbIp1Yq7cqAKxVEWdkiRq+vdryTxGGdAtln8JgemOQkDU=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Mon, 19 Apr
 2021 00:54:41 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 00:54:41 +0000
Subject: Re: [OE-core] [PATCH] oe-time-dd-test.sh: increase timeout to 15 sec
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1677026B4C4FCC42.11056@lists.openembedded.org>
Message-ID: <d00380f2-3214-f8ad-3faf-454d932878e9@windriver.com>
Date: Sun, 18 Apr 2021 20:54:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1677026B4C4FCC42.11056@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:a03:39e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 00:54:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc8b69b-9a46-40d2-98a9-08d902cdb6f5
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB25383498978DD4A56CF1B3D8F8499@DM6PR11MB2538.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GlhIaEetrd/hQkjfjc0XEVaus/SuUZDtjE2k+FXuxSu0q9giejyKsVT1tpF/ItIKW840PcLWHRXULcIkDPtdX1e0LV3IhFMCUTA2TfyhbS2D3sC+qUVzr+NtQsn8KXD1GDoLnK9X8G/oidJR41/wKzue4gs4XuUtR6R9Bglu/qS6TkX2LgJHd33S6lF/RtSR5ixwaA965OgOKtpqgvBieHLyDS4OF05EQWJTP4hnRroxexnEoRVtp3kaDBhCtvv/myWlMfRceAjkkUOACL9BkUOUK9zRMhSF1rnfXFbbSMx7y4E1DvGOzbJmla7gJ4PoD+n3dW0a4z5nEeefVVl2vHp6Cgnum8wkl6JZDqRK0D5l6nEMUr1c2HG2/wHQW5ocnFjBOhV5J0r7GtBsKeyNOkJ29HKR3wQclhz+yXQsxQSeBNhDTLF+hRf2le7Wv7aNVEpkM6quoci/oQw+5QlvJ5NgeQQp9rdIlhpX5aC9k0ktKIVLqGNFYa6coIF9wUWX8M42G4FRD/2Jkew/VHTKeyxolo3WCljJj+hpsVh6OdfPHkYjDFMg8DPTPNQxF5rDHMLv4s5XqYDzs4sjKvK55j07GiS67yy2A5Z2mCEKmXO4s+5xVAZKzs/P1W6+hfyIxDHbO1KOdSdGnoQN/h4uOoHiugO/wMAiu1glAWRKBA0rvaKMbJq42SqTlEJTU+QGxpo+8SpUY6lagzP9XrnkG8i68pOCTMym+ee7KLwNLJIWowO7faaEl3CYCvtYbZSCvCuvSExX2xPGN/INylfoB9n1rtbqcLifhnUu/LT/H40=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(346002)(376002)(366004)(136003)(52116002)(8936002)(83380400001)(6916009)(36756003)(38100700002)(26005)(86362001)(8676002)(316002)(66556008)(66946007)(53546011)(38350700002)(2906002)(16576012)(5660300002)(478600001)(31686004)(956004)(2616005)(6486002)(966005)(31696002)(66476007)(6666004)(186003)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dHFPcjhkMGRWNTBHQUR4bk5FQ2xoRm5KZ0R3MG9YVmVKSlYxQVNIL0xHSndn?=
 =?utf-8?B?R3RZbS83MU9iMTUyVmFQcndiK091b01kQU9KemlubXNMUXZpUGc3SjJqZzRx?=
 =?utf-8?B?QnA2Q1UzUVgweFkxQ2hJdTcxWHpweUZmUjRrMDA1ZHJMZGVhbGdqV0I0Qy9o?=
 =?utf-8?B?UDZORDhRZWI0emtKRHdXY1N4WjVDMzNrYTJ6MjdabmRtOU9iOWQxVjlzcG5U?=
 =?utf-8?B?ZGlFOGQwUFVXNHdKQTNHZE03UlNBZHFwQzcvQUxERnNLeXhuWG9LNHIzcFZv?=
 =?utf-8?B?QkVrTXVzUnV6N09QU25SYVJwQysvN0t4Mnh2TEZya2IzQk1FZFJMdHVIcnFp?=
 =?utf-8?B?QzdxTXVqdUhwVzYvWktuVzZaMmowQ1NXeDNFV3pHbFIzeFJKV0hkeU9TbHpG?=
 =?utf-8?B?aklEQi92amkzR1hMM2lsSzd5VGdzV2lLQVVCa0ZKZ095ODBRSitER3J0OHpX?=
 =?utf-8?B?T3lwV1F4dnM2SU9tZ3Z3Z3Y1bHNFY3RlTGpPYnZKREYwTytDVTZKNGZJZ0FI?=
 =?utf-8?B?OWE1OEJ3Mnp0OUdHd3ZsendRQk5QTGs1RzdzbXp6VGFCZkhHRUpBdmZKTW5V?=
 =?utf-8?B?dGEzUStPV2NmcktMb05GU0JTcXZWNDNMTENQVFkwdUpTN1pPTEpZNzJwS2Fo?=
 =?utf-8?B?b2w4ekYxUTZWYm4zSURGZktXczNURmlGZFdTZDZtL2FLWFdNUDBlQllPQzVy?=
 =?utf-8?B?R3lOdFFPczJuV3lJUmhMWTQzTVlKMWFuYlZFU3FjVGUrbmpLS1MwRmlBU0ky?=
 =?utf-8?B?Y2FIT1RmSktPdU5hcWRIL1FWUWxFVkNYcnp0MDZTZ0UvbkZiZGRnYSs1QWFr?=
 =?utf-8?B?dndpY1VGUVE5T01LQ0NiSXhuQ0FHWG91a0p5Y1BldnVnQlNYZkxMYU1SUEhu?=
 =?utf-8?B?QkdRYTRUNWticE5sdmZXaDFwVnZHYnJzMTkxOXlPMDdUM01Bb2xJOEVzZ3p4?=
 =?utf-8?B?eFRyVjliQi9PcUdvb0RFUFNxZzV0ak9laCtGc2tlbmpJRTVRTEk1NzZtODR1?=
 =?utf-8?B?TzM2T0QwZzlCOVVnNkJZS0pWTFBFdXdYNElnVCtlRzNnOW8rMWhzZUV1RXNZ?=
 =?utf-8?B?WThRUStmR1gxcThWeEJKR0NMd0JmcDdtRDg0K0FQL0dpQk8rY0xORVdJWXEw?=
 =?utf-8?B?SzNzQTEyb2xEcWxCMERBRSt2TWQrVHpvT1ZhcGkvdFNUVGVhVWk5QjFpVTRC?=
 =?utf-8?B?ZmswNWJyb2lSdklFekJxUVFUVExqYU1kc3NSMks2dElZY0Npb1JqcTMrVGNG?=
 =?utf-8?B?NTRGUzhxSnpHLzdwSGtRY3V0dEF3S3VmQ0NSN3ZxUmhpNFpDT0lHaEZpekNw?=
 =?utf-8?B?V3NRVHdMbmhVdG1obzlUWTJad3pUd2JXR1NGU0tiVmtCTCsxcWJUK1lGSWl4?=
 =?utf-8?B?Z0JhVWlJb0VpUnNKWGlpY2FsM0w1TU1hR01wYUJXL2RvemVHbmtTcDluM1pu?=
 =?utf-8?B?Nkg4OXhFVlFqUEQxOHRmdkRhVUZJMSttbXJ5SE5rcWl5RmRndjE2RFJ5cWtJ?=
 =?utf-8?B?NkJpczNodWs2ZFdIbFZ6UlJJZnoxKzhOK2xnVGU2Z01KVW15bVhwS0t1d0M1?=
 =?utf-8?B?MUpnVmd5bUhPL1dDd0FEWDR4STY5UHdwVnpWUzJhd1RkV3hGR0NlKzRrYVhI?=
 =?utf-8?B?MGhHL2tDMis4QWI1RVhVN01sajMzRlFaUWt4bjgzQzhqRWVvUjdUdjErSFBX?=
 =?utf-8?B?YjkxbjAxV1VjdjFOT1VPdGJoQU9MRi80Nlg5VmxPZ3N0bWJzV3l6cDN2bW01?=
 =?utf-8?Q?yHlXbzVGeie7pAbqHaRrr33W9ybQ0IVMG67vjG9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc8b69b-9a46-40d2-98a9-08d902cdb6f5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 00:54:41.3224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Foiis0d5RipwaLOq9QtEz7NeJkHSUUsFAkaAtBIbINnn/XDDQ9I7ZgRJht0KbQjYXvO0aQmX8VRw4Y6/OJsava8fDcbkPyDhbRsc/sSS5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2538
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-04-18 1:00 p.m., Randy MacLeod wrote:
> With the previous timeout of 5 seconds, there would be
> builds such as:
>     https://autobuilder.yocto.io/pub/non-release/20210417-13/
> which produced 17 files with top output with top running 454 times
> and that's a bit too much data to analyze for each run. By
> increasing the timeout, we'll find the worse problems
> first, fix them and then we can decrease the timeout if needed.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   scripts/oe-time-dd-test.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
> index 5b25e6bd97..459071e732 100755
> --- a/scripts/oe-time-dd-test.sh
> +++ b/scripts/oe-time-dd-test.sh
> @@ -13,7 +13,7 @@ usage() {
>           echo "Usage: $0 <count>"
>   }
>   
> -TIMEOUT=5
> +TIMEOUT=15
>   
>   if [ $# -ne 1 ]; then
>           usage

Please merge the corresponding change to yocto-autobuilder-helper:

[yocto] [PATCH yocto-autobuilder-helper] config.json: measure every 60 
seconds

before this one.

../Randy

> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
