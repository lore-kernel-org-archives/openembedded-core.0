Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.14218.1630311079658199571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 01:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fP1kSP6c;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4876e13b66=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17U81uo8022188
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 01:11:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=KZTZ3s94veImjFpL5khDpzbhVLKo9Iis8GoZz8I6F8s=;
 b=fP1kSP6cY7kNtsMASWmZX9ileO99kmSfig17GwYeWkP97Pd3CxQnUBndjVzhsOBcrp0y
 xoCjtqRmXF23P1P//joEOWMz8Bq2MIPrkKsm9JkSNm3VWNCXW3rXofT3yOW4ouodLrYc
 LYKliCMPOB6tdL5WWW6KuO4wlnG1NNj8HFXC3l/tiHjulmNp75pLdsV13Rk/Og40g+sZ
 Ega50QRAup30rtiEbelOx2Iqs5xuhTbbzcSPWClVPoQXQ3NAr97KMPKvyDpnKmkCLUE3
 AboEovqjOhC+zWCyTVFGgC6aptrMvc7P+8LQF897C6eTNaxJqGiANkLlB8Z2l+eXVFeg Ow== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3arhwt88fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 01:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTA+F4n2uWEw6ys4+9XPA+oWztx9/m3SX05kXaWQun75JxDxbatV/8yFVyTMh8u3BvfQFv41V6hmvHyTYD2A9m+a48il6QBl1v4x1k6HsdMHiyqbebYz/zjDXPmsIDIo0+2v8GkfkaPYmMAzfNlv2nuU2Q7S+IZMQb5LuPNWo8V+loub0UODxwis+MY5eHtVzd3cGijowMJxQB6j2KivD/5PsCdmg74AJh8xosp6pV7kcXfrAgbW9Sw2jfntpr2TjeoWsVOr4zdPBhKbyOrEiMyabktOacM/xVv3lsqWadQVnB7pOmjJZ4TnU5gFaPz7sus9pAtursr3+TsZy1z2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZTZ3s94veImjFpL5khDpzbhVLKo9Iis8GoZz8I6F8s=;
 b=Ifb9LI9iXERTPKUc56j6AtyJHLXqv6ukrBKUxpPbJ9kAzRajLraf9rSXcp56mDDfKhQEyqxkX1C5iw31NQP0JT6tKKFgUjSocw9t3OuVYCtxn0LZxUQIExRAER8Fx306xVQVSTyhZ5tZJQAefeYVT5Pgc/l1T0QLsQZzolGV6bycycLteRk51TgFsbtIq/F4d65KQ2xWXDqau6tV2mEjWfqPUR1fetdOd2ily8gWMewK8ADEq/rCYyZ/QDgYyJtSQBO6rj1sS1ARJg6ASwxK0H+QN29hhW8kAyHDJM4Qo7OT8zFLvWQgGE7JURBLkd790jWLlIbRDlkEgIpPXEboJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 08:11:15 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::911:37d1:9b4a:7693]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::911:37d1:9b4a:7693%4]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 08:11:15 +0000
Subject: Re: [OE-core] [PATCH] bitbake.conf: support persistent /var/tmp
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16989323AFD32DAC.17148@lists.openembedded.org>
Message-ID: <8b998b82-b567-8c92-0ac7-e6efe5732595@windriver.com>
Date: Mon, 30 Aug 2021 16:11:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16989323AFD32DAC.17148@lists.openembedded.org>
X-ClientProxiedBy: HKAPR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:203:d0::22) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HKAPR04CA0012.apcprd04.prod.outlook.com (2603:1096:203:d0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 08:11:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33d02141-8306-4868-3e76-08d96b8dbcb8
X-MS-TrafficTypeDiagnostic: SA0PR11MB4640:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4640DA57CAD81BE380A5655F82CB9@SA0PR11MB4640.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CjtgK8yFh51YeKuv3x45CAu5SXUP3C1WaFWUvXB+jUe0IudM97PymDzwt02rLzFuZhThFDC7PWEeSoXCK4WuAhqTuYPhMa2SkYZxm3vpvhXTiSOySjsWakYeWpYEMB5Df+yO1Kqjb+y4ZXA+JZ8WegzdycbbNwTcYkCGbWsVdZflMi7dFuPklMdaG4s1Crmj2KkHH1sopI4PBuNbD5VcMwD7RI+Lu7yT1epwcTs0XNgBJyFqNhNNUCb8IHuf6P5RleFhbzVBggIaXLLrZQ0jXc6X6YNltv/NPdM/nDJSQ9tFpMHpJwc9n9BWRZ8sUgtflgiMtCNcM6ubLzSX6OgKQ+UZM/ffqnSOmZEo3Ypqo814Ik2j18Zzp0YTQTppifkIHUFSvJMlh/EZGvWcZx1qm2ZRWkyEhqZU77x/3PIr5neEuNYLL6P352C14pxiqDjLwWPmNJBZhR+e9K2gQMGP78Pvd5x48hzYmCNdrwQLPkRJrJpBK17BFxzXOartYW2gQkL0xOIPecafdmgt/BUOgl5TLjuMVuOf8TNoHDXNcaQ5B5Qm82kFKi0ETCXubsJuFuOxNqY5HXNgffGDZICgb6YFsBxVtASjHXdCZ+nCFzN1tasA8Jc4Q4YPMI9UtABjSIkTF8SctKxi81ZiJHL/BdvpmcwYZDt90stJofK4JtEAXXlxV++QTg/b/yXRTq5Eas9B0esMTDtSK9oWugoAS9w942mdQg4zwBKT7PYHcwSRGvCJd5WlFVqeJMDq2yJstaUqCqhPrPDSGpR1YJB8x3Yp5f9y5r8SusQPBmW2B/MS4WLu2apI/DlO+lcTcUiiBfBKZLDO2lBSuxt5aNMQ92wrPuj6L6z3XNwecaSb+IxXQ0J2ZISXc+kmb0UoOUP7C5CEosEf1izGPyISLss7XaGzYrDAkpdkg2+mhVuI83o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(966005)(16576012)(31696002)(6486002)(186003)(6666004)(8936002)(31686004)(66556008)(38100700002)(6916009)(33964004)(2616005)(8676002)(956004)(508600001)(166002)(30864003)(26005)(2906002)(6706004)(83380400001)(38350700002)(86362001)(53546011)(66946007)(66476007)(316002)(52116002)(36756003)(44832011)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWRLWnRQT0ZORHQ1bkNpZ2ZZdFNlT0x3U0poQzhBTElUMzBVNjcyM2cvcXNr?=
 =?utf-8?B?Y1FDakNTblFzM3RWa2ppT3BWUHYyeFEzMlFWSENPVHAwcDhuVTFiUlJkMFdn?=
 =?utf-8?B?R3JTd0xOdlZDVFVmcVpJYnhOMDhmQ3ozNXVlaE43T2U4N21nMEd4Rnd1OGpI?=
 =?utf-8?B?Q05yZ3hWRWVLVytiSCtPVHdtTkFINGFDMG4yd2xqbXF6NEUybEw1Nk5VWTRa?=
 =?utf-8?B?UVIxbFZ1SS9IY05NdXZrRlY5Q3hOOEZiYVQzRmhrakUxMi81ME5ZakVvUTZF?=
 =?utf-8?B?Z1RDQ2RBaVNIOVBUWnd1WTAxWmZyTjdjZUZsRklJdDFVY2hXbnNWVHQrNUJQ?=
 =?utf-8?B?YXpzeG5USFpIVXdtcUJobjFuMWl6R1N0NEtJNXh0eUwrQmg4SzNCeEFMaU5v?=
 =?utf-8?B?SFAyT1krSzVOa01kVUwyWjl6MS9JVEdxOUY2TGJ3TDFuQUZoNkJhOHZlMEQ4?=
 =?utf-8?B?NGpWTGlRSFZYekJBaWJwYThMYzg1YnBvOUNoZjd3MXNyczNVdUs4b1BUSkRR?=
 =?utf-8?B?V1ZYekJDekNtVWx2VlNEM1RHMGQvcTJTWU5wbHN3bjM5V01NVjBvTUd1Vldx?=
 =?utf-8?B?MUNIR3dQam93djFIREZaa041MXp6b0FzVDBqT05ZejEwSXRTRE9aYnFrc0hL?=
 =?utf-8?B?OWhZTjNZOEpQWEpWb2lxcXFqQS9iNEFsemZNS3dWVUk4VzhjdGdWY2ZnWTFX?=
 =?utf-8?B?eFdDS0pGOHdtYTR5VkQ5eFJDSzd1ZHBFTjY4cWN1ZVBad05EYVJWNllCdUJO?=
 =?utf-8?B?cW91bjFVd1IvSVovbEZNRzQwQjVmT3JxV3p3Wm5HVlErejcxNjF2ZURuOUJV?=
 =?utf-8?B?MjlUWUJNRTYzNGJVKy9JMCtaeXEzTW5ZRE9MYVlPNVUzajJsMERXbWdoZUF4?=
 =?utf-8?B?RzJabU1vZVcwVnR6dmNHZTBrSXR2NlRNOGJpdVF0RXBLZk9xU0JGM2F0WDdy?=
 =?utf-8?B?NEZBSWMydWJiZkhLUzBZMmowQjlMTVRaakloR2pwM1ZkWFoyRStOZkFnclVw?=
 =?utf-8?B?M0dZcW1Qb0JudDJXQTh0YlNkZ0h3RWFhN01pVVR5THhnL3NTanoydjltWTI3?=
 =?utf-8?B?VkVFVHVMWDAvQ3RUZElrejZQdUdDUlFLVUsyRmFmM1J2Nms2K1FpbDh6QXdR?=
 =?utf-8?B?TzJCdmhPbGkvN3lnUkpHM1FPOHg1WHY5UGpUa0lBbVdVa0U0K0h0dDVoTXNO?=
 =?utf-8?B?UjVINUd0aGJPYitEbExvUTBCVnltaWRkZVpQTGRoV0J6Rndqd0h2dmVkWExC?=
 =?utf-8?B?RU5QeW40WklOellldmlHaFIvVlZmVFJIY2F0b2IwQ2JSb1VmdnFJTjJQd2Ix?=
 =?utf-8?B?dTdwV3pHNVdsN0Nuc3d3SkJsRHQwbGNmQ0JsRkxQTTlCM1ZFVDI0RWJLbWhs?=
 =?utf-8?B?YWtmVlRkRUdQekVXVndWYTE3R2NyR3Z5TjZPMXprWW9mNG83SmJKNUYvZzA5?=
 =?utf-8?B?OFRVRTdadktGM2xmUkRiSThwczlVbnJoRnJzZGVzMmRsZDFjYXBUeGR1UlVU?=
 =?utf-8?B?WWV0TnVWYnY1eHpPRzBKcHNrcm51U0k2ZXFISlZZKytteGM1QU83RUZ0Ti9P?=
 =?utf-8?B?ZnVkRmRJQW0wSXZCK0YrME5RRXgyZ3Bjd2JNcVhvOE96YXE3aFFlenh4QnYr?=
 =?utf-8?B?QmZFR2M1SnhLSDJBaTBoclpmdXVIZnFTZU90SmIzRGRBSldJSkFIR0ZCRFhH?=
 =?utf-8?B?aFhTS3h5RjNxZ3JrVGNJWS9DTmt6L2R4MUtoZFdIUTlJRS9BQjZsVXBkamxn?=
 =?utf-8?Q?P9oE96dy7epbPvAescAOGZ8X62FA243LYN4kwns?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d02141-8306-4868-3e76-08d96b8dbcb8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:11:15.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjq9eOygqH6shdhvuAl36qZOaFf92qYv10o9R4nxSmKKerefmOncv355OqdcqE3ikhE5jwuEVeIrCqh5YLw+zAqETCVdvl3it0REXYYDJNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
X-Proofpoint-GUID: dA7FwXKYRYc6a1AfN3LQJv4kyccI-n8T
X-Proofpoint-ORIG-GUID: dA7FwXKYRYc6a1AfN3LQJv4kyccI-n8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-30_03,2021-08-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300060
Content-Type: multipart/alternative;
 boundary="------------756D429CD8BA250726DCA164"
Content-Language: en-US

--------------756D429CD8BA250726DCA164
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 8/6/21 9:21 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Steps:
> 1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
> 2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
> 3. docker run -it --rm poky:latest /bin/sh
> 4.
> /var # ls -al
> drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
> drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
> drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
> drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
> drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
> drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
> drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -> volatile/tmp
> drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
> /var # cd log
> /bin/sh: cd: can't cd to log: No such file or directory
> /var # cd tmp
> /bin/sh: cd: can't cd to tmp: No such file or directory
> /var # cd volatile/
> /var/volatile # ls -al
> drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
> drwxr-xr-x    8 root     root          4096 Mar  9  2018 ..
>
> In step3, because we don't launch container with init system,
> volatile/tmp is not created during startup, and the dad link will cause
> error. Supporting persistent /var/tmp can resolve this problem.
>
> To support persistent /var/tmp, rename VOLATILE_LOG_DIR
> to VOLATILE_DIR
>
> Don't use VOLATILE_LOG_DIR/VOLATILE_TMP_DIR
> to control it separately since it will make things complicated,
> we need to make kinds of fs-perms*.txt for kinds of combination
> of the two variables.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/conf/bitbake.conf                                 | 10 ++++++----
>   ...erms-persistent-log.txt => fs-perms-persistent.txt} |  2 --
>   meta/recipes-core/base-files/base-files_3.0.14.bb      |  7 ++++---
>   .../recipes-core/initscripts/initscripts-1.0/volatiles |  3 ---
>   meta/recipes-core/initscripts/initscripts_1.0.bb       |  7 +++++--
>   meta/recipes-core/systemd/systemd_249.1.bb             |  5 +++--
>   meta/recipes-core/udev/eudev_3.2.10.bb                 |  3 +++
>   7 files changed, 21 insertions(+), 16 deletions(-)
>   rename meta/files/{fs-perms-persistent-log.txt => fs-perms-persistent.txt} (95%)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 821dae2ba6..e93c0b7893 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -86,9 +86,11 @@ USRBINPATH_class-nativesdk = "/usr/bin"
>   # Root home directory
>   ROOT_HOME ??= "/home/root"
>   
> -# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
> -# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
> -VOLATILE_LOG_DIR ?= "yes"
> +# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to
> +# /var/volatile/log, /var/tmp links to /var/volatile/tmp
> +# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log and /var/tmp
> +# is on persistent storage.
> +VOLATILE_DIR ?= "yes"
>   
>   ##################################################################
>   # Architecture-dependent build variables.
> @@ -349,7 +351,7 @@ FILESEXTRAPATHS ?= "__default:"
>   #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
>   #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
>   #  oldincludedir
> -FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
> +FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_DIR')) else 'files/fs-perms-persistent.txt'}"
>   
>   ##################################################################
>   # General work and output directories for the build system.
> diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent.txt
> similarity index 95%
> rename from meta/files/fs-perms-persistent-log.txt
> rename to meta/files/fs-perms-persistent.txt
> index 518c1be3c9..326c0ed092 100644
> --- a/meta/files/fs-perms-persistent-log.txt
> +++ b/meta/files/fs-perms-persistent.txt
> @@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
>   # Links
>   ${localstatedir}/run	link	/run
>   ${localstatedir}/lock	link	/run/lock
> -${localstatedir}/tmp	link	volatile/tmp
>   
>   /home				0755	root	root	false - - -
>   /srv				0755	root	root	false - - -
> @@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
>   # Special permissions from base-files
>   # Set 1777
>   /tmp				01777	root	root	false - - -
> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>   
>   # Set 0700
>   ${ROOT_HOME}			0700	root	root	false - - -
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 94299431f6..0e06629bbd 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -29,7 +29,7 @@ S = "${WORKDIR}"
>   INHIBIT_DEFAULT_DEPS = "1"
>   
>   docdir_append = "/${P}"
> -dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
> +dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}tmp"
>   dirs2775 = ""
>   dirs555 = "/sys /proc"
>   dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>              ${localstatedir}/backups ${localstatedir}/lib \
>              ${localstatedir}/lib/misc ${localstatedir}/spool \
>              ${localstatedir}/volatile \
> -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> +           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}log \
>              /home ${prefix}/src ${localstatedir}/local \
>              /media"
>   
> @@ -53,7 +53,8 @@ dirs755-lsb = "/srv  \
>                  ${prefix}/lib/locale"
>   dirs2775-lsb = "/var/mail"
>   
> -volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
> +volatiles = "${@'log' if oe.types.boolean('${VOLATILE_DIR}') else ''} \
> +             ${@'tmp' if oe.types.boolean('${VOLATILE_DIR}') else ''}"
>   conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>                ${sysconfdir}/issue /${sysconfdir}/issue.net \
>                ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index cd8a4be05f..eeeb8905da 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -24,11 +24,8 @@
>   # a link will be created at /var/test pointing to /tmp/testfile and due to this
>   # link the file defined as /var/test will actually be created as /tmp/testfile.
>   d root root 1777 /run/lock none
> -d root root 0755 /var/volatile/log none
> -d root root 1777 /var/volatile/tmp none
>   l root root 1777 /var/lock /run/lock
>   l root root 0755 /var/run /run
> -l root root 1777 /var/tmp /var/volatile/tmp
>   l root root 1777 /tmp /var/tmp
>   d root root 0755 /var/lock/subsys none
>   f root root 0664 /var/log/wtmp none
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 65f9c0ae8d..cc079024f4 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -105,9 +105,12 @@ do_install () {
>   	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
>   	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
>   	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
> -	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
> -		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
> +	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
> +                sed -i -e '\@^# link the file@ a\d root root 0755 /var/volatile/log none\nd root root 1777 /var/volatile/tmp none\nl root root 0755 /var/tmp /var/volatile/tmp\nl root root 0755 /var/log /var/volatile/log' \
>   			${D}${sysconfdir}/default/volatiles/00_core
> +	else
> +		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
> +			${D}${sysconfdir}/init.d/populate-volatile.sh
>   	fi
>   	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
>   	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
> diff --git a/meta/recipes-core/systemd/systemd_249.1.bb b/meta/recipes-core/systemd/systemd_249.1.bb
> index 9bfb12249c..0914b7e0b2 100644
> --- a/meta/recipes-core/systemd/systemd_249.1.bb
> +++ b/meta/recipes-core/systemd/systemd_249.1.bb
> @@ -251,8 +251,9 @@ do_install() {
>   		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
>   	done
>   
> -	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
> -
> +	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
> +		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
> +	fi
>   	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>   		install -d ${D}${sysconfdir}/init.d
>   		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
> diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
> index a5d2115f80..3761fd748e 100644
> --- a/meta/recipes-core/udev/eudev_3.2.10.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.10.bb
> @@ -42,6 +42,9 @@ do_install_append() {
>   	install -d ${D}${sysconfdir}/init.d
>   	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>   	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
> +	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = False ]; then
> +		sed -i -e 's%mkdir -m 1777 -p /var/volatile/tmp%mkdir -m 1777 -p /var/tmp%g' ${D}${sysconfdir}/init.d/udev
> +	fi
>   
>   	install -d ${D}${sysconfdir}/udev/rules.d
>   	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
>
> 
>

--------------756D429CD8BA250726DCA164
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 8/6/21 9:21 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16989323AFD32DAC.17148@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Steps:
1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
3. docker run -it --rm poky:latest /bin/sh
4.
/var # ls -al
drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -&gt; ../run/lock
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -&gt; volatile/log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -&gt; ../run
drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -&gt; volatile/tmp
drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
/var # cd log
/bin/sh: cd: can't cd to log: No such file or directory
/var # cd tmp
/bin/sh: cd: can't cd to tmp: No such file or directory
/var # cd volatile/
/var/volatile # ls -al
drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
drwxr-xr-x    8 root     root          4096 Mar  9  2018 ..

In step3, because we don't launch container with init system,
volatile/tmp is not created during startup, and the dad link will cause
error. Supporting persistent /var/tmp can resolve this problem.

To support persistent /var/tmp, rename VOLATILE_LOG_DIR
to VOLATILE_DIR

Don't use VOLATILE_LOG_DIR/VOLATILE_TMP_DIR
to control it separately since it will make things complicated,
we need to make kinds of fs-perms*.txt for kinds of combination
of the two variables.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/conf/bitbake.conf                                 | 10 ++++++----
 ...erms-persistent-log.txt =&gt; fs-perms-persistent.txt} |  2 --
 meta/recipes-core/base-files/base-files_3.0.14.bb      |  7 ++++---
 .../recipes-core/initscripts/initscripts-1.0/volatiles |  3 ---
 meta/recipes-core/initscripts/initscripts_1.0.bb       |  7 +++++--
 meta/recipes-core/systemd/systemd_249.1.bb             |  5 +++--
 meta/recipes-core/udev/eudev_3.2.10.bb                 |  3 +++
 7 files changed, 21 insertions(+), 16 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt =&gt; fs-perms-persistent.txt} (95%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 821dae2ba6..e93c0b7893 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,9 +86,11 @@ USRBINPATH_class-nativesdk = &quot;/usr/bin&quot;
 # Root home directory
 ROOT_HOME ??= &quot;/home/root&quot;
 
-# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
-# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
-VOLATILE_LOG_DIR ?= &quot;yes&quot;
+# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to
+# /var/volatile/log, /var/tmp links to /var/volatile/tmp
+# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log and /var/tmp
+# is on persistent storage.
+VOLATILE_DIR ?= &quot;yes&quot;
 
 ##################################################################
 # Architecture-dependent build variables.
@@ -349,7 +351,7 @@ FILESEXTRAPATHS ?= &quot;__default:&quot;
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
 #  oldincludedir
-FILESYSTEM_PERMS_TABLES ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@'files/fs-perms.txt'ifoe.types.boolean(d.getVar('VOLATILE_LOG_DIR'))else'files/fs-perms-persistent-log.txt'}">&quot;${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}&quot;</a>
+FILESYSTEM_PERMS_TABLES ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@'files/fs-perms.txt'ifoe.types.boolean(d.getVar('VOLATILE_DIR'))else'files/fs-perms-persistent.txt'}">&quot;${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_DIR')) else 'files/fs-perms-persistent.txt'}&quot;</a>
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent.txt
similarity index 95%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-persistent.txt
index 518c1be3c9..326c0ed092 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent.txt
@@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 94299431f6..0e06629bbd 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -29,7 +29,7 @@ S = &quot;${WORKDIR}&quot;
 INHIBIT_DEFAULT_DEPS = &quot;1&quot;
 
 docdir_append = &quot;/${P}&quot;
-dirs1777 = &quot;/tmp ${localstatedir}/volatile/tmp&quot;
+dirs1777 = &quot;/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}tmp&quot;
 dirs2775 = &quot;&quot;
 dirs555 = &quot;/sys /proc&quot;
 dirs755 = &quot;/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -42,7 +42,7 @@ dirs755 = &quot;/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${localstatedir}/backups ${localstatedir}/lib \
            ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
+           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}log \
            /home ${prefix}/src ${localstatedir}/local \
            /media&quot;
 
@@ -53,7 +53,8 @@ dirs755-lsb = &quot;/srv  \
                ${prefix}/lib/locale&quot;
 dirs2775-lsb = &quot;/var/mail&quot;
 
-volatiles = <a class="moz-txt-link-rfc2396E" href="mailto:${@'log'ifoe.types.boolean('${VOLATILE_LOG_DIR}')else''}tmp">&quot;${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp&quot;</a>
+volatiles = <a class="moz-txt-link-rfc2396E" href="mailto:${@'log'ifoe.types.boolean('${VOLATILE_DIR}')else''}\+${@'tmp'ifoe.types.boolean('${VOLATILE_DIR}')else''}">&quot;${@'log' if oe.types.boolean('${VOLATILE_DIR}') else ''} \
+             ${@'tmp' if oe.types.boolean('${VOLATILE_DIR}') else ''}&quot;</a>
 conffiles = &quot;${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f..eeeb8905da 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -24,11 +24,8 @@
 # a link will be created at /var/test pointing to /tmp/testfile and due to this
 # link the file defined as /var/test will actually be created as /tmp/testfile.
 d root root 1777 /run/lock none
-d root root 0755 /var/volatile/log none
-d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
-l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 65f9c0ae8d..cc079024f4 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -105,9 +105,12 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
-		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+                sed -i -e '\@^# link the file@ a\d root root 0755 /var/volatile/log none\nd root root 1777 /var/volatile/tmp none\nl root root 0755 /var/tmp /var/volatile/tmp\nl root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
+	else
+		sed -i -e 's;TMPROOT=&quot;${ROOT_DIR}/var/volatile/tmp&quot;;TMPROOT=&quot;${ROOT_DIR}/var/tmp&quot;;g' \
+			${D}${sysconfdir}/init.d/populate-volatile.sh
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
diff --git a/meta/recipes-core/systemd/systemd_249.1.bb b/meta/recipes-core/systemd/systemd_249.1.bb
index 9bfb12249c..0914b7e0b2 100644
--- a/meta/recipes-core/systemd/systemd_249.1.bb
+++ b/meta/recipes-core/systemd/systemd_249.1.bb
@@ -251,8 +251,9 @@ do_install() {
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
 
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
index a5d2115f80..3761fd748e 100644
--- a/meta/recipes-core/udev/eudev_3.2.10.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -42,6 +42,9 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = False ]; then
+		sed -i -e 's%mkdir -m 1777 -p /var/volatile/tmp%mkdir -m 1777 -p /var/tmp%g' ${D}${sysconfdir}/init.d/udev
+	fi
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------756D429CD8BA250726DCA164--
