Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.5466.1607557662482352356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 15:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=P+eRspqv;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v4 1/3] introduce lib_subpackage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607557661;
	bh=yNc4Pwsoh9olhB9pvlACEYnwv2y/Or3PPAm0fcJ3VBE=;
	h=From:To:Cc:References:Date:In-Reply-To:From;
	b=P+eRspqvn1PEDl7qxVJX9xkttVFg5MNjmm5aHQ20Mx37qBw9xD9QNOMDKr7j3O9zg
	 qqdoDyk3wDEyr55UBBwhA894VEOF6c9ifJXT22yWXhBCVY1euAfOlUD9gpk0LIlxso
	 Xd+N+2cvnGQWRpE4u7AdHjUYJTc9hMyr0PyeQPeckDfcjYs0pudN8g8yJ9/s8DSPg1
	 oX8Bp7k3VYpmryJcHNaWpN9adEUojFuxWUWf33GeiKovG3OVq1l8+eSUsAfqNglrJv
	 VX+aQvUcWxgotLFAjq4ysz/JWx48K2Ptps9Gu7hP8OVgA/T4j4TiqeSEu+iP3Y21DA
	 JcBeX35OJFprQ==
From: "Sinan Kaya" <okaya@kernel.org>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201203232826.28519-1-okaya@kernel.org>
 <20201204110142.GV30831@pbcl.net>
 <d7593470-039f-e4c4-e4a9-36c475cf99c0@kernel.org>
 <20201205222337.GW30831@pbcl.net>
 <164DFA8489EB0A7A.29396@lists.openembedded.org>
Message-ID: <09709579-adf9-1a13-44e9-b16d93d1f57f@kernel.org>
Date: Wed, 9 Dec 2020 18:47:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <164DFA8489EB0A7A.29396@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/5/2020 7:54 PM, Sinan Kaya wrote:
> On 12/5/2020 5:23 PM, Phil Blundell wrote:
>>> I'm open to giving it a better name. Richard pointed me to a file
>>> beginning with lib_foo.class for where this functionality could be
>>> hosted before.
>> I suppose the interesting question here, then, is "what is this class
>> actually for?"  The description above says that it "allows us to easily
>> split a recipe into subpackages" but doesn't say very much about what
>> the consequences of including the class actually are or under what
>> circumstances that's useful.
>>
>> Reading between the lines the idea seems to be that this class is
>> appropriate for recipes that build a collection of utilities each of
>> which is essentially independent and is useful in its own right
>> without any of the others.  Is that right?
> 
> Yes, this is correct.
> 
>>
>>>>> +    d.appendVar("PACKAGES", " " + " ".join(packages))
>>>>> +    d.appendVar("PROVIDES", " " + " ".join(packages))
>>>> It seems a bit strange to be putting the same things in PACKAGES and
>>>> PROVIDES.  Is that actually necessary?
>>> I want to be able to include procps-ps without the entire procps
>>> package. I was not able to do that without the above two lines.
>> What do you mean by "include procps-ps"?  It sounds like you're saying
>> you want to be able to introduce procps-ps to DEPENDS, is that right?
>>
> 
> I want to be able to include a specific tool out of N number of tools
> that a package builds into the image.
> 
>> p.
> 

Is there anything else that i need to do on this changeset to move it
forward?

I have no clue if there has been a build failure somewhere or if I have
addressed all comments.
