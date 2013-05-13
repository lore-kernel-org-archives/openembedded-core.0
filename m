Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Uc0Af-00061b-F4
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:20:41 +0200
Received: by mail-la0-f47.google.com with SMTP id fq12so1292224lab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 14:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=H4aeCDRLd18938maXYlnYlzE8MHkNAhOYUjsNayAjtI=;
	b=p7+wvBeZTQIBKjUzV20qZhYwaoWELbr8KQgSF3LMjNh2Guykib+qwRKxOAzYRDIOqv
	GlkCCUGfaXB22IEPpQjAwDM6ZWjvYoqSzK5yI27VQu8/uzWS/KwBP/9zUS1D3ZHeT6dk
	QygIjeprsmOw4Fv/xlhGghG4OrcJ1J5HH26Vby4XFEnsIJjuixqEXl1qCUk2ra4CZARw
	VuIBKbzR6Rd4AQK7yCYlRtHHg158yC/U+tjoRX6nGhANBD9db/pN9+hsu6rI+/22yWW2
	Ea09+Qt5jXVJZL2WwBuhW2YdHTkoPYGkradIQ/aU8SCiXOz/S2aq0pYf1iB10uX1YNf8
	L45w==
MIME-Version: 1.0
X-Received: by 10.112.20.199 with SMTP id p7mr13723905lbe.71.1368478947251;
	Mon, 13 May 2013 14:02:27 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Mon, 13 May 2013 14:02:27 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131650030.12354@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
Date: Mon, 13 May 2013 17:02:27 -0400
Message-ID: <CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Mon, 13 May 2013 21:20:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 4:51 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Mon, 13 May 2013, Bruce Ashfield wrote:
>
>> That's all you need, here's my output:
>>
>> root@qemumips64:~# uname -a
>> Linux qemumips64 3.8.11-yocto-standard #1 PREEMPT Mon May 13 15:47:58
>> EDT 2013 mips64 GNU/Linux
>>
>> That's built from scratch on Yocto master. So clearly there's
>> something strange going on in the failing configs.
>
>    i attached a screenshot of the last part of the boot which includes
> the call trace, if that's of any interest.

That's the same trace the Trevor saw, and that Khem and I have seen (and fixed)
a few times.

I'm betting everyone is using a different SRCREV for the kernel that I am, since
I've built and booted this multiple times.

Can you dump your board and meta top commits to the thread ?

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


