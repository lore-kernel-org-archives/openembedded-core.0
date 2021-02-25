Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.79])
 by mx.groups.io with SMTP id smtpd.web10.394.1614289247254268355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fY/DhIO3;
 spf=pass (domain: windriver.com, ip: 40.107.237.79, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDkrrEtJtoMKgQWZY89dd2+LN3Wwvmil2ITkyNTXg1CfRIQ97xo8dg6X/012K0Sm7DtT0zeL9N9fkEj/R7pRmzNxCo+qZlVZ8vGBaxGTIjlvEkT3nN6PcdUoWkCVcmPooUVByfNVj8ZMAKivCvcjCvvy3LvI8QoqhGu8bzxb6tipih22FtJ+PP9Lk8DzC9QIl4UJ4/TOLMt5YBa7vESII7+HE2srx+0AFgkdruf0g+fTCaTNabZqcgwXAV24pbQuzSd1n1ediOkIS8NML2Ey7ZnwmRhQaMG8kKT+HU/EURkYVLDvyNNsBHZU2nWjqk1sjhethmegDX9p6v4KXqtKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqvGgHTMa5We2wgsunK3lkBvVkMIZsocuz0H70DtapY=;
 b=kw3n4u5HI/Oo5wRGVwBX4JG+KhAPAXbXv1KUnsq3CKFB+aFHDgaYwEnyQP5gr/7+lR9MDwXOA0k+md2dovwq9njmCsKJ1M99pESKonA9HhRzz0J7uggzd8Pf4FAwHCoy2kChdNSXuZ3ASrEGIPovL1cocTX6nMdul3PTZ3fIfuAoXtkRtuGLLCGJlojzI+sA8+D4csrpU4TSgbWGS1+40pXBpmwyu2/G7J+ovlz5NfiUZvE/6MT6kXl0xtmR+LQaJNVdHX6GNWBfYBuqOVbN+3c24Jrhcm0H21Nx+3ySXS12NjpHwbkBDO0oa+Q8QhWPXYwlh94oHtqyydlumSVrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqvGgHTMa5We2wgsunK3lkBvVkMIZsocuz0H70DtapY=;
 b=fY/DhIO3mzccskIXM1zalU/rLV3KEGCz4EpS0VaTwJfM6iarPI6tnaYhjp0q+k/Q/eBHz5zgIp2e+K6X2Dv/F/Z1NHCkpG0ldWNraRIiHAMcjVZ/CuTbF/2Lm/FhVK2z5yr2c0Pu2dLYsv9xXsZtPcOEtTVgSPDVFCwRXIN9HNE=
Authentication-Results: lexmark.com; dkim=none (message not signed)
 header.d=none;lexmark.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3354.namprd11.prod.outlook.com (2603:10b6:5:9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Thu, 25 Feb 2021 21:40:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 21:40:44 +0000
Subject: Re: [OE-core] [v2] Merge meta-rust to oe-core
To: Martin Jansa <martin.jansa@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org, steven@stevenwalter.org,
 johan.anderholm@gmail.com, derek@asterius.io,
 Paul Barker <pbarker@konsulko.com>, cardoe@cardoe.com, dev@codyps.com,
 tylerwhall@gmail.com
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
 <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
 <20210225173758.ao34u4demrbahfz2@jama>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <9267b04d-4f3a-9efc-d2cb-41206bd9b762@windriver.com>
Date: Thu, 25 Feb 2021 16:40:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210225173758.ao34u4demrbahfz2@jama>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR08CA0033.namprd08.prod.outlook.com (2603:10b6:a03:100::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 21:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ea7644-6b95-498b-ca6f-08d8d9d60175
X-MS-TrafficTypeDiagnostic: DM6PR11MB3354:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3354494B707BF9A447D1EECCF89E9@DM6PR11MB3354.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4AXoprEQz0zv0zEXZMlsKnA1vtXD2ZmeIdVdT7RnP0ZLYn8o8UoMhXtjaQQcx/FfOYJCRBk9/iDkXx9qCpBLLL+pGP7U/rRxUbD6+k4FMJztYFQMtAvna53YySwcuudQ3Rhe0EWro28mltl3jreZOazaXE+wsgzY1SQwiol/8Sf1bFSDqgjVsLbTEU1szXBEHMVMsIVjJBg/Ih/19dCVCzLXoVU2NVsxqlk+rQSGJzX7jfY4ri7taadk0aRgqHbBXsxkJLS0jzomT8MWwMyctmviiwu4DfQkhdXHbjM0LZsNzABwuMofwbs/uB/xhbE2qV8c0xFBqtMfR6OR+2X1eNVC7vDXvyv/jgusVhlTk4d87qWHl0PCiMf2zYj3L+HKnPG48IjB+W8PiLtqMOpLmqyiaP4T5SSNnWyOhL9oJI1+DwALwqoAOUteGCufMadFeL9TBDtk3Ynja5Tis9WT+JGOsCn8M1CDKbiNsuakQsuqLPT9dRupFdiWzb/3YC/YF5nO3tdI25AUvz7uKyolKv27b4jEJRrWjQzgWxGCMBxgiTUryNSo+oBtIMfOcNEa33Db6rz0APH83fUBYyoWuPN/yH+RUY8Vb31imcYzdt+H9zYC+pX8+sEeTUS6KaT9KQmmk/EtwrhzaTz3/VeZ3huP+P1wlY24N0RzUaP8hDHlo4Isoo3eKDWNPNM3Tq5q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(6486002)(7416002)(26005)(16526019)(31686004)(53546011)(2616005)(31696002)(86362001)(186003)(83380400001)(36756003)(956004)(966005)(66556008)(8936002)(6666004)(52116002)(4326008)(5660300002)(316002)(8676002)(66946007)(16576012)(110136005)(66476007)(478600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?q+IA66JLo9gNPz9X53na8qF9WL77KDI2u2clqSHfIDpQTqTF9N1MdYKM/lZe?=
 =?us-ascii?Q?zVdDy1maIIrFj4QAzb1DD5Q92aFnLlyUHbAonnbpsqeAW/EFHBxaZoZOnSfx?=
 =?us-ascii?Q?+Lo6X7+eSkZrLaRSlPkQQ9Q+iCufU0B6M/bbTGQn6ex1/s5h7qlOkoukanl3?=
 =?us-ascii?Q?JxazZdnosSBaios8xftNyl/2M9f1VYAawblj/q3RJ7T2lUzCwLdBNdP6go45?=
 =?us-ascii?Q?Olg7mnlHiQJ8SHWjC9+SOQD0ZdN9cdyBLzzxrpiRLHXTcmvUcGzcTPhh/ggS?=
 =?us-ascii?Q?ZuaA7xD1sQ2miPNt88uBdcfmJJF03Du9AuMuV2rGTEJuZ3Hz0Ql9d0oZ3h74?=
 =?us-ascii?Q?SovzbM7VcIrv6CbKveYJducnRvAwmQYWzq33q3eTzVDg5SOisilYcqpBe4yg?=
 =?us-ascii?Q?R3H8RnD3MEcX4Gmu783/vR2QmZFYrLgLjHZbxI/6Bd/Rnuyt8vKeEcJxKG3Q?=
 =?us-ascii?Q?cbzvLUhhEAKqPKjCPAMmE12dpu4xg59fZ0pbgM/srWCqlWzc/UBuAQpP/cu7?=
 =?us-ascii?Q?18Zire7kef98qrtMYdrlb5QmDCa19QZ6xDs1cr1vQlamW2cF27ReQzIkh++w?=
 =?us-ascii?Q?PJ3M/Qn5n8mt7zk1sLKzetn1qXzpdZuEbZCrqSYzh6LWPWF2zBH5jdUz+2QG?=
 =?us-ascii?Q?+Lq41hQ9diZ2vR2WB1yPhKQ8fJ1/fWeiuPEBc3b1/WZQI38qn90+tCqGkgUM?=
 =?us-ascii?Q?QK7Vw6ylwlaUrXZHHAph/dsys9hv2vxaZBcvc6jIwyDoW2Idkgn6e4jmZ3I5?=
 =?us-ascii?Q?M7q3abOvF6CkFYA9Uup3RHc19PagGjYA15n1zYnkHfY7i+KqQNasV4cRChL/?=
 =?us-ascii?Q?3WvSdOZWPkJsJj66AGk7RSWU2eBtvFITwmmgD1iJvSVk4nkSRU4kzeac8ly+?=
 =?us-ascii?Q?Cvmdwg9bU2651G6HYhAJ4p+j3l4MbqCdYvA22eUrl1ntWvobb2S3wthfxHL/?=
 =?us-ascii?Q?gx0ucBVggY0WNHw5aidioSaZ8m6PNJQZOiYxpsbw2p+46Wo7bc4sa98o9YIT?=
 =?us-ascii?Q?DmlXCNaAFclL2mYRmMTB+SqYTHwuf1PV7TgpjElx/GmRMurETVYZOxqz+fjH?=
 =?us-ascii?Q?LQ2C0e0MoBEocXusIHfaFwlyz+5JvLK/lfTCF4VO1GFXQemrJAlA38Lm3cw1?=
 =?us-ascii?Q?Qejvnyvn3a67C69P9gSqNVeYM7Uq+Opnu4VMRlv6nqNnsv37MBP9VrRgZgfT?=
 =?us-ascii?Q?bs9fjOi+5EEy7ToH7Vk6xpOHgjHBI5Q3c9atp2dtKwBk8zh0vLQdy1JC5n9U?=
 =?us-ascii?Q?TUQC7bMEopj9FVi/xV/dwfUXHeecOuLmsquoNyNx+afEcJzrgALwMax5uEtS?=
 =?us-ascii?Q?ialero6wBwozpQHhqZq+QNRf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ea7644-6b95-498b-ca6f-08d8d9d60175
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 21:40:44.6249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGmH+37dQcUi4MDF6WBtnIV1Sb0QFbGagdl2ymznF8F7f+jjZaTnEq8t+wVvkgZRJD5Vx/aMwW1ihNNe3BbqW8tBqrgoKFtU1gwLLBI2dHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3354
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-CA

Richard,
I won't have a v3 today.

I'm adding some of the people have worked on meta-rust as an FYI.
Sorry that I haven't been CCing y'all earlier.

If you'd like to be dropped from the thread say so on list or to me=20
privately.

One brief comment below but I haven't had much time
to work on this today yet.

On 2021-02-25 12:37 p.m., Martin Jansa wrote:
> On Thu, Feb 25, 2021 at 04:55:43PM +0000, Richard Purdie wrote:
>> On Wed, 2021-02-24 at 20:48 -0500, Randy MacLeod wrote:
>>> Added or updated these commits:
>>>
>>>  =A0=A0=A086109491bc maintainers: Add myself as maintainer for rust pk=
gs
>>>  =A0=A0=A0...
>>>  =A0=A0=A0b411e322b3 rust: remove container build scripts used by meta=
-rust
>>>  =A0=A0=A0c646d47ebc rust: update the README to conform to being in oe=
-core
>>>  =A0=A0=A0e19d823567 meta-rust: merge commits
>>>
>>> The last commit update was just squashing a new commit from meta-rust:
>>>  =A0=A0=A0f8b9103 Remove checks for Rust versions we don't build anymo=
re.
>>>
>>>
>>> To Do List
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> 1) cargo-bitbake - the README suggest adding this using desktop
>>>  =A0=A0=A0cargo but once we get the SDK merged, it should be added the=
re.
>>>  =A0=A0=A0Someone suggested using devtool for this rather than cargo-b=
itbake.
>>>
>>> 2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
>>> git bisect using poky, meta-oe/master, meta-rust+SDK patches.
>>>
>>> 3) Add a test case to either:
>>>  =A0=A0=A0- just build rust-hello-world or
>>>  =A0=A0=A0- run it in qemu
>>>
>>> N) Fix *some* of the remaining bugs in:
>>>  =A0=A0=A0=A0=A0=A0https://github.com/meta-rust/meta-rust/issues
>> I put this into master-next to see how it looked. The build hasn't comp=
leted
>> yet but so far:
>>
>> rust-native doesn't build on debian8:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/40/s=
teps/13/logs/stdio
>>
>> oe-selftest:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1855/=
steps/14/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1887
>> (others will likely show the same issues)
>>
>> which is basically three tests failing:
>>
>> oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
>> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
> Not sure how to read these, but it might be fixed in upstream by:
> https://github.com/meta-rust/meta-rust/commit/920328c8d8dd553e69309733d8=
74229af4fa159f
> the sstate-diff-machines.sh doesn't show with an issue for rust-native w=
ith this one applied.
>
> And it did show an error without it:
>   =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata be=
tween qemux86 and qemuarm =3D=3D=3D
> ERROR: rust-native different signature for task do_populate_sysroot.sigd=
ata between qemux86 and qemuarm
> NOTE: Starting bitbake server...
> NOTE: Started PRServer with DBfile: OE/cache/prserv.sqlite3, IP: 127.0.0=
.1, PORT: 46469, PID: 57036
> Hash for dependent task rust/rust_1.49.0.bb:do_install:virtual:native ch=
anged from 7334d76a4757c1b893a8c2b8c85ada005788b3adeff5a33fe509c43f994d91c1=
 to 162ccf6462851630b0816fdb5fbe68f6b158b81f4ce3ed45ec4c1f258f93212c
> Unable to find matching sigdata for virtual:native:OE/meta-rust/recipes-=
devtools/rust/rust_1.49.0.bb:do_install with hashes 7334d76a4757c1b893a8c2b=
8c85ada005788b3adeff5a33fe509c43f994d91c1 or 162ccf6462851630b0816fdb5fbe68=
f6b158b81f4ce3ed45ec4c1f258f93212c
>
> ERROR: 1 errors found in BUILD/sstate-diff/1614274412/signatures.qemuarm=
.do_populate_sysroot.sigdata.log

I have that in my patchset locally:

commit e19d82356755a42a46221cb1a0fbacf6339560a1
Author: Randy MacLeod <Randy.MacLeod@windriver.com>
Date:=A0=A0 Tue Feb 23 21:26:23 2021

 =A0=A0=A0 meta-rust: merge commits

 =A0=A0=A0 Merge most of:
 =A0=A0=A0=A0=A0 git log --oneline --no-merges 5cda04c..029f1ea
 =A0=A0=A0 with two layer.conf exceptions explained below.

 =A0=A0=A0 f8b9103 Remove checks for Rust versions we don't build anymore.
 =A0=A0=A0 920328c rust-native shouldn't depend on TARGET variables

and I confirmed that it's in master-next.


../Randy

>
>> oe-selftest -r distrodata.Distrodata.test_maintainers
>>
>> so the maintainers entries aren't quite right which is easy to fix and
>> the sstate signatures aren't behaving correctly which may be more fun,
>> depends what is wrong. Those tests explain they're broken (which is wha=
t
>> we have the tests for) but more investigation would be needed to
>> understand how/why.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>>=20
>>

--=20
# Randy MacLeod
# Wind River Linux

