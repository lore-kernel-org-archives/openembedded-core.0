Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.63239.1629330700396656415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 16:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AAsXuwJp;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3864237ae6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17INdOdp028673
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 16:51:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=g2Z7rluDrSJoT7HNacvTKnzYr+1g+lUjr73hzJ8MvH8=;
 b=AAsXuwJp6aqq7WB95QOlqDIYEhb8VV7f8cXFTHlZ7cJnktXzuITnaEfnR1N4lafFcia6
 D1tszh1xf/IJizyuwdj+saSAe6dV8ZXvnUlkdfCOhZsOGPbpFeEGkMoDwTJWPRwB9Zyg
 MQZrHhhMeGULCULaZCqfAqvnZRBX033xVIbZbzJy/d5W6rngnOg6nroyQ+6xmqGekD62
 nzMb/TkQ9H31g+T2NZVkxEhXO51RYXDfVSp5Ks0TCNRSVVoetd/PanLyZYa+odzSK5j/
 MZ1TTNQfaFHTmEXkBuGpzUNdiMNMq45NgdGJ31PXtfmz06emFg15DJxBs8aLUa8Y3Xh1 VQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ah20t0g3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 16:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2CbbVVVkRrEplQXhvccgo6FEuo2Yi1P/47EZ+kyxhkJ00A2TbflhDDQ6vdgO4qtDuTF9herO60cZziG+uVQO5mr3lUcddOvGOCEz8L5sfJGf9Id7WxJMZGUPLtudYFZaUN8BM7ibOpMzdKjQsPoToMbNIh7oVOj4Nm7UGtrhzzBsYtPmKZcp2fplk1aOdd2Zu2xOGwUBG2oHM3HpwLrWhCr3ered4fzt6LjAvlVdxwxGCK3mPsfJhH6h8lUbPzRVZ2P21HQY0z+AW9KAjmPWAIayqmgTLLYLSZHr1HCjhjBN+vCm6cOySzOPSGXwG6bTYzDQeB8PrrMKiA/XWeO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2Z7rluDrSJoT7HNacvTKnzYr+1g+lUjr73hzJ8MvH8=;
 b=LE1RT0da1sFZpv+DodcgSwqc5wCPEvc6D+Dw04c8oESFERS4F7ovYVXQf0HjTpUSofOTfRMnMngkm5v53plKwIx01tdcUaeWrGtW8iQuNRYJvIjU5WZajJHmFkLeA+AYo1i3cuF4VHKuLRy8osOuXL2efkxKRAaA/mqiTXO/661zFMAk/tusaoqLVjz+61norA+e8ZT9dtbKbMoLnkvLyO21UEnSxhSi1cLZX89jBnHy1jetEtrperDRR4aFM+/pj7Nna/UL0ZdBLT+Bkds87n72pSoA3EaW6xDtpE5NYyny4cK3SoxEcOMer6ZThEF8VJ3BBFW8P8vQcikiI4og6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2265.namprd11.prod.outlook.com (2603:10b6:4:50::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 23:51:33 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 23:51:33 +0000
Subject: Re: [OE-core] [PATCH] glibc: update to HEAD of release/2.34/master branch
To: Sakib Sajal <sakib.sajal@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20210818230509.38342-1-sakib.sajal@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <430edb20-c307-e391-673a-1477f39c0fb8@windriver.com>
Date: Wed, 18 Aug 2021 19:51:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210818230509.38342-1-sakib.sajal@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by SJ0PR03CA0351.namprd03.prod.outlook.com (2603:10b6:a03:39c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 23:51:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e78fa4-0a9b-4674-8881-08d962a31ba9
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2265:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB22657FAA91437942EF3F57E7F8FF9@DM5PR1101MB2265.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QikXRc5enpy5RhERc7XXutt8rpdcjO4rnOUyC8/hUyDflsxTQqBgNIQJt0avnMuDQJ0nGFPWpcJ25/RB+5ABUXDkFPm8YgC6RYXxpBFIPC7XQoGhboK/AqIC5QqwRM8/luTn3BBTBaRwio0BrfFIlzTXPxf6NvvY6Thk4mn6CrRjpoxbSOo1XcXYjn8dO6aizsCaFUWdE5aqMX4NM3Jix6cpaVs3O8PGEE3IvmSIutQZaenPwDJ6pRgj0DvQR+xheeJPn2/nROOIpkF5CF1WFX7ZxacmwSs+oe7RMaR4SeEZlYpmREuLoRqAdAsRZHWYB9JcKm2l3d32bXQ7YJqk+wjR6MYKB/0meZ5LsVV37VAgftLgmiaYqRMDJivpX2BtvJWZ5YvBAd9ZaEMNAkbx9giaZvodhL8jB9RSfWzVkmCVHWzT6zdOnoOgdMV7vlwssVuPMH1isspUxETNbdWx9od3/QK8sTkarjmhzKEprwtesZEB/WTTnrA6i+sbiD/x6ecg3LJmqTumoowgxK0rrkgBYSSaLXsq+0xAX2rap2wfni1GzXuNJ5wB0f9UThhhYYiXXYYhH8fIakDB9CJo42QZLauB4jKIws1va4Pn7qrewROJoDYYhZ9K0jdem/+atey/+GoZRZ22b7iElhvitAOVA6vKeEPKjDCnUmobuePXVoyrf0dp+MtfUboLLS7r+ZVMeayIbRzgv3SL4q9DEY3RRxO41kKLJPbhobBOwSbKf4DonfwLRyg5riU6BeWUCQeWVQYkH65oWmhAcvOAUPrHZHz2ZwyDWynr0CeBwPBFPjPu/mE0sDGEPUHRY7G3P1mZFZOrprRoW8rldD74wl7UENPD6bBssbWgmsRajxki1LfgvKMwdjTWLuQmPwgY77NprCH4h69k/TcoXyYf1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39850400004)(136003)(26005)(478600001)(38100700002)(31686004)(8676002)(86362001)(2616005)(966005)(15650500001)(53546011)(2906002)(956004)(6666004)(66476007)(5660300002)(38350700002)(36756003)(66946007)(52116002)(16576012)(8936002)(316002)(186003)(6486002)(31696002)(66556008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUdVTE9JNzdGWndieXpmV3JZSVVEL1ZSU0c2eENBNjRhVkNRTTB6ZjZWMEJF?=
 =?utf-8?B?a21zbTk5Q2pUTlNUdDk2QmJCcUFzVkFsYlpOR2MyVmhiVVdlQVB6SVNqaUw1?=
 =?utf-8?B?N3haa3BIMVhIUDRuOVRpQmZSSXJLZHRaVU5JZXYrNVlGN3V2S211Nkh2NHdL?=
 =?utf-8?B?d0lrTk9HWTVJMmZHblJpWEpIUUxZa0M5c3lPenlDeEpXY3Z3eEpieS9qN1Rr?=
 =?utf-8?B?Y0FKbkJKc3l4L2xZQ0pyT2tybnlKTUNIcjdHWWZZYk9XaTVNbzdia2YxaElQ?=
 =?utf-8?B?R094czdLekhIV202c2J1eVRDcDNERmNJQTllWGV6RSsyUlJzZ1NmNVdTYWtE?=
 =?utf-8?B?cTlqbGJ2MnlGNm1SNmY2VDlVWGliVW5nbFpSb3RoU1dzNHBlOURsTUR3bmM2?=
 =?utf-8?B?anRRaloxNW9ZNFVtWkdMd2pJR0xpNnIwcjQrdXFTZFhFeTNDYzczWlVlZFd6?=
 =?utf-8?B?QVpWaDRMeWlrQ2d3MlFMcHRla1FoeGgwZFBoWGs2L05GNW9UZzdTUkNzZUhP?=
 =?utf-8?B?aFBCbjdOVmdkM0kvMWw0cHhDd2tnczB0bkdYSFBoZ29aVjNKbDY3bU9sMWFy?=
 =?utf-8?B?RG5ZdU1Sd29TQ0V1ZXpXRjg2R29YWjlVVFlscXpmd0VBR1psbUx4SVl3V21n?=
 =?utf-8?B?WkJITFVPUnR5VVZETkFPRW1TTmsrSEFLWW9vaVdwTFFxd0N3ZWZCNHNBRHZN?=
 =?utf-8?B?WjhvZ1NUdlVTT05VU2ErSlBPTzBwU3VKSnA2a2NQZUNZNGpFTDVyWGdKK3dM?=
 =?utf-8?B?UWtZN3VpUzJuMU9jdkNQckVnQmFpRDhuN3FIdGZJQ09VU3ZvQWYwUHFRSi9z?=
 =?utf-8?B?TE51TVMza2k2cWk0L0hJTjh2Q1pYZVRzWVdULzBrR08rK0I4MGJ3RmNDUDdE?=
 =?utf-8?B?ckRyY2NPUlFWQkhlUVB0cEhCcHRiV3lBWjJjY1Z1SFN1Um50dmF0cG5YMjh4?=
 =?utf-8?B?MFRxTWpzVEoyZzFSWXBOU0xIUENjcXRRNThxa3pERVJlb0R3NExjVWI0eUxy?=
 =?utf-8?B?QmFmUVhnSDREenBIU0lyZVltTG9FV09Ld2dsd0NsMDdrSE5td2dIQkJPZ3dI?=
 =?utf-8?B?MGxjTEUwUktrb2tFRFNtZllvVVlERHhOd215QnV5NDVvTHdmTXluR1c1VEp6?=
 =?utf-8?B?dEpESlNIcnh1NmY2Wkx1QVNsRTNzdXVxZjYxNWNOcWhkVitVYm5ISHJZRFpu?=
 =?utf-8?B?YTV0dDQvZVJCRHBMM1pkOWhIdzkwcnRZQTNjcHdWbnVVWFk2VzdPM2l0S3Yz?=
 =?utf-8?B?UTVldnVyaVdlbVBMUURHamNrcVFsVGM3cFNMV1lNM09rQ0Y5ZWdoZ3lCRy9J?=
 =?utf-8?B?YlViU3FZYzhyWEFhV0tMaGNTNVRHYkRYNkZEZmk0Q3E0Mkk3Q1pvdXBoVEhD?=
 =?utf-8?B?ZHlaZXN4S0FxN3RjUUZpalJKQ1FUM2l6cEVJdHdFR2pUYmZoSVFKeHI0N09k?=
 =?utf-8?B?VHdvMys5RHVxc0JrejFJU3RzRzI4VmJqa0hjN2R1K2IreUtwK1FLeTMwWkkw?=
 =?utf-8?B?MGNiWDNzYndCQWkrbXJLN2VaTmxCK0pSelhLV0pKVS9lYzIwQmRDWThJVjM0?=
 =?utf-8?B?SWtsODZEeEZScTlLQWdOdFhlbUlRaVFpbmxrSU91VWdHaXJ3aWljUEdRMmdE?=
 =?utf-8?B?TjZPREo5ZWdCZmE5NkdzR3VKR3NORHU3VmVmYlI5K01XWEtGdG4weUt1Wi95?=
 =?utf-8?B?S3JSRnphanc5dFBJd1JKbWlZa3ZBU0ZvQnZ4Y1ZPYWYvN0lOTmh0VnhLZS81?=
 =?utf-8?Q?Df/VS5/jywl2fYwlnhlpeM08kIG57GV3YoGaYgb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e78fa4-0a9b-4674-8881-08d962a31ba9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 23:51:33.5281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROm9NG555pB/rTLh15krolYI7FzxU7PJjVD1XcFLHrL3sJkOulQtakUWRp5r0W8spwCft2vT5V3896iQD1E+yP6l6Hp2sq24Xnfa1h0qYdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2265
X-Proofpoint-GUID: 4W7_aJvrmFhr6vWOs1BxxzgcSIGUIcah
X-Proofpoint-ORIG-GUID: 4W7_aJvrmFhr6vWOs1BxxzgcSIGUIcah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-18_08,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180143
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-08-18 7:05 p.m., Sakib Sajal wrote:
> Update glibc to head of release/2.34/master branch to
> to include fixes, includes fix for CVE-2021-38604:
> 
> Changelog:
> glibc.git$ git log --oneline ae37d06c7d127817ba43850f0f898b793d42aea7...
> 7c987a5ccb (HEAD, origin/release/2.34/master) librt: add test (bug 28213)
> 7947430322 librt: fix NULL pointer dereference (bug 28213)
> 31902ae639 Linux: Fix fcntl, ioctl, prctl redirects for _TIME_BITS=64 (bug 28182)
> 9995d0588f iconv_charmap: Close output file when done
> 7ff4da3dc2 copy_and_spawn_sgid: Avoid double calls to close()
> a5bd2e10e0 gaiconf_init: Avoid double-free in label and precedence lists
> 3a48da47a9 gconv_parseconfdir: Fix memory leak
> 0b03996304 ldconfig: avoid leak on empty paths in config file
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 281df7ecda..c53b53f114 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.34/master"
>   PV = "2.34"
> -SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
> +SRCREV_glibc ?= "7c987a5ccb31df80456d53a094e47f81310f549b"
>   SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> 
> 
> 
> 
> 

What build and runtime testing did you do Sakib?


-- 
# Randy MacLeod
# Wind River Linux
