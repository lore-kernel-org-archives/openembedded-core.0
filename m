Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.58])
 by mx.groups.io with SMTP id smtpd.web08.5298.1616046008545690310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 22:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oTrnTCvG;
 spf=pass (domain: windriver.com, ip: 40.107.102.58, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpWjP1TeIdw3IPNNZii1HXqfk+gibxZHAFm+MFnOz9tG51JmgIAK0wpKgXGKp9AiK+T3F2eNwZaCs3qyTmszZ53iKNKzrw0y1VSxY8OUuJtwx/KvCEB9llSFUoN2QuHgg5tIQt8UkjlBxnp5A/CDsbM6p77PPHq9lGWpUDn0CZOvX6Fxeb3SOfIoxal22Q+iZT+1G5PSAw8FjASAac77bgzSUXpxqWxEO7I5dxRbE3XUj6/+GomIwhy2ER5ktGscbCzgaQJ24AHNrYsvoXPY4kKKFt4oJyiRq0p9S562J+f4rEhGl2/p6+xQ3AtcfhPeT1VoQ/jZ28mqBXe20cLstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7Pkf0csSce2V2HRVOQPKVvoUI5NVwerrcQHyQ7NAeU=;
 b=NIgeXXPm6XlpfjYTzOd5cNwmMdQuDrq5pOweOkqZGzrYMvXDlSsU+JUh2NcwkYDmI1lnSIjQxFYhgYjZf7YPXkV6G9vXwg6J+2uNR52mWg7iJeJNLtt+dr+dHjfpChrFvL8rxHtg7D+S6Q5KT1rrrJVtp9SvsHQaZdPH04SqQmhH5amtEkF9ZcEGSE5GGi2/DzQibZfQg1ie5hDg3o7XJiqwVbnvwAanJOw+OsFwmiZ1xtE1hPo1r/2wl/NXSGKkY9UOh2IKvG7q2Zbs444Jzl8/xQ/5addBZgbj7MfHLJZ+fVdFl2ssBMfJ5uKLDCEem8zcZ449dN0vD400Hl8aXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7Pkf0csSce2V2HRVOQPKVvoUI5NVwerrcQHyQ7NAeU=;
 b=oTrnTCvGamE+oOvPWvllXyFH+ujOtuKD90zZYys+Jq3rmA4Hd4ca0B2cdJEGu+TRqTpzcqZGqrLqi/09pD+4GrkbPFeKmgoPwOuxndS5WqxK7C+dMgtpUGkpijhkMJg2FmtoBGjgHz5r+h3WwOe/+Bc3JBBbEKtdAS3JI3HES90=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 05:40:05 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::447c:865d:de63:389a]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::447c:865d:de63:389a%6]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 05:40:05 +0000
Subject: Re: [OE-core] [PATCH v2] autotools: don't wipe elfutils macros
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <166D505781F5EE94.19946@lists.openembedded.org>
 <166D50DC24E9BAF7.5206@lists.openembedded.org>
Message-ID: <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
Date: Thu, 18 Mar 2021 13:38:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166D50DC24E9BAF7.5206@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:203:c9::8) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HKAPR03CA0021.apcprd03.prod.outlook.com (2603:1096:203:c9::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend Transport; Thu, 18 Mar 2021 05:40:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5ef83bc-71ee-4a27-1020-08d8e9d0487d
X-MS-TrafficTypeDiagnostic: PH0PR11MB5078:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB507883877FAA8067777DFFDBF1699@PH0PR11MB5078.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k7RoDh4P5jjcyq8LeBe2Sc4XDP7rTjRTRZsvNYN/SE/ySRrzUvu96xgsXew5xCZOL95GNirN+KNKMaJmU1KMN8BkR5ik5WIiKMLNuEbMVnvviKAAAvgshKv3dYpCqdR2MqK01sVPEMWoaYROsRjYGy+hMJATBukwQMugiZgynbSe9xBHZ7pCBpBOPGru01f7CGaOOtj5Q/6UprXrTvwyYxkPjFZqAAqpU8EVAGTnWgkghAxaIPTSCqbTVj8WvkqhKb8SORVM7PWjD6zsUEPh5pEh4c8qDbKHn1w+4Gtg8jebEVCzPJa1XybhBxhc0vW2486mGJkZfQEoh8jPakPaJNt3aCjuzeEWBEjPtD84yE2KZwgszE7ppEEDN2YiYcLVIgysmCp2F2aQCLGTNBpKvxVdCOXytjIM6exk5ulC8od8DYOOA0EpA/CVxoQLgiAvYuayxK+N3Zi5w0eYhXC/IQXdsgJnIpvuGOJrCoUXWDBKyDqDqgFN9wUd83VPqb9pu7PPg8ru0H5TewBCVSuaxNujsKgeqx8G+jblC+7xbMJQKqVUIxUp1X3kEm7fJgNkjhS3A1Z7FkE4DclD2/ZX9B3rNOtpKwbJ5kO4hNIjYajtxR/RWi7/0E8GN4SbZvyXUKbHwAmvbTFtdaoTSBDtEc2j6qPqK4hQMDYEFR5LkYaFSIbi3cBFst+B4+1tHvPZk76mjNVZiqBFxJ01nKAkoopHq3CdLZeABqnT2fD1Afv0vjgE974vcxDi+JPSQmeCUMnqiVzuLx+FiUnUXbIoDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(66556008)(6916009)(8676002)(66946007)(478600001)(26005)(5660300002)(52116002)(186003)(6706004)(316002)(966005)(38100700001)(66476007)(83380400001)(2906002)(53546011)(6486002)(16526019)(31696002)(6666004)(36756003)(8936002)(2616005)(956004)(31686004)(86362001)(16576012)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WDV0bkI5b1BnTmNPZjZ4T2U0Wms0WFJ0T3djamw5Y1VHVFpiSGdTOFUzU1Jp?=
 =?utf-8?B?SHFzY3pEY3locTZ5MjRmUjhJQTU2TDMrak1iWjg5dUp2TjJmUzZDOWJXYXht?=
 =?utf-8?B?Rzd3UGx3UHlWajhwNHAyaVFPemxWaHBQdTk2ZzVzMzRoaVE5MElHUlZNd3Q1?=
 =?utf-8?B?WDlMTTVSamtvYVJIUHRaR0FDY0NGRE5xU2s0NEFsNkNpejlvMVFTMHVBbUwv?=
 =?utf-8?B?YiswMXRvNkpaT3hscWVrLzVCYW95bFNEcWRNdXlMdXVpQ0ZVU2Y0Q25CVWlx?=
 =?utf-8?B?VjRJWVRtWkx6bHEySHlPNUlYcUo2RE9OQU41bGk2MmhiWjdFYlRYTTFhMnZ1?=
 =?utf-8?B?eGhnRlMwY3FMQ0hUU0wvdVlMaW8ycXkvVmsvemdTdFpNT0tBTWlVekFHL2Nm?=
 =?utf-8?B?a1g3WmN2S1JyckR5OTdudmxFemEvQzZaU0tydWFXa2xlbFBhRzZ0dGZpbHBq?=
 =?utf-8?B?V2ppenJ3SlNzdDJlMUtkamtUa1B6eWRuVkxrcXd6Wlk1WStCZHFKSnZnZnFG?=
 =?utf-8?B?eVRPOVB4YlptUGZjUUZsLzFtVUJzU1c5V3ZXek8xdlVZRDltTXNrbUdVNnNy?=
 =?utf-8?B?ckVYOVZTMUM5ZXgzUWZ1YVRPbmMwRWV0allmYjExY1pxbDVGRkg5S0hnWFF1?=
 =?utf-8?B?RHRDbDZPdTZIbGxuY3pXNkxzWmJsbUQzOUdKTXBtSmlpcGRsVW9NZXZLdXhM?=
 =?utf-8?B?L2VoTzRjQWJ3VDF1ZHl0YzZvVFpEVTVub3YyNDRaNHg5anRjeUtRNHlvOThv?=
 =?utf-8?B?M3QzcjEyS2ZTU3V5REk0REY3M1NYeDhRa1VTNzhmL3lMVktTb2JEdEpOSS9G?=
 =?utf-8?B?RmRkQjBvQnZ0MEpOak9QTDdaK3FmYnNSYkU0clhISys3L3JEV1d4SUwrOWdX?=
 =?utf-8?B?UFIzaFlWbThEemR2NTBBcUNNazYwRGRHREdCR2hYRjBLWTcvamdKSCt0cGV5?=
 =?utf-8?B?SGhza3pBRG9USG1TQkZGSVV4NkVsSFZQd1k1ZzNmd0g4RDVtNDRWcUgvZDYx?=
 =?utf-8?B?RGhMUURGMlJlMDgzcVRUMzQzTE5TTUp3ZTVGQ3M0YkhoQU0xUThldi9MVjNx?=
 =?utf-8?B?ZDVXNHhhanNOUjAzbk41OWF1YytDeDE2RGRhUjVibDZVUnVvM0d1QklqTUds?=
 =?utf-8?B?a2JBN0hqY05VSTBIaU5JTVh5SStxbVhLVGxtZlNBNG8rZjJSazJRUzhOeXdU?=
 =?utf-8?B?eUZ3aWZRM2NoUXNJazN3eUZtQkJBNUc1YW9Zb2JZUjFGU1R1UkVXMlNtQ3p1?=
 =?utf-8?B?RGlkQU8vNEUwV1NBdG4rU2t0UW9yU0g0VUVMbytQdnVzOURVYmdsS29QQ2t0?=
 =?utf-8?B?RktqWk5Gcy9wcnlvb3VJUFJHR04wOEQ4N2hncjJ5czZtNXdpamZQUDNLMUxI?=
 =?utf-8?B?NlZyUUlVQlEvRW52dU5zUHNJZ01ESmgwSFI0OTNGZVpOc0RhbGlZc0NlVWw0?=
 =?utf-8?B?cExzdEU2NVBVMzlKWXJOUUdBUlJ2dVBXWDZwVWhySHBOVnVxeFZPejlacTVj?=
 =?utf-8?B?VnlhcUkrMldBc1YvSkJ1ZCtRV2ZrMkF5RldNelRhVDYwR0lSakpzc2FVcElM?=
 =?utf-8?B?Z0NuS25jV3FrUDByUWwySmtFUzR0ZTYxcnNFNUxRZHZnd2RYbUlISS9qSWov?=
 =?utf-8?B?SHhMR3A5SlY3NkFMaU0vNVVBdkJ5Q1Z5VmJyZHRzMWF4VGg5M2tZS2JVMjlD?=
 =?utf-8?B?MnIvRkRxRGdqcG5QRmdnVk9ZZ0dRUUN2YU04V1dieFg0RUQwVllhMHlzVVQ4?=
 =?utf-8?Q?H3l2Xe0oA8IlQ4JQXMI3O6W8VtmB6RmAjEFnB8+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ef83bc-71ee-4a27-1020-08d8e9d0487d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 05:40:05.3312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUfIYZFmmOZz6ZLqH733lwH3OJPVTeb+AJjyTBP5byiev57qmCnIHiO9htm3GNH1l8wzov/WlmvLpG0qzSmKbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

Understood your concern, but skip elfutils here is the least code change 
and the gettext also use this means previously.

Meanwhile, there should as least as possible recipe need to skip wiping 
macros. If no, we may need to reconsider the related implement in 
autotools.bbclass. From this perspective, I think we should better 
record the recipe in this general bbclass.

Thanks,

On 3/18/21 11:05 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The below m4 macros files shipped with recipe will be removed if the
> recipe use AM_GNU_GETTEXT.
> gettext.m4
> iconv.m4
> lib-ld.m4
> lib-link.m4
> lib-prefix.m4
> nls.m4 po.m4
> progtest.m4
> 
> After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
> commit (dd52d2ab Modernize gettext infrastructure) included, so the above
> m4 macros files such as iconv.m4 is removed and it's bad as we need to
> patch against iconv.m4 shippped with elfutils.
> 
> So we skip elfutils to not let the elfutils m4 macros removed and also
> fix below issue:
>   $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch -f
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/classes/autotools.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 9dc8ebdaa7..4b462c5aba 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -203,7 +203,7 @@ autotools_do_configure() {
>   				bbnote Executing glib-gettextize --force --copy
>   				echo "no" | glib-gettextize --force --copy
>   			fi
> -		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> +		elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
>   			# We'd call gettextize here if it wasn't so broken...
>   			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>   			if [ -d ${S}/po/ ]; then
> 
> 
> 
> 
> 
