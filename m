Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0040.outbound.protection.outlook.com [104.47.32.40])
	by mail.openembedded.org (Postfix) with ESMTP id BDC3877BFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 22:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bskrZsM57Fg9OjHdgLbs31y2x81+HquWcBdjrNbfM54=;
	b=T4J7Y5NJiAVhZVnj+wNowdtAqKwv9F8FWnoq4Yrcn/LjnJncWLX5lvg3aL7AK0PLcK8DjI6MEws83RJddabxS6OJb3IiOgD2JU5AzCCCiE4Golv1ea29n7xC/iDzVxWGLyRlGo9akj+u45+wWp2TKrCdr7Kh/2EbaIqbOKT5JoA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	MWHPR01MB2688.prod.exchangelabs.com (10.172.165.14) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Mon, 10 Apr 2017 22:29:14 +0000
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
	<04df66a4-7305-12f9-8398-66bb2a09a796@gmail.com>
	<3b7a87b8-05ac-12d0-5e83-95aed03d7dcd@xevo.com>
	<7c5867be-485b-1d3e-c2bf-ebf4e0fa2da0@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <5633c594-39f7-729e-f8f6-d024337d4489@xevo.com>
Date: Mon, 10 Apr 2017 15:34:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <7c5867be-485b-1d3e-c2bf-ebf4e0fa2da0@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR20CA0009.namprd20.prod.outlook.com (10.171.151.147) To
	MWHPR01MB2688.prod.exchangelabs.com (10.172.165.14)
X-MS-Office365-Filtering-Correlation-Id: ab23a4f6-1a8d-4ad6-c684-08d4806104c2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:MWHPR01MB2688; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	3:caVmAibEjUevCiDRsJk1c86fA+3ZGDjopQaObVzlmqB6Xi4MAhZkxZx9vr/klrtKSvkeYlQsVxoNQt9hOH5oBl/tnstmf4c+l/XCwPe5OJbiUBUlk6cJPeJuA1Si1dYwjjcJUWbhyCHY+AnuQgCglGH6I+UmUYKgp6GnHxp1GUAjR6s8c4mIK3TpkYhMergt1at+Hp99juyKVWT/JkgJiT1FfebDRi10+92IaJLz2pRLnQAM2kdyk6AdGzkrMET+8AccB61o5z1umR7JIeEt7/G3L03WKOBOd6uukL+oR+xJYuxKLLIqasefPt9g1e49EHnDw7IjAvuu9CL8OQwnKg==;
	25:eig6M2q3/mReWIfRb2//ISQ/SY20+9Cm7OOeU3Pb8xWIMO+MWzD0TMi/R390URvuscl3skvEPMR8AjMeSb6Q07hoMrG7G5PSvOZmYktEScVUWCR4FZ4nRJu7etsjeE/pprZfeCXRDz+XNqLvVBOECSoGYb4qAnlXxHKWx8MpdyRujYGMXXP0DBKzW8DjOrSrr4C/C+WhfXywsakMka0lm9SL9dHaJnM0G6jBIFnasOkvGJExixV5Q06x1daTDLHxCcSMEv91VhHJ3JMI2iFxn0luTi7d9LJlwqj6nkhmfPSrXyVawfu8nllxQvE5RE7k4i2qtY0FsoM8284+Gu6Kcg5N30I3TkYUx9GwFgFlGEQgqkIWipoOcIgUcJbPRpZqARYEOnM46NjXm+CtaXLkQtCJ9ls4RzyHkGC4ZaYwdcaNcbvkTtn6p0ta715HFa7e5YiEVFeuKUX5EeD36e17Kg==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	31:FdqlFpsDqsQ1P5vfxm9x8SQoKDSOZFt3JIzaaT9a3T/6ShNi1vrUzU9qDmPRQxqcNxwzTBDTO+FJceuD1kXgNxqQCHPWxKFwuKRg58vNO9hixa/t6k0YWLzxcVE6bk+y76p5PSVXazSkkDoO1v8Kgo1BYGWacpALuclNkXlF2UvlLkbUIrO5vI9+PS4WS+xRg2Y74yf2w98KzvQrS6Cj8aG0cz6SDCFutS+zmJlCvbpd21c6NodSXukjPa9YvTDBqvl45Eh9oTtEsFo+8R2GZg==;
	20:yqiz8iWoRBbA+nIc4nra4mR5HB3dB8e1Rw1uDhB6q87AW4km1X6r+bDJE79SIdV9E9EwOft4b0EcX4ZhR1jVRiWblllyu95ur3WlfXg5kWtJ1US5KwaaNwZqcKFgoKXs7jkKTUQGrBRhH/ofq+GSiskAv7mjK+0HTUoe0+P7ToEb2ymsrzO/Kq+BT3OwafNeUfpTbxALLbpBewAGlBSHTYbj8TcMnL4+i+Y/T1+pTCYO0ANSHCAB1f4tL3UMj/e9fK+yF+a/06nS7uVsJvR2FkmOitg1FFdqSkdNAzP5qx4DsQxHE0U7JL/ifEqULAt0nVZq/rsOlflQAdjA5fu7zg==
X-Microsoft-Antispam-PRVS: <MWHPR01MB2688ABE5105D09BAB9C405C5AB010@MWHPR01MB2688.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(6041248)(20161123564025)(20161123562025)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(6072148);
	SRVR:MWHPR01MB2688; BCL:0; PCL:0; RULEID:; SRVR:MWHPR01MB2688; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	4:ExsCk2bpgCRanZSGx567wSAP4p14dL+2u5x8iyi7IEiDvlFx+MCC8hEsFunt/9OOtA25RaUoyoL0UqV3152ubZxqT9gBm54j8WAZ3xzPSUSG+UArsVUakHhCTRAS4TSJMqdzRlsTfyVW8CX+lBsiN425qhwJtFXy+IEnnDF7hFLDyCzXWE04oS0c0LYCo8L/sDN/UrEOHdptSwJLTthKUUYhf/HLqzMbBlPEQwpHOyCaEK/HId1DaXmqw2e9h4l3ciU13Ihr0dyCF5iRn2jwUv5EmNoOwjUBBZSAA6PGtNApaUnBt20dkXorHj0lWrdjyZHmnbANYgfe0CeLtBTigvpxYVrq/o1FDEQYRcKU6SPHN5L5ZKqG14oBsmxNoOYkSphR8FbrxHs5NTqvF2XT+IR9lVyqv77tjkA10wBAkONxEY/hsBoO3PXb/0emWGhHzdXm5bg+avW5S8tMfzuZqAcRCfVMolZlvpL6EUpVfsejecSV3lBAv5ln1ZeuxYcB4YWRKjtEpNlpJXfabENB/iD7W4XTrwdf1d5Jn7bY2EG1T4BhlaINLRTl0TmmxRE8iXfqRRtcMwENXn0tGFR+yqcidhu/p0UayF+EG29m8JBs/6rngTwfPtVxsU/ovqV+6S7bkodmT/JeBtIXCTd3HXG3JdYJaGR2XnstI8LA9ejy2tS1+iX6nNt4hXOkkIsO6yBm5hf+CpCudczmiMm5TA==
X-Forefront-PRVS: 027367F73D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(377454003)(24454002)(31686004)(47776003)(50986999)(93886004)(76176999)(189998001)(54356999)(4001350100001)(33646002)(5660300001)(90366009)(53936002)(3846002)(83506001)(305945005)(7736002)(81166006)(8676002)(31696002)(86362001)(2906002)(50466002)(77096006)(42186005)(66066001)(23676002)(2950100002)(38730400002)(6116002)(64126003)(36756003)(229853002)(6486002)(6666003)(53546009)(25786009)(230700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR01MB2688; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxTUIyNjg4OzIzOkdrVVg1Y0R6eVN6azhDV1RKRVY5bTV0RzBq?=
	=?utf-8?B?OU93b1BXbHF6UGNwV0k2NXlYZVZObFF3VXVJOE12ckRQck56eFdhUDE2VmJv?=
	=?utf-8?B?YUM4UnIzbVdId1BWdDR0dS92NmtaZ2labXRUVzJaMlB1NmNLakhUcExGNG5N?=
	=?utf-8?B?OEpuSXp3UnVFeUpCdk9YaEY3Ny9oNTlvS2I4QkhIL1M4UkhzZ3o0WG9iM1FJ?=
	=?utf-8?B?NnI3Slp1eW1xaWFpcThQYjVJbW93WHhvQS9hNTY0RXV5MDZLYlZKaFJoSlZH?=
	=?utf-8?B?WXN2L3YxRlREYTArQ3RmemRrTjdFdWY5ZnNSRjBRNjdaR2EwSUlOUlgvNVdo?=
	=?utf-8?B?WHFDeGVLQ0xxWUYwaGdldzhPOTJNSWovcTlrS0pEWXZQWHFGNEFMTTNrd0wx?=
	=?utf-8?B?bjE3YjlGTmRqeHQ2aG9vSkFxN1lJOUMxYTloWDJobXhWZDV6NjVON09ESjBh?=
	=?utf-8?B?UmxKZ0NKUXhtSkRYMVhFSUhJZEFpZVR0TUJremdmQlNjb1FhMFpvNVMvdHB3?=
	=?utf-8?B?NUJKdElTb1U2UVhYNDFOY3hDYmhPT2MwUitBVG9LK0dLL3hSVUhDa09yTVVU?=
	=?utf-8?B?cWVqSGdGbXM5Z0hjRFc3Vlg5Mlg5L1JvL1hRMFg1ay9Wa1JoVVc0T0lnakhC?=
	=?utf-8?B?ZjVTTGV6aTZQbi9tb0QyWjVZb0tuNEhjM0VscSs4Snl2dU1FM0dZYmpzRjY3?=
	=?utf-8?B?d0dGZGpDU0pzNHVCK0FNZHh5bnlJbjhKWDF3dmtKNTJyMVZCdisveGpTYTlM?=
	=?utf-8?B?MloydzByN1BuVHhueHc4OVB1dkVzVGlRZml3U1hMWVdleHEvV3NnZXNaaksv?=
	=?utf-8?B?c2NRYnc3ejBWRnZtUDRKOCtGYVYrbVV0SVFaTmxQVk5FWXhsTWM4TlNtMk9W?=
	=?utf-8?B?WTNmLzRJSEo1aEhuSWVXdGZKblFLcjRkMTVUQnNaU3pyTDdETDFCdC9tYmxm?=
	=?utf-8?B?b28wY1QvSFQxajJTaGRnYm5lS2xZYnoydU1RRzF5NCtqYVhQRHRGWVNsMlF5?=
	=?utf-8?B?UWljbFZoR1VBMUVSZENFaXoxTzFvWTFhT2JuZndWQkd4ZW1XejFLeTluWWlk?=
	=?utf-8?B?enVMQm5oRjJsUnBUWHg5RnhIRWloT0hnTUxIRWJFb1FVWFcyRHVFa1V5bk02?=
	=?utf-8?B?RERJTk8zK1dETG5UcGx6UzlLaXRRQlNVVkVCNFJYVXJ3V3ErUkEweFNIaCtu?=
	=?utf-8?B?aXhXTUdHSTdZL2JEb3Bkc0IyQTZOOElYRnpKd2xCZHdncDhpdHVCNzlZOVRz?=
	=?utf-8?B?Y2FhUy9GM2V1VVhGRWpoUEo5VVIzVmNVTUpDekpiNSt2L2pFSU56SzRLRS9m?=
	=?utf-8?B?MHNXT1RicXB0cVRiUG5rbDR3NHZNcnBJbUNqTjYvaStEWUFYQmVxK2N4L3d5?=
	=?utf-8?B?b0NxdnJDZmErNHYrUi95Ym91cnBEeTVlRzJvZ1BKNk5DMDc2cXZUNm5FeXY3?=
	=?utf-8?B?eEd2bEdNVTZlZk0yMVg5bk1CVmk3VThtTmhLbDJUb0dGazFWa09qdjJmRzJO?=
	=?utf-8?B?ekRDaG1WRWNtRlQrNHNlTnNIYXQzb0dOV09xWUxWSXVhZ08rSy85QkMvb2VQ?=
	=?utf-8?B?UzdRSEtmMkg5dC9RbjRGblJSYjRDSXc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	6:KoYepKjSI5M4x/o7KeWuUoXy8hjGu1QdGzwCCZsh1rp/czzOK+hoFiNUGerBcJRP8mdd65u9t+1nLk+aftLcguM//K5T67FR8X3DaCYSgjI3Kq81yVN+9FnjBIBmlAQx4I7EA93BZrSZ3MZQVdll+e4H65GBR3NRm5FK/rGuvNGxv5lTZlru7tIoNw31zaZM5cEdn749+nBOwcO5PvK55c+XcfgKXyq8+g/w3JLptbR4gqXNCIL3lT+NsgM8yW0uDUaHPbY/W9aO9ptWYYg2ohriTEvY394FlipLsSm5W2j6cbc7uTfPsZFFyiTRODIoxbWR3EMwcIBORWWGvLbeOpWDBLR/nOGyo6GGBc2m6A//C2Ps4uRfT1L04rJNZX4tExGrzLk3mjZxqOATcIUfGHpLbydnVL3Tvq41PH7c1d2MrgGj5uAMUEeIfL23xsBPQpFGnLYtz4CD6vkeWL8T5Q==;
	5:wZx3cpbbj1GdJCtPTsyfbNFj2P9dZaBX99UvfDio+sbFm8TleNhPCusV689cAywsQ2737Xv4ITJ2hLF/xFphv2cMbK6gA6o1vo7Xxb1m3w80ciPq6B8YcMIo7iTEoOK0GWzc1/+QVyAor+xmL5Vs5Q==;
	24:gFmS0q9XQR9kHBSz5hXv8lU4rzYThjXZHvVhAGW3lZo7NY7BVYMa3sH61UWP6Uz8DyXdq7syVqwIqKjKRRl9WvU/nBOq2l8pI8JH7dQrbm0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	7:hIpnAu0n8oca2QlpfRtZdBhV79rLfCgIfEumuyLNcGuxQ8qqHlHtK3orW1Xo7fGAG6Vf1d14ofC571g3n37SMWx+spG0dfDdt1HfB7PJ4XMXCGJSRWI388RRxf+mclQQcD0gNrJpY+5dZzM7eCY6M64XVUTe/EbUtufkExBFyeYgbWybYz3P9aKX36MmFmTnOrdYPZsLoTSMRvpqPTGoPhv6EJFz13NGt92KTu/z/DUtEtoQO7Z2H0//aO+g4xSyR4/t3sKG1OUUs6I2M1h6AEqGcSwW4Y8I8AYxU1ROqKrgY//CqjZu+vA6ecVeBrvUOt2+7N2cMXus8QtiMqrqzQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2017 22:29:14.5859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2688
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 22:29:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2017 03:53 PM, Martin Kelly wrote:
> On 03/30/2017 04:58 PM, Martin Kelly wrote:
>> On 03/30/2017 12:31 PM, Khem Raj wrote:
>>>
>>>
>>> On 3/30/17 12:20 PM, Martin Kelly wrote:
>>>> Hi,
>>>>
>>>> I'm trying to integrate the meta-clang version of LLVM 4.0 (used for
>>>> recipes that need a newer LLVM version) alongside the oe-core
>>>> version of
>>>> LLVM 3.3 (used for mesa). I'd like some recipes to use LLVM 4.0 and
>>>> some
>>>> to use LLVM 3.3 and for them not to collide with each other.
>>>>
>>>> Right now, once the meta-clang layer is enabled, the recipes collide
>>>> because they both provide llvm-common.bb. I tried explicitly versioning
>>>> llvm-common, which makes them no longer collide. However, mesa then
>>>> fails to build because the meta-clang version of LLVM installs
>>>> llvm-config into the native common sysroot in
>>>
>>> merging all llvm-common into a single recipe might be good
>>
>
> I thought more about this issue. Absent some clever solution that allows
> us to unify the wrappers (which is difficult due to the issues I
> mentioned in the last mail), I think we have three routes that could
> work to at least allow meta-clang and meta-oe to exist in the same Yocto
> workspace without breakage:
>
> (a) Instead of installing llvm-config into
> ${SYSROOT_DESTDIR}${bindir_crossscripts} -- which causes collisions when
> meta-clang and meta-oe both try to overwrite the same shared file --
> install into ${D}{bindir}llvm-config, and install the binary llvm-config
> into ${D}${bindir}/llvm-config${PV}. Recipes requiring LLVM will then
> need to depend on either llvm-common3.3 or llvm-common4.0, but at least
> there will be no collision or ambiguity which one gets used.
>
> (b) Use a common wrapper in
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config that does what the
> meta-oe current version does; just exec
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${WANT_LLVM_RELEASE}. Let
> the meta-oe LLVM 3.3 install the binary llvm-config into
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config3.3 and let the
> meta-clang LLVM 4.0 install its wrapper llvm-config into
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config4.0. meta-clang will
> have to use the second wrapper script because it needs to edit
> TARGET_CFLAGS and similar to avoid compiling target binaries using
> native flags (due to the CMake LLVM build which appears not to respect
> cross-compile).
>
> (c) Use a common llvm-config wrapper in
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config that does a
> hardcoded check for WANT_LLVM_RELEASE. If the version is 4.0 or greater,
> then edit the TARGET_CFLAGS and similar, otherwise don't.
>
> It seems to me that all these options are undesireable, but (a) is
> probably least so.
>
> Khem and others: which option would you like me to pursue, or do you
> have an alternate suggestion?
>

(friendly ping)

