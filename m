Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 37AE861608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:26:07 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6yZc-0004ng-OR; Wed, 26 Feb 2020 16:26:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TSHNqZwXdkalthstvYb9d67NZycLzAn5QErdYoyGwCM=;
	b=AVvCtbG4cf41C8C8h2/aR56nTb
	43lWO5Zd/1v2LxLxWReWRnNBdKIk4Ch9KocRGJ7FYhCw8y7u4lEJOx4SAMHmKfOvUB9u1U0c0WeU8
	ogN63dl0ipojxNUJH8ro43asIxd8h+vXtfL/+fT2GKXdxz5Bw6mFF71uvixlALBBjROMlpOLdBVR7
	cgvBOcDld0mIJFFKdN0yKxkagphcdjQNw/+KWLOUZxD6/oFqhg9TJvbuf0cvZzgO7JN0vbGelLK/c
	eID2lS11dmn3MWM8NAdw/WTxXRhcj+dxZrca7Jrzoo7NAlkK5NBPD7bNSAFN69sWhOsZXMmuCyKlv
	h7eK5mlw==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j6yZY-0005Xj-EO; Wed, 26 Feb 2020 16:26:06 +0100
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
To: Khem Raj <raj.khem@gmail.com>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
	<3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
	<CAMKF1sq+8VCveK48+FqpnPRU_MH6_g9+bVfzo4f2Bbto_d6MJQ@mail.gmail.com>
	<1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
Message-ID: <8d85c619-ce7c-c08a-dbff-0577ab36f2b7@pr.hu>
Date: Wed, 26 Feb 2020 16:26:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 58ab21d751055c5f434a9dd5a96062a4
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226152606Z
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
X-List-Received-Date: Wed, 26 Feb 2020 15:26:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 16:20 keltezéssel, Böszörményi Zoltán írta:
> 2020. 02. 26. 16:13 keltezéssel, Khem Raj írta:
>> On Wed, Feb 26, 2020 at 7:12 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>
>>> 2020. 02. 26. 15:58 keltezéssel, Khem Raj írta:
>>>> On Wed, Feb 26, 2020 at 6:05 AM Böszörményi Zoltán via
>>>> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>>>
>>>>> The package name exploits sstate.bbclass so it's not added as
>>>>> implicit dependency to packages.
>>>>>
>>>>
>>>> what is the use of this recipe and why should it be added to core ?
>>>
>>> I should have added a cover letter, shouldn't I?
>>> See patch 3/5 in the series for enabling gallium-va in Mesa.
>>>
>>
>> recipe seems to build full libva, so why not just use that instead.
> 
> You don't seem to be reading mails from openembedded-devel that
> you were cc-ed on.
> http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/205142.html

TL;DR: Making mesa depend on libva would introduce a circular dependency.

> 
>>
>>>>
>>>>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>>>>> ---
>>>>>    meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>>>>>    meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
>>>>>    2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>    create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>
>>>>> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc 
>>>>> b/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>> index ca1386d80b..5b1cdee7e3 100644
>>>>> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>> @@ -17,10 +17,12 @@ SECTION = "x11"
>>>>>    LICENSE = "MIT"
>>>>>    LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
>>>>>
>>>>> -SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
>>>>> +SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
>>>>>    SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
>>>>>    SRC_URI[sha256sum] = 
>>>>> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
>>>>>
>>>>> +S = "${WORKDIR}/libva-${PV}"
>>>>> +
>>>>>    UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>>>>>
>>>>>    DEPENDS = "libdrm"
>>>>> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb 
>>>>> b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>> new file mode 100644
>>>>> index 0000000000..828ef6fbca
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>> @@ -0,0 +1,5 @@
>>>>> +require libva-${PV}.inc
>>>>> +
>>>>> +do_install_append () {
>>>>> +       rm -f ${D}${libdir}/*.so*
>>>>> +}
>>>>> -- 
>>>>> 2.24.1
>>>>>
>>>>> -- 
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
> 


