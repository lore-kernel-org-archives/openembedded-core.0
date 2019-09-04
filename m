Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D86E7CE22
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 20:30:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x84KUEqD012983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2019 13:30:14 -0700 (PDT)
Received: from soho-mhatle-m.corp.ad.wrs.com (128.224.60.50) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 4 Sep 2019 13:30:14 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: Adrian Bunk <bunk@stusta.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
	<0f8a4a800e70afe1eef8875571dbb50e1dc8f865.camel@linuxfoundation.org>
	<20190904195351.GA21155@localhost>
	<2f471561-51a0-3682-57cc-4323b771e684@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <5888b261-7f1e-b500-737a-e6b42a4f194e@windriver.com>
Date: Wed, 4 Sep 2019 16:30:13 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2f471561-51a0-3682-57cc-4323b771e684@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Wed, 04 Sep 2019 20:30:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/4/19 4:18 PM, Mark Hatle wrote:
> On 9/4/19 3:53 PM, Adrian Bunk wrote:
>> On Wed, Sep 04, 2019 at 07:50:35PM +0100, Richard Purdie wrote:
>>> On Wed, 2019-09-04 at 08:07 -0400, Mark Hatle wrote:
>>>> On 9/3/19 1:59 PM, Wes Lindauer wrote:
>>>>> Mark,
>>>>>
>>>>> In reference to "It typically does NOT include the license of
>>>>> things used to
>>>>> build the software (such as makefiles, autoconf fragments, etc)".
>>>>> Since the only file that is licensed under GPLv3 is a M4 macro,
>>>>> does that mean
>>>>> the current patch is still valid? Shouldn't the GPLv3 license be
>>>>> removed from
>>>>> this recipe?
>>>>
>>>> Unless the M4 file is generating/injecting code into the build(very
>>>> few I've
>>>> seen do this), then I would say it's not under GPLv3 at all.  (And I
>>>> wouldn't
>>>> have included GPLv3 in the LICENSE statement.)
>>>>
>>>> But we need more consensus then just me saying so.
>>>>
>>>> This may be a good question for the OE-TSC to ensure that we have
>>>> clarification
>>>> on this issue, and it's not just me saying I think one way or
>>>> another.
>>>
>>> Not sure it needs to go to the TSC, we just need a patch which clearly
>>> says why the LICENSE statement is incorrect. I don't think the original
>>> patch in the series was clear about why GPLv3 didn't apply but if the
>>> commit message is improved, its probably fine.
>>
>> I am getting more and more confused about both the patch and the 
>> semantics of LICENSE.
>>
>> The status quo in the recipe is:
>>
>> <--  snip  ->
>>
>> # The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
>> # which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
>> # and the LGPL bits are under lib/, which appears to be used for libgnu, which
>> # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
>> LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
>> LICENSE_${PN} = "GPLv2+"
>> LICENSE_${PN}-dev = "GPLv2+"
>> LICENSE_${PN}-staticdev = "GPLv2+"
>> LICENSE_${PN}-doc = "GPLv2+"
>> LICENSE_${PN}-dbg = "GPLv2+"
>> LICENSE_${PN}-locale = "GPLv2+"
>> LICENSE_liblzma = "PD"
>>
>> LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
>>                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
>>                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
>>                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
>>                     "
>>
>> <--  snip  -->
>>
>> My confusion about the patch is that it removes COPYING.GPLv3 from 
>> LIC_FILES_CHKSUM but keeps GPL-3.0-with-autoconf-exception in LICENSE.
>>
>> My confusion about the semantics of LICENSE is that I fail to find a 
>> clear statement in the documentation that the legal meaning of LICENSE 
>> in OE is what Mark claims it would be. Is this just Marks personal 
>> opinion on what should be done, or is this undocumented tribal 
>> knowledge, or is the exact semantics of LICENSE documented
>> somewhere in a language that lawyers understand?
>>
>> My guess for the latter would be "undocumented tribal knowledge",
>> and clarification is required what is actually correct or incorrect
>> here. And I think this is also what Mark was asking for.
> 
> It -was- documented at one time, but I suspect that documentation was revised
> and the language was lost (or it never made it into a final version of the docs.)
> 
> This is why I was suggesting the TSC weigh in, and just clarify that:
> 
> LICENSE = is the _source code_ license, and only includes items that are or
> could be included in the making of the binaries.  This does NOT include
> autoconf, automake, makefiles, etc that are only used during the build process,
> but not in the sources used to build the outputs.
> 
> LICENSE_<pkg> = is the binary license for a specific package.  It defaults to
> the same as the LICENSE.

Replying to myself....  from meta/conf/documentation.conf:

LICENSE[doc] = "The list of source licenses for the recipe. Logical operators
'&' or '|' and parentheses can be used."


Not sure if this clarifies, but that is the internally documented version.

From the current mega-manual:

LICENSE: This variable specifies the license for the software. If you do not
know the license under which the software you are building is distributed, you
should go to the source code and look for that information. Typical files
containing this information include COPYING, LICENSE, and README files. You
could also find the information near the top of a source file.


So again, my reading is not compiled (output) items, like autoconf, makefiles,
etc would not be considered 'source code'.  But again, I think this really
requires clarification so there is no ambiguity as to what was intended.

--Mark

> --Mark
> 
>>> Cheers,
>>>
>>> Richard
>>
>> cu
>> Adrian
>>
> 


