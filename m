Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6393.1630373804204691438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 18:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZEEbkgji;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4877ba6e2e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17V1DHOj020812
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 18:36:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=djiw/L1iEQtlbXMPX3ak8qOROxJIluTkYxzXRW0Zgco=;
 b=ZEEbkgjiyN1Z8b03+/4eoOQGQzL99xnUQ0lmFwai2DYgOSPs6NIu0G8atWWGz/9X0+G/
 pMhG+EAamlmS5aOLRf09UF8eYhGQkQlefY45YN6+iJP0Dlv/4QcSZxF2jL7cnUpMpqje
 W2pnBijHHKIidzATBz69/Am/IyC1NnELTRjHqvXLqNQY/5tNpItGiCT8joXpjmPKspRl
 X2cWz1Jv3bm5IK8u5MNuA6OF4TpuCO6cZqXKpyTBWmbc5hut1ySGDmVkgAwC988yhehp
 3tcwurV7im80+lK2ida0sJF5UCM7SsFA0khQwPe8qGEx66cf0frW2sYZs8jHVhcKQ65W /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3arhwt8ww6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 18:36:43 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17V1agXe000569
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 18:36:42 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 3arhwt8ww5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Aug 2021 18:36:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccvyng3fnqoO2U1+qU5QFiPN15KR1ebEad41680o0c7VSr229e1b1yb4U3xpISZECpI7NAt/ZyVwaWuKhrXNq/JsFkzmNmNU70v0SBE8K/P+bsTB18hD1glgNxfSf84lR6BZqWSg1g5Ja3j0TkzdRoD2VECZA2XK6xXRuUji0253AXFxTaqUcqNAyFYuVzf53IosB3XhC6SQfIIVZfAo1aRwV0zlmri52WLpGAuvNTsVVG8s+1Mu7XwSnziOje0TyiLsnZAzFy6PCaPxGFMhLyCXg8m7m8membHC0SBUQMPP8JHg8F/ahNtmN5zIZFsld0GVcj5zADH/y7RJ1BO5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djiw/L1iEQtlbXMPX3ak8qOROxJIluTkYxzXRW0Zgco=;
 b=aekMG/2WvZb8zkCPpwX9hNbOO+OngA2pwYHbnt4uWZDcHkoZVZlunGP5EyxasKGg1dPRlzfcxE/9piEfp2MzI2IkVMe6IG3MMqhG4CnpF50Gtfj1tISPGaj9vdKmHLU/ogdCgBy7DaUpKdpjSm4y+2C1Dg9XBlmsx1FRyn7DcHlOG5Cra8jcGtOUzDqxDrBXVFhw4XUXIw6k9iVUM3vhGOIVc1QOFiNimnY1coc/7uCA2Kmv6StyHfnjs2nLEs6P95Qx4gguvTKU2chjJFV2V3REW6BYZ1eAtleEU7Nw7SiEpMcmH4vpTPt1+ZkeDkS0u+yZeDdLdnINRmd23QnBqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MWHPR11MB0077.namprd11.prod.outlook.com (2603:10b6:301:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 01:36:40 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d1c0:bab8:4a6a:edf8]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d1c0:bab8:4a6a:edf8%2]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 01:36:40 +0000
Subject: Upgrade uninative to fix multiple native build failures in old unprivileged docker
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org, raj.khem@gmail.com,
        Michael Halstead <mhalstead@linuxfoundation.org>
References: <169FF34664D4ACC1.22970@lists.openembedded.org>
 <169FF42BF9440142.22970@lists.openembedded.org>
Message-ID: <f1f1ee17-1f81-8791-b87e-3692a0cafe2a@windriver.com>
Date: Tue, 31 Aug 2021 09:36:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <169FF42BF9440142.22970@lists.openembedded.org>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by BY3PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:39b::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10 via Frontend Transport; Tue, 31 Aug 2021 01:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df25444e-8675-44fb-896b-08d96c1fc7a0
X-MS-TrafficTypeDiagnostic: MWHPR11MB0077:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB00774CAD6F86814BFAF0C8CC94CC9@MWHPR11MB0077.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TYNuDO7xAmFfSLSx3jlNl1CI5YlUSxOXuVp4xs9qfVPM5xyJu/Xtb8P4/rDtz8xTSMlJ4SmTprewQBHsJLcs4Q/Fgx8PPHn5w3ItnmXh894AaWq65IPagSWyOR/MgPEVvh/XYkZF3IzmBElrFeA1N+oyow1OrNn4YxNF/qlw24svFsSEIjPm8c+fiHsxmu/0xzPZSKRWqmX0Fk5Ep733ZKhWMHxgI4Lm+kKeN+o3ggWSMItBnOGIP94NrM1LyQUXR1nm8EJAq6Mp7MIilHi78NYBCN/fYoffe523tIHnv0uKBTmJ7b7yZemKjLt9EzSaXdLVYA6wW6AlWc8K46jgquHVvX4rbluhGgFOqWz7UMgrvNrF0JOEgsj3NRg629iPZ4ViFUFubxX84nls3nR25xkHejGOKWhFWJu8ymrQwoQ4aNgGSodyuJDbA0Uvzs8e3c8xS6xMlMDJ1SunZz7+3H69sLR5mcAma1vN12a6O9h5EN+u+9UW/KCtpbRUnCrPSy14wrXq+Vnn4UbzJ+zT59mMDegL0T9J5+TkknXEwQ4HWzjXdZTafw1xgpMnWwk2A/dFt1gAXj/bZIKEHQtEg9ARyLhlyxYKABm4jSRq1r324wWmF8xiDOaeFR0lyqCyzWJyWq0skiR4ZidJUZapJcyFEEYxLxhItV+lcNRePXW4Tx/y/X/3G1Z6jUy+ewlqYgb3WH04vZaD3aAmzYi1Xk+8VTty7LBAlyuTpGWY8jzHbNj1Lqp6sqs+SBlYxXRBv5RAwmi5NNyS0b90elf0KjshgyDG8QFMltsT5DqIdDU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(38350700002)(6666004)(6916009)(16576012)(38100700002)(2906002)(6486002)(5660300002)(316002)(2616005)(8676002)(86362001)(478600001)(83380400001)(66946007)(66556008)(66476007)(26005)(44832011)(31696002)(36756003)(52116002)(31686004)(956004)(186003)(6706004)(8936002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXkxc2E3azhZZGE3ZHVTOUhBWVV2K1o3Vjhod3JyM1dwUHlxYnpiY3RTaElT?=
 =?utf-8?B?MHcyRXNRQ0dBVXlwTEk3Lyt4blJueXhIcWk5RS80dTNaa1VzTS9JRGVTekVp?=
 =?utf-8?B?MW40Y200TWhVQ3VxVGtEeXFaQWpFUTZWOVV0alUrMk5laUx2ejhsNldjVWhB?=
 =?utf-8?B?Q1Z1UlBXTHdTemlWM3g4SkE2MlJzdFlxazRLTXMxY1RNbFJYQ3lHQnBWL1Ry?=
 =?utf-8?B?WHk0amh1WUlxVm0vTzdyZEcwQjJUOXZjWTc4NlIvbTFrTGtoQVJFT2JMWkJQ?=
 =?utf-8?B?ZXVEQ2xidWo5SS9HQlRNLzJpMW5tekp2b0tjVExqaXVhWUtjUVdXNmo3TDUy?=
 =?utf-8?B?RGNoVGpleDU3cThZZVBWVU42OWZEdVVNalRwRisrVFd5bVdWOFFCNzZCc3Yy?=
 =?utf-8?B?bWlYUWRZTHFzM1kwenl4UklVUUl4UUszbUpkSWlBc213Yk5BbTdsL1Jabnh1?=
 =?utf-8?B?NjFwT25hbTFtUzczSkhVMzhPdUhKM1hYNHEwMytqZGdqUU1ZTHlMYkk3a0hk?=
 =?utf-8?B?MTJEY0ZEVndySVowVDYzVTZocUdFdndEajFsL2xKb21oVm55UTR2ZWxlbEhE?=
 =?utf-8?B?U091VDZMaE5jT2xQN3R2bG90R2pwcjBLbWVnV1JaOTFzeXBvUE1BS3dkK0NB?=
 =?utf-8?B?eEJXZ1FKc3NqSUlYcEtMSW1DaWJKWnJRYlJDSWluNy9QOTRuR1UyYXVlNlg5?=
 =?utf-8?B?NXdjT1pncEZBU3EzK1N5Umh4amZxUmJ4bTliUU84WHBRZDRLSTg3cXYzRXhG?=
 =?utf-8?B?cS9MZG1rTVZBRFREL0JSVHZ4LzgzZm5kalBQNWVFeGVZWnY0OEx4eXE2SmZq?=
 =?utf-8?B?dUdFSXU0TE5XWkMweTR3WTRNdXNSaVU4cUZPcVdhWUhHbDJTZjF4ZU8xdVI1?=
 =?utf-8?B?YVh4STNmaDQ1aHEvZnZQNm85MDhlT1lzTlMyNkxPakF1T1NGRUdUbXh3Wlc5?=
 =?utf-8?B?TUJIR08yaURJeXVSbmh0NDdZZG9MZ0QwRnhDbmVxaHIwVkNDNW5BLy9XeVdL?=
 =?utf-8?B?VWpmSW9rbW9wM0ZHakVTakErQlM3Znh3ZXgwc3lPclpYQUVmSFB0ekoxN2Vs?=
 =?utf-8?B?SlRlUTVSTjQzYndOKzJMM0lOVmRUNDZiSlMxWTlNRFFUdWFGbVVmNnRwMTk3?=
 =?utf-8?B?TUhBL0dUc1NldkpFVy9DZmUwU1JsZWpqdjBhUzFpM0N0V1ROaGl6NlQwdTEw?=
 =?utf-8?B?dDZQOXh6VTY3MllwdHZBSE9HZ3lPeWw3WTNqUVFpL2QxZlAwY3hBZ3lZeFhz?=
 =?utf-8?B?ck0vWVFxMHVseGVvOVNvRmY5WHJDQTE3T3h5cytUbFFGS0NCbUROaWkvcGlR?=
 =?utf-8?B?QUsvMHhwUWtRb1pNMGVIRUtDcGRjVUZqNXEyVG8rSDZCT2RRb0pHbTUzZUxK?=
 =?utf-8?B?Q0VVU2xiRnZSaXdvOS9DWDBZWWl1TnVTNDA0YVlRNTRJQjVqVzBpVzRaN1lJ?=
 =?utf-8?B?b04relBWOFpiQzMxakxoOHZWTWd0SlNtMXlFTmVLMkVPRlFZVEFqekdhcy9a?=
 =?utf-8?B?SDlScnN3eS9JR3VXK3B5SnN3MVVMeEpBN2pJMEM1UjlYczgyeFcwKyt1NFgz?=
 =?utf-8?B?WCt2WjZ2WUVoYlM0aGtYcGFGQ3JDYjhsQzZOU3hJTFRzWkxpNkpvYnp0NE5E?=
 =?utf-8?B?TzhIaHZlTFhsSzNVU09WZ3VVM0E0STRwckpZWWVXZ1hXdjdsTERFcFZZeFNF?=
 =?utf-8?B?bjJxcTMxUVI1bmZBRnBmUXh3RkVXNFIvYjhBbUZ2K1VEV2s1bmNRc1dEbkE5?=
 =?utf-8?Q?Nhpt3T0X87A9ASXHQV+kG0ZvFv4ZFUa25V+niay?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df25444e-8675-44fb-896b-08d96c1fc7a0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 01:36:39.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEqguhXvXKEEJirEyVg2D7Vwonyl5W98VRURvVzlSvrtUqjcummRPEG6XPITX5XxRf61XAG0QTmGTs1hucZZrYYVfl2ulfEda1e2jtcjf8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0077
X-Proofpoint-GUID: Te6FNwC2ze_cd934yCjlAr6k6wU6j5wn
X-Proofpoint-ORIG-GUID: QB35PNQnaOCImyVwqg6ZMI8Cq-GdAyZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-30_06,2021-08-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310007
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard & Michael,

The reason why I submitted patch [glibc: fix create thread failed in old
unprivileged docker] is there are build failures with uninative 3.3 under
old unprivileged docker. If the glibc fix is OK, would you please upgrade
a new uninative that contains the fix.

Here are the steps to reproduce the failures
1) Run a container without privileged
$ docker pull resin/yocto-build-env
$ docker run -it -e HOST_UID="$(id -u)" -e DISTRO="poky" -v $PWD:/mnt -w 
/mnt resin/yocto-build-env bash

2) Poky build preparation
$ apt update && apt install -y liblz4-tool zstd
$ useradd -u $HOST_UID -m -d /mnt/test -s /bin/bash test
$ su test
$ cd ~

3) Setup a Poky project with uninative enabled
$ git clone --branch master --single-branch git://git.yoctoproject.org/poky
$ cd poky && . ./oe-init-build-env
$ echo 'INHERIT += "uninative"' >> conf/local.conf

4) Build failures
...
$ bitbake ninja-native
|ninja: fatal: posix_spawn: Operation not permitted

$ bitbake go-cross-core2-64
|runtime/cgo: pthread_create failed: Operation not permitted

$ bitbake pkgconfig-native
| configure: error: I can't find the libraries for the thread implementation
...

After applying the glibc fix, I built a uninative tarball on my local
project to replace uninative 3.3. Then repeat above steps, no above
failures any more

//Hongxu

