Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TGVph-0002ZS-3z
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 16:09:53 +0200
Received: from localhost ([127.0.0.1]:51773 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TGVdH-0000mu-Er
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 13:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=tYLwcmcwIB2Hk8h7693IiW1pX/Q=; b=LLQRr85usFuFQHg/VDd0ZDjyv/Gh
	VTmNf0UH0Y3zYIxG6eKwDqdr9/dtHRD7ECta4RjtwQ0M0oF8Ff7JQeGUg8awiUIR
	INPdyS/ndqrHOmNNf4sbXxE+f//uDTDWf97gYvK+awCpl8O1iJYRx4OZU9l1k13K
	/TB8xd4v7ZmdwOs=
Received: from [195.171.99.130] (port=62571 helo=[192.168.0.59])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TGVdH-0000mr-CL
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 13:57:03 +0000
Message-ID: <5061B893.5030705@communistcode.co.uk>
Date: Tue, 25 Sep 2012 14:58:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
	<CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
	<50601BC1.9060706@communistcode.co.uk> <50601D62.8070408@intel.com>
	<50601FD9.4080009@communistcode.co.uk>
	<CAMKF1sqGGc+mE-0JpxznkC1KkbqMrVOzMqRiUtxX8fOR7FqwTQ@mail.gmail.com>
	<50616B77.1030007@communistcode.co.uk>
	<CAMKF1sqWTFmvWq8PbFohzWZ8-fPn1BMREdb7yryDJEsZf9U8SQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqWTFmvWq8PbFohzWZ8-fPn1BMREdb7yryDJEsZf9U8SQ@mail.gmail.com>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 14:09:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/12 14:41, Khem Raj wrote:
> On Tue, Sep 25, 2012 at 1:29 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> Ok, I passed the compiler and the linker the sysroot flag and it compiled
>> successfully. Thank you everyone for all your help and I'll brush up on my
>> compiling/linking knowledge!
> Hmm if you installed toolchain in different prefix then it was built
> on and then experience
>
> <cross>-gcc hello.c not building thats a problem we have to fix in
> relocatable SDK install or wherever
> wasnt that the case ?

I think the issue was that I am using Eclipse to manage my build and it 
was over writing the GCC parameters.

I believe it was calling arm-*-*-* directly and not using ${CC} if that 
makes sense? Therefore it didn't know where to find the libraries and 
includes. Passing the --sysroot option to the compiler and the linker 
now lets it build.

Eclipse is still having issues looking in the right directory for 
includes and I don't know what is causing that - but it compiles and 
links fine now.

If I can provide more information then I would be happy to. I think I 
agree and I'm still not fully convinced that it's completely fixed.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



