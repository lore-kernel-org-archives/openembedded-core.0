Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id BBDC873BB8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 20:05:29 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so204271771pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Gpfi1Lklxki0S6zH0EtUrw7iq9Qx49fyjK2m5rZOuE8=;
	b=RHJz24rULNt+9i1mWy1mqwCUg3ZUQMN5zKoIQ3fGdq1Th10QMm4r/He+yYzUjAlUhW
	oy+47YFasJr1gzQY9vGjPR8n/96xl2k/zBJLVM671IeYZIpqzd1uje+SZ5uhGWJC7/rj
	GijtkcrPpHm/8OsWwQOFDWRvfJITbwrDILDeBfyfzhQrWT9pndz8XqRRZUB/f8I19bD6
	+YRIGoip3oSSsQ/fF304Klvu4Tw7kxpl/LZYBBFswGVpF0rdysnQkKQU8LA5Gtf3cRHN
	CU9IeG9SpenRsuPmjokPmR12yxF1NzhERIrA5OB4c1AwHwpSIQfmrQSXSCH76znKFMWB
	adwg==
MIME-Version: 1.0
X-Received: by 10.68.179.67 with SMTP id de3mr54748151pbc.85.1430856330678;
	Tue, 05 May 2015 13:05:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 5 May 2015 13:05:30 -0700 (PDT)
In-Reply-To: <1430855489.8074.10.camel@linuxfoundation.org>
References: <5547BE45.2050206@windriver.com>
	<1430855489.8074.10.camel@linuxfoundation.org>
Date: Tue, 5 May 2015 17:05:30 -0300
X-Google-Sender-Auth: Q4OMwazN-CGBIUuDOGlfa_qHbQ4
Message-ID: <CAP9ODKo9WAzdRnZp0wtZJYK+5tN+CyTph4dzH2tgguuoXOBqPw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add libreSSL to oe-core?
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
X-List-Received-Date: Tue, 05 May 2015 20:05:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 5, 2015 at 4:51 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-05-04 at 14:45 -0400, Randy MacLeod wrote:
>> Should oe-core add libressl as an alternative to openssl and other
>> OE SSL/TLS implementations?
>>
>> We had a request from a customer to add LibreSSL so I was wondering
>> about the plans of the Yocto community and indeed of the larger Linux
>> distro community.
>>
>> Libressl claims (aims?) to be  a more stable, secure TLS implementation
>> then OpenSSL. It was initially only for OpenBSD but it supports a
>> variety of platforms now:
>>     http://www.libressl.org/releases.html
>> The CVE history enthusiastically summarized on Wikipedia:
>>     https://en.wikipedia.org/wiki/LibreSSL
>> does indicate that libressl has been vulnerable to fewer CVEs than
>> openssl so far. I quickly reviewed:
>>     https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations
>> but perhaps someone on the list has more direct experience, knowledge
>> and/or opinions of implementations of TLS? Note that the libressl devs
>> has stated that they have no interest in FIPS 140-2 certification:
>>     http://marc.info/?l=openbsd-misc&m=139819485423701&w=2
>> so that could be a problem for some users.
>>
>>
>> Other than Arch, and openSUSE Factory build, it seems that no
>> major linux distro has added libressl:
>>     http://pkgs.org/search/libressl
>>
>> An OE libressl recipe is not current indexed:
>>
>> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libressl
>>
>> If I search more broadly:
>>     http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ssl
>>
>> I see that the OE community does have recipes for:
>>    gnutls, nss, polarssl (now mbed TLS) and wolfssl.
>>
>> So what do you think of libressl?
>
> I don't see a pressing reason to accept this into OE-Core right now. The
> CVE numbers are bound to be lower for something with less exposure and
> the fact most mainline distros aren't using it is also a mild
> contraindication.
>
> Certainly a recipe in meta-oe and someone experimenting with it would be
> great and I've love to see the feedback and results but I'd be cautious
> here for the core right now.
>
> Obviously it will be interesting to see if anyone else has strong
> opinions though too.

I share this very same view. Adding this to meta-oe seems more logical for now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

