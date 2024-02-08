Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCD0C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:11:17 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web10.1234.1707415868479720495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=cOvJdvBF;
 spf=pass (domain: ni.com, ip: 40.107.220.51, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxftPmnmsxRjYQsgFH5JzTy1FgydzKBOJW1aemKTTlE/vkNY4RnAZbBoO2c0jiZhPEm9BlRE06jEAdWB9VKnNJPiddE+9OVzThBcXBcpzS6gxN09CUrs4x+Gvx8SMPGxV4oRpTeSzHzzsfiLk2TPdEHOhuSplkaZtuVwnh2S/jHj9PlzmnrgEVNyW6pWMNQ6R1cD/lHv9TvF+BXRWbmuXx/q9o9us8p2Sr/pi7LM7A84POe9fPzEPl66/eGZvcqoM+HGlRpVof3/sFjlCFM2FPwFfoHUBezS2WgIGpbGvmapH1tnanqkajmfPXKOG/4Ff5dIyjsbvTF0FCfBIqOZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BTVsXJCKIPzWn+VCExeProjhYcQe9ZRx/pHy5sprZs=;
 b=UvWtDg4ilYYhy/bevY4oT+D8VHPBDhA7PMUzzpC70yxNlbSBTTkZteX93McMd2KI9n6FepIia8F4wmnJwwDpFiQOb/ne2Mio1N2Zpb1P68y8gLZQqpM0gihLSAGeaUiFoSmeu47fSY4TdjQpmQjnQDyh0I9g310LOqwLlbPrDm9rOAGiBf5KR0ecNG+wpKa2HL4PUYsJIOdbPggSA87PwPQnNp1U33kymF+JKD3x/8FPYBRsMMbgulKDlhIl1PR1HjFqTOu7ya9rwUrvIjq1gZ8kCncNGllAj7Zm+xtGvMgAYneK8crmJsE6fKlaOx9Xs9xm5cYpKJRbVagXws0sMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BTVsXJCKIPzWn+VCExeProjhYcQe9ZRx/pHy5sprZs=;
 b=cOvJdvBFguEmCjF3cS6wbh1WYut6bALGj2+iL/oO6Yf+lB5FynD6w/T6vSNo5xtxZFxLG9gPdHNXTy8cirt/jyhxGdmDTrrBG3cX/uqPN5V587CaaxuBxQPUTwYtVpsAmqlBP0MxOk5dF/FLdNg/ZJE6tlF6q3iKJmdiN7N0lxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by BL3PR04MB8203.namprd04.prod.outlook.com (2603:10b6:208:34a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 18:11:05 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 18:11:05 +0000
Message-ID: <86cca1cc-be2c-4e55-8d12-b59d98516c01@ni.com>
Date: Thu, 8 Feb 2024 13:11:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH 3/3] opkg-arch-config:
 update recipe HOMEPAGE
Content-Language: en-US
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <0101018d89e67455-2fa5cd14-1712-4455-b136-6608832e2ac0-000000@us-west-2.amazonses.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <0101018d89e67455-2fa5cd14-1712-4455-b136-6608832e2ac0-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::25) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|BL3PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d161d9f-1a53-4267-ddd8-08dc28d15128
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EcF6Awj4levQG6opHJKwHHZ6wjSFlrV0Fw09mcJciuLMxo1pk6CaBzGi/VNvyAFvubV4B/NSogtjLp0YV9w0MJIi25NWnVUuUJZAcwkqJSksopHcPeDBAukyQvB2bosHRq5rMQ8CwXx89MCzPFRLApN/A+ZdEo2mQdyd3S9weEuJVGJtKE72o0rYh84dsaSVIu+41YTyv+65gvibYgX1qCckEFvaikPaPK/7vZs99BaK7cBRYWmeza4aE65VH0dzXyknDR2teBpW36XlGDzYptcr24xf7JwKGIMiFZ8++pz8Ak/VCLtOZpaWDG6DCAUSvbpjPrFR0ohOdL+ATmoi3YiuFVkKpUjA0/lZ5AxekfuUND0c0ssLfQwCrBa/TIPmdasxwWHW0CpTwjd4cKNAm3Vt3Etum8vfSDVKMSVmqIAg7Z1mwR9GsGnu03PNaOvWhTRPZ9YQYbs5SqoxO20TIwtC+NEOtljSxF0SUTJdKGBQqTORnAakv9Nyia3QgHWAsHX+0NtR/zFcOjgPrJk2qLbINLo3mxb22fFPC/726VoBwwBmqj91FELAxVTmBE7A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(230473577357003)(230273577357003)(186009)(1800799012)(64100799003)(451199024)(36756003)(31686004)(6512007)(316002)(6666004)(966005)(4326008)(66476007)(66946007)(2906002)(44832011)(6506007)(6486002)(53546011)(478600001)(36916002)(5660300002)(15650500001)(66556008)(86362001)(31696002)(38100700002)(6916009)(26005)(2616005)(8936002)(8676002)(41300700001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVBod0pjYkJ4QzRJMXE0bnFyaWdEdEZCVlQvSHFTbUhoMzBGSTdrQ3hzdGR4?=
 =?utf-8?B?dnhheGJxQzByZ0R4c3QwMitFWHVGRUc0Umw0b1NpYzk3ZzlMbXMyOXJrbWFF?=
 =?utf-8?B?RFlRR0ZzMHIwZEgwekFHMTlJL1R1YnppcnlORFg2ZzZpTk1LN3dOL2NPSWMy?=
 =?utf-8?B?WTB1U1d5U090dml1UFVENEgvZUZKUGE3aVhkc095VHExRTRoYTFnNkNQOTBn?=
 =?utf-8?B?eE1DdmdBeVgvNUpubU9oR1RuVDgvM2JCN0c3bVBHRTA0dDNHa3o0SFpTS1pN?=
 =?utf-8?B?T0xVK2N2Wll2eFZnSUtTSzlsVmNWSVBLMGhJZmd3VjVIZE90aXFYY3VUZnU3?=
 =?utf-8?B?Ulh3Y2VkVXBzUlpJNjE3UEp4YXZ5MmtKUnpTK0xRT2lHcXkvSUU2dm44Q0tK?=
 =?utf-8?B?aHFVN01LY0o3QnFkZ0JPc0d1YTl0dkhMbk1iVmVVR2l4elRuTU14Z0xLaGlj?=
 =?utf-8?B?VW1tdXpFVG93VEZ2bXJES0cwaEJRSFNlNnhLZlk3OFFrWUtTdFpTcmlSVzNi?=
 =?utf-8?B?amFXM0RCSUYzNzJ3aUJENVpMTDBpK0hKaUxKNHcwK25hMXFJQkhkQ3EyemZK?=
 =?utf-8?B?MTFtK1YrbFd2dFA3S3pNTDQ1ZlI4VnlMQ1k4blU4NmY5cHdLbzNwVU91OEZB?=
 =?utf-8?B?TXpXZ2ovRmhSYzBOUG1BTkJiWTE1Y2dDeGg2eW9Bb0REeWhiR3ErbDNENzA3?=
 =?utf-8?B?ZVpIeURFYUVlV1FXZVZ6UVZCQ0VuNjcxK09BNEg4MzZOZzFYQUhqZ0NCOXdC?=
 =?utf-8?B?VHRha1ExNnBOWGloYlUvQjkxbUY5UUxDRG5IMGNGR21SVWtHUHJDQjdGT2RW?=
 =?utf-8?B?a2JuaG9UbTg0WFNidjVxWjJoNFZxVVJkVWxLVlJqMFRNam5RazJqc1pUbEFo?=
 =?utf-8?B?dTdVTytSY1dEalFvOCs4eGRNZnVldWh1YTM0eFA3YmlwWk5uOWxkUGh3QXJ0?=
 =?utf-8?B?UDV0RThNSExFYmVpZGFuMnR6Qi9ESzJWWjBFbmFPNHowaGlSeEV3Vnc4OUd5?=
 =?utf-8?B?L0pUd3N1M0RJVkdoYzJ2cjdqK1o4REFCVDV4cmZNdE16TjhFb3NTSVhpdW81?=
 =?utf-8?B?VG5wWVpPZXE2Y2pYOXZVbUJWVmV3YTQvanFEd0VrcjdITmNqbUlxQWV1bHdz?=
 =?utf-8?B?bVRmWE85Uk1EU05VaEJwejhDZklUcFhTQzZlU2pQaXlHRTFJQUk3M01CV1Qr?=
 =?utf-8?B?NUkzL09lQitPdjYwM05lbDZ1b3IvUTE3b1FyYk9VTWQ1U1Jla3E0eWhhMmQ0?=
 =?utf-8?B?L3hHRytHaW1rNlpabjdSOWJBUllSanRaNVI5bHgvZmFsZXpYL3hCRGRWVXZh?=
 =?utf-8?B?Q1QyRG41aTRlSjVrL0ZMVFF0ak16eHRuT0NqWHFhblh3Y2ZUUm1iUkxDMlJj?=
 =?utf-8?B?Nm82VHNvc0t3a2FIeDNnQ2UrYnFsaHR1bG03blg4NDRNaVVET1RBN2JRa254?=
 =?utf-8?B?UkRlbm9JK3NpQ2dvRVU2MkVVeUUrWitjUEp5WVhnVkk3dUxMM25sa1lDSnRh?=
 =?utf-8?B?T05xai9kWU1wM0tjTko3SGQ3bDNudnJEZXVmbmczOUZOMXhlSk9TVmVnekpY?=
 =?utf-8?B?TVZkaFVkSUlRV003QXdndXdJekcvRzEvUTBNU2RCRjA1cnNJZUpzdU5TRm5h?=
 =?utf-8?B?UnNCRnk2T0pOczNhUUdMT1dyMklYRUtOdTlYSzNuRFpIUFJDd2wxVENVL2Ev?=
 =?utf-8?B?eUVYZ1ZvMmkxZTdNcnNEOE9DcEtDMUhnZ3A3OUIwVm9yVWp6c0I4L2VUSDF6?=
 =?utf-8?B?a1dPS1VsY0VZSFlIV1FVVG5oU2k1Z3Zaem1lVTFWdkFHSjhwNWx4Zit4Zy9M?=
 =?utf-8?B?ZWl5VVFKdms2NWdFelB5RXBNSkl0SFFoam1CV3NtdlJTT2hCczl1T0IyUHVI?=
 =?utf-8?B?TmhvQ2g0K1RDTHNFcGRFNFhiMkV2L1BxSjJrNW54K0xqQmd1cE52M0p1d1JP?=
 =?utf-8?B?cEt2QlorRm1wbE45SUlDOTRuQWwrdTdHb3pGbXpyUWNoMFZyQ3dmQUV3WG83?=
 =?utf-8?B?VnQ5NytTRzJyak9VVjJWNDRtczl5czd0b3FLc0dWaDZidXJtcVJDY0c1dG9O?=
 =?utf-8?B?YXBMNnZGc0NuK1FPNFkyVUIxNDJrTm5ZVUJDaHBiMzQ1SWRZbm9KTHZQV0lF?=
 =?utf-8?Q?q8xy1ron7F2LMvvRzD5UXodJq?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d161d9f-1a53-4267-ddd8-08dc28d15128
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:11:05.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHRPuwwCJg8A3eS2jEoxLIi7X4YI/rY3TzLjptRJxRvkns7JXfYaHE9F7EA8eLXrXTMdz+GiUzFMiQ6jtITsAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195171

Fixed. See PATCH V2.

On 2/8/24 13:06, patchtest@automation.yoctoproject.org wrote:
> [You don't often get email from patchtest@automation.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/3-3-opkg-arch-config-update-recipe-HOMEPAGE.patch
>
> FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


