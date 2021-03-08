Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.56])
 by mx.groups.io with SMTP id smtpd.web12.2863.1615236428331940698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 12:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZMPLmgOY;
 spf=pass (domain: windriver.com, ip: 40.107.237.56, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjJK5N1YOdTT2YsVXNTFX8ME8IXHUJtKFd2CUo6PcA0gIKom3cZ8fLHee2C+/So/nEtmIhckxvRbb7DfdowqYmaF3UKnLjaDKzOSKYuLU6Lbhq06Q7FkDuq/aLPEdm2FwW9IJnZ1Gt2bD8GY3sxEEcCqp2BxGAHUFAwRgHFr66EIXOCcUG2Kl9cAeeo58ZBfGNtFLnKUFtR8UNemVxDf5DqX+BfukD4RtRPM+A1f7RmigaQetFUPwh5xdbtxSCZEYC0Iu+uC79EtWj6xUxxGy3n8AAmuAkVDxZRkRBrfTCXTOoqMbUHwrusUrpja6+PpYEyO3Efzhym7bQnM+0XphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HEyM0/Q5qYRXP8QtmMgtmtlRwBfX/2IxWWzNCjVFH0=;
 b=iOfH69zXp82bbNNdjSrOJx6YUsebF2hMI9LdH6gRPbDagKUqtTZ7OPMEyTOu7eWJvDgw1j+neBKJqiw9IXmaw3e7FvBGEu8mvXOqKavCfsja/rItgRdPxzoP0Kk5rVefL4qoaM7ZBuR3OxY1axlsx4pZJPCwYnYqpVhjJUFxVn7aEkoGq6BIr+Ae/4vPBSNLve+gCPqyRgjoNCR0OPIuAvzUUIyDMxU2b/R8mHVabVMF1zpH3FhBXMRqibd9CgFG3HwFRVUhtJWhhXa63jMDbtGAqRF+kYHYHVxUTjMLjsHVr+Oi62SwW9PdH3g5LLTyOK7mkk1er9qd70MNmIDEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HEyM0/Q5qYRXP8QtmMgtmtlRwBfX/2IxWWzNCjVFH0=;
 b=ZMPLmgOYTAG+BpNpwjsFEGU+k7scS5BC97dtx5/HI8nYqZ8siihfqryMd1VkaP2vIu331WaaXrXxF2tFeuMG91+eBJuOWYeh7RfzzkRxOczYLgqI8Zy9Okz2Vi7aNYN8ayZywhBuIQGULIlLUiIMrAYKr7E0OSGg+UBHrYbxpVA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2604.namprd11.prod.outlook.com (2603:10b6:5:c8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Mon, 8 Mar 2021 20:47:06 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7%7]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 20:47:06 +0000
Subject: Re: [OE-core] [PATCH] scripts/oe-timeout-dd-test.sh: add script
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210307205817.5679-1-sakib.sajal@windriver.com>
 <a8d69435-a6cc-4daf-a22a-cb190c04f781@windriver.com>
 <847ee37ec1bc1545e0a13d11c4eeac6358ef3fa8.camel@linuxfoundation.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <2b197274-5e89-2648-5881-4f2671a1e6aa@windriver.com>
Date: Mon, 8 Mar 2021 15:46:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <847ee37ec1bc1545e0a13d11c4eeac6358ef3fa8.camel@linuxfoundation.org>
X-Originating-IP: [184.146.108.8]
X-ClientProxiedBy: BL1PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.146.108.8) by BL1PR13CA0131.namprd13.prod.outlook.com (2603:10b6:208:2bb::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.23 via Frontend Transport; Mon, 8 Mar 2021 20:47:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d94f881-52eb-40a2-f11e-08d8e27355a2
X-MS-TrafficTypeDiagnostic: DM6PR11MB2604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2604F1ADA508D79EB3BD7BC5F2939@DM6PR11MB2604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ekp8coRipblq+e0y5nbox9xDm2FngcMSv42b4qAZQjEZ19n6LWEsA+lMMQ9AgK5Bj+dBMJCxDTgS9INwFkitpyDu2W0nHfIKR9tE6uATz1AhV9if7VWwQ4i+j24jZPra11Vi1h5YOXkwPDcgNfXk8LVhalpWZhABPx4iucHBxc5zwNENpRGDG47cwGCQGgNRD29ueR5udYP/VNEO6c2xAucTGe0sVgGuwstRiT0QeOxueipDS70ep10HTlrDHtgVlDgvzMV60zY/Q+RIqaanOERSOZ9JsY4NBR3ZCZKOOn14kaE3adP7GIHBAmI8+nJXq8mUejfCWlgs2Od/Xk30hSbxxga1qx2TIEsZ/1g1BAYp6auGzSApqCajS+oRY7stFRd5qdq2tuXIIBnUg8CCMsCjvM3D425sje02QJL/o6XuUALZ92wAe5PtZ5lHqYF8hX3nYEY62BiUWicNRXVw7muXoM5ukqAj6Z/faWO5mtdsimmBFinwtidACuKTDaHp2K5tpgGPCJ+Fh4AgAR0qepXEL47U1ZlFuSSdO9zj/gOFTzYCiYKoqWjv8j3jNgmdYH5OKck4Kh8IFsZ5HBTLWj/5zXpMStQaK11UtCrjio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(36756003)(26005)(6486002)(83380400001)(956004)(44832011)(31696002)(16526019)(86362001)(31686004)(53546011)(186003)(110136005)(5660300002)(8676002)(316002)(66476007)(478600001)(2616005)(66946007)(66556008)(16576012)(2906002)(52116002)(6666004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ahYj5aQImVVR+hUqhBFAk/1Qby6QFb86eH61qIK2QiAjJKAVJumdtbDeA6is?=
 =?us-ascii?Q?quoQ2NzsqkuPK4OsbRwUL4oe1oQDewWJlw8rbL17ibsPfo3CGfzkT7CmMXVq?=
 =?us-ascii?Q?1kW7lN02E/hZAq8yocCSdJ7g1cNb0hDxEUQVeGXKdSmJL22F8NoAc0NK9gPX?=
 =?us-ascii?Q?qbk6DKrPPkVEMK+FLhE/0OED9zybr3FEYP2mq2HJHcLN6ri+lx1+mPsAPMdI?=
 =?us-ascii?Q?4uaDbsNXG0jUPynaXC1KCeDa0DED+vhnf1kDIrRE4DMptekStqjcoPHlFEVN?=
 =?us-ascii?Q?LQTIIwSNdpYUc56ubnWp7tKHhIcto+a2ZoaKUxVXMdfgshcdHRS0wd8GXiXg?=
 =?us-ascii?Q?jH2gyfWC4Fh1cy7RqwM8dfkAYqmXQBhvKYXBt07K0CrJh5H0RWZm72MnDkNz?=
 =?us-ascii?Q?Lb3PQgD9HQBOY2d1qcvUGzlTQzOGYCcD2GYis0Fx4ouKpTUcYfd4oMTQAjTZ?=
 =?us-ascii?Q?JQFIrbNvfAJqXe/vke6Owc7wjcogswzgKnTa/9LtprbXZD7xwP3vhDqNE95I?=
 =?us-ascii?Q?BisHJjgOJAef5Fuur5cXGUwFrDBVwNxXDSqMyu8qTkHrOF47Dw3peWbjUsnB?=
 =?us-ascii?Q?YRhVvTtg/FXgkI4o4H+U6timF8F7xhrlwYonri+X3Qj1Oty6wUKAQ7rXRD6j?=
 =?us-ascii?Q?184DVn9ZQ+t8lVllNPUKUPl3I2+hhe6DqOGCBAbryDB+Y1kyXfLPia6zloHs?=
 =?us-ascii?Q?fXElGIFd0Vige/GsvW8+56Zr+Pod3MJhCYaA7uVwl6yXn6Xx/555uaKrVgfa?=
 =?us-ascii?Q?QCH4ng+l2vGFk5jSLC8gDxBz/gPd/hCCYaicm3cvJ/BnIeljeOp0a06f4OcD?=
 =?us-ascii?Q?qlj5slpHCEnm0xSKQt+MBFbzqIf1DXOOZOpIPU+i2Ub5tnmtYewPVkTqOzfI?=
 =?us-ascii?Q?oUCIZNbtrBR0zkdPONIjCMY+FK9s5/W42kbB702XQSU2mVl0hOFRo1YJPiXs?=
 =?us-ascii?Q?J3RBSAMTkcdPUuSt8I2ODg+EbheaCMO2zxwllUXOi8PBGbcaKU0qOKlzzUn8?=
 =?us-ascii?Q?ivpVvuhiauSWfI+wq1ZGbLFR1Se1f9lsyRg9I6dAgbR4hRMWlKZRRRUeUP5i?=
 =?us-ascii?Q?0zuPPBWYfGRIEOK/VAG6DgXec+6oy7wVZ/R/8G/DYO5p9q8xN0pPwRqItFQN?=
 =?us-ascii?Q?7A8jitNsjtE6NcA4slIuLtuuplrHpErmr9I9c4sAtBT5eotCZk9N3DS7102U?=
 =?us-ascii?Q?KAM33Yj81ina6LlQhnaT4nb4cY8u6DBRuu+0YziD4rZvyQJT5nwOGhQblvto?=
 =?us-ascii?Q?6fi+YXTCi5K86Q3PKO73JWXVLm5fjNtPc3exub3VHx12McYWuVc8Ta4elYLi?=
 =?us-ascii?Q?oRakiDE2JW1oCs93beLPQkRn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d94f881-52eb-40a2-f11e-08d8e27355a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 20:47:06.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rla6YyrOBiIyffKBFNLhCJDJjGhkiXQ+tRAc318nQVXNmZomaL3OIJiN4kTX5ghonJlrCN4o9LB6L5lDb41atk74IR5R385w4PaeUkYr74w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2604
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-03-08 12:33 p.m., Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, 2021-03-08 at 09:50 -0500, Randy MacLeod wrote:
>> On 2021-03-07 3:58 p.m., Sakib Sajal wrote:
>>> +timeout $1 dd if=3D/dev/zero of=3D/tmp/foo bs=3D1024 count=3D$2 >/dev/=
null 2>&1
>>> +
>>> +if [ $? -ne 0 ]
>>> +then
>>> +        top -b -n 1
>>> +else
>>> +        echo "success"
>> Do we need this else part? It'll just fill up the logs?
>>
>>> +fi
>>> +
>> What values have you tried and how did that work out?
>> On Friday, a build with 100KB and was it .5 seconds and didn't
>> see any event exceed the timeout, right? We also ran several builds
>> out of a shared local sstate-cache and didn't see any event exceed the
>> timeout, iirc.
> It would really help me to have an idea of what we're proposing we config=
ure
> on the autobuilder and how to capture the result...
>
> Cheers,
>
> Richard

Hi Richard,

Randy and I could directly use autobuilders and make the necessary=20
changes to run the tests/experiments, if you prefer to do it yourself,=20
read on for more details.

We have been working on a way to collect more data to deal with the=20
various intermittent failures that we've been having. We put together a=20
simple script that tries to write a specified amount of data to the=20
filesystem within a specified time. This script can be used to determine=20
if there is io stress on the file-system, if so it captures the output=20
of top to see which processes are running.


To use the script to monitor the filesystem during a build, add this to=20
local.conf:

BB_HEARTBEAT_EVENT =3D "<interval at which data will be logged>"
BB_LOG_HOST_STAT_ON_INTERVAL =3D "1"
BB_LOG_HOST_STAT_CMDS =3D "oe-timeout-dd-test.sh <timeout> <no. of=20
kilobytes to write>"

The logs are stored in tmp-glibc/buildstats/*/host_stats file.

Sample log output:

Event Time: 1615158368.577454
Date: 2021-03-07 23:06:08.586541
oe-timeout-dd-test.sh 0.1 1000
success

Event Time: 1615158392.393126
Date: 2021-03-07 23:06:32.480006
oe-timeout-dd-test.sh 0.1 1000
success

Event Time: 1615159999.497806
Date: 2021-03-07 23:33:19.508317
oe-timeout-dd-test.sh 0.1 1000
top - 15:33:20 up 136 days,=C2=A0 8:11, 16 users,=C2=A0 load average: 641.5=
4,=20
792.91, 704.
....


The builds that exceeded the timeout can be found by:

grep "top " tmp-glibc/buildstats/*/host_stats

For example:

build$ grep -r=C2=A0 "top " data_collect*/tmp-glibc/buildstats/
data_collect1/tmp-glibc/buildstats/20210307205832/host_stats:top -=20
16:22:44 up 136 days,=C2=A0 9:01, 16 users,=C2=A0 load average: 1653.48, 77=
4.33, 548
data_collect2/tmp-glibc/buildstats/20210307205836/host_stats:top -=20
15:33:20 up 136 days,=C2=A0 8:11, 16 users,=C2=A0 load average: 641.54, 792=
.91, 704.
data_collect2/tmp-glibc/buildstats/20210307205836/host_stats:top -=20
16:21:50 up 136 days,=C2=A0 9:00, 16 users,=C2=A0 load average: 859.48, 535=
.06, 464.
data_collect2/tmp-glibc/buildstats/20210307205836/host_stats:top -=20
16:23:50 up 136 days,=C2=A0 9:02, 16 users,=C2=A0 load average: 1300.73, 86=
3.23, 596
data_collect3/tmp-glibc/buildstats/20210307205840/host_stats:top -=20
14:57:51 up 136 days,=C2=A0 7:36, 16 users,=C2=A0 load average: 343.42, 281=
.75, 243.
data_collect4/tmp-glibc/buildstats/20210307205840/host_stats:top -=20
15:07:42 up 136 days,=C2=A0 7:46, 16 users,=C2=A0 load average: 607.03, 447=
.76, 324.
data_collect5/tmp-glibc/buildstats/20210307205840/host_stats:top -=20
14:57:35 up 136 days,=C2=A0 7:35, 16 users,=C2=A0 load average: 304.50, 270=
.72, 239.
data_collect5/tmp-glibc/buildstats/20210307205840/host_stats:top -=20
15:04:53 up 136 days,=C2=A0 7:43, 16 users,=C2=A0 load average: 491.61, 307=
.05, 262.
data_collect5/tmp-glibc/buildstats/20210307205840/host_stats:top -=20
16:27:34 up 136 days,=C2=A0 9:05, 16 users,=C2=A0 load average: 457.19, 639=
.73, 563.


I ran 5 builds simultaneously using a shared sstate-cache with 0.5s=20
timeout and 100kb write, which did not trigger the script for io lag for=20
any build.
I reran the test without shared sstate-cache and all 5 builds=20
encountered io lag at least once, some 3 or 4 times, as shown in the=20
grep output above.

Looking at the logs, it looked like the machine was swapping.

The <timeout> and the <count> variables may need to be adjusted for each=20
machine.

We found a bug with the data collection mechanism, where if the scripts=20
hasn't returned within a second, it times out and is killed. This bug=20
should not hamper with you carrying out tests, I will send a fix.

The bug looks like following:

Error running command: oe-timeout-dd-test.sh 0.1 1000
Command '['oe-timeout-dd-test.sh', '0.1', '1000']' timed out after 1 second=
s


Sincerely,

Sakib

