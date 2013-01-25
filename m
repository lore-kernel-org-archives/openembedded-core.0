Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TybAn-0004vh-Ab
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 05:45:55 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so4612606dan.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 20:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=h1BaJGDwW1komKSWuhuOctV0DFE2w8UR6djV8pjnfcY=;
	b=oX/wUAPhUSsoUMQUMFLUJdSIoU5c69x7e5aCIXcMwuODsC+lhonhSSxAIB5wV0daay
	n8Vd9lGCJkLTAokv4+G8kjeLx0dL/HkjfT/YMHOTK7ePG6ULBOuj2Va3cha6fCKgxwHo
	K4ulepcaW02a0A+Qk2Jb/Mz0gcTGqVV/tph4i+seFmzX7/KzfkHJCO/rt1/mbE6e4yPM
	hcVZt8XOSLFvmztDh9ex1kgDB8PxIYph4F8PWZhcK20PfIeB6r8RAB79GmudrIu6lE30
	+EU6uHBzpYXIx57QoqCxuqIw6lZfQPPqZz72WVu0TmYIv9QgVvRbhZWjsEmRaf9k+qBu
	uE2w==
X-Received: by 10.66.72.201 with SMTP id f9mr10508963pav.38.1359088218535;
	Thu, 24 Jan 2013 20:30:18 -0800 (PST)
Received: from [172.23.10.175] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id nw9sm16102323pbb.42.2013.01.24.20.30.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 20:30:17 -0800 (PST)
Message-ID: <51020A54.3010106@gmail.com>
Date: Thu, 24 Jan 2013 20:30:12 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<1359064215.3616.20.camel@ted>
	<CAMKF1spCF8ZQ86skFu_V0PHy7_r4n=h3d_6cNF5t3-x36dkoRA@mail.gmail.com>
	<CABcZANmaExGvf_4Vm-+00nkk905an8atzPPR946KOsOWGpwYvw@mail.gmail.com>
	<1359067749.3616.23.camel@ted>
In-Reply-To: <1359067749.3616.23.camel@ted>
X-Enigmail-Version: 1.5
Cc: Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libpcap: Add missing libusb dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 04:45:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/24/2013 02:49 PM, Richard Purdie wrote:
> On Thu, 2013-01-24 at 15:42 -0700, Chris Larson wrote:
>> 
>> On Thu, Jan 24, 2013 at 3:14 PM, Khem Raj <raj.khem@gmail.com>
>> wrote: On Thu, Jan 24, 2013 at 1:50 PM, Richard Purdie 
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Do we need libusb support in libpcap? What does this
>> dependency buy us
>>> and couldn't we force it off instead?
>> 
>> 
>> its needed to support canusb in libpcap, I would say yes we 
>> should support it but disabling it would be ok too although all
>> my builds were silently using libusb so I think unknowingly may
>> be but we are already shipping with canusb support.
>> 
>> I'd personally prefer it disabled, but I'd think at the very
>> least it should be a PACKAGECONFIG entry, whether its included in
>> the default value of PACKAGECONFIG itself or not.
>> 
> Agreed, PACKAGECONFIG, default off is the way to go with this IMO
> too.
> 

OK I have turned it into a PACKAGECONFIG which is off by default.
Disabling canusb support in 1.3 was buggy and it really did not
disable it so I had to backport relevant patches from libpcap upstream
but now
all looks good.

I have pushed V2 into pull tree please take a look.

> Cheers,
> 
> Richard
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlECClQACgkQuwUzVZGdMxTkKACaApmk49aFcWyV8Vcn/I7TToPo
y0MAn2uGa7LTEt+PPy2aMOgsVX4oKdHF
=qLRK
-----END PGP SIGNATURE-----


