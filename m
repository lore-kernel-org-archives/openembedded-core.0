Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0055.outbound.protection.outlook.com [104.47.38.55])
	by mail.openembedded.org (Postfix) with ESMTP id C37EF77861
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 01:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fRIG+5eavkjCZAedgr0t0uWJoDGzpfsSzDglyRXfM2U=;
	b=pgPwxLrczsw8hw9JRrRhQ7hPSCKD6YFwa3rY+WvMgTR9PaFvCMdPxcnGAC8M8d2tfmga0khVCWTafihj+ilptmOIyDj3R6HqPXEtiBtJLNAkg3q96UyS3KQ1BEZNBUigEuMXBKHiFcmXFsqoqyoNYuNbUL2GvyJALyVzBaP9Wqo=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.111.61.107] (66.162.141.202) by
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Wed, 8 Mar 2017 00:48:47 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
Date: Tue, 7 Mar 2017 16:43:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: BN6PR03CA0004.namprd03.prod.outlook.com (10.168.230.142) To
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28)
X-MS-Office365-Filtering-Correlation-Id: 097232e0-00a5-4355-c102-08d465bce1c3
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR01MB1406;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	3:+plISYMjvReD5xRZHg2r9IeVO2tQkMt7JcWvqmnIgobJ5N2iZJBzr5s0ZRKjeAU8B55IRJ6oRGzQpt426FiEPthqsoOZm2G59ov90KWH8jeYMCNTddntwAtL4quZclRsz9CzuE1pYQkeAmQSkGZpHEmdZdHxTlFjOBjz5I/ARYy/cyTgIvvc7zoS/pIRKtQBkcfXPAS63lbgQl3tPYb8zgA93eodLBcqik+yzaGKm4JiGqFFp4DcO+96IUeN0d15hNam6RnLJZcR/RBgbbtDhA==;
	25:gpD3NYW94jskJs2NGWI9kNQm/EDIF/Ir84kNMD7O583OxXNPuOCZYUfoL/BDtR2dcnwujLTn2OA2Ei/5M1ZDdl92kyIIjTiM4kU17hCdjHm/XhbP/XUbG7oxs1crmkjd19jahlVSw9+gbIe6vLzVsUqQuYXA5JgUswnsf2WzyRLRBbauFjal3iQ/C9GHkUxnl2zfrcTH5zC68PKyJXoKFKipLwte2usY8GENcBPnKLBHr39Rdc2huyTos9xrA3d7q0ZQPmU5ttMWrfWxtEYC+yYlNuB1hXk3U1OMH3PYeRXuR67JURLh8kwvGR7UhSJgex07GnJT+eXJTSZ5qXoF9Z87ur8F5QG7MCD0PW76K76whNZ6lmZTTXULGLeNgjpSXgv4PEMC1396VLStGnIkWVUg0DdmcEjWkf8algF24mrreUT7p2R4VrsLd+Y2UU4fmJ4e4hdFNTYu/+UCz9XYZg==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	31:7NYKBZdK17JC9Qqzy+tPHxAwguvaC2sqSkoCGfntdlnSXCVF/iIUoCByVVmcMI+lZEhXQtzbibgHMJXX3RO63srwIv5F541CBZjp/Nf2rrZGUWA7VTIE7u+11fJnstYI50CkcrF32I/94DpA3G/k7I+LVqVPL7biRwwniBnrUVYw+d65XDtWT8E6fTyv+HsXiS8zYTq6aKTJhnk5lnQnp0+LOJkqE22EQqFTNSY/qJKMa1w2q0CWjFXIfO1/Xlcx/a2tokxWS2+W+/OC/kb9zw==;
	20:OaOij3bgJhvsJ2dlVM2lUGo78jdjWrBipMZ3P9uQj17CQO0W90HszSYj4HHy2AXacxErmTg0+dxD5qWhZvKmrTMzcXI7BtxE29FPuoD1hjVLtMD6NF5Xx1SiH4JMcpDSyBgNEp8ptnWC2463d05ZXJuVZ+uAYCVGRO+FLvpOGvG7D51altKTYXwGy20S1TRobmEGAx1gO9ynBMbOoWXxjvp8jSLtKG6mU1Tbbz1YBZro/pR2RG/E7Yjv3UQ29f6vvTNjyd7ZAbZQMMBmUPO6sWjUr+Vq280PHmrbziOZYUWVSqnnho90cdYtJ5VpnAXihwib+u9RQE6kg76QwcaDxQ==
X-Microsoft-Antispam-PRVS: <CY1PR01MB140613B49439214C9DE245CCAB2E0@CY1PR01MB1406.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(5213294742642);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123564025)(20161123558025)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:CY1PR01MB1406; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	4:tL9ckrze/jG3a88tXhnj/WAxe4636G5uP15xx5FGus0p6JhFmHt3yluAd8HM/XxnIx8PCHQE+Wy6svskiAog0tIaw951QlA4pmpAk6H/8yNiL5hHajrSsC7DhoOuRWBAqTDhX5FFS8vLcCI26q3WNPOdU/O2zTCeye48Yx+FLyA4oDaVkbNzH4I0dOBxlyhlTBWdCX4RkuXh0Cj7i9ZeIq+mBhB+woSjO/X/OEgz7XcGoLK2auWGdDCjgqqqkh46MWY+8JX1c27WmLfP8Ywau7RhQPHYv/U6XmIpKLnO6SgZ2NHr8BnhzVRX0mjVsXXEZ7yMTT3zrZXyt9jdhMtombyptbU5d5B/U/wbxx31tRbAAwNmIuPxFZbdBBJddoQU2ayzCPKGwYZgKbrD6VFA3nUHKKzYznUfdvdecJsigkVz5r3KdhK5kt5UYHO/z5g+C5MR1xVXKgr/monc+gF2BSikeLFi1JtxcrmbXE4e5WhWZZpMZBA0AiyEVwPEpNde4vPMlRjW5YytbvQoOsUpV34SidjV/8NAl2ph4o6ohDrYXAv4Um7kDa895fQyaFNxlw8B0iaa4HuNIKY/cmHeCMFamux76fdiwmfOfZYHIU5aJ00couUWHzwJvfWPw4tA
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(77096006)(31686004)(86362001)(47776003)(2906002)(5660300001)(25786008)(4326008)(42186005)(54906002)(4001350100001)(189998001)(23676002)(50466002)(81166006)(53936002)(33646002)(230700001)(3846002)(8676002)(83506001)(6116002)(36756003)(6486002)(54356999)(38730400002)(50986999)(31696002)(7736002)(305945005)(66066001)(64126003)(6916009)(110136004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1406; H:[10.111.61.107];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA2OzIzOjYxVGNXZmR2elE1K09UbmlUbDAwSGpoZGY0?=
	=?utf-8?B?V1lPUEFvTXJsWDFka0ExaFN2ZTh5djFXQ1ZLZ2tha0JiYmlqTUxhNnE5MDha?=
	=?utf-8?B?SDBqOU81L2k5c0E2NFpaSXdkMzAyUzVyaUY1K0pFcGhQUE1BaE9ZSTBGK3Uw?=
	=?utf-8?B?ZGtYVjJTbnJVTmg4UEJTQXovSW8yalMxWDVqeHZ5cmxMQm8wNWp4YlhZUHd6?=
	=?utf-8?B?cDNXbms1RG51SFNZQXdUenJFTGZCbmpPdUZIT2VFUWs1ZUdwR1RLeXRDNFcy?=
	=?utf-8?B?a0REcW1tNHhJRnVPRTJqbXB5NzJNNC9zVVMwWnBObkIxajFya1VwMTJDdndZ?=
	=?utf-8?B?bk83a25aNWJPMHBXNDVRUVZVdnVwSmxkMERoaTczL1I3RE1rVFFnTEp4S2xF?=
	=?utf-8?B?TGJNWG15SjAvWVBPbWF1c1MrOERyT1IrVDFRa2puTlZINnBta0U4L3J6RFRE?=
	=?utf-8?B?K1RHcmhDV2tZR21vZnoyK0RzWjZhUGhoa1hOdjlnU1grVGNGMVYrenVIc3or?=
	=?utf-8?B?emVRYmdFRWpLRVRiKzRJZFNIWTNKd2xoRXFFYnFiZVUwckVGaU96djM0dFg0?=
	=?utf-8?B?ZmM1UXJMYXhXNnJTYUN0bjNnaU1jSDIxVW8rbFYrSm9DUnRaS3JRUUZjdWZL?=
	=?utf-8?B?WG5FdkppK29oZUtHQ3V6Nnl0NHRLeXoydnV0MUdFZ3o4TjVGQkNPUTA3ajMr?=
	=?utf-8?B?SDBPY1BGT1lpMGhNVUVSdENkMnQ2bjFLOG1GNStkVnowZHVaNmQrQVY4bFA0?=
	=?utf-8?B?bnlKK1d0NVZPVmEzNjBrNU02QW5HWEkva3RCTWNoclZIUDBabGJTM1BWMXlr?=
	=?utf-8?B?V2trK3BtNWpndllVNXpweEo4NmxrZXJQcjZHVERPcEh1RU1lSGpoMUEyMkl6?=
	=?utf-8?B?VVhmcXpKK3hGREErN1g2ckJZYXBrZ2pxYVdJTWFIclhWUGRHOXNaZm43R3R3?=
	=?utf-8?B?WWRzYXhKNWsrZVNyRUd3ZzlkRkx3OXdTVW45am1uYU5VbXN1NTFBUVFsREJ1?=
	=?utf-8?B?VjUwejBvd3BBL3o3YU5kM2hENFd6M0xZM1VkTklvV01PU2VsNTUvcnFHanB4?=
	=?utf-8?B?eVd0WnMyOHpYMTJnVCtXV2dGV1pvNDgwT3R2UU1UNU1Ic005Vk5ETmpLQXNM?=
	=?utf-8?B?dlU0NUZIcVBFbUtZNm1NeUdQOWdzNk1sMzNPT1NKU1d1elIra05QUlMwTHo5?=
	=?utf-8?B?dXp6Sy92cTIzK3NBT08rWnN5R1c0M1J6Z2pXYzVTUkhUeERLak1JK2crdmRV?=
	=?utf-8?B?eFYrTDd6eWF0aVJONHdVZjZ4WmxneDQwSUxySWI1c0FKRkFhZFUwMTZTaTVr?=
	=?utf-8?B?NVA1NmlPVldRTGc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	6:Z51g6xLo0coCHe1h0g12DHlS0jOcqN6T37SNV38zKDmjAhK6p1tLnZG41qfyepo6irXO4vQjLAzO8+/VPI5ulRDJ2Ohobxty+aTCoUaWqdt9P/sdFRSp7u4w+9thMlvYFU+aX/Y3GCTgwEf2VRR1yUVhyZccY4R4kuuoANZ79UcAlkFLOLptpKnjxqhjjUA4hz/YsmjEIzdn0WITSt7xGc43Xq+B4cW6Kcj2p5Wb3kG77P7q42wZpWnKGtiE8ONNc4is9vdwf7AmyJDuYcNVvRzyE+ZB6l6hFK8eWdAHB/QzSzF9bNfU94dv/nYXq7Mp1hApvKBlc08FoP6v0mXGk3MYcCL5/srdnIaz8DMZhphvMxXnT6ukIF1vlnFJ4HVXfGy5KT8BJLaz+vSIYNZj7A==;
	5:CV9r73s6LgVzD4LjZlZ+KeVlcbjP303+VUjn4sDS1Pyt2NmWoIY6YnKMecFkhMst8xLYZy53ZmGo67dmoM3xA3DOVen9LHyJej66ylnBHAQbQtjp+8DhuKWA6Gx6CGn7qrVmOUWfjsestN28cFcMAw==;
	24:YwNmh62c9oV54AIcXiFeYjnbIKOGYauSF/BQ2aJNwLiRMcyrbWhAVDiadKZXBMkiqbsInR19654RU34BM4B8CpB63FyNcyZ+lXwXT6+Io3I=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	7:BiS5BmTBxXGnskYDmIKDP8ij5QDbMAMguX7Sjx7MOb2y5Xx7zjJZVQbwpIoG/vPzKCQR6CoPhcGpZowluOluW2z16iBvAKNm9zbJZxXJvGsI2xbsrrfFrbvQeWvJHKP4mXTkp8W3Rvnoige+eI3nNU4H700cFXLc08M2PtETG6+ZCKDuwBgSRfd92CzjWvPM96UbZIV9Bi9P7PWhwLyy8B63y551/ZND9iBR27D/Miku8cLZPJHrmvbCcObNFgZt2bNsWG0eJcK4qAAOAVb8aB85Peqve+eIaCe1FBQWsjNvjS4lsNi3r0+5Q7b+wVUnt20DH06K3zYw7CuJQ/a5rw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2017 00:48:47.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1406
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Default rpaths in BUILD_LDFLAGS
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
X-List-Received-Date: Wed, 08 Mar 2017 01:03:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While debugging an issue with a package that uses llvm-config to compile 
with clang, I started hitting [rpaths] QA warnings because some output 
executables contained absolute rpaths pointing into my build directory. 
After tracing through the issue, I determined the rpaths to eventually 
be originating from the setting of BUILD_LDFLAGS in 
meta/conf/bitbake.conf. The rpath part of this was added in commit 
35759f97 to the poky repo.

A quick grep through the poky repo reveals that many projects have 
turned off rpath in their builds (the mechanism through which is 
build-system-dependent and doesn't always work right). Obviously, I can 
do the same for clang/llvm-config, but it doesn't seem like the ideal 
solution if many projects are having to do the same.

I'm wondering if those with more background on this issue could provide 
more detail regarding why rpaths are set at the top level and why they 
are necessary. In addition, I'm wondering if there might be a cleaner 
way to remove the rpaths for those projects that need to do so without 
each project manually writing sed and similar invocations to do it.

Thanks,
Martin

In case you're curious about the background of the issue, my project is 
using the output of llvm-config --ldflags to set its linker flags. 
llvm-config is populating the output --ldflags with whatever it is given 
for CXX_LINK_FLAGS. CXX_LINK_FLAGS is being populated by the generic 
cmake logic in cmake.bbclass, which is getting its flags from 
BUILD_LDFLAGS in meta/conf/bitbake.conf.

