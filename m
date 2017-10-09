Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F194E71B27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 17:28:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v99HS2M3025060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Oct 2017 10:28:02 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 9 Oct 2017 10:28:01 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Paul Barker <pbarker@toganlabs.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
	<CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
	<CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0c97da3b-489d-eba0-8106-7b00d142746b@windriver.com>
Date: Mon, 9 Oct 2017 12:28:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Mon, 09 Oct 2017 17:28:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/9/17 12:11 PM, Andre McCurdy wrote:
> On Mon, Oct 9, 2017 at 10:01 AM, Paul Barker <pbarker@toganlabs.com> wrote:
>> On Mon, Oct 9, 2017 at 5:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Oct 9, 2017 at 9:16 AM, Paul Barker <pbarker@toganlabs.com> wrote:
>>>> On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> wrote:
>>>>>>
>>>>>> I'm looking at what I can use to determine if sse2 is supported for a
>>>>>> given machine/tune.
>>>>>>
>>>>>> In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
>>>>>> in oe-core, but not sure this will cover tunings which might be
>>>>>> defined in other layers.
>>>>>>
>>>>>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
>>>>>> feels dirty.
>>>>>>
>>>>>> Any suggestions on this?
>>>>>>
>>>
>>> Perhaps inverse is easier, meaning, set 387 for i586, i486 and i386
>>> and leave the
>>> defaults as it is for other variants
>>
>> Sadly that won't cover it. We'd also need to cover Pentium variants
>> pre-Pentium4 and early AMD variants. It's SSE2 which is needed not the
>> original SSE instructions.
>>

This is why 'TUNE_FEATURES' was introduced.  If SSE2 (or something else) is need
for proper configuration, then we should add a specific tune_feature and update
the corresponding tunes.

--Mark

> Does testing X86ARCH32 work?
> 


