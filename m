Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 62A6961672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:15:01 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j70H0-00026I-40; Wed, 26 Feb 2020 18:15:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dUsLihfpq2ijavIcf3JryrzbLvW2Wsi2UUe9SonuKwk=;
	b=b7FaF1z5vss6FeYLX1Og8gM8iH
	0xrP2EJn6sLOIYP3PKbMHocYnETBduqcR+OQtwZiCXdwcU+NyyKcew/kuf9ReVD3sGYVhNsYlwXcj
	GstC8NWpS/zr6/WJzlHbB3Pwx8AQDRKLBN9oOUnzOUwt3O/1EAcCuDWD0x37IqhUQERS3Ns/UGgzR
	0jjpjB6G7KYNIW04kNTaE9TdW4PL50BDKYrFv9smwMTPVZHFN4tEEDnk4Mvk0HKgRlagbCungVtIC
	L12AbWignb6RaTuFK0zr5SC/1NMd81bCGGTxzC4mivQdQNNVvtwmvnExyCuaO8WLjotUWC4hx2NZz
	+mt6LNWg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j70Gv-0000vF-7Y; Wed, 26 Feb 2020 18:15:00 +0100
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
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
Message-ID: <dca27a23-5bb1-bfae-8736-d29a0faded96@pr.hu>
Date: Wed, 26 Feb 2020 18:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e1137d64-5be8-9667-fb3f-3ea264a1a5ad@pr.hu>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 5febd8249cd066c61ce768adf8b22bea
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226171500Z
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
X-List-Received-Date: Wed, 26 Feb 2020 17:15:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 18:08 keltezéssel, Böszörményi Zoltán írta:
> 2020. 02. 26. 17:51 keltezéssel, Khem Raj írta:
>>
>>
>> On 2/26/20 7:58 AM, Böszörményi Zoltán wrote:
>>> 2020. 02. 26. 16:30 keltezéssel, Khem Raj írta:
>>>> On Wed, Feb 26, 2020 at 7:20 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>>>
>>>>> 2020. 02. 26. 16:13 keltezéssel, Khem Raj írta:
>>>>>> On Wed, Feb 26, 2020 at 7:12 AM Böszörményi Zoltán <zboszor@pr.hu>
>>>>>> wrote:
>>>>>>>
>>>>>>> 2020. 02. 26. 15:58 keltezéssel, Khem Raj írta:
>>>>>>>> On Wed, Feb 26, 2020 at 6:05 AM Böszörményi Zoltán via
>>>>>>>> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>>>>>>>
>>>>>>>>> The package name exploits sstate.bbclass so it's not added as
>>>>>>>>> implicit dependency to packages.
>>>>>>>>>
>>>>>>>>
>>>>>>>> what is the use of this recipe and why should it be added to core ?
>>>>>>>
>>>>>>> I should have added a cover letter, shouldn't I?
>>>>>>> See patch 3/5 in the series for enabling gallium-va in Mesa.
>>>>>>>
>>>>>>
>>>>>> recipe seems to build full libva, so why not just use that instead.
>>>>>
>>>>> You don't seem to be reading mails from openembedded-devel that
>>>>> you were cc-ed on.
>>>>
>>>> don't assume things
>>>
>>> Understood.
>>>
>>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/205142.html
>>>>>
>>>>>
>>>>
>>>> I am trying to make us thing if -dev package can be used somehow to
>>>> avoid this
>>>> or have we exhausted all possibilities.
>>>
>>> Why is it a problem to exploit sstate.bbclass internals implicitly
>>> by using a *-initial package name for an arbitrary package?
>>
>> it is not a problem, however, it is a work to keep such setup going and
>> also it has to be considered always in dependencies etc.
>>
>>> Surely it's not reserved for libgcc-initial and friends.
>>>
>>
>> they are different usecases, libgcc-initial is a veneer/trampoline used
>> to bootstrap toolchain, and that too we want to remove at every
>> opportunity we get, we use to have lot of initial recipes and they are
>> very few left, so we have to be mindful of adding another one.
>>
>>> It solves two problems nicely in one go:
>>> 1. by using a different package than libva, the libva-vs-mesa
>>>     circular dependency is avoided. mesa needs a crippled libva
>>> (pkgconfig + headers)
>>>     to build its VAAPI state tracker and the VAAPI drivers
>>
>> I see archlinux using full libva for this. how are other distros doing
>> it? is this problem unique to OE
> 
> Fedora also uses the full libva.
> 
> However, the chicken-and-egg circular dependency is broken by history
> for these distros.
> 
> Koji and Mock build one package at a time with all their dependencies
> already available from the staging package repository and the results
> will be eventually uploaded to the same repository.
> 
> Bitbake doesn't have have this loophole to download pre-built dependencies.

Also, somewhere on 01.org or in the libva sources the same solution
I presented in this patchset is suggested:

1. build libva with --disable-glx (it is needed when Mesa SDK is present)
    but it's not needed by not depending on mesa in libva-initial
2. build mesa with libva build in (1) as it only needs the pkgconfig files
    and the headers
3. build libva with --enable-glx. It's autodetected, set to on with
    depending on mesa in the full libva recipe.

Obviusly the same libva recipe can't be used to build mesa that depends on mesa.

> 
>>
>>> 2. by using libva-initial as the package name, the per-recipe sysroot issue
>>>     is avoided where prepare-sysroot for a 3rd package like
>>> intel-vaapi-driver
>>>     would fail because the real libva the crippled variant would install
>>>     identical files
>>>
>>
>> right, this is the problem I am afraid of creating almost duplicate packages
>>
>>>>
>>>>>>
>>>>>>>>
>>>>>>>>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>>>>>>>>> ---
>>>>>>>>>      meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>>>>>>>>>      meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
>>>>>>>>>      2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>>      create mode 100644
>>>>>>>>> meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>>>>
>>>>>>>>> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>>>> b/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>>>> index ca1386d80b..5b1cdee7e3 100644
>>>>>>>>> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>>>> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>>>> @@ -17,10 +17,12 @@ SECTION = "x11"
>>>>>>>>>      LICENSE = "MIT"
>>>>>>>>>      LIC_FILES_CHKSUM =
>>>>>>>>> "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
>>>>>>>>>
>>>>>>>>> -SRC_URI =
>>>>>>>>> "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
>>>>>>>>>
>>>>>>>>> +SRC_URI =
>>>>>>>>> "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
>>>>>>>>>
>>>>>>>>>      SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
>>>>>>>>>      SRC_URI[sha256sum] =
>>>>>>>>> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
>>>>>>>>>
>>>>>>>>> +S = "${WORKDIR}/libva-${PV}"
>>>>>>>>> +
>>>>>>>>>      UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>>>>>>>>>
>>>>>>>>>      DEPENDS = "libdrm"
>>>>>>>>> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>>>> b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>>>> new file mode 100644
>>>>>>>>> index 0000000000..828ef6fbca
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>>>> @@ -0,0 +1,5 @@
>>>>>>>>> +require libva-${PV}.inc
>>>>>>>>> +
>>>>>>>>> +do_install_append () {
>>>>>>>>> +       rm -f ${D}${libdir}/*.so*
>>>>>>>>> +}
>>>>>>>>> -- 
>>>>>>>>> 2.24.1
>>>>>>>>>
>>>>>>>>> -- 
>>>>>>>>> _______________________________________________
>>>>>>>>> Openembedded-core mailing list
>>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>
>>>>>
>>>
> 


