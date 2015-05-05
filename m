Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 11DF072A85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t45Jpj9j015375; Tue, 5 May 2015 20:51:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l2QB14m0vHou; Tue,  5 May 2015 20:51:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t45JpTWN015370
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 5 May 2015 20:51:41 +0100
Message-ID: <1430855489.8074.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Tue, 05 May 2015 20:51:29 +0100
In-Reply-To: <5547BE45.2050206@windriver.com>
References: <5547BE45.2050206@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 05 May 2015 19:51:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-04 at 14:45 -0400, Randy MacLeod wrote:
> Should oe-core add libressl as an alternative to openssl and other
> OE SSL/TLS implementations?
> 
> We had a request from a customer to add LibreSSL so I was wondering
> about the plans of the Yocto community and indeed of the larger Linux
> distro community.
> 
> Libressl claims (aims?) to be  a more stable, secure TLS implementation
> then OpenSSL. It was initially only for OpenBSD but it supports a
> variety of platforms now:
>     http://www.libressl.org/releases.html
> The CVE history enthusiastically summarized on Wikipedia:
>     https://en.wikipedia.org/wiki/LibreSSL
> does indicate that libressl has been vulnerable to fewer CVEs than
> openssl so far. I quickly reviewed:
>     https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations
> but perhaps someone on the list has more direct experience, knowledge
> and/or opinions of implementations of TLS? Note that the libressl devs
> has stated that they have no interest in FIPS 140-2 certification:
>     http://marc.info/?l=openbsd-misc&m=139819485423701&w=2
> so that could be a problem for some users.
> 
> 
> Other than Arch, and openSUSE Factory build, it seems that no
> major linux distro has added libressl:
>     http://pkgs.org/search/libressl
> 
> An OE libressl recipe is not current indexed:
>  
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libressl
> 
> If I search more broadly:
>     http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ssl
> 
> I see that the OE community does have recipes for:
>    gnutls, nss, polarssl (now mbed TLS) and wolfssl.
> 
> So what do you think of libressl?

I don't see a pressing reason to accept this into OE-Core right now. The
CVE numbers are bound to be lower for something with less exposure and
the fact most mainline distros aren't using it is also a mild
contraindication.

Certainly a recipe in meta-oe and someone experimenting with it would be
great and I've love to see the feedback and results but I'd be cautious
here for the core right now.

Obviously it will be interesting to see if anyone else has strong
opinions though too.

Cheers,

Richard


