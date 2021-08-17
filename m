Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36063.1629184406303186326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 00:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=dSy64CkD;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3863d9f4d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17H6q6pp021913
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 07:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=eW99IeEIrk23nrJ+Eu4t2FekP0D2W8ASmle92lxS/ag=;
 b=dSy64CkDCWps17vvFrL3diaBLyqH+cjJQ/Qasv/Wfm5+qQSeSldSxBKelVpQgTqKfd0E
 syrxMSjOhiDVpdLZgwq6ZyKma4iZoA4plnoUJdx1IRFji2fkUAPQUttKB/XoNMw2vNDk
 Af8RyFly6Fncbmu+vuAzmEchFl0Ndd7RRPKd4CpQiaJsa+ywWHXE+i/SKDhICd2yJv3f
 luMFqA5ieRUPQtTrTRH6CLU+LLthiv3whbTALidr7COfiZGeENdOUnfQH6kiwNSrJjcI
 7KYmDDrwxbyRMl2DoQGnJbAXo3HqWC0wSYP52TLn4S+uoHwbKiNfbNnkTuR5PkkYiE6B eA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwwg8b4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 07:13:24 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17H7DOEU026261
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 07:13:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwwg8b4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Aug 2021 07:13:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkQhWNqsY01TJVMZOt9YV9XfZaxs2326BSuCCSjLIjmjPnPh0spQjiY5RnIODrO+CRrAFzd7pS3gjcnFWGYPEVJnr5WhiMBaj5tPVHA064Yml+VkGTI4r9sSOKTPpLjDtH6RBOaZP/IE3Mpx1iOb7a2I64XcIc2ZzF9YQAxsJ7lHJs2j4fwxAO04zEmaOha4a0y8n8VJLSenn7hXZlW6KSCqT7ik9kLBNyoDdQd9cHe0SxXtBfbb32mMDSZ2GUiJv/YVGQQg2gcZF041biY2A4uifq5EeqlCap+1SknI9S7K9pAApwrFa2C4q+6e9Xg9Pi1fjuUnwnx1CIzJ58fmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW99IeEIrk23nrJ+Eu4t2FekP0D2W8ASmle92lxS/ag=;
 b=LCfF2lus/MzzN1PBR7cT8jOrUY1uSrx+WdtSSCXQquP43iWyrr2whog1m2lS6ofW3mTPa1nR71T8Q75a/0zCPPRvQsKLpQwRqzUouyotngFQ+JP1jJMmtiYV/I2N1ZOMyPae1+ZysnYHxpPNNDYPg3lrEvcJy48+rjtBdurcmXBmh6/asmuInDO4Yg70tXErBaWMCijaO1rTtl6rfuDS7DJa92EGcvok2LcihVgFBKD1pIXdmPOZ3T+oiyXs/NrEsH3ncO+PqKHUnVfWpD4dizjoVZ+XgqpEmZTauShH3R3Nqao1P8YTC8MtAw+KXqheCPxUF+9kW9jaJ4NFfF35hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 17 Aug
 2021 07:13:22 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 07:13:22 +0000
Subject: Re: [OE-core] [PATCH] shadow: update default settings for useradd
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210817031124.35396-1-yi.zhao@windriver.com>
 <CANNYZj8M0dWxvrqpbU-HcNK1XPBG44n7OdnrBZ82SgaaA+Ypww@mail.gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <04adccbd-8352-8247-f88b-53c05361743f@windriver.com>
Date: Tue, 17 Aug 2021 15:13:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CANNYZj8M0dWxvrqpbU-HcNK1XPBG44n7OdnrBZ82SgaaA+Ypww@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend Transport; Tue, 17 Aug 2021 07:13:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0602e269-aac2-4730-b2f3-08d9614e7f60
X-MS-TrafficTypeDiagnostic: CO1PR11MB4771:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4771BE8E4E95CB9D1608AB07F9FE9@CO1PR11MB4771.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d3vc2sdMv9/Sw5Lgwh9dk7BKbDDtxuCer2XPcpTmNCIAl5MOvN1veKMqKacsYCtT8P8wVg9KFgFssub5s/Y60jBcfUJjJxoY/dJ0xPFKfP8PhdNzTksXEETG2Y7MZayP9XYNHLFgiKz/89g5SI/7t8mnPhp5lkRuDwS5vr5gtqkAaM5ZdWllCNVdY1t/UpuqF72onx+91HhSNpqakvJCA2PlqJio8g6Tf4z+nG+L8Ob19gNxzce8qpt3smOqZt53pRlB/zLxTPX4v9tlJ3LzHca3k+1cYH8vFsmzWlFnOIuSHKepErNrOiTQZAmnjM2qAuZMEveHyMHr+ULq6Ry3b0ksHYQE79WozIDskJTW8DI2dV4ws6OASOTu+i5XI3lXEVyog7Jx0XiPJU2tazFCZIQjfM1CL4icQ72s3lsCjnsncKuAL0Hfo9YCX2pYdoambQJohr4PWF5qMj2x6pd7bSuWG2v4lIU22G2vvMDqn2sIxuc9YOjIiR6MZoTsH32erKO1lN4S0AeyWr9x1z0TZhFAW8IbL5jcpc0yBdg6FF9CKVReKJOfEUo1Uknw/EKn9t1Vl1pWNJOfrOKckSgxtvEetPaB1RC+m/Rx0FVHhDGEwJ5e9YT3irQoSsntroWhdSl3GMxY7NgQ2gGRGWYpobnB9DT5GQrb1yNggy8lNWvjZFIi4SJn1M7HOiQGB8zC1mOv/oMOtorF2hA6UbM+a6uSM+QDQmW2mQEpmAdrq5Wh+LRNm3XrITX0X/MJ1w/gvweYTdM8PBymHImZ3P9wbazkr4iXO54wN/k8vwMwpAX6OAEBr0WgZDNh6n9H9e3SZph0MSq/t8SDdm/kqdFylQi8jh4tKaPPCuyoC5ULeNrNeQQcmHsUkBbUBa2peBpcPNAJ88FSHoeqP9L1Uh/tEZ1/qJFggF2Z1OVnES0tIjI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(166002)(31686004)(316002)(5660300002)(36756003)(2616005)(956004)(4326008)(15650500001)(6706004)(966005)(6666004)(8936002)(16576012)(44832011)(478600001)(6916009)(8676002)(83380400001)(86362001)(31696002)(38100700002)(38350700002)(53546011)(33964004)(6486002)(66476007)(66556008)(26005)(186003)(66946007)(52116002)(2906002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnoxNU1Za0NZU2thZ2krRG9WWUhrTE4rQVBvYVVZTmJnNk1Rc1pPZW9xaVZh?=
 =?utf-8?B?NFY5cXFQR3ZmODIxbmZFNHBsRVVYT05FdmFsMmczbENEZ1ZKcldJYkVYNTVq?=
 =?utf-8?B?cVVGUkpFbFkxbUVzQ2F5UVEwdGxOSCs2cGhSZ2d6NXd4N3BOVDF1a01mczFp?=
 =?utf-8?B?T0N5bWFieDZ3TW5ZMmgwQzVpT0w4TWFuRG1JZ3hrQW1GMWNqWVVPMTJzNGlk?=
 =?utf-8?B?VENPeFNuRG5YNjkyWHRIQTlTMisxTUNHaGIrM0MzTU1jUFdlZWUvMExkUlQ4?=
 =?utf-8?B?bHp1eEJaSXJ0RnNtNmZmZzlsRjJGQjA2VUhnL1k0Tm9PR3EzMDlXeTFEVStt?=
 =?utf-8?B?b0pVWE9uYk9DaVBUWHF3U3UxZ3VucDc5ZFlSMmErUHl1L1BzVlhDZi83aXNt?=
 =?utf-8?B?eE5ZQ00vMFZzeFdlVXo5MktqZkdiR0xxSE1YZE9QQ3BUdHRYWTllbGlvMWNr?=
 =?utf-8?B?REV4TkNoSWN0U251YW9OTVpBOVFici8rVE5QcS9zQlYvR2dWRzFnS3R3TTRX?=
 =?utf-8?B?SGVxcVNXOStZU1hMWHd2MlovYWZlSzhVRGpKT3Z2Mkt1Q3FrajFWamNQZUxZ?=
 =?utf-8?B?Yk9WVzNHTk9sUkxHYUhHQkliQTRDamhrbmUwOGsxYnZlajFsK2d0bTloQ3pY?=
 =?utf-8?B?Y240OFVlWGZIbldJSDFIbGZlT0IraTFsYldLN2R4Y0R1bmJoWExjSTIwRHM3?=
 =?utf-8?B?VkFTdHVnWHNZS1dUTnI0MlNJbENwTjFacnB3Mk5Ta3VEeDEzaDhlVm9ERWkx?=
 =?utf-8?B?ZFhSQm5PREJBa01XUm44K2hWSnNVRDBjYzh0VjB4SWQvZG82aDlRRzFZWDRH?=
 =?utf-8?B?QVRYYkg0ZjI3dXBFNTR1S25kV0VvVE9hY0tVZWJmSVV4YkRXaHkxSXdDd2Ru?=
 =?utf-8?B?VndtOVNGandEMGR4a2NoZVZNaW95c3VCeTlIMWpERTgybGN5Zk0wVjhBR2RY?=
 =?utf-8?B?VjJTekk4d2hsRGhheTVZMnFDSVVibjhKVjVpdllzblFaUllkNk15ZzZOeEJF?=
 =?utf-8?B?d3F6OVZnUjc4N2paaHMxL0E0MDFwYXhDQU1QdDE1YWdlOXI5UUNlQk5IOXpR?=
 =?utf-8?B?bG1UWGx0Wm1aUVNEV3llbHpFVDdmSWt1QitzVlBrMWR1Qkc5elA0L0JtbVZN?=
 =?utf-8?B?RTQrbG1Pa3doakN1SDRmeVZVOUhmTjJ4Nmo1OGlKTUtnWjVVM0ZUd0o1a2gw?=
 =?utf-8?B?eE0zSmNRY3pyQTU0ZVlEc1ZQUkFLblRvV0Roc2kxOEx2UGJvZ0RkNjlUWnRX?=
 =?utf-8?B?Y0tRM0VnUHMzYVEzcXBvK1pIWkN4NXRhbHQ5VHdib3gvVXM1TjlDd0ZvemhQ?=
 =?utf-8?B?KzhTaWJ6WTUwT0FQZmpqNFFjNllYdHFsSkhKcE5lMFUzUG93YXVEckFaY3FD?=
 =?utf-8?B?U043Qjd1S1FiR1lTVmRsaDJTcjR0MXRHNVY2bXR3b3BseW1Md3gvNXNnZG91?=
 =?utf-8?B?eVFQM3pzMXpoeUdXRzZDUjVGRnlSNVBrVjFYZCtYV2pDeGJ6Uy9UdmtveUh3?=
 =?utf-8?B?cGNyZmVPMkRndTVUQ01pRlpSa3kwQ3ZFdEVYYkdOZjVaczBqL2hqcmlwUjc0?=
 =?utf-8?B?U3g5MVZiT1pmTGVGUXM4ODFGSVlMN2pPT1hVQTdIcUFUaGU1Y3dwblQwT2tL?=
 =?utf-8?B?TklRZ2ZKbTl5S3hHRTk4ZE1EM3BySmRJTTZXWkhvL3ZWUkF2SlowRHpCL2Ro?=
 =?utf-8?B?eVU5UFV6R24zd0hkNHRUN1VtYUNYVCt5U1pwSVkrSGRkWi9jS1pFbXdGN2VO?=
 =?utf-8?Q?mF5xz7Ap+r+N0ygwGlVvpqGuiSa7C3P7ATlWI5m?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0602e269-aac2-4730-b2f3-08d9614e7f60
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 07:13:22.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMewCxYOXyOUlMkfnG/+zFPnQSp/Kv6CXSDCsiLMwpBMWDhhhDR4S857PRnwlPqoxG5a38c9xm4vkZAbo/sqAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
X-Proofpoint-GUID: WBF7e-4QOAiqdR0qitNHSAxjCuk8EjfB
X-Proofpoint-ORIG-GUID: r5L7g4e2ezOYQNJiVBVvS_wB0bj_Atg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_02,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170047
Content-Type: multipart/alternative;
 boundary="------------2D6513A6A2DBCA0B4B2DB060"
Content-Language: en-US

--------------2D6513A6A2DBCA0B4B2DB060
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17H6q6pp021913


On 8/17/21 2:59 PM, Alexander Kanavin wrote:
> If the issue is that /etc/default/useradd was deleted, shouldn't we=20
> address this by reinstating that file? Patching the source code does=20
> not seem like a better solution, and introduces surprising behaviour=20
> for those expecting upstream defaults rather than Yocto's.

Thanks. That's reasonable. I will send V2.


//Yi


>
> Alex
>
> On Tue, 17 Aug 2021 at 05:11, Yi Zhao <yi.zhao@windriver.com=20
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-i=
n
>     settings by default. Some settings are not consistent with previous
>     shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the defaul=
t
>     shell to /bin/sh and stop creating mail spool.
>
>     [1]
>     https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6=
629669ef0b647267b
>     <https://urldefense.com/v3/__https://github.com/shadow-maint/shadow/c=
ommit/bbf4b79bc49fd1826eb41f6629669ef0b647267b__;!!AjveYdw8EvQ!Kk3VAv9WZwGA=
3kQvHueZFUH7P9syGlPpKSUrJFOeT58lU68Bf5fcNuv3yIPf9hGQng$>
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     ---
>     =C2=A0...0001-useradd-update-default-settings.patch | 38
>     +++++++++++++++++++
>     =C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +
>     =C2=A02 files changed, 39 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-extended/shadow/files/0001-useradd-update-default-settin=
gs.patch
>
>     diff --git
>     a/meta/recipes-extended/shadow/files/0001-useradd-update-default-sett=
ings.patch
>     b/meta/recipes-extended/shadow/files/0001-useradd-update-default-sett=
ings.patch
>     new file mode 100644
>     index 0000000000..1e6702019b
>     --- /dev/null
>     +++
>     b/meta/recipes-extended/shadow/files/0001-useradd-update-default-sett=
ings.patch
>     @@ -0,0 +1,38 @@
>     +From 46106ec16409ea99f73a8a8823e50ac54db8e122 Mon Sep 17 00:00:00
>     2001
>     +From: Yi Zhao <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>
>     +Date: Tue, 17 Aug 2021 10:11:27 +0800
>     +Subject: [PATCH] useradd: update default settings
>     +
>     +The shadow 4.9 stops shiping /etc/default/useradd[1] and uses
>     built-in
>     +settings by default. Some settings are not consistent with previous
>     +shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the
>     default
>     +shell to /bin/sh and stop creating mail spool.
>     +
>     +[1]
>     https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6=
629669ef0b647267b
>     <https://urldefense.com/v3/__https://github.com/shadow-maint/shadow/c=
ommit/bbf4b79bc49fd1826eb41f6629669ef0b647267b__;!!AjveYdw8EvQ!Kk3VAv9WZwGA=
3kQvHueZFUH7P9syGlPpKSUrJFOeT58lU68Bf5fcNuv3yIPf9hGQng$>
>     +
>     +Upstream-Status: Inappropriate [embedded specific]
>     +
>     +Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     +---
>     + src/useradd.c | 4 ++--
>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/src/useradd.c b/src/useradd.c
>     +index 0d3f390d..715351b4 100644
>     +--- a/src/useradd.c
>     ++++ b/src/useradd.c
>     +@@ -104,9 +104,9 @@ FILE *shadow_logfd =3D NULL;
>     + static gid_t def_group =3D 1000;
>     + static const char *def_gname =3D "other";
>     + static const char *def_home =3D "/home";
>     +-static const char *def_shell =3D "/bin/bash";
>     ++static const char *def_shell =3D "/bin/sh";
>     + static const char *def_template =3D SKEL_DIR;
>     +-static const char *def_create_mail_spool =3D "yes";
>     ++static const char *def_create_mail_spool =3D "no";
>     +
>     + static long def_inactive =3D -1;
>     + static const char *def_expire =3D "";
>     +--
>     +2.25.1
>     +
>     diff --git a/meta/recipes-extended/shadow/shadow.inc
>     b/meta/recipes-extended/shadow/shadow.inc
>     index 97ffae978a..e2a7a5bac6 100644
>     --- a/meta/recipes-extended/shadow/shadow.inc
>     +++ b/meta/recipes-extended/shadow/shadow.inc
>     @@ -16,6 +16,7 @@ SRC_URI =3D
>     "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP=
}
>     <https://urldefense.com/v3/__https://github.com/shadow-maint/shadow/r=
eleases/download/v$*7BPV*7D/$*7BBP*7D__;JSUlJQ!!AjveYdw8EvQ!Kk3VAv9WZwGA3kQ=
vHueZFUH7P9syGlPpKSUrJFOeT58lU68Bf5fcNuv3yIMldpXy0w$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://shadow-relaxed-usern=
ames.patch \
>     file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patc=
h
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libsubid-link-t=
o-PAM-libraries.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-useradd-update-=
default-settings.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     =C2=A0SRC_URI:append:class-target =3D " \
>     --=20
>     2.25.1
>
>
>=20
>

--------------2D6513A6A2DBCA0B4B2DB060
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/21 2:59 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8M0dWxvrqpbU-HcNK1XPBG44n7OdnrBZ82SgaaA+Ypww@mail.gmail.com">
      
      <div dir="ltr">
        <div>If the issue is that /etc/default/useradd was deleted,
          shouldn't we address this by reinstating that file? Patching
          the source code does not seem like a better solution, and
          introduces surprising behaviour for those expecting upstream
          defaults rather than Yocto's.</div>
      </div>
    </blockquote>
    <p>Thanks. That's reasonable. I will send V2.</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8M0dWxvrqpbU-HcNK1XPBG44n7OdnrBZ82SgaaA+Ypww@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, 17 Aug 2021 at 05:11,
          Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The
          shadow 4.9 stops shiping /etc/default/useradd[1] and uses
          built-in<br>
          settings by default. Some settings are not consistent with
          previous<br>
          shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the
          default<br>
          shell to /bin/sh and stop creating mail spool.<br>
          <br>
          [1] <a href="https://urldefense.com/v3/__https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b__;!!AjveYdw8EvQ!Kk3VAv9WZwGA3kQvHueZFUH7P9syGlPpKSUrJFOeT58lU68Bf5fcNuv3yIPf9hGQng$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b</a><br>
          <br>
          Signed-off-by: Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com" target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;...0001-useradd-update-default-settings.patch | 38
          +++++++++++++++++++<br>
          &nbsp;meta/recipes-extended/shadow/shadow.inc&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
          &nbsp;2 files changed, 39 insertions(+)<br>
          &nbsp;create mode 100644
meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch<br>
          <br>
          diff --git
a/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch<br>
          new file mode 100644<br>
          index 0000000000..1e6702019b<br>
          --- /dev/null<br>
          +++
b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch<br>
          @@ -0,0 +1,38 @@<br>
          +From 46106ec16409ea99f73a8a8823e50ac54db8e122 Mon Sep 17
          00:00:00 2001<br>
          +From: Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com" target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
          +Date: Tue, 17 Aug 2021 10:11:27 +0800<br>
          +Subject: [PATCH] useradd: update default settings<br>
          +<br>
          +The shadow 4.9 stops shiping /etc/default/useradd[1] and uses
          built-in<br>
          +settings by default. Some settings are not consistent with
          previous<br>
          +shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change
          the default<br>
          +shell to /bin/sh and stop creating mail spool.<br>
          +<br>
          +[1] <a href="https://urldefense.com/v3/__https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b__;!!AjveYdw8EvQ!Kk3VAv9WZwGA3kQvHueZFUH7P9syGlPpKSUrJFOeT58lU68Bf5fcNuv3yIPf9hGQng$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b</a><br>
          +<br>
          +Upstream-Status: Inappropriate [embedded specific]<br>
          +<br>
          +Signed-off-by: Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com" target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
          +---<br>
          + src/useradd.c | 4 ++--<br>
          + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
          +<br>
          +diff --git a/src/useradd.c b/src/useradd.c<br>
          +index 0d3f390d..715351b4 100644<br>
          +--- a/src/useradd.c<br>
          ++++ b/src/useradd.c<br>
          +@@ -104,9 +104,9 @@ FILE *shadow_logfd = NULL;<br>
          + static gid_t def_group = 1000;<br>
          + static const char *def_gname = &quot;other&quot;;<br>
          + static const char *def_home = &quot;/home&quot;;<br>
          +-static const char *def_shell = &quot;/bin/bash&quot;;<br>
          ++static const char *def_shell = &quot;/bin/sh&quot;;<br>
          + static const char *def_template = SKEL_DIR;<br>
          +-static const char *def_create_mail_spool = &quot;yes&quot;;<br>
          ++static const char *def_create_mail_spool = &quot;no&quot;;<br>
          + <br>
          + static long def_inactive = -1;<br>
          + static const char *def_expire = &quot;&quot;;<br>
          +-- <br>
          +2.25.1<br>
          +<br>
          diff --git a/meta/recipes-extended/shadow/shadow.inc
          b/meta/recipes-extended/shadow/shadow.inc<br>
          index 97ffae978a..e2a7a5bac6 100644<br>
          --- a/meta/recipes-extended/shadow/shadow.inc<br>
          +++ b/meta/recipes-extended/shadow/shadow.inc<br>
          @@ -16,6 +16,7 @@ SRC_URI = &quot;<a href="https://urldefense.com/v3/__https://github.com/shadow-maint/shadow/releases/download/v$*7BPV*7D/$*7BBP*7D__;JSUlJQ!!AjveYdw8EvQ!Kk3VAv9WZwGA3kQvHueZFUH7P9syGlPpKSUrJFOeT58lU68Bf5fcNuv3yIMldpXy0w$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}</a><br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://shadow-relaxed-usernames.patch">file://shadow-relaxed-usernames.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class="moz-txt-link-freetext" href="file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch">file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://0001-libsubid-link-to-PAM-libraries.patch">file://0001-libsubid-link-to-PAM-libraries.patch</a> \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://0001-useradd-update-default-settings.patch">file://0001-useradd-update-default-settings.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          <br>
          &nbsp;SRC_URI:append:class-target = &quot; \<br>
          -- <br>
          2.25.1<br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2D6513A6A2DBCA0B4B2DB060--
