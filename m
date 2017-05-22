Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0040.outbound.protection.outlook.com [104.47.41.40])
	by mail.openembedded.org (Postfix) with ESMTP id 8038E77E8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dNPAp2o/NIDQaM+fnaBLX29+63yzgADydlL+Rf3CtSU=;
	b=LIWf64Ex3liWlAuCLSXUGvjMbP2xx0dhXACXqoGG8HgQge0fz/dZHnQw69Ljy4wj1leQvOxxXEvN/bPKWkOsPR1ZRghoFfBxlwzZbcftvmhoVQinoPeUdZKmkzVeSP1zL7BU09Hg6Kdg38wW/Yc2ww2RntqLvAsiF9rDROU0A/8=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.111.60.102] (66.162.141.202) by
	CY4PR01MB2677.prod.exchangelabs.com (10.172.135.11) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Mon, 22 May 2017 18:09:19 +0000
To: Randy Witt <randy.e.witt@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<816f658a-cb3c-2312-99ad-d7e5e3fd2bce@xevo.com>
	<9d51bbc6-08ed-16aa-5f05-e6bdd6d3af12@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <6a20ee75-f84e-508c-578f-af03fcc3df2a@xevo.com>
Date: Mon, 22 May 2017 11:09:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9d51bbc6-08ed-16aa-5f05-e6bdd6d3af12@linux.intel.com>
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: CY4PR01CA0015.prod.exchangelabs.com (10.169.249.25) To
	CY4PR01MB2677.prod.exchangelabs.com (10.172.135.11)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR01MB2677:
X-MS-Office365-Filtering-Correlation-Id: 07949594-0e2a-44f9-0e79-08d4a13daaf0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2677; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	3:QDIpuMUg82AgL4YQws4SN94bBJdpmpCeZZvnmI2C9Z1TW/LHF5hccAZ217fVPIvumWRWMvHkyGPJvquZc/l3N2cFgepmDzdZLXkxkEz5kfsp5QEY/ZhaeCZOM1P6EHnF5890E6pugJtCvdO3vZ3DSXwz5aqE9wCXnndECZuNZn3XW613J5fzFh7oy42rlzMkFruqBRAwJZCKtB4R2s1jKsquKCaZr+d1kC8trVffM4eltEt1O6b/o+IGMiPxUyKDZYxmdRHzlcCDojAJtrrITyQ31AGFjN953xt2vnW+XonIPDeShiByQOZMY2lSlSjPalcsxisX84BOLz423Cx7lA==;
	25:WyOvxY3LZV3kpZEoSHqUZg9OzHS3DcG5ONjlpUeDincR8hWw/LzryPe9P9uOgkLYkhZtzAgoeObIpD7q+5qya/Q/oD9wckx8zXIivJV+1hLgCM5rxB+O+kKKsQBRi9lfN+yDXNczKVYe88JOy5OQKDFAkGC7z2B1ONE6zSZgaKrBW6MG/e8qc34UpIesm/wb3DSK+zmyKYmtREHNEkB8OU4D6QOFK5FcuQAb0ZGD1iVgiF3doHl9shXaa2PQRNjFaW11vYFbDgGx/Z2XUCIiXCgt8yOQB+EkVA1nKj+1fC9+6SDTnV4XAhfMaMONnOpx44VtvegtaI/bXYr2JSoKwLSdii1ZxRYdvMr16nJoKhe3mWtYZXX8ZgINPTMXnMP/XmiZ3o7nRGLxoxWyP19L3PfmS7vOtsodMwyIi5TJ2l9bljvtrK5CGzBnNrIXwF1aQvkq+dQ6AaXseQDZh+yQc/FzbCYst6hFOAZGpQH2PTE=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	31:BAqmcxyVTZXGcqpF7m2V4euHWuTW6tWsFM+UWGqJNwv4j387EhgMV+aHeAf8UX8H8s8zqVeEelbwRkIw0vRpI53x2Ou5uNS7qsio6pYQvQC+1mZ0Q355rDl/Qqhbr174Zpg4bX0N4TyXipqfrAT3GRJB2diZ06TFFYBKKrYP77tWol8Q2+YgqZ0IA4JyhOtAkTTwCYYpnUd/VqCarPQE9IgKP2VPlAmAs5qKcIjjZ1jRudPBlH2YKxX1RjH17wUbaz1vpk/liiyvuQPx4U8Tvw==;
	20:THQRMXfXex3GJZkF/CUPF3AJVefPpGY+liROfrnSHmLZKgjOrZVvCIj2fLcp0e5qvfhuL1ZmNp3ikxDdaN9YBtO79V/Rt61lX8dJKsT3Nsbuz+UnMHdQ4mEaMrQAwVDZBSezQm2kgieQju8Syxu3DCITMtJsaJIuxu/JFZi3RrbisHGzyTxcnBcV+3Dog6zzzfmUJr+3St9VE5BHpAwgO9+s/YYNa1yyRtm2PAXUk1L3+tHyBDa9+KN1IeJkt2Jejb1D5Uix2iMGNq7XfYa4800xs/42zyV1qNrnoqaA8rLKb6S+VpceEiPiqqKyiHpit8FtmmWAIYuneYCn38SLaw==
X-Microsoft-Antispam-PRVS: <CY4PR01MB2677FB3FE17A054628AB2775ABF80@CY4PR01MB2677.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(6041248)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123564025)(6072148);
	SRVR:CY4PR01MB2677; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2677; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	4:Zs1K32k+PPMYoQW9pihbV76ESXHRHIw4xHqw1izE3VIn2uEzPfDctBbjhRz+UwSU7yV2nQ7j7WbUBs+3+qU0AEvHSBiIQccNW8aixotq3cMNot3YL9VFj9CTH1BAG2xu9h9aUrhAPSMJq0olI3aJjLZ1654BDmv/wqWIWtopCbsfGcnMJ1dcBWj8xhj1G4TnTy2zt6OSEirgqjvFO4Y57nyEYImcsApP57046Am0IzMLqbyxe7Foi+jPBSRG3lZGPXtoRSct0FW0WlKyzPx2Tb5yzgFdMR189bYqACLfWn5vnjrqf6pAnXwEhGJePoBxP0nunJIPtKyvmdD2vLIYuBfb1jfG6fs8kDvGsqIcYlpalfPVGQlOzC6F2mB4zvH9cpWld+7/v0bFMYX370gqQ9va8AaNvdmtp01vX+J+GqpUUOV4lJs5zoGV+24oLwMBnqslO6BYino0KLB64ZvOz6nICLxNZDrSCN/l3+OILtL5dSJS8XC9RTrC5k+fsNoLbNHBg/Xt71qxH5Py0xhELoK75WFy/i2QqSKpi/Mivb9DPHV1HmNj/gNuj+WAx9LvYfBTlfOpAQdxIMuLwlhXf1qgwD3ChmLlxk6BB2N/VHyYom3rL9aiunW/92OkXBLIhenaLjaW/3P1/Qemevx3uT1x0vbwGYSjc8psOupmwTBVNBJMmBRouuBJyI3BmDYgeZWStlzIssJ0Z4UdZt3kdMKkENZBkhiq/LPJhoggju1KtXTQ5vypJMzM5cdZsIbCv1C7AABRWCNQSln/ZKge2A==
X-Forefront-PRVS: 03152A99FF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(39830400002)(39410400002)(39400400002)(377454003)(52314003)(24454002)(189998001)(38730400002)(6246003)(478600001)(50466002)(64126003)(25786009)(7736002)(53936002)(3846002)(305945005)(66066001)(6116002)(4001350100001)(47776003)(50986999)(81166006)(8676002)(65826007)(230700001)(2906002)(76176999)(6486002)(77096006)(54356999)(5660300001)(36756003)(33646002)(65806001)(65956001)(31686004)(229853002)(42186005)(53546009)(2950100002)(6666003)(6306002)(23676002)(83506001)(86362001)(31696002)(966005)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2677; H:[10.111.60.102];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxTUIyNjc3OzIzOklNaFdPTnVOQ0JtazB4bEJSVFlUYzBPMlZj?=
	=?utf-8?B?YlBUOEdlRm5zT2lSU3RMaTRHYXRxTUxmR28xUXRWUUFyTjR5bG5UT09vV0F1?=
	=?utf-8?B?M3RmQ1AzVzNkTzVjaFlheXJCUU9JK244R25zUEVHZ2o3TFNBbys5KzdsaTRm?=
	=?utf-8?B?SG1SaDRxQVhIVG5ZZHhuOUJUK0NJcFZzTmJIVFk1M01PeWhYN0NvQyszYWlh?=
	=?utf-8?B?bzIzVFMrcmZRT3RxaTNNb1M0TWdGOERCTzVydkk2WlZ4QnpodmsyOHRwbHMv?=
	=?utf-8?B?M2VJbS9TVUZJYjZ5Rk1NY2FCSjVsVjJydEZlbmgxVy9pRWVoVGQrdGxkK0c4?=
	=?utf-8?B?L0VKaXFrdjhsb0pQUVlUaGY5cFRMRjdIK2N4TUN2MFBVZUtmSmVLLzRsTWNO?=
	=?utf-8?B?Zk9xdEdGSXQ5K3p6aXRxY3JJc1RuUzkvbnorQnl2ZFV4bkxSclJReFU3THVw?=
	=?utf-8?B?dXdXbkF3RFZrQW9taFVDNUdETmgxLzZZV0VkVkpBblQ5bmlYeXJ6bjh3Vlhy?=
	=?utf-8?B?bEV6UHNENURyZmluZDlOdHloOFRWS0RBSUg5eFZRenJ2VWJzRFFaOXRlNG44?=
	=?utf-8?B?bEJXR2ljS2J2Y0tqNEZhWHJlTUNDTHQxUjRTNE0zSHFnM2FrS2p2UmVQUFRY?=
	=?utf-8?B?Z0NwRWt3VklWbHowcVVwVDl5V2hNSWxTNjlDUGRoQ01ubmp1ZlhaSUV4amVv?=
	=?utf-8?B?RGlFRGRCR2JWY09LQ2pLNVlsR1o4dm5Gcm5XVXliVUdESXVKRk0raEc5WGlI?=
	=?utf-8?B?bnAzNW1TTU81UGhXK1FVeUczSTZmS3dSazhFc1VCQkNVRTBWbU1WQjllWk1o?=
	=?utf-8?B?Ny9Ja1JLbzhTVXFVWklOR3VHMUV4bk1VbnZGSTM1dVBKc2Uwc2N2dnlnbEIr?=
	=?utf-8?B?amJsaDNkKytsRWdHMHFhdGE0TFV0WGV0eHNJQjZnUFhDd0F4cUhGUERoRFBl?=
	=?utf-8?B?eHVMN0xZQ3gvanlncWp5ZlptdmdrbkpPbEtWUGhELzF5TzdLRHBTL2VDSjdk?=
	=?utf-8?B?UlA0OU1OWm9SWUs4dWZlaU8vR01QZ0Z1QUpQSFpkTUlKK3F0d2tyMkNSV29T?=
	=?utf-8?B?ek92R0dDMDhsVTJ1T2ptdWx0QUNRUjNPYUtQZXNYNkhhbjBuZEZ0RDhaV0Vo?=
	=?utf-8?B?Znd5RnNJMmlVWTNtemEzZ1l6TDdiNUJlVDdBZFNJSkl6L0ZRZk1HWE44QW03?=
	=?utf-8?B?ZmdJZXRPRUhiRkhTdXpYdjhCVGNBcklrV3duSFREWnZWb0pDYWwvYXp1SFkz?=
	=?utf-8?B?UlE5R29EVExLNkJSU3F5Sm1PdHhkM2dNcXdsREpIdW50VTBvU0ZKTkZVeTM4?=
	=?utf-8?B?MUYraGg0NnpiekJlcy9EbmVUeUJPaHd1YmdLYmpablpxcmhmbnBrZ2tFeVRV?=
	=?utf-8?B?b1A5c3FlVVR2N253M0JaN0djcXR0NjMyakdycGUvYXF4QkFtWU1CODcwQk1p?=
	=?utf-8?B?T0EybDQybXo1UENNM2ZuTkVOWFFuK0VUV0NSNjVOVUYvdDE0bTdvN2dhOEFo?=
	=?utf-8?B?b2Q2ZXh6ZXdpNUtUdG9VdEtLdTBXSEpSQXUxb2JCUFM5UkQ1cFhZZEpjSEZH?=
	=?utf-8?B?N3pBWGNVS3NKdE1hRldLUFRWOHMyanlZbnk1T0d5V3dIdzRuWVRmT3ZrUDZK?=
	=?utf-8?B?enRlUG4xU3dTUDQwVGNVV2RwV0Njb3gxSHpTcGNFMHJsNjZ0bXJhOVQzYzlF?=
	=?utf-8?B?eDFjci96OHJTWDk3VFpUTHdGc2J5Y1o4VDBMOUI3eWRnS09YazFmR0pURGtr?=
	=?utf-8?B?a3Y2WnVvR01Vc281ZEZnZz09?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	6:Jtm43eX9wvJNxlJf48ZG1gdzorQrUYctkxC8THq/ddL5slBQHUpCjU2bpn1FY8s9jcCj8zrHuN9joyHdARRIArbMWomHlSCgy6vfxjRheJIUVtVNkf24t6rDwfNsKj//mcHScl8cI+gBTy5nOcpg49n//9oG4+IUBixKvXAL9p2+Q6+CQcaVurTNsk9UDnSYplYSwVzaz3dQ4GOFn5Lx+kdLSgf4nXaHOJiIiU9y6LqnLhsSPyOyg7afpyBJrBzVTqPzOGp91aC5ZMn0YO0HXwvXDJhZ5asIyj9iCoYgwM/KUdz9LnZl+Wxw5o+QNNYyR6Jpw1eKmcpY8XJ7SNuAcdtgdZ0s7qFAP6TStR3+CWEg9BpvN+3GHl5BU0SQg0W95FacGzT8U8lC63thkRSsWoJ4Yw7zVTpGeXyArJr5RZnZ2KYGXVrCDVchod/NgCw8No1tJnAKi1j2tsxCzv0RzO6gAqv7c5HPuJ1RmmHeipHTJteoIsp8XlQDLeKwPBEsY6b8uHdVFcEykhw9+KdmIA==;
	5:AuZA+LqrDDPw3CLCJTJG9PXMlYkAXrJ+MnoB/EWlfx8HtDThvbj7GYRRCHcVpYFq6HgS2DpdipqeZlHIRFV1bMfz0MvYnfIuyQPLiMeSG1k+3FRPP4P+wY1zwqQsyqxM3I5749egZK5UnMnLydTE3A==;
	24:2KRgLEhIjju2frrs6MRPsgd4yuYLRDrBvBq7j0lLySGCPUmF+bDtWJ7QGMXlfSI8yb0aGvvIZ2IruZ0mUYKB1qoZ6pxrbccPkpTENgvh7mg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	7:Eo4z8rFg8TKzfoxvo4fOn26de2tL6E92zg4f+HAfm5o+0ml93tQWU0oX3biLPmM1c1dWfyTtzLSJeSVSx/RNfH7EEwFVsKMwKph/kVv3HNi4sQCS2vFsSMcljIM8w2+NDcEZ5kkEB3QkjgQwwXMEyPjSetTCjx4/uewWlZ+wGhxx5/be4l5eM3aHDCXmnGVCtc8qFXNMPg7E8fTvcQTARstnyrCZzGvRFP4ItLxtRrsK3gnjvd1L+SDMNJWVA80DJZerTkuVfXN8kqdIS9yGLxpKfjI5mtM/ag/YD8pu/ZRFUrGMW7pZYvHLGlKKxllpsODrhWfVYBJMnSA2m5s+EA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2017 18:09:19.7227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2677
Cc: Joshua G Lock <joshua.g.lock@intel.com>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Mon, 22 May 2017 18:09:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2017 10:53 AM, Randy Witt wrote:
> On 05/22/2017 10:29 AM, Martin Kelly wrote:
>> (friendly ping)
>>
>> On 05/02/2017 12:20 PM, Martin Kelly wrote:
>>> Currently, the qemu CPUs for are specified as generic, but the built
>>> artifacts are not. For example, we build x86-64 artifacts targeting
>>> core2duo but run them in qemu with generic qemu/kvm CPUs. This causes
>>> some packages that take advantage of the host architecture to crash
>>> because they try to use CPU features not advertised by qemu. As an
>>> example, Qt uses ssse3. When artifacts linked against Qt and built
>>> targeting core2duo attempt to run on a generic qemu/kvm CPU, we get
>>> the following crash:
>>>
>>> Incompatible processor. This Qt build requires the following features:
>>>      ssse3
>>>
>>> We could fix this by making packages like Qt not take advantage of CPU
>>> features. However, we will probably keep facing similar issues over
>>> time, so it's better to resolve them in a more enduring way.
>
> If the MACHINE is a generic qemu, it seems more correct to build without
> the extensions. For instance, what happens when core2duo doesn't have
> all the necessary instructions that some package decided to use?
>
> I like the idea of being able to exercise the code, but I only see this
> fix as pushing the maintenance until the problem appears again later.
>

Currently, I believe we're passing in all the right flags (e.g. -march) 
to specify a core2duo build, so GCC should not issue any instructions 
that a core2duo wouldn't support. By passing in these flags, we're 
allowing recipes to issue core2duo instructions and then creating a 
runtime environment that doesn't support those same instructions (bug).

I don't think we're deferring any maintenance; unless we change the 
-march and similar flags to be something other than core2duo, I think 
the problems should go away. If we make that change, we should update 
the qemu CPUs at the same time.

We can solve the problem in one of two ways:

- Make qemu run as core2duo
- Make recipes build as something even more basic

The second change is much more involved than the first. I don't which 
-march (and similar) flags are the closest match to the generic qemu 
32/qemu64 CPUs. However, I suspect there may not be a perfect match. 
And, core2duo is already quite old and basic by today's standards 
anyway, so I think bringing the qemu CPUs up to match is the simplest 
and best way to fix the issue.

>>>
>>> Fix this by making the qemu -cpu arguments match the built artifacts.
>>>
>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>> ---
>>>
>>> I sent this to poky@yoctoproject.org but it should have gone to OE-core,
>>> so I'm resending it now to restart the discussion on the right mailing
>>> list. There were some comments about it in a previous mail thread on the
>>> poky mailing list:
>>>
>>> https://lists.yoctoproject.org/pipermail/poky/2017-April/010956.html
>>>
>>>  meta/conf/machine/include/qemuboot-x86.inc | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
>>> b/meta/conf/machine/include/qemuboot-x86.inc
>>> index 06ac983..acd03a1 100644
>>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>>> @@ -1,12 +1,12 @@
>>>  # For runqemu
>>>  IMAGE_CLASSES += "qemuboot"
>>>  QB_SYSTEM_NAME_x86 = "qemu-system-i386"
>>> -QB_CPU_x86 = "-cpu qemu32"
>>> -QB_CPU_KVM_x86 = "-cpu kvm32"
>>> +QB_CPU_x86 = "-cpu pentium2"
>>> +QB_CPU_KVM_x86 = "-cpu pentium2"
>>>
>>>  QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
>>>  QB_CPU_x86-64 = "-cpu core2duo"
>>> -QB_CPU_KVM_x86-64 = "-cpu kvm64"
>>> +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>>>
>>>  QB_AUDIO_DRV = "alsa"
>>>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>>>
>

