Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.14134.1607088602279575120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 05:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iFvzLgcn;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v4 1/3] introduce lib_subpackage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607088601;
	bh=ZVw2wNr6mkwG/e48ifZOnZbCd26+y5DoH0QH6ZhnXZo=;
	h=To:Cc:References:From:Date:In-Reply-To:From;
	b=iFvzLgcnqa3jlpz1fDZC+h76LJSZnfP1JnJB4Af2JBOP0RkMi/x0qGYQFxiYyqgiy
	 OZxN2bl/eBnoLF7QyunCYdCBEg4ss9/MEKecPGLZVpckU2c7K5Az49TL+py4uvy+Aq
	 KfLUEDa8iSB2MICtwt2xTIqD3wngG/DY+GWBh4C7sAEcfoRHR9X6hvw8DZkNw3r4by
	 dCqviYB4kEFA9rPYCO1gymZqJDolappVGP74Rndk6HtIhvqlO95KCKsYxW2qLzd5qX
	 BaxbECXXSzYV5Ct7RTaA2xR8keE8AOBLvK+ERKElN6oUVyqI/GRlGI0/arICv9U+94
	 1VJgmAF7TsYCw==
To: pb@pbcl.net
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201203232826.28519-1-okaya@kernel.org>
 <20201204110142.GV30831@pbcl.net>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <d7593470-039f-e4c4-e4a9-36c475cf99c0@kernel.org>
Date: Fri, 4 Dec 2020 08:30:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204110142.GV30831@pbcl.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

+Richard,

On 12/4/2020 6:01 AM, Phil Blundell via lists.openembedded.org wrote:
> On Thu, Dec 03, 2020 at 11:28:24PM +0000, Sinan Kaya wrote:
>> This subclass allows us to easily split a recipe into
>> subpackages.
> 
> "lib_subpackage" seems a slightly odd name for something that isn't
> dealing with libraries.  What's the etymology of that?

I'm open to giving it a better name. Richard pointed me to a file
beginning with lib_foo.class for where this functionality could be
hosted before.

> 
>> +    d.appendVar("PACKAGES", " " + " ".join(packages))
>> +    d.appendVar("PROVIDES", " " + " ".join(packages))
> 
> It seems a bit strange to be putting the same things in PACKAGES and
> PROVIDES.  Is that actually necessary?

I want to be able to include procps-ps without the entire procps
package. I was not able to do that without the above two lines.

> 
> p.
> 
> 
> 
> 
> 

