Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 50BD775794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:31:51 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so27751653pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Zykdc14ddKozsSl0k32+Lpnqd1HxXMMHuhhQRWx905g=;
	b=m64v+HvDGrbM1hMz0u8mncFo2zZ4wf/7QCzO88G7+jl3xdv9shnRZduI6KZ4qPhwvc
	6CWH7rSEF+PEEzBbYHdTzA5QoGDVCNy0UN+6WrazACV4i771RSSyyIsS1ieqI8JCA3Si
	mEZNkbMm2C1RzlBsfh6kN6mf1q5V6bbXINfCl0254Bb4KP9iv3ljgBKskTFZWGUsq7lC
	0bfIQkNsL4yeRXxkS7Yx+pdgXCYhIwEH87JDkoUWPZbmIieBh2wOBxcJIiweU328Oa0q
	kjiyQEROVQu9Gkpr7nBiFBpNiBZBmnvDsmcNHi1f+sa7Zwu1FDZ3FFpAPuPfFXbty57k
	98dA==
X-Received: by 10.70.94.170 with SMTP id dd10mr18076359pdb.146.1440167512162; 
	Fri, 21 Aug 2015 07:31:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:b5f8:e42e:856b:b54b?
	([2601:202:4000:1239:b5f8:e42e:856b:b54b])
	by smtp.googlemail.com with ESMTPSA id
	xo14sm8099063pac.24.2015.08.21.07.31.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Aug 2015 07:31:50 -0700 (PDT)
Message-ID: <55D7364C.7090508@gmail.com>
Date: Fri, 21 Aug 2015 07:31:40 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
	<20150818080317.GC2458@jama>
	<CAHiDW_HCSh-FquWyhib9WDSHxpTVB6iHu-5DP40ugP2=D3O3gw@mail.gmail.com>
	<20150821120618.GA2442@jama>
In-Reply-To: <20150821120618.GA2442@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Fri, 21 Aug 2015 14:31:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2015 05:06 AM, Martin Jansa wrote:
> On Fri, Aug 21, 2015 at 11:48:30AM +0300, Jussi Kukkonen wrote:
>> On 18 August 2015 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Sun, Aug 09, 2015 at 10:58:21AM +0530, Armin Kuster wrote:
>>>> adding the license definitions on the few packages that
>>>> deviate from the overall package license.
>>>>
>>>> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
>>>> and spot checking files.
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>   meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
>>>>   1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
>>>> index f53afcc..f9d331f 100644
>>>> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
>>>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>>>> @@ -2,6 +2,15 @@ SUMMARY = "A low level cryptographic library"
>>>>   HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>>>>   SECTION = "libs"
>>>>   LICENSE = "LGPLv2.1 & GPLv2"
>>>
>>> It would be nice to package GPLv2 files in separate package as well (or
>>> LGPLv2.1 library in seprate package) if you have time to do that.
>>
>> Forgot to answer this, sorry.
>>
>> For 2.7.1 what you suggest may work -- there may be some tools that
>> are GPLv2 that we could separate. But for the new version the strange
>> " "LGPLv3+ | GPLv2+" license combo is _not_ a result of the library
>> being LGPL and some utilities being GPL: the library itself (like a
>> lot of GNU stuff nowadays) is dual licensed like that.
>
> This means that we need to preserve nettle 2.7.1 for people who cannot
> use LGPLv3 (and GPLv2 for libraries).

ok. SO if I resubmit the update, it should be an addition not 
replacement. Would I define PREFERRED_VERSION then as well?

- armin
>
>> It seems weird but actually makes sense for GNU: It forces all users
>> to comply with LGPLv3, except the GPLv2 programs that can't easily be
>> relicensed to GPLv3. Those GPLv2 programs would be incompatible with
>> the newer LGPLv3 libraries but this dual-licensing lets them off the
>> hook.
>>
>> Jussi
>>
>>
>>
>>>> +LICENSE_${PN}-cast = "CC0"
>>>> +LICENSE_${PN}-gosthash = "MIT"
>>>> +
>>>> +# both public and GPL license listed
>>>> +LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
>>>> +LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
>>>> +
>>>> +
>>>>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>>>>                       file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>>>>                       file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>>>> --
>>>> 2.3.5
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>

