Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 141D07D5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:35:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4DBYp8L024755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2019 04:34:51 -0700 (PDT)
Received: from soho-mhatle-m.local (147.11.117.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 04:34:50 -0700
To: Khem Raj <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, Bas Mevissen
	<abuse@basmevissen.nl>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
	<ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
	<b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
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
Message-ID: <ceb5ee6b-3965-de63-4237-805a6a97e92b@windriver.com>
Date: Mon, 13 May 2019 14:34:48 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 13 May 2019 11:35:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/11/19 4:42 AM, Khem Raj wrote:
> 
> 
> On 4/29/19 6:51 AM, richard.purdie@linuxfoundation.org wrote:
>> On Mon, 2019-04-29 at 15:47 +0200, Andreas Müller wrote:
>>> On Mon, Apr 29, 2019 at 2:21 PM Andreas Müller <
>>> schnitzeltony@gmail.com> wrote:
>>>> On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl
>>>>> wrote:
>>>>> On 2019-04-29 11:29, Andreas Müller wrote:
>>>>>
>>>>> (...)
>>>>>
>>>>>> Understood - hope to find time till tomorrow for this. Need to
>>>>>> find an
>>>>>> old machine for test because otherwise further fixes might
>>>>>> remain
>>>>>> incomplete again.
>>>>>>
>>>>>
>>>>> Why not add the g++ option --std=c++11 when test building this
>>>>> recipe?
>>>>>
>>>>> $cat test.cc
>>>>>
>>>>> #include <string>
>>>>>
>>>>> using namespace std::literals;
>>>>>
>>>>> int main()
>>>>> {
>>>>>          return 0;
>>>>> }
>>>>>
>>>>>
>>>>> $ g++ --std=c++17 test.cc -o test
>>>>> $ g++ --std=c++11 test.cc -o test
>>>>> test.cc:5:22: error: ‘literals’ is not a namespace-name
>>>>>       5 | using namespace std::literals;
>>>>>         |                      ^~~~~~~~
>>>>>
>>>>> -- Bas.
>>>> Did that but on CFLAGS (copy & paste from another place in recipe)
>>>> and
>>>> since issues popped up I thought it was right :(
>>>>
>>> Looked into:
>>>
>>> There is no easy way to get vte-native to build with c++11. Even if -
>>> patches possibly introduce functional changes/errors (and the result
>>> of oe-selftest is questionable with a massively patched vte).
>>>
>>> So I see two ways to go:
>>>
>>> 1. set vte-native requirements to c++14. That worked here with
>>> CXXFLAGS_append_class-native = " --std=c++14" but looking into logs
>>> of
>>> centos 7 there are several '--std=gnu++11'. Have no idea where they
>>> come from so chances are high this patch is going fail with c++14.
>>> 2. revert vte back to 0.52.2 and forget the idea to get recent
>>> gnome-terminal back in near future. That requires vte 0.56.1 and was
>>> the reason I sent the update here.
>>>
>>> My preference is 2.
>>
>> I'm willing to try testing a c++14 patch if that helps, we can fall
>> back to 2 if that fails?
>>
> 
> Can we require centos7 and other hosts which use old compilers to 
> install the additional packages to have newer compilers ? e.g. for 
> centos installing devtoolset-7 will fix this issue

I think we need to consider disabling this by default, as Ross indicated he
wasn't sure it was really required, as well as consider the c++14 patch (if
standard CentOS supports C++-14).

I do think it's reasonable to try to patch this component, assuming it can be
done in a reasonable way with a reasonable end result.  (10-lines is pretty easy
to understand/support, 1000 lines... no so much.)

However, once we get past one component into multiples, then we need a better
answer.  Either a set of buildtools the user can build/download, or items
standard distributions have that they can install.

Unfortunately CentOS 7 (and corresponding RHEL) is ancient by compiler
standards, but is heavily used as a replacement is not yet ready.  So this is a
problem we'll need to deal with for a while still.  Until CentOS 7 era is really
no longer heavily used I think we don't have a choice here but to deal with this
one way or another.

--Mark

>> Cheers,
>>
>> Richard
>>


