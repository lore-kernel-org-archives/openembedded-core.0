Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4C7661809
	for <openembedded-core@openembedded.org>;
	Sun,  8 Mar 2020 15:48:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 028Flsdu008040
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 8 Mar 2020 08:48:04 -0700
Received: from [128.224.23.190] (128.224.23.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0;
	Sun, 8 Mar 2020 08:47:43 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
	<babd7ffac5376394f222d6ed21544028ee053369.camel@linuxfoundation.org>
	<CANNYZj9ryAAC37rCRvxiT10LKpg1uo27H8GPW_o_qrh3X9Qrtw@mail.gmail.com>
	<07697e4e61eec35dc6ca42fd7c0b6694aca036c4.camel@linuxfoundation.org>
	<d2d3ad268f75dacaf4061ba4dc537a22bda6bd65.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <ae026371-ee56-d7b8-0101-1a3bc877a6c6@windriver.com>
Date: Sun, 8 Mar 2020 11:47:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d2d3ad268f75dacaf4061ba4dc537a22bda6bd65.camel@linuxfoundation.org>
X-Originating-IP: [128.224.23.190]
Cc: openembedded-core <openembedded-core@openembedded.org>
Subject: Re: M3 build status
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
X-List-Received-Date: Sun, 08 Mar 2020 15:48:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/8/20 10:34 AM, Richard Purdie wrote:
> On Sun, 2020-03-08 at 13:18 +0000, Richard Purdie wrote:
>> On Sun, 2020-03-08 at 14:08 +0100, Alexander Kanavin wrote:
>>> On Sun, 8 Mar 2020 at 09:15, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>> This is now closer. Alex fixed the libmodule-build-perl and
>>>> gettext
>>>> reproducibility issues (thanks!), I tracked down a glibc issue
>>>> and
>>>> procps one I saw locally. On a fresh autobuilder run we saw:
>>>>
>>>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-mk0v6ljq/packages/diff-html/
>>>> and
>>>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-5pvgdd3a/packages/diff-html/
>>>>
>>>> which I believe is the remaining blocking issue on coreutils-
>>>> ptest.
>>> Not quite. The coreutils-ptest itself seems to persistently fail
>>> here:
>>>
>>> AssertionError: Failed ptests:
>>> {'coreutils': ['tests/tail-2/assert.sh']}
>>>
>>> so I'd like to have that fixed before it goes in. We have a 100%
>>> ptest pass rate now (except for random timing fluctuations), which
>>> I
>>> don't want to see regressed :)
>> I agree that would be nice and something we need to do before
>> release,
>> I may let us sort that one test in M4 to enable the M3 build, I have
>> to
>> take a pragmatic approach to this.
>>
>> That said, there is a more pressing issue:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1686
>>
>> which is somehow seemingly related to the coreutils change, I just
>> can't see how as yet :/
>>
>> (as well as the gcc-plugin reproducibility issues)
> Caused by the new libmodule-build-perl which depends upon build-
> essential and hence gcc which isn't target multilib 'safe'.

coreutils is fighting hard to avoid getting a ptest!

I'll have a look at these issues first thing tomorrow.

>
> If we could stop the -ptest package dependencies leaking to -dev we'd
> avoid this.
>
> Cheers,
>
> Richard
>
>

