Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.9956.1622216274335893376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 08:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3787924000C;
	Fri, 28 May 2021 15:37:51 +0000 (UTC)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20210526145910.3930141-1-ross.burton@arm.com>
 <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
 <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org>
 <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
 <b45cfe4-de37-dacc-b613-a67ff38fb7dd@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <816fc138-c7d2-3303-c153-cfd151aa9d62@bootlin.com>
Date: Fri, 28 May 2021 17:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b45cfe4-de37-dacc-b613-a67ff38fb7dd@crashcourse.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 5/28/21 12:43 PM, Robert P. J. Day wrote:
>   i've actually been pondering this for a while -- the best way to
> keep the variables glossary up to date, and here's a thought.
>
>   if one notices a single variable missing, and one has time and the
> know-how to add that entry to the variables glossary, then submit a
> patch (as i've done recently, all of which i apparently have to
> improve. :-)

Your efforts are much appreciated, and I'm sharing the blame for being a
big slow at processing them.

>
>   on the other hand, if one finds a number of closely-related
> variables that are all missing -- for which it would make little sense
> to add just one or two without adding all the rest -- and one is
> lacking either the time or the expertise to submit an all-encompassing
> patch to add them all, then submit a bugzilla entry for it:
>
> https://bugzilla.yoctoproject.org/describecomponents.cgi?product=Reference
>
> and perhaps the person or people with the know-how can handle it. at
> the very least, we'd have a list of what's missing.
>
>   i might even add a new product category entry just for this:
> "variables glossary". anyway, i think this would be useful just to
> keep track of what's not there, and allow people to cherry-pick what
> they'd like to work on.


This sounds like a good idea.

I asked Michael H. to add one for us, and I'm going to use it very soon!

Thanks again for all your contributions!

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

