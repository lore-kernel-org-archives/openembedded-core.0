Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6391.1628066355938971270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 01:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DCaa7FOi;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3850754a31=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1748I1Ik019571
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 08:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=U48eX5iZ8P3jRfGCERyn0QY08oZ9cZshtgw/QKi1CZ8=;
 b=DCaa7FOiV/puXOSwAHxJTimexws6gzCtcnXk1gBtWlqDVY33HXJ0Ffw2Hwp/MYICQrku
 f00Jyw1sTtIubbVbOx+D8o/g38I2UYYKMdEU0Bi7tGyxoLbrZBDe+p6y9/43mpTcG4CI
 /zHBraYiikB0qAc/NfldTE2X6pDXtGAq/Br5P+RU3VKSolG+daWCTIzA0z3S4OZyaJpj
 HZuSWNNU100PSpBDLPfKo4mS7j+oIgpA2dZJeE8r24glKwaqI1Z22LOzdWF/NrGfkgHt
 CovJO8Dd3Tv4xvVOMAj8NMUfuPvrB/gVo61/MVq7wdANSK3kGH41BPIXQRCniMofy2np Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a705h8vf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 08:39:14 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1748dDX6026499
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 08:39:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a705h8vf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Aug 2021 08:39:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhooD+kXXlWAwxXVP1TKtwZAMAinb1ggRn/XzFTUnR0kjiWzpiBJnNbvB5D4YQ6ADI47kSRlYNYP7HvR/vLZjPQIZfdeeppww75K4qb6MaD+ibz02YYz6wCvaPrbYwe99k3VldoC7NeulmTBFV/lkZ2bRffJc98ZxroqUcoz0Pim0nX9JeO5K0jlziJ1SdOLL65x4m7l+2M2IYMNpvQE/45MG/XQpziIe+82HRny8mJlT8J1U4c/44HHm+ZjhdUWhvaTIhbVRDQMoaLtkHYhPhAjADSWEf7IHfnxY6UIYeRO8nyg/xRyS/9V24Jc5HSPgRbqCx9NCQ3Yx2+tNkTLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U48eX5iZ8P3jRfGCERyn0QY08oZ9cZshtgw/QKi1CZ8=;
 b=S/uNFTxv7/kOxVt/c9lOivnytIy4n4V87IkWHx23NW1zirE+dYJJtAFM7xGEKrsgpwMqMBXs9JdogaM3isecOqbJjNFRQgA2I8+3i52RW8DSmXbBDLji91dR+gLw+8YMJ7nrBsyj2gB6PYvkiRSbLOaiHnkRhJvf7Yw6zew5QNKMy3bLZGkToy0WW2qzgNhw96J+YiwY6fFZQCLQU/XmZw4oeBrFvxV7+ffbV5jEKNYvoAMcrZjgIDOzCA5uU8qJ1vwzBZWAJHvaf8Tkv6/ljJJV75Uu7ZOb9M6DZPih5Dnj2U6NKgZ8OxEZtJtKWj7TscDnPlN1r+ar//QrcB4Mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Wed, 4 Aug
 2021 08:39:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 08:39:09 +0000
Subject: Re: [OE-core] [PATCH 6/9] shadow: update 4.8.1 -> 4.9
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
 <20210730114507.732448-6-alex.kanavin@gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <29613ec1-ed8d-6fdc-284c-cb6ce31d9dce@windriver.com>
Date: Wed, 4 Aug 2021 16:39:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210730114507.732448-6-alex.kanavin@gmail.com>
X-ClientProxiedBy: HK2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:202:16::21) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR02CA0137.apcprd02.prod.outlook.com (2603:1096:202:16::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 08:39:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f471080-6422-4801-58da-08d9572353a0
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB453914581C31CD035AE62A1FF9F19@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:38;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	50eQbdRI5AWxMbcVL31AWH4uRXgrH7RFaTYUwLg6OiNvurLVn1Z7U3Y/qxXiK+vs1OXXx/FqwTxyyZwbY/IPi86AOnzpC8dJvPy+Ge8ErRaYwzdeNRscHaet83nCdx5o1stcOx2e6wfKH8x7exzh5PdeF9oi/hXy445NC15lk94udjg/BkzmF3BElcLZY+eWRrD6FpHoXU6WS0Vd7uSQSe6zwxSUnNd2eBLQK/T67viBAMeOTPD5TFCS/UKLotm8gitteLPx5uQUToEN3lyV5qaTo8CUIH2FUm9YbmhHTcP2nKjpqwuhvrKcLmSSjXfMYEGAp7kzL+kve1tlIRvxgLhCfbnFtJ0rih5H9AFU8z4cljlYfbvaPIQjen8fbqawLzfXymLZx0N/8lMr2cTQPGIDi+RL6wiVOdYxZHsxBAApXbov4nHQ5Cs6XehQlvHrysFqp//qdhC9TR1TJ0bLwZdHUxgf/rUVZTBtpfj5890O5lURXNTyaPRoI5/hZpuSncu9e3TWTERk0aYtTOZ62T9xO24IzGbyWAwxwTy1ac0TacqKER/qefJ6iWtybQIa75UN7TIqiGPNfqtnkkqtwlJaA7VmAo05DkvFo0wo9xjXYUKjQAG58PpJL3470BnahNgVTONjMQlWKn543rhLlhgECiieSe/JnbbYHP7ye1iGbRS0Yko3Nyp3OlmJVFxvJvx59wLfK3SC1APEZ6pFazWYICWJtge76ZKHnex3dyDMfgl/yk2wfS6qdDz0kvKYJcpacRVo7aLVFcrfE4pF3BFkDukJtijcTZsDTEwBdch1eTwETQJjja7ndj/aT9rI6UzjxsjobxnqR/AefpG/Xq9ZHOXfB8ayW2aWa89Qe7pkjS/Qvwpd6jsxGNiPfwHKssi4TcUO1/riPweoI7o+C61OZek1gzqoGWbFM7M8ZBA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(966005)(31686004)(8676002)(83380400001)(508600001)(86362001)(66556008)(16576012)(2616005)(44832011)(166002)(316002)(15650500001)(66476007)(66946007)(31696002)(36756003)(38350700002)(6666004)(8936002)(6706004)(53546011)(52116002)(26005)(6486002)(38100700002)(30864003)(33964004)(2906002)(956004)(21314003)(78286007)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTRnU081TG5RS25INDMxOElkZjFpZ0FIUlNwdmNyZGNTaEVjejhhWnVzYXBm?=
 =?utf-8?B?TEord0Z0WXpXTmxOWGloV3dOWWQwV2tPcUJCOWthYnUvaVNwZk9lOHdPNFIx?=
 =?utf-8?B?M1JDYjdoak5mTGVpdTU0ellEaUkvSldydGVzRGhrNHloN1pnSWlNa1RXQkdo?=
 =?utf-8?B?S3duZWJrU3MyZ2NYVkRjNVVnd2VEMFVSSHpCTGNsVEhKczZDLzM4V3lvSzZa?=
 =?utf-8?B?SjhhVzBsK2xRS3dZdGZueFhmZXZNdnd1WHVBckZ0ZU1nZ3IvcWhOTEFDRmJ4?=
 =?utf-8?B?VWtRUVJhNFhMREZsZURMc1BNR1ptK2hXSXNqQlh0QXBzS0NWeUMzeXRpdFhP?=
 =?utf-8?B?aE5kYmEzM3JIbnE0WEM0UnpMZVhCcWdTS0pVcW5ub3o4cUV6YjNGVWlQT3VF?=
 =?utf-8?B?bFEwbjVlTzllbzBZeEY5Y0pvNVk4T014QU1pdlM4VGg1TTBrVzZoREdqT0tu?=
 =?utf-8?B?UmVlWU5pSUdMck1VTnZENGljeW9wZExhUkliTE1IcmtLc0Nqb1E1TUlmWENX?=
 =?utf-8?B?VWJra05aWHplVjUzN1Z1YVJZR3pKc0RCQ1o1TjVyK0RYWWxyREZUSXcrRzFQ?=
 =?utf-8?B?NTluRi9RSHFWdTJ0NzdKVG14bHdwai84ZGgvYm9KMkJYcnFPRzNkUVpvNnJa?=
 =?utf-8?B?RDh3c2JxTWpOczd0RXdQOHdFSVRtWGdJWkpJbFJ6VU9PQk1UaXI0V09wdys5?=
 =?utf-8?B?bHZQcWNvcXRQWXlUVTk5bVR1Z3J4RU9CVjN4Qk55TFcrdHlsblVYWlpFUG54?=
 =?utf-8?B?ZWtVS21JWWFzWmpRbitHVFM1azljUnZWRE9mZ05uN0ZRQ3h3K1k4K1pzbkc5?=
 =?utf-8?B?V2Jtd2pHWjFWRkJwOCtnam9rdnBPdCtBMmxXdUsrQ0tqeHkxNkFPSzBzdHRT?=
 =?utf-8?B?cXJueGxjVXJxUjg3M2VhbnhDSU9Pb0FSU3RTM0FZSlZwdEUyK2srTTdFWWcr?=
 =?utf-8?B?WHlFekpnVU81TzNNSktqSmZucHBVNUxhbmxEeG9PVlZObVNOZUw2c29nM3FI?=
 =?utf-8?B?bnZvZkc3Z3dJd0doMUVNS2g0K0RJRUpqNEdlOXlqL2NOZ2dkbWNWRWlXRXcr?=
 =?utf-8?B?QnZOS3hMWVFWbnUvR3pEbjhwRnhpcU01d0EvN3M0MlZnN2Rpek9NdG9lbmZE?=
 =?utf-8?B?QkNKLzdwYmhYcExjemQzQllCY3pIbk5VSFdTMTliZGZ0a2lqK29UVXh1OFVB?=
 =?utf-8?B?dE8wQ2oyMUV6NFdObUlWSkd5TjZXU2d6akV3UEppc2ZMbUorRCtFQStuQXVY?=
 =?utf-8?B?YzA3eG1icGFHU2psdGdZKzhnMG1YaDdKUGJudTB1Unc5TmdqV1lmOUd4VHVm?=
 =?utf-8?B?WmRYbmFqekxwc0RHUzRPMnN0TkRyKzRES0hLNURwZDNqTTNPaWl1SEl5MTFW?=
 =?utf-8?B?clhJU1drZHRuekNJVm1oNUZ6aUduVkxMRHd0b0tIcldCVEx6Z2MvRkdWdTJH?=
 =?utf-8?B?VnZmdjIrcUdFL25rQjNJVTNTVTRCd1dzdDZRN08wNGtvb3NQVUlMOW1HUjZz?=
 =?utf-8?B?NkxDLzdDdVcrT2FzVWkzdmQxR3VVZ2VubVBNVER1Zy9uUVhKL0QrUXBsVjF5?=
 =?utf-8?B?cmgyUnZRenFGUTMyV05xWmM2c2g0MjVWZDlvZnlXOHgzWVdVNkxSUGl4ekhM?=
 =?utf-8?B?c2tKcnYxbFk4eDNYRFB1cnI3Zk9ia1BoUDFDUkgrT3pjdEE4c1k4RERXN0FH?=
 =?utf-8?B?ejVDdENrbG84R2N2bVlyRGpJQVRTSFl1TTV6S1lZU0p3UkpKcDVXZzE1MGNm?=
 =?utf-8?Q?f45U+nj279nNfmK56WHjsv6jcVr2GMlbLx+r6BI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f471080-6422-4801-58da-08d9572353a0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 08:39:09.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2kDGLoPJaKk7wVL/sTwdFH2E0sU/8j4ukKFoyAV/B+5vrrJTnuyyL96SOUAeacr0LJ3k28rdbGShLhWDBpjew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-GUID: v9N1YNWqrfhrGshSqMZjud-aXqqJ7Kuq
X-Proofpoint-ORIG-GUID: rWd67RQc0SFL4BzU2WQj1wz4tShky3Hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_03,2021-08-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040041
Content-Type: multipart/alternative;
 boundary="------------523549CE7C57738772325247"
Content-Language: en-US

--------------523549CE7C57738772325247
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/30/21 7:45 PM, Alexander Kanavin wrote:
> Add a couple backports to fix builds.
>
> Drop 0002-Allow-for-setting-password-in-clear-text.patch;
> what it adds is horribly insecure and AB testing didn't reveal any
> regressions or use cases for it.

Dropping this patch makes the password setting function in 
extrausers.bbclass unavailable:
https://docs.yoctoproject.org/singleindex.html#extrausers-bbclass


//Yi


>
> Drop /etc/default/ tweaks as files are no longer installed there.
>
> Drop manpage alternatives as manpages are no longer installed.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   ...01-Disable-use-of-syslog-for-sysroot.patch |  29 +-
>   ...builds-with-respect-to-libsubid-incl.patch | 114 +++++++
>   .../0001-libsubid-link-to-PAM-libraries.patch |  31 ++
>   ...w-for-setting-password-in-clear-text.patch | 301 ------------------
>   ...nexpected-open-failure-in-chroot-env.patch |   6 +-
>   meta/recipes-extended/shadow/shadow.inc       |  21 +-
>   .../shadow/{shadow_4.8.1.bb => shadow_4.9.bb} |   0
>   7 files changed, 167 insertions(+), 335 deletions(-)
>   create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
>   create mode 100644 meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
>   rename meta/recipes-extended/shadow/{shadow_4.8.1.bb => shadow_4.9.bb} (100%)
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> index ab317b9aa0..95728bcd3f 100644
> --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> +++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> @@ -1,4 +1,4 @@
> -From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
> +From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
>   From: Scott Garman <scott.a.garman@intel.com>
>   Date: Thu, 14 Apr 2016 12:28:57 +0200
>   Subject: [PATCH] Disable use of syslog for sysroot
> @@ -19,12 +19,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>    src/groupmems.c | 3 +++
>    src/groupmod.c  | 3 +++
>    src/useradd.c   | 3 +++
> - src/userdel.c   | 3 +++
> + src/userdel.c   | 4 ++++
>    src/usermod.c   | 3 +++
> - 7 files changed, 21 insertions(+)
> + 7 files changed, 22 insertions(+)
>   
>   diff --git a/src/groupadd.c b/src/groupadd.c
> -index 2dd8eec..e9c4bb7 100644
> +index d7f68b1..5fe5f43 100644
>   --- a/src/groupadd.c
>   +++ b/src/groupadd.c
>   @@ -34,6 +34,9 @@
> @@ -38,7 +38,7 @@ index 2dd8eec..e9c4bb7 100644
>    #include <fcntl.h>
>    #include <getopt.h>
>   diff --git a/src/groupdel.c b/src/groupdel.c
> -index f941a84..5a70056 100644
> +index 5c89312..2aefc5a 100644
>   --- a/src/groupdel.c
>   +++ b/src/groupdel.c
>   @@ -34,6 +34,9 @@
> @@ -52,7 +52,7 @@ index f941a84..5a70056 100644
>    #include <fcntl.h>
>    #include <grp.h>
>   diff --git a/src/groupmems.c b/src/groupmems.c
> -index fc91c8b..2842514 100644
> +index 654a8f3..6b2026b 100644
>   --- a/src/groupmems.c
>   +++ b/src/groupmems.c
>   @@ -32,6 +32,9 @@
> @@ -66,7 +66,7 @@ index fc91c8b..2842514 100644
>    #include <getopt.h>
>    #include <grp.h>
>   diff --git a/src/groupmod.c b/src/groupmod.c
> -index 1dca5fc..bc14438 100644
> +index acd6f35..a2c5247 100644
>   --- a/src/groupmod.c
>   +++ b/src/groupmod.c
>   @@ -34,6 +34,9 @@
> @@ -80,7 +80,7 @@ index 1dca5fc..bc14438 100644
>    #include <fcntl.h>
>    #include <getopt.h>
>   diff --git a/src/useradd.c b/src/useradd.c
> -index 4af0f7c..1b7bf06 100644
> +index 127177e..b80e505 100644
>   --- a/src/useradd.c
>   +++ b/src/useradd.c
>   @@ -34,6 +34,9 @@
> @@ -94,21 +94,22 @@ index 4af0f7c..1b7bf06 100644
>    #include <ctype.h>
>    #include <errno.h>
>   diff --git a/src/userdel.c b/src/userdel.c
> -index cc951e5..153e0be 100644
> +index 79a7c89..c1e010a 100644
>   --- a/src/userdel.c
>   +++ b/src/userdel.c
> -@@ -34,6 +34,9 @@
> -
> - #ident "$Id$"
> +@@ -31,6 +31,10 @@
> +  */
>    
> + #include <config.h>
> ++
>   +/* Disable use of syslog since we're running this command against a sysroot */
>   +#undef USE_SYSLOG
>   +
>    #include <assert.h>
> + #include <dirent.h>
>    #include <errno.h>
> - #include <fcntl.h>
>   diff --git a/src/usermod.c b/src/usermod.c
> -index 05b9871..21c6da9 100644
> +index 03bb9b9..e15fdd4 100644
>   --- a/src/usermod.c
>   +++ b/src/usermod.c
>   @@ -34,6 +34,9 @@
> diff --git a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
> new file mode 100644
> index 0000000000..c577be6505
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
> @@ -0,0 +1,114 @@
> +From eced8077b57946fe0b723e7c6c510e8f344ce89b Mon Sep 17 00:00:00 2001
> +From: Serge Hallyn <serge@hallyn.com>
> +Date: Fri, 23 Jul 2021 17:51:13 -0500
> +Subject: [PATCH] Fix out of tree builds with respect to libsubid includes
> +
> +There's a better way to do this, and I hope to clean that up,
> +but this fixes out of tree builds for me right now.
> +
> +Closes #386
> +
> +Signed-off-by: Serge Hallyn <serge@hallyn.com>
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + lib/Makefile.am      | 2 ++
> + libmisc/Makefile.am  | 2 +-
> + libsubid/Makefile.am | 4 ++--
> + src/Makefile.am      | 6 ++++++
> + 4 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index ecf3ee25..5ac2e111 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -10,6 +10,8 @@ if HAVE_VENDORDIR
> + libshadow_la_CPPFLAGS += -DVENDORDIR=\"$(VENDORDIR)\"
> + endif
> +
> ++libshadow_la_CPPFLAGS += -I$(top_srcdir)
> ++
> + libshadow_la_SOURCES = \
> + 	commonio.c \
> + 	commonio.h \
> +diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
> +index 9766a7ec..9f237e0d 100644
> +--- a/libmisc/Makefile.am
> ++++ b/libmisc/Makefile.am
> +@@ -1,7 +1,7 @@
> +
> + EXTRA_DIST = .indent.pro xgetXXbyYY.c
> +
> +-AM_CPPFLAGS = -I$(top_srcdir)/lib $(ECONF_CPPFLAGS)
> ++AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_srcdir) $(ECONF_CPPFLAGS)
> +
> + noinst_LTLIBRARIES = libmisc.la
> +
> +diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
> +index 189165b0..cdc41fe6 100644
> +--- a/libsubid/Makefile.am
> ++++ b/libsubid/Makefile.am
> +@@ -19,8 +19,8 @@ MISCLIBS = \
> + 	$(LIBTCB)
> +
> + libsubid_la_LIBADD = \
> +-	$(top_srcdir)/lib/libshadow.la \
> +-	$(top_srcdir)/libmisc/libmisc.la \
> ++	$(top_builddir)/lib/libshadow.la \
> ++	$(top_builddir)/libmisc/libmisc.la \
> + 	$(MISCLIBS) -ldl
> +
> + AM_CPPFLAGS = \
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 35027013..7c1a3491 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -10,6 +10,7 @@ sgidperms = 2755
> + AM_CPPFLAGS = \
> + 	-I${top_srcdir}/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-DLOCALEDIR=\"$(datadir)/locale\"
> +
> + # XXX why are login and su in /bin anyway (other than for
> +@@ -183,6 +184,7 @@ list_subid_ranges_LDADD = \
> + list_subid_ranges_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + get_subid_owners_LDADD = \
> +@@ -194,11 +196,13 @@ get_subid_owners_LDADD = \
> + get_subid_owners_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + new_subid_range_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + new_subid_range_LDADD = \
> +@@ -210,6 +214,7 @@ new_subid_range_LDADD = \
> + free_subid_range_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + free_subid_range_LDADD = \
> +@@ -220,6 +225,7 @@ free_subid_range_LDADD = \
> +
> + check_subid_range_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libmisc
> +
> + check_subid_range_LDADD = \
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
> new file mode 100644
> index 0000000000..ea7a99dbf7
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
> @@ -0,0 +1,31 @@
> +From 4f44617af3a0c59be267ac5fcc33586e3783f5e6 Mon Sep 17 00:00:00 2001
> +From: Xi Ruoyao <xry111@mengyan1223.wang>
> +Date: Fri, 23 Jul 2021 14:38:08 +0800
> +Subject: [PATCH] libsubid: link to PAM libraries
> +
> +libsubid.so links to libmisc.a, which contains several routines referring to
> +PAM functions.
> +
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c444e9d6]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + libsubid/Makefile.am | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
> +index cdc41fe6..99308c1f 100644
> +--- a/libsubid/Makefile.am
> ++++ b/libsubid/Makefile.am
> +@@ -16,7 +16,8 @@ MISCLIBS = \
> + 	$(LIBCRYPT) \
> + 	$(LIBACL) \
> + 	$(LIBATTR) \
> +-	$(LIBTCB)
> ++	$(LIBTCB) \
> ++	$(LIBPAM)
> +
> + libsubid_la_LIBADD = \
> + 	$(top_builddir)/lib/libshadow.la \
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> deleted file mode 100644
> index c6332e4f76..0000000000
> --- a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> +++ /dev/null
> @@ -1,301 +0,0 @@
> -From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Sat, 16 Nov 2013 15:27:47 +0800
> -Subject: [PATCH] Allow for setting password in clear text
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
> ----
> - src/Makefile.am |  8 ++++----
> - src/groupadd.c  | 20 +++++++++++++++-----
> - src/groupmod.c  | 20 +++++++++++++++-----
> - src/useradd.c   | 21 +++++++++++++++------
> - src/usermod.c   | 20 +++++++++++++++-----
> - 5 files changed, 64 insertions(+), 25 deletions(-)
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index f31fd7a..4a317a3 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -103,10 +103,10 @@ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT_NOPAM)
> - chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
> - expiry_LDADD = $(LDADD) $(LIBECONF)
> - gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
> --groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -+groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
> - groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> - groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> --groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -+groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
> - grpck_LDADD    = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> - grpconv_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> - grpunconv_LDADD = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -@@ -127,9 +127,9 @@ su_SOURCES     = \
> - 	suauth.c
> - su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD) $(LIBECONF)
> - sulogin_LDADD  = $(LDADD) $(LIBCRYPT) $(LIBECONF)
> --useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
> -+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
> - userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBECONF)
> --usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
> -+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
> - vipw_LDADD     = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -
> - install-am: all-am
> -diff --git a/src/groupadd.c b/src/groupadd.c
> -index e9c4bb7..d572c00 100644
> ---- a/src/groupadd.c
> -+++ b/src/groupadd.c
> -@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
> - 	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
> - 	                "                                (non-unique) GID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD use this clear password for the new group\n"), usageout);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       directory prefix\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       directory prefix\n"), usageout);
> - 	(void) fputs ("\n", usageout);
> - 	exit (status);
> - }
> -@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
> - 		{"key",        required_argument, NULL, 'K'},
> - 		{"non-unique", no_argument,       NULL, 'o'},
> - 		{"password",   required_argument, NULL, 'p'},
> -+		{"clear-password", required_argument, NULL, 'P'},
> - 		{"system",     no_argument,       NULL, 'r'},
> - 		{"root",       required_argument, NULL, 'R'},
> --		{"prefix",     required_argument, NULL, 'P'},
> -+		{"prefix",     required_argument, NULL, 'A'},
> - 		{NULL, 0, NULL, '\0'}
> - 	};
> -
> --	while ((c = getopt_long (argc, argv, "fg:hK:op:rR:P:",
> -+	while ((c = getopt_long (argc, argv, "fg:hK:op:P:rR:A:",
> - 		                 long_options, NULL)) != -1) {
> - 		switch (c) {
> - 		case 'f':
> -@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
> - 			pflg = true;
> - 			group_passwd = optarg;
> - 			break;
> -+		case 'P':
> -+			pflg = true;
> -+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+			break;
> - 		case 'r':
> - 			rflg = true;
> - 			break;
> - 		case 'R': /* no-op, handled in process_root_flag () */
> - 			break;
> --		case 'P': /* no-op, handled in process_prefix_flag () */
> -+		case 'A': /* no-op, handled in process_prefix_flag () */
> -+			fprintf (stderr,
> -+				 _("%s: -A is deliberately not supported \n"),
> -+				 Prog);
> -+			exit (E_BAD_ARG);
> - 			break;
> - 		default:
> - 			usage (E_USAGE);
> -@@ -588,7 +598,7 @@ int main (int argc, char **argv)
> - 	(void) textdomain (PACKAGE);
> -
> - 	process_root_flag ("-R", argc, argv);
> --	prefix = process_prefix_flag ("-P", argc, argv);
> -+	prefix = process_prefix_flag ("-A", argc, argv);
> -
> - 	OPENLOG ("groupadd");
> - #ifdef WITH_AUDIT
> -diff --git a/src/groupmod.c b/src/groupmod.c
> -index bc14438..25ccb44 100644
> ---- a/src/groupmod.c
> -+++ b/src/groupmod.c
> -@@ -138,8 +138,9 @@ static void usage (int status)
> - 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
> - 	                "                                PASSWORD\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this clear PASSWORD\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> - 	(void) fputs ("\n", usageout);
> - 	exit (status);
> - }
> -@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
> - 		{"new-name",   required_argument, NULL, 'n'},
> - 		{"non-unique", no_argument,       NULL, 'o'},
> - 		{"password",   required_argument, NULL, 'p'},
> -+		{"clear-password", required_argument, NULL, 'P'},
> - 		{"root",       required_argument, NULL, 'R'},
> --		{"prefix",     required_argument, NULL, 'P'},
> -+		{"prefix",     required_argument, NULL, 'A'},
> - 		{NULL, 0, NULL, '\0'}
> - 	};
> --	while ((c = getopt_long (argc, argv, "g:hn:op:R:P:",
> -+	while ((c = getopt_long (argc, argv, "g:hn:op:P:R:A:",
> - 		                 long_options, NULL)) != -1) {
> - 		switch (c) {
> - 		case 'g':
> -@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
> - 			group_passwd = optarg;
> - 			pflg = true;
> - 			break;
> -+		case 'P':
> -+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+			pflg = true;
> -+			break;
> - 		case 'R': /* no-op, handled in process_root_flag () */
> - 			break;
> --		case 'P': /* no-op, handled in process_prefix_flag () */
> -+		case 'A': /* no-op, handled in process_prefix_flag () */
> -+			fprintf (stderr,
> -+				 _("%s: -A is deliberately not supported \n"),
> -+				 Prog);
> -+			exit (E_BAD_ARG);
> - 			break;
> - 		default:
> - 			usage (E_USAGE);
> -@@ -761,7 +771,7 @@ int main (int argc, char **argv)
> - 	(void) textdomain (PACKAGE);
> -
> - 	process_root_flag ("-R", argc, argv);
> --	prefix = process_prefix_flag ("-P", argc, argv);
> -+	prefix = process_prefix_flag ("-A", argc, argv);
> -
> - 	OPENLOG ("groupmod");
> - #ifdef WITH_AUDIT
> -diff --git a/src/useradd.c b/src/useradd.c
> -index 1b7bf06..44f09e2 100644
> ---- a/src/useradd.c
> -+++ b/src/useradd.c
> -@@ -853,9 +853,10 @@ static void usage (int status)
> - 	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
> - 	                "                                (non-unique) UID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD clear password of the new account\n"), usageout);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> - 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
> - 	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), usageout);
> - 	(void) fputs (_("  -U, --user-group              create a group with the same name as the user\n"), usageout);
> -@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
> - 			{"no-user-group",  no_argument,       NULL, 'N'},
> - 			{"non-unique",     no_argument,       NULL, 'o'},
> - 			{"password",       required_argument, NULL, 'p'},
> -+			{"clear-password", required_argument, NULL, 'P'},
> - 			{"system",         no_argument,       NULL, 'r'},
> - 			{"root",           required_argument, NULL, 'R'},
> --			{"prefix",         required_argument, NULL, 'P'},
> -+			{"prefix",         required_argument, NULL, 'A'},
> - 			{"shell",          required_argument, NULL, 's'},
> - 			{"uid",            required_argument, NULL, 'u'},
> - 			{"user-group",     no_argument,       NULL, 'U'},
> -@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
> - 		};
> - 		while ((c = getopt_long (argc, argv,
> - #ifdef WITH_SELINUX
> --		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:UZ:",
> -+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:UZ:",
> - #else				/* !WITH_SELINUX */
> --		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U",
> -+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:U",
> - #endif				/* !WITH_SELINUX */
> - 		                         long_options, NULL)) != -1) {
> - 			switch (c) {
> -@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **argv)
> - 				}
> - 				user_pass = optarg;
> - 				break;
> -+			case 'P': /* set clear text password */
> -+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+				break;
> - 			case 'r':
> - 				rflg = true;
> - 				break;
> - 			case 'R': /* no-op, handled in process_root_flag () */
> - 				break;
> --			case 'P': /* no-op, handled in process_prefix_flag () */
> -+			case 'A': /* no-op, handled in process_prefix_flag () */
> -+				fprintf (stderr,
> -+					 _("%s: -A is deliberately not supported \n"),
> -+					 Prog);
> -+				exit (E_BAD_ARG);
> - 				break;
> - 			case 's':
> - 				if (   ( !VALID (optarg) )
> -@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
> -
> - 	process_root_flag ("-R", argc, argv);
> -
> --	prefix = process_prefix_flag("-P", argc, argv);
> -+	prefix = process_prefix_flag("-A", argc, argv);
> -
> - 	OPENLOG ("useradd");
> - #ifdef WITH_AUDIT
> -diff --git a/src/usermod.c b/src/usermod.c
> -index 21c6da9..cffdb3e 100644
> ---- a/src/usermod.c
> -+++ b/src/usermod.c
> -@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
> - 	                "                                new location (use only with -d)\n"), usageout);
> - 	(void) fputs (_("  -o, --non-unique              allow using duplicate (non-unique) UID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       use encrypted password for the new password\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD use clear password for the new password\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> - 	(void) fputs (_("  -s, --shell SHELL             new login shell for the user account\n"), usageout);
> - 	(void) fputs (_("  -u, --uid UID                 new UID for the user account\n"), usageout);
> - 	(void) fputs (_("  -U, --unlock                  unlock the user account\n"), usageout);
> -@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
> - 			{"move-home",    no_argument,       NULL, 'm'},
> - 			{"non-unique",   no_argument,       NULL, 'o'},
> - 			{"password",     required_argument, NULL, 'p'},
> -+			{"clear-password", required_argument, NULL, 'P'},
> - 			{"root",         required_argument, NULL, 'R'},
> --			{"prefix",       required_argument, NULL, 'P'},
> -+			{"prefix",       required_argument, NULL, 'A'},
> - 			{"shell",        required_argument, NULL, 's'},
> - 			{"uid",          required_argument, NULL, 'u'},
> - 			{"unlock",       no_argument,       NULL, 'U'},
> -@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
> - 			{NULL, 0, NULL, '\0'}
> - 		};
> - 		while ((c = getopt_long (argc, argv,
> --		                         "abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
> -+		                         "abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
> - #ifdef ENABLE_SUBIDS
> - 		                         "v:w:V:W:"
> - #endif				/* ENABLE_SUBIDS */
> -@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
> - 				user_pass = optarg;
> - 				pflg = true;
> - 				break;
> -+			case 'P':
> -+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+				pflg = true;
> -+				break;
> - 			case 'R': /* no-op, handled in process_root_flag () */
> - 				break;
> --			case 'P': /* no-op, handled in process_prefix_flag () */
> -+			case 'A': /* no-op, handled in process_prefix_flag () */
> -+				fprintf (stderr,
> -+					 _("%s: -A is deliberately not supported \n"),
> -+					 Prog);
> -+				exit (E_BAD_ARG);
> - 				break;
> - 			case 's':
> - 				if (!VALID (optarg)) {
> -@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
> - 	(void) textdomain (PACKAGE);
> -
> - 	process_root_flag ("-R", argc, argv);
> --	prefix = process_prefix_flag ("-P", argc, argv);
> -+	prefix = process_prefix_flag ("-A", argc, argv);
> -
> - 	OPENLOG ("usermod");
> - #ifdef WITH_AUDIT
> diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> index 9825216369..bd24626a26 100644
> --- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> +++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> @@ -1,4 +1,4 @@
> -From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
> +From 1422c24f7266b553c82100e3d18a10c55cd91063 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Thu, 17 Jul 2014 15:53:34 +0800
>   Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
> @@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>    1 file changed, 12 insertions(+), 4 deletions(-)
>   
>   diff --git a/lib/commonio.c b/lib/commonio.c
> -index 16fa7e7..d6bc297 100644
> +index cef404b..66908fb 100644
>   --- a/lib/commonio.c
>   +++ b/lib/commonio.c
> -@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int mode)
> +@@ -646,10 +646,18 @@ int commonio_open (struct commonio_db *db, int mode)
>    	db->cursor = NULL;
>    	db->changed = false;
>    
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 2cbdfbc1cf..51d2ca5f16 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
>   DEPENDS = "virtual/crypt"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
> -SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
> +SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}.tar.gz \
>              file://shadow-4.1.3-dots-in-usernames.patch \
>              ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>              file://shadow-relaxed-usernames.patch \
> +           file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
> +           file://0001-libsubid-link-to-PAM-libraries.patch \
>              "
>   
>   SRC_URI_append_class-target = " \
> @@ -23,15 +25,13 @@ SRC_URI_append_class-target = " \
>   
>   SRC_URI_append_class-native = " \
>              file://0001-Disable-use-of-syslog-for-sysroot.patch \
> -           file://0002-Allow-for-setting-password-in-clear-text.patch \
>              file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>              "
>   SRC_URI_append_class-nativesdk = " \
>              file://0001-Disable-use-of-syslog-for-sysroot.patch \
>              "
>   
> -SRC_URI[md5sum] = "3d97f11e66bfb0b14702b115fa8be480"
> -SRC_URI[sha256sum] = "3ee3081fbbcbcfea5c8916419e46bc724807bab271072104f23e7a29e9668f3a"
> +SRC_URI[sha256sum] = "6c4627ff9c9422b96664517ae753c944f2902e92809d0698b65f5fef11985212"
>   
>   # Additional Policy files for PAM
>   PAM_SRC_URI = "file://pam.d/chfn \
> @@ -115,12 +115,6 @@ do_install() {
>   	# Use proper encryption for passwords
>   	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
>   
> -	# Now we don't have a mail system. Disable mail creation for now.
> -	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
> -	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
> -
> -	# Use users group by default
> -	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
>   }
>   
>   do_install_append() {
> @@ -184,13 +178,6 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
>   ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
>   ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
>   
> -ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1 nologin.8"
> -ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
> -ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
> -ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
> -ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
> -ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
> -
>   PACKAGE_WRITE_DEPS += "shadow-native"
>   pkg_postinst_${PN}_class-target () {
>   	if [ "x$D" != "x" ]; then
> diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.9.bb
> similarity index 100%
> rename from meta/recipes-extended/shadow/shadow_4.8.1.bb
> rename to meta/recipes-extended/shadow/shadow_4.9.bb
>
> 
>

--------------523549CE7C57738772325247
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/30/21 7:45 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210730114507.732448-6-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">Add a couple backports to fix builds.

Drop 0002-Allow-for-setting-password-in-clear-text.patch;
what it adds is horribly insecure and AB testing didn't reveal any
regressions or use cases for it.</pre>
    </blockquote>
    <p>Dropping this patch makes the password setting function in
      extrausers.bbclass unavailable:<br>
      <a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/singleindex.html#extrausers-bbclass">https://docs.yoctoproject.org/singleindex.html#extrausers-bbclass</a><br>
    </p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20210730114507.732448-6-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Drop /etc/default/ tweaks as files are no longer installed there.

Drop manpage alternatives as manpages are no longer installed.

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch |  29 +-
 ...builds-with-respect-to-libsubid-incl.patch | 114 +++++++
 .../0001-libsubid-link-to-PAM-libraries.patch |  31 ++
 ...w-for-setting-password-in-clear-text.patch | 301 ------------------
 ...nexpected-open-failure-in-chroot-env.patch |   6 +-
 meta/recipes-extended/shadow/shadow.inc       |  21 +-
 .../shadow/{shadow_4.8.1.bb =&gt; shadow_4.9.bb} |   0
 7 files changed, 167 insertions(+), 335 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
 rename meta/recipes-extended/shadow/{shadow_4.8.1.bb =&gt; shadow_4.9.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index ab317b9aa0..95728bcd3f 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,4 +1,4 @@
-From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
+From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
 From: Scott Garman <a class="moz-txt-link-rfc2396E" href="mailto:scott.a.garman@intel.com">&lt;scott.a.garman@intel.com&gt;</a>
 Date: Thu, 14 Apr 2016 12:28:57 +0200
 Subject: [PATCH] Disable use of syslog for sysroot
@@ -19,12 +19,12 @@ Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
  src/groupmems.c | 3 +++
  src/groupmod.c  | 3 +++
  src/useradd.c   | 3 +++
- src/userdel.c   | 3 +++
+ src/userdel.c   | 4 ++++
  src/usermod.c   | 3 +++
- 7 files changed, 21 insertions(+)
+ 7 files changed, 22 insertions(+)
 
 diff --git a/src/groupadd.c b/src/groupadd.c
-index 2dd8eec..e9c4bb7 100644
+index d7f68b1..5fe5f43 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
 @@ -34,6 +34,9 @@
@@ -38,7 +38,7 @@ index 2dd8eec..e9c4bb7 100644
  #include &lt;fcntl.h&gt;
  #include &lt;getopt.h&gt;
 diff --git a/src/groupdel.c b/src/groupdel.c
-index f941a84..5a70056 100644
+index 5c89312..2aefc5a 100644
 --- a/src/groupdel.c
 +++ b/src/groupdel.c
 @@ -34,6 +34,9 @@
@@ -52,7 +52,7 @@ index f941a84..5a70056 100644
  #include &lt;fcntl.h&gt;
  #include &lt;grp.h&gt;
 diff --git a/src/groupmems.c b/src/groupmems.c
-index fc91c8b..2842514 100644
+index 654a8f3..6b2026b 100644
 --- a/src/groupmems.c
 +++ b/src/groupmems.c
 @@ -32,6 +32,9 @@
@@ -66,7 +66,7 @@ index fc91c8b..2842514 100644
  #include &lt;getopt.h&gt;
  #include &lt;grp.h&gt;
 diff --git a/src/groupmod.c b/src/groupmod.c
-index 1dca5fc..bc14438 100644
+index acd6f35..a2c5247 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
 @@ -34,6 +34,9 @@
@@ -80,7 +80,7 @@ index 1dca5fc..bc14438 100644
  #include &lt;fcntl.h&gt;
  #include &lt;getopt.h&gt;
 diff --git a/src/useradd.c b/src/useradd.c
-index 4af0f7c..1b7bf06 100644
+index 127177e..b80e505 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
 @@ -34,6 +34,9 @@
@@ -94,21 +94,22 @@ index 4af0f7c..1b7bf06 100644
  #include &lt;ctype.h&gt;
  #include &lt;errno.h&gt;
 diff --git a/src/userdel.c b/src/userdel.c
-index cc951e5..153e0be 100644
+index 79a7c89..c1e010a 100644
 --- a/src/userdel.c
 +++ b/src/userdel.c
-@@ -34,6 +34,9 @@
- 
- #ident &quot;$Id$&quot;
+@@ -31,6 +31,10 @@
+  */
  
+ #include &lt;config.h&gt;
++
 +/* Disable use of syslog since we're running this command against a sysroot */
 +#undef USE_SYSLOG
 +
  #include &lt;assert.h&gt;
+ #include &lt;dirent.h&gt;
  #include &lt;errno.h&gt;
- #include &lt;fcntl.h&gt;
 diff --git a/src/usermod.c b/src/usermod.c
-index 05b9871..21c6da9 100644
+index 03bb9b9..e15fdd4 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
 @@ -34,6 +34,9 @@
diff --git a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
new file mode 100644
index 0000000000..c577be6505
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
@@ -0,0 +1,114 @@
+From eced8077b57946fe0b723e7c6c510e8f344ce89b Mon Sep 17 00:00:00 2001
+From: Serge Hallyn <a class="moz-txt-link-rfc2396E" href="mailto:serge@hallyn.com">&lt;serge@hallyn.com&gt;</a>
+Date: Fri, 23 Jul 2021 17:51:13 -0500
+Subject: [PATCH] Fix out of tree builds with respect to libsubid includes
+
+There's a better way to do this, and I hope to clean that up,
+but this fixes out of tree builds for me right now.
+
+Closes #386
+
+Signed-off-by: Serge Hallyn <a class="moz-txt-link-rfc2396E" href="mailto:serge@hallyn.com">&lt;serge@hallyn.com&gt;</a>
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1">https://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1</a>]
+Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
+---
+ lib/Makefile.am      | 2 ++
+ libmisc/Makefile.am  | 2 +-
+ libsubid/Makefile.am | 4 ++--
+ src/Makefile.am      | 6 ++++++
+ 4 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index ecf3ee25..5ac2e111 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -10,6 +10,8 @@ if HAVE_VENDORDIR
+ libshadow_la_CPPFLAGS += -DVENDORDIR=\&quot;$(VENDORDIR)\&quot;
+ endif
+ 
++libshadow_la_CPPFLAGS += -I$(top_srcdir)
++
+ libshadow_la_SOURCES = \
+ 	commonio.c \
+ 	commonio.h \
+diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
+index 9766a7ec..9f237e0d 100644
+--- a/libmisc/Makefile.am
++++ b/libmisc/Makefile.am
+@@ -1,7 +1,7 @@
+ 
+ EXTRA_DIST = .indent.pro xgetXXbyYY.c
+ 
+-AM_CPPFLAGS = -I$(top_srcdir)/lib $(ECONF_CPPFLAGS)
++AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_srcdir) $(ECONF_CPPFLAGS)
+ 
+ noinst_LTLIBRARIES = libmisc.la
+ 
+diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
+index 189165b0..cdc41fe6 100644
+--- a/libsubid/Makefile.am
++++ b/libsubid/Makefile.am
+@@ -19,8 +19,8 @@ MISCLIBS = \
+ 	$(LIBTCB)
+ 
+ libsubid_la_LIBADD = \
+-	$(top_srcdir)/lib/libshadow.la \
+-	$(top_srcdir)/libmisc/libmisc.la \
++	$(top_builddir)/lib/libshadow.la \
++	$(top_builddir)/libmisc/libmisc.la \
+ 	$(MISCLIBS) -ldl
+ 
+ AM_CPPFLAGS = \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 35027013..7c1a3491 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -10,6 +10,7 @@ sgidperms = 2755
+ AM_CPPFLAGS = \
+ 	-I${top_srcdir}/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-DLOCALEDIR=\&quot;$(datadir)/locale\&quot;
+ 
+ # XXX why are login and su in /bin anyway (other than for
+@@ -183,6 +184,7 @@ list_subid_ranges_LDADD = \
+ list_subid_ranges_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ get_subid_owners_LDADD = \
+@@ -194,11 +196,13 @@ get_subid_owners_LDADD = \
+ get_subid_owners_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ new_subid_range_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ new_subid_range_LDADD = \
+@@ -210,6 +214,7 @@ new_subid_range_LDADD = \
+ free_subid_range_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ free_subid_range_LDADD = \
+@@ -220,6 +225,7 @@ free_subid_range_LDADD = \
+ 
+ check_subid_range_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libmisc
+ 
+ check_subid_range_LDADD = \
+-- 
+2.31.1
+
diff --git a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
new file mode 100644
index 0000000000..ea7a99dbf7
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
@@ -0,0 +1,31 @@
+From 4f44617af3a0c59be267ac5fcc33586e3783f5e6 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <a class="moz-txt-link-rfc2396E" href="mailto:xry111@mengyan1223.wang">&lt;xry111@mengyan1223.wang&gt;</a>
+Date: Fri, 23 Jul 2021 14:38:08 +0800
+Subject: [PATCH] libsubid: link to PAM libraries
+
+libsubid.so links to libmisc.a, which contains several routines referring to
+PAM functions.
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c444e9d6">https://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c444e9d6</a>]
+Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
+---
+ libsubid/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
+index cdc41fe6..99308c1f 100644
+--- a/libsubid/Makefile.am
++++ b/libsubid/Makefile.am
+@@ -16,7 +16,8 @@ MISCLIBS = \
+ 	$(LIBCRYPT) \
+ 	$(LIBACL) \
+ 	$(LIBATTR) \
+-	$(LIBTCB)
++	$(LIBTCB) \
++	$(LIBPAM)
+ 
+ libsubid_la_LIBADD = \
+ 	$(top_builddir)/lib/libshadow.la \
+-- 
+2.31.1
+
diff --git a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
deleted file mode 100644
index c6332e4f76..0000000000
--- a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
-From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
-Date: Sat, 16 Nov 2013 15:27:47 +0800
-Subject: [PATCH] Allow for setting password in clear text
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
-
----
- src/Makefile.am |  8 ++++----
- src/groupadd.c  | 20 +++++++++++++++-----
- src/groupmod.c  | 20 +++++++++++++++-----
- src/useradd.c   | 21 +++++++++++++++------
- src/usermod.c   | 20 +++++++++++++++-----
- 5 files changed, 64 insertions(+), 25 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f31fd7a..4a317a3 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -103,10 +103,10 @@ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT_NOPAM)
- chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
- expiry_LDADD = $(LDADD) $(LIBECONF)
- gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
--groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-+groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
- groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
--groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-+groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
- grpck_LDADD    = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- grpconv_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- grpunconv_LDADD = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-@@ -127,9 +127,9 @@ su_SOURCES     = \
- 	suauth.c
- su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD) $(LIBECONF)
- sulogin_LDADD  = $(LDADD) $(LIBCRYPT) $(LIBECONF)
--useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
-+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
- userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBECONF)
--usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
-+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
- vipw_LDADD     = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- 
- install-am: all-am
-diff --git a/src/groupadd.c b/src/groupadd.c
-index e9c4bb7..d572c00 100644
---- a/src/groupadd.c
-+++ b/src/groupadd.c
-@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
- 	(void) fputs (_(&quot;  -o, --non-unique              allow to create groups with duplicate\n&quot;
- 	                &quot;                                (non-unique) GID\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -p, --password PASSWORD       use this encrypted password for the new group\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD use this clear password for the new group\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -r, --system                  create a system account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to chroot into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       directory prefix\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       directory prefix\n&quot;), usageout);
- 	(void) fputs (&quot;\n&quot;, usageout);
- 	exit (status);
- }
-@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
- 		{&quot;key&quot;,        required_argument, NULL, 'K'},
- 		{&quot;non-unique&quot;, no_argument,       NULL, 'o'},
- 		{&quot;password&quot;,   required_argument, NULL, 'p'},
-+		{&quot;clear-password&quot;, required_argument, NULL, 'P'},
- 		{&quot;system&quot;,     no_argument,       NULL, 'r'},
- 		{&quot;root&quot;,       required_argument, NULL, 'R'},
--		{&quot;prefix&quot;,     required_argument, NULL, 'P'},
-+		{&quot;prefix&quot;,     required_argument, NULL, 'A'},
- 		{NULL, 0, NULL, '\0'}
- 	};
- 
--	while ((c = getopt_long (argc, argv, &quot;fg:hK:op:rR:P:&quot;,
-+	while ((c = getopt_long (argc, argv, &quot;fg:hK:op:P:rR:A:&quot;,
- 		                 long_options, NULL)) != -1) {
- 		switch (c) {
- 		case 'f':
-@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
- 			pflg = true;
- 			group_passwd = optarg;
- 			break;
-+		case 'P':
-+			pflg = true;
-+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+			break;
- 		case 'r':
- 			rflg = true;
- 			break;
- 		case 'R': /* no-op, handled in process_root_flag () */
- 			break;
--		case 'P': /* no-op, handled in process_prefix_flag () */
-+		case 'A': /* no-op, handled in process_prefix_flag () */
-+			fprintf (stderr,
-+				 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+				 Prog);
-+			exit (E_BAD_ARG);
- 			break;
- 		default:
- 			usage (E_USAGE);
-@@ -588,7 +598,7 @@ int main (int argc, char **argv)
- 	(void) textdomain (PACKAGE);
- 
- 	process_root_flag (&quot;-R&quot;, argc, argv);
--	prefix = process_prefix_flag (&quot;-P&quot;, argc, argv);
-+	prefix = process_prefix_flag (&quot;-A&quot;, argc, argv);
- 
- 	OPENLOG (&quot;groupadd&quot;);
- #ifdef WITH_AUDIT
-diff --git a/src/groupmod.c b/src/groupmod.c
-index bc14438..25ccb44 100644
---- a/src/groupmod.c
-+++ b/src/groupmod.c
-@@ -138,8 +138,9 @@ static void usage (int status)
- 	(void) fputs (_(&quot;  -o, --non-unique              allow to use a duplicate (non-unique) GID\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -p, --password PASSWORD       change the password to this (encrypted)\n&quot;
- 	                &quot;                                PASSWORD\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD change the password to this clear PASSWORD\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to chroot into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n&quot;), usageout);
- 	(void) fputs (&quot;\n&quot;, usageout);
- 	exit (status);
- }
-@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
- 		{&quot;new-name&quot;,   required_argument, NULL, 'n'},
- 		{&quot;non-unique&quot;, no_argument,       NULL, 'o'},
- 		{&quot;password&quot;,   required_argument, NULL, 'p'},
-+		{&quot;clear-password&quot;, required_argument, NULL, 'P'},
- 		{&quot;root&quot;,       required_argument, NULL, 'R'},
--		{&quot;prefix&quot;,     required_argument, NULL, 'P'},
-+		{&quot;prefix&quot;,     required_argument, NULL, 'A'},
- 		{NULL, 0, NULL, '\0'}
- 	};
--	while ((c = getopt_long (argc, argv, &quot;g:hn:op:R:P:&quot;,
-+	while ((c = getopt_long (argc, argv, &quot;g:hn:op:P:R:A:&quot;,
- 		                 long_options, NULL)) != -1) {
- 		switch (c) {
- 		case 'g':
-@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
- 			group_passwd = optarg;
- 			pflg = true;
- 			break;
-+		case 'P':
-+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+			pflg = true;
-+			break;
- 		case 'R': /* no-op, handled in process_root_flag () */
- 			break;
--		case 'P': /* no-op, handled in process_prefix_flag () */
-+		case 'A': /* no-op, handled in process_prefix_flag () */
-+			fprintf (stderr,
-+				 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+				 Prog);
-+			exit (E_BAD_ARG);
- 			break;
- 		default:
- 			usage (E_USAGE);
-@@ -761,7 +771,7 @@ int main (int argc, char **argv)
- 	(void) textdomain (PACKAGE);
- 
- 	process_root_flag (&quot;-R&quot;, argc, argv);
--	prefix = process_prefix_flag (&quot;-P&quot;, argc, argv);
-+	prefix = process_prefix_flag (&quot;-A&quot;, argc, argv);
- 
- 	OPENLOG (&quot;groupmod&quot;);
- #ifdef WITH_AUDIT
-diff --git a/src/useradd.c b/src/useradd.c
-index 1b7bf06..44f09e2 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -853,9 +853,10 @@ static void usage (int status)
- 	(void) fputs (_(&quot;  -o, --non-unique              allow to create users with duplicate\n&quot;
- 	                &quot;                                (non-unique) UID\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -p, --password PASSWORD       encrypted password of the new account\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD clear password of the new account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -r, --system                  create a system account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to chroot into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -s, --shell SHELL             login shell of the new account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -u, --uid UID                 user ID of the new account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -U, --user-group              create a group with the same name as the user\n&quot;), usageout);
-@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
- 			{&quot;no-user-group&quot;,  no_argument,       NULL, 'N'},
- 			{&quot;non-unique&quot;,     no_argument,       NULL, 'o'},
- 			{&quot;password&quot;,       required_argument, NULL, 'p'},
-+			{&quot;clear-password&quot;, required_argument, NULL, 'P'},
- 			{&quot;system&quot;,         no_argument,       NULL, 'r'},
- 			{&quot;root&quot;,           required_argument, NULL, 'R'},
--			{&quot;prefix&quot;,         required_argument, NULL, 'P'},
-+			{&quot;prefix&quot;,         required_argument, NULL, 'A'},
- 			{&quot;shell&quot;,          required_argument, NULL, 's'},
- 			{&quot;uid&quot;,            required_argument, NULL, 'u'},
- 			{&quot;user-group&quot;,     no_argument,       NULL, 'U'},
-@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
- 		};
- 		while ((c = getopt_long (argc, argv,
- #ifdef WITH_SELINUX
--		                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:UZ:&quot;,
-+		                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:UZ:&quot;,
- #else				/* !WITH_SELINUX */
--		                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U&quot;,
-+		                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:U&quot;,
- #endif				/* !WITH_SELINUX */
- 		                         long_options, NULL)) != -1) {
- 			switch (c) {
-@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **argv)
- 				}
- 				user_pass = optarg;
- 				break;
-+			case 'P': /* set clear text password */
-+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+				break;
- 			case 'r':
- 				rflg = true;
- 				break;
- 			case 'R': /* no-op, handled in process_root_flag () */
- 				break;
--			case 'P': /* no-op, handled in process_prefix_flag () */
-+			case 'A': /* no-op, handled in process_prefix_flag () */
-+				fprintf (stderr,
-+					 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+					 Prog);
-+				exit (E_BAD_ARG);
- 				break;
- 			case 's':
- 				if (   ( !VALID (optarg) )
-@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
- 
- 	process_root_flag (&quot;-R&quot;, argc, argv);
- 
--	prefix = process_prefix_flag(&quot;-P&quot;, argc, argv);
-+	prefix = process_prefix_flag(&quot;-A&quot;, argc, argv);
- 
- 	OPENLOG (&quot;useradd&quot;);
- #ifdef WITH_AUDIT
-diff --git a/src/usermod.c b/src/usermod.c
-index 21c6da9..cffdb3e 100644
---- a/src/usermod.c
-+++ b/src/usermod.c
-@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
- 	                &quot;                                new location (use only with -d)\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -o, --non-unique              allow using duplicate (non-unique) UID\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -p, --password PASSWORD       use encrypted password for the new password\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD use clear password for the new password\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to chroot into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -s, --shell SHELL             new login shell for the user account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -u, --uid UID                 new UID for the user account\n&quot;), usageout);
- 	(void) fputs (_(&quot;  -U, --unlock                  unlock the user account\n&quot;), usageout);
-@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
- 			{&quot;move-home&quot;,    no_argument,       NULL, 'm'},
- 			{&quot;non-unique&quot;,   no_argument,       NULL, 'o'},
- 			{&quot;password&quot;,     required_argument, NULL, 'p'},
-+			{&quot;clear-password&quot;, required_argument, NULL, 'P'},
- 			{&quot;root&quot;,         required_argument, NULL, 'R'},
--			{&quot;prefix&quot;,       required_argument, NULL, 'P'},
-+			{&quot;prefix&quot;,       required_argument, NULL, 'A'},
- 			{&quot;shell&quot;,        required_argument, NULL, 's'},
- 			{&quot;uid&quot;,          required_argument, NULL, 'u'},
- 			{&quot;unlock&quot;,       no_argument,       NULL, 'U'},
-@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
- 			{NULL, 0, NULL, '\0'}
- 		};
- 		while ((c = getopt_long (argc, argv,
--		                         &quot;abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:&quot;
-+		                         &quot;abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:&quot;
- #ifdef ENABLE_SUBIDS
- 		                         &quot;v:w:V:W:&quot;
- #endif				/* ENABLE_SUBIDS */
-@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
- 				user_pass = optarg;
- 				pflg = true;
- 				break;
-+			case 'P':
-+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+				pflg = true;
-+				break;
- 			case 'R': /* no-op, handled in process_root_flag () */
- 				break;
--			case 'P': /* no-op, handled in process_prefix_flag () */
-+			case 'A': /* no-op, handled in process_prefix_flag () */
-+				fprintf (stderr,
-+					 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+					 Prog);
-+				exit (E_BAD_ARG);
- 				break;
- 			case 's':
- 				if (!VALID (optarg)) {
-@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
- 	(void) textdomain (PACKAGE);
- 
- 	process_root_flag (&quot;-R&quot;, argc, argv);
--	prefix = process_prefix_flag (&quot;-P&quot;, argc, argv);
-+	prefix = process_prefix_flag (&quot;-A&quot;, argc, argv);
- 
- 	OPENLOG (&quot;usermod&quot;);
- #ifdef WITH_AUDIT
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 9825216369..bd24626a26 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
+From 1422c24f7266b553c82100e3d18a10c55cd91063 Mon Sep 17 00:00:00 2001
 From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 16fa7e7..d6bc297 100644
+index cef404b..66908fb 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -646,10 +646,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db-&gt;cursor = NULL;
  	db-&gt;changed = false;
  
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2cbdfbc1cf..51d2ca5f16 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5\DEPENDS=">&quot;file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
 DEPENDS = &quot;</a>virtual/crypt&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/shadow-maint/shadow/releases">&quot;https://github.com/shadow-maint/shadow/releases&quot;</a>
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz\+SRC_URI=">&quot;https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
+SRC_URI = &quot;</a>https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
+           file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
+           file://0001-libsubid-link-to-PAM-libraries.patch \
            &quot;
 
 SRC_URI_append_class-target = &quot; \
@@ -23,15 +25,13 @@ SRC_URI_append_class-target = &quot; \
 
 SRC_URI_append_class-native = &quot; \
            <a class="moz-txt-link-freetext" href="file://0001-Disable-use-of-syslog-for-sysroot.patch">file://0001-Disable-use-of-syslog-for-sysroot.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0002-Allow-for-setting-password-in-clear-text.patch">file://0002-Allow-for-setting-password-in-clear-text.patch</a> \
            <a class="moz-txt-link-freetext" href="file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch">file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch</a> \
            &quot;
 SRC_URI_append_class-nativesdk = &quot; \
            <a class="moz-txt-link-freetext" href="file://0001-Disable-use-of-syslog-for-sysroot.patch">file://0001-Disable-use-of-syslog-for-sysroot.patch</a> \
            &quot;
 
-SRC_URI[md5sum] = &quot;3d97f11e66bfb0b14702b115fa8be480&quot;
-SRC_URI[sha256sum] = &quot;3ee3081fbbcbcfea5c8916419e46bc724807bab271072104f23e7a29e9668f3a&quot;
+SRC_URI[sha256sum] = &quot;6c4627ff9c9422b96664517ae753c944f2902e92809d0698b65f5fef11985212&quot;
 
 # Additional Policy files for PAM
 PAM_SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://pam.d/chfn\@@-115,12+115,6@@do_install(){#Useproperencryptionforpasswordssed-i's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHODSHA512/'${D}${sysconfdir}/login.defs-#Nowwedon'thaveamailsystem.Disablemailcreationfornow.-sed-i's:/bin/bash:/bin/sh:g'${D}${sysconfdir}/default/useradd-sed-i'/^CREATE_MAIL_SPOOL/s:^:#:'${D}${sysconfdir}/default/useradd--#Useusersgroupbydefault-sed-i's,^GROUP=1000,GROUP=100,g'${D}${sysconfdir}/default/useradd}do_install_append(){@@-184,13+178,6@@ALTERNATIVE_${PN}-base=">&quot;file://pam.d/chfn \
@@ -115,12 +115,6 @@ do_install() {
 	# Use proper encryption for passwords
 	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
 
-	# Now we don't have a mail system. Disable mail creation for now.
-	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
-	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
-
-	# Use users group by default
-	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
 }
 
 do_install_append() {
@@ -184,13 +178,6 @@ ALTERNATIVE_${PN}-base = &quot;</a>newgrp groups login su&quot;
 ALTERNATIVE_LINK_NAME[login] = &quot;${base_bindir}/login&quot;
 ALTERNATIVE_LINK_NAME[su] = &quot;${base_bindir}/su&quot;
 
-ALTERNATIVE_${PN}-doc = &quot;passwd.5 getspnam.3 groups.1 su.1 nologin.8&quot;
-ALTERNATIVE_LINK_NAME[passwd.5] = &quot;${mandir}/man5/passwd.5&quot;
-ALTERNATIVE_LINK_NAME[getspnam.3] = &quot;${mandir}/man3/getspnam.3&quot;
-ALTERNATIVE_LINK_NAME[groups.1] = &quot;${mandir}/man1/groups.1&quot;
-ALTERNATIVE_LINK_NAME[su.1] = &quot;${mandir}/man1/su.1&quot;
-ALTERNATIVE_LINK_NAME[nologin.8] = &quot;${mandir}/man8/nologin.8&quot;
-
 PACKAGE_WRITE_DEPS += &quot;shadow-native&quot;
 pkg_postinst_${PN}_class-target () {
 	if [ &quot;x$D&quot; != &quot;x&quot; ]; then
diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.9.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.8.1.bb
rename to meta/recipes-extended/shadow/shadow_4.9.bb
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------523549CE7C57738772325247--
