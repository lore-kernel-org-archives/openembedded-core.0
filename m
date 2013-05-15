Received: from mail-lb0-f178.google.com ([209.85.217.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ucfiu-0001KY-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:42:50 +0200
Received: by mail-lb0-f178.google.com with SMTP id w10so666719lbi.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=yXb4pTUPNyi2Ok3v0PtmY5aWqGgloWVfwG4YKBLA3RY=;
	b=Ijm0I4uTrmTwLbakVCcUwU5HUdrRAY7kWutqVUpa1DJY53skcXIEtmR8lQQpCSoVDd
	BPbsIR3f8vGtN0TCZIkLYr2S+sgjSKpDXW43KWnLfjZkIK8INCKN30uD6XunapwqBivL
	0TdCVhxq+/LgSFRaKAgz6o9cnMH8DpNfB1w6KyDH2ZevX2JZ8vhnPCOr2kLB+c7P9OtA
	7UCEE1WhFh1rAAjLz8eB/sq4Y9TkgjYd8KntqnZOmNNkcufdeI005VBJc7pW0dYF5405
	wEBg70syo8Q4e9SlAT83otX05G4D4BnFgzt0mpRZD28YTJH6Ja9CSYz8gy87Kh7ELz8U
	wtXg==
MIME-Version: 1.0
X-Received: by 10.112.159.10 with SMTP id wy10mr73098lbb.95.1368638670856;
	Wed, 15 May 2013 10:24:30 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Wed, 15 May 2013 10:24:30 -0700 (PDT)
In-Reply-To: <CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
Date: Wed, 15 May 2013 13:24:30 -0400
Message-ID: <CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 May 2013 17:42:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 1:22 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> What really confuses me about the attempts I was making is that in
> my local.conf file I have explicitly asked for kernel version 3.8.11:
>
>     PREFERRED_VERSION_linux-yocto := "3.8.11%"
>
> When I watch the build messages fly by I see that linux-yocto_3.8.11
> is being built.
>
> In my work directory there is a directory called:
>
>
> tmp/work/qemumips64-poky-linux/linux-yocto/3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_bbefde394205a1b317eae31942bfc13afce0b0ac-r4.1/
>
> but when I got into the
>
>
> tmp/work/qemumips64-poky-linux/linux-yocto/3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_bbefde394205a1b317eae31942bfc13afce0b0ac-r4.1/linux
>
> directory and have a look at the Makefile, I see:
>
>      VERSION = 3
>      PATCHLEVEL = 8
>      SUBLEVEL = 4
>      EXTRAVERSION =
>      NAME = Unicycling Gorilla
>
> and when I boot the image the kernel banner says:
>
>     Linux version 3.8.4-yocto-standard (trevor@zzz) (gcc version 4.7.2 (GCC)
> ) #1 PREEMPT Tue May 14 11:10:07 EDT 2013
>
> Can anyone explain the discrepancy?

You set the SRCREV that Khem sent. That was my 3.8.4. commit. The version
number in the directories is coming coming from the PV of the package, which you
didn't tweak.

Bruce


--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


