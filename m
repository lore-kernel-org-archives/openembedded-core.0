Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 484E3615FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:41:39 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7Ejj-0005M3-Qg; Thu, 27 Feb 2020 09:41:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GQ8616wyeR9JgMb2nvuMh4OsH8p6L/bbX69bc7tnHss=;
	b=JMzlDyWIW7VM3aUKO+Le5hI47w
	y+IV3S8oMLPTMBD1tZukgeCKRWWWsos03H0bNFOIl+x/1btS6feHO/PD5orMSsAKkSt2NFvgAQreQ
	QNoz31UK8tAt9eZqxa+DGKV10EneY8ivo7jZALu30ohmGSbdHRlkOoHmlZttFZw3ClITBwtYbKOqa
	zeZ7Hhu5MJfLxGN700qBBNY/Dk63pqK1/2+bdyMC6SMOgygkendg/sZP+ZlYaUoY1tMAh250R66MH
	Kv+cZUfd1mORKubyKwL5lNfOGmGlYSGSAr4Pn4fNODSL33vKUskh30qWvbQtrBstwsxCOMmVNUvmQ
	17dJSMlw==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j7Ejf-0004QU-Il; Thu, 27 Feb 2020 09:41:37 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20200227061657.66871-1-zboszor@pr.hu>
	<f35582c7-c1e7-a2ac-29b8-75bb33305d36@pr.hu>
	<CAMKF1sqBdh45oAbTGMYxQSXPaF-r5ZqbdVZZzmR1P7heAy=6kQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <39009389-fac8-edc3-66e1-9d51868f4ad6@pr.hu>
Date: Thu, 27 Feb 2020 09:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqBdh45oAbTGMYxQSXPaF-r5ZqbdVZZzmR1P7heAy=6kQ@mail.gmail.com>
X-Spam-Score: -2.0 (--)
X-Scan-Signature: f27674dcb73dc349b62d57623b8ab406
X-Spam-Tracer: backend.mail.pr.hu -2.0 20200227084137Z
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang][PATCH] conf/nonclangable.conf: Always build mesa with gcc
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
X-List-Received-Date: Thu, 27 Feb 2020 08:41:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 27. 8:44 keltezéssel, Khem Raj írta:
> Can you send it via github pull request please

Sure.

> 
> On Wed, Feb 26, 2020 at 10:21 PM Böszörményi Zoltán via
> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>
>> Ignore this, the patch is against the zeus branch.
>> Re-sent with the proper subject.
>>
>> 2020. 02. 27. 7:16 keltezéssel, Böszörményi Zoltán írta:
>>> Building mesa (at least version 19.3.4) with clang 9.0.1 leads
>>> to linker errors on x86/x86-64:
>>>
>>> "undefined reference to `typeinfo for llvm::raw_pwrite_stream'"
>>> in libvulkan_radeon.so
>>>
>>> and
>>>
>>> "undefined reference to `typeinfo for llvm::RTDyldMemoryManager'"
>>> in libgallium.a.
>>>
>>> It was reported at https://gitlab.freedesktop.org/mesa/mesa/issues/2533
>>>
>>> It seems it is related to rtti not being enabled, at least reports
>>> from a few years ago on forums lead to that conclusion.
>>> But enabling rtti for clang in PACKAGECONFIG doesn't help.
>>>
>>> Just build mesa with gcc, it fixes the linker errors.
>>>
>>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>>> ---
>>>    conf/nonclangable.conf | 7 +++----
>>>    1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
>>> index 70336bb..91b9965 100644
>>> --- a/conf/nonclangable.conf
>>> +++ b/conf/nonclangable.conf
>>> @@ -45,10 +45,9 @@ TOOLCHAIN_pn-libssp-nonshared = "gcc"
>>>    TOOLCHAIN_pn-libstd-rs = "gcc"
>>>    TOOLCHAIN_pn-m4_powerpc = "gcc"
>>>    # clang does not have 64bit atomics on mips32
>>> -TOOLCHAIN_pn-mesa_mips = "gcc"
>>> -TOOLCHAIN_pn-mesa_mipsel = "gcc"
>>> -TOOLCHAIN_pn-mesa_riscv64 = "gcc"
>>> -TOOLCHAIN_pn-mesa_powerpc = "gcc"
>>> +# building Mesa 19.3.x with clang causes linker errors on x86/x86-64
>>> +# See https://gitlab.freedesktop.org/mesa/mesa/issues/2533
>>> +TOOLCHAIN_pn-mesa = "gcc"
>>>    # multiple definition of 'mongo::error_details::isNamedCode<0>'
>>>    TOOLCHAIN_pn-mongodb = "gcc"
>>>    # variant-impl.hpp:309:36: error: 'is_variant' does not name a template but is followed by template arguments
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


