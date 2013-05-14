Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UcEY6-0000uR-FF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 14:41:46 +0200
Received: by mail-la0-f41.google.com with SMTP id lx15so452730lab.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=E8kc5u+nrXldmeLntx5NKdhCuxVt2SniLPExLx+XfqA=;
	b=A7i45OFli3x9lTgngfADKK2QubehYIc2hg7YLzmzU/fJyu0zBtFkbtFqFx0ZtSDDVV
	3Ayr+h/fxhgQiZU8LGx3wN3iXKH8H3aBkV/6/1glKPF5bCBYxZxk4Lx6L5dyDCHw+XOr
	9vvM7J15qGln602HTPdpBXDxFfYKFenvhxr7n99eB/xAFBCkGzvk4T27A+DEPWSOkxCQ
	Pe+dU0vVju8ZMG/p3Pm0UHevMxn41WbPcaS795Y8F+y52D55ahjvvJ+4Ni2wHsxvwGIg
	spLie4sKkNFedBVFGQXIq2r79ND/FEdkLmsCC4WCT2RzYyP9ScHvym+XjJVmq+3lZSIr
	sk+Q==
MIME-Version: 1.0
X-Received: by 10.112.159.136 with SMTP id xc8mr14925022lbb.57.1368534214492; 
	Tue, 14 May 2013 05:23:34 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Tue, 14 May 2013 05:23:34 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305140423590.26605@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
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
Date: Tue, 14 May 2013 08:23:34 -0400
Message-ID: <CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 May 2013 12:41:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Mon, 13 May 2013, Khem Raj wrote:
>
>> can you try this
>>
>> add
>>
>> SRCREV_machine_qemumips64 = "bbefde394205a1b317eae31942bfc13afce0b0ac"
>>
>> to linux-yocto_3.8.bb
>>
>> and rebuild the kernel and see if that boots
>
>   ok, that gives me a successful boot (tried it twice, success both
> times) but i'm now at a boot prompt:
>
>   qemumips64 login:
>
> that's not accepting any keyboard input.  tried a couple more times,
> same result -- boot to login prompt, but no keyboard input. thoughts?

I'm going to switch to an oe-core only, clean build today. The commit that Khem
referenced was my change where we prototyped this work .. and I fixed the boot.
But I'm still able to boot here, so I was unaware that my -stable
updates managed
to break my own fix :)

Stay tuned, but for now, I'd suggest waiting to hear back from me.
I'll bisect and
fix it again if it (re)broke.

Bruce

>
> rday
>
> p.s.  i can ping the VM (192.168.7.2) but can't ssh into it, FWIW.
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


