Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8636C61033
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 20:21:17 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j73BG-00035y-2U; Wed, 26 Feb 2020 21:21:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h4yC3ZJ7cWzg2xkf+XrBhDXldOxdjmYIjUZP9ZT+nkA=;
	b=gcU77VtJqBKuN2Zx2x2OeysUjc
	GW4pH0+6skbF85+Bh7YRd0c6gFfTBy6Fvdg/AIjcTZWvXXC8yNHQB5B0PbYbl/U0APn2+Ayv/LmXw
	y3Hws2i+yNQMW/VOsss2egxICQ29LftuDuXtLo1ndQcZX+/FJAN34bSAgayfgIFZ6pOdfYW32E++U
	xZP3ngUYQ9mVw/0qZfB6oHsbP0WsNWRyKodsMtYE8nBrbrCmuT/T9tTFKBb9nO+ef6qm/NgloAKzM
	wxmKt1/mpqMJDxdeaZlx8eHVohVUiEYcgUltpjUy/qiDuO+ZYUZjFzL2pmKAbCNIyh3XSBwjbYXUn
	K6EGH/7g==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j73BB-0007c1-NK; Wed, 26 Feb 2020 21:21:16 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
	<3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
	<CAMKF1sq+8VCveK48+FqpnPRU_MH6_g9+bVfzo4f2Bbto_d6MJQ@mail.gmail.com>
	<1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
	<CAMKF1srD6BcwvQQ7cs3fdw1oQUxO+8K6dRWVn4DozbrkUgy+Cw@mail.gmail.com>
	<8a163a56-9558-222a-b24b-03001d7e3b1c@pr.hu>
	<3a2f7872-9f55-f27a-3db9-66aa2fc786f5@gmail.com>
	<e1137d64-5be8-9667-fb3f-3ea264a1a5ad@pr.hu>
	<dca27a23-5bb1-bfae-8736-d29a0faded96@pr.hu>
	<cf075d34-c566-8284-8e16-3eb3b030e12c@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <a2e69e18-a8e9-0965-9d6e-341107937868@pr.hu>
Date: Wed, 26 Feb 2020 21:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cf075d34-c566-8284-8e16-3eb3b030e12c@gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 8bcceada9082d4496415c523679013ef
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226202116Z
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 20:21:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 20:44 keltezéssel, Khem Raj írta:
> 
> 
> On 2/26/20 9:14 AM, Böszörményi Zoltán wrote:
>> 2020. 02. 26. 18:08 keltezéssel, Böszörményi Zoltán írta:
>>> 2020. 02. 26. 17:51 keltezéssel, Khem Raj írta:
>>>>
>>>>
>>>> On 2/26/20 7:58 AM, Böszörményi Zoltán wrote:
>>>>> 2020. 02. 26. 16:30 keltezéssel, Khem Raj írta:
>>>>>> On Wed, Feb 26, 2020 at 7:20 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>>>>>
>>>>>>> 2020. 02. 26. 16:13 keltezéssel, Khem Raj írta:
>>>>>>>> On Wed, Feb 26, 2020 at 7:12 AM Böszörményi Zoltán <zboszor@pr.hu>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> 2020. 02. 26. 15:58 keltezéssel, Khem Raj írta:
>>>>>>>>>> On Wed, Feb 26, 2020 at 6:05 AM Böszörményi Zoltán via
>>>>>>>>>> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>>>>>>>>>
>>>>>>>>>>> The package name exploits sstate.bbclass so it's not added as
>>>>>>>>>>> implicit dependency to packages.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> what is the use of this recipe and why should it be added to core ?
>>>>>>>>>
>>>>>>>>> I should have added a cover letter, shouldn't I?
>>>>>>>>> See patch 3/5 in the series for enabling gallium-va in Mesa.
>>>>>>>>>
>>>>>>>>
>>>>>>>> recipe seems to build full libva, so why not just use that instead.
>>>>>>>
>>>>>>> You don't seem to be reading mails from openembedded-devel that
>>>>>>> you were cc-ed on.
>>>>>>
>>>>>> don't assume things
>>>>>
>>>>> Understood.
>>>>>
>>>>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/205142.html
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> I am trying to make us thing if -dev package can be used somehow to
>>>>>> avoid this
>>>>>> or have we exhausted all possibilities.
>>>>>
>>>>> Why is it a problem to exploit sstate.bbclass internals implicitly
>>>>> by using a *-initial package name for an arbitrary package?
>>>>
>>>> it is not a problem, however, it is a work to keep such setup going and
>>>> also it has to be considered always in dependencies etc.
>>>>
>>>>> Surely it's not reserved for libgcc-initial and friends.
>>>>>
>>>>
>>>> they are different usecases, libgcc-initial is a veneer/trampoline used
>>>> to bootstrap toolchain, and that too we want to remove at every
>>>> opportunity we get, we use to have lot of initial recipes and they are
>>>> very few left, so we have to be mindful of adding another one.
>>>>
>>>>> It solves two problems nicely in one go:
>>>>> 1. by using a different package than libva, the libva-vs-mesa
>>>>>     circular dependency is avoided. mesa needs a crippled libva
>>>>> (pkgconfig + headers)
>>>>>     to build its VAAPI state tracker and the VAAPI drivers
>>>>
>>>> I see archlinux using full libva for this. how are other distros doing
>>>> it? is this problem unique to OE
>>>
>>> Fedora also uses the full libva.
>>>
>>> However, the chicken-and-egg circular dependency is broken by history
>>> for these distros.
>>>
>>> Koji and Mock build one package at a time with all their dependencies
>>> already available from the staging package repository and the results
>>> will be eventually uploaded to the same repository.
>>>
>>> Bitbake doesn't have have this loophole to download pre-built dependencies.
>>
>> Also, somewhere on 01.org or in the libva sources the same solution
>> I presented in this patchset is suggested:
>>
>> 1. build libva with --disable-glx (it is needed when Mesa SDK is present)
>>     but it's not needed by not depending on mesa in libva-initial
>> 2. build mesa with libva build in (1) as it only needs the pkgconfig files
>>     and the headers
>> 3. build libva with --enable-glx. It's autodetected, set to on with
>>     depending on mesa in the full libva recipe.
> 
> looking at the nature of the problem, it might be the way to unbreak the catch-22, does 
> anything else needs this bootstrap header package ?

Besides DEPENDS="libdrm", no.

> do we need to ensure that content of libva-dev and the bootstrap packages do not overlap.

I don't think so.
Apparently, the mesa-dev package built from this patchset
doesn't depend on libva-initial-dev and this latter package
doesn't get included into an image either. I guess the
sstate.bbclass internals deal with this properly.


> 
>>
>> Obviusly the same libva recipe can't be used to build mesa that depends on mesa.
>>
> 
> 


