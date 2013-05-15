Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ucbxu-0005Gk-Hd
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 15:42:13 +0200
Received: by mail-lb0-f177.google.com with SMTP id 13so1854052lba.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=hx8NGezm/mn7SdvW1gHeZQ+h+gqgGzNzB2rRz+nXQyc=;
	b=Gzank5ib7Sp6PHtSYz1v4VR9rGoV5NYDXr2az3QiMJVgbhvorKdxpKV/O1bhI38+rA
	Rl557lz6TquPd7z3SYjpma1yX1wxzzNCiETnRicvEPTmlvhePEGcTivLYB8JdpN1GzHK
	3F00ZGXt4R1H+LwnvK2PvDUHIPBieh5Ipgrpx83rdKT6H4HOa9bbdHS+IH3I/tuolnVJ
	NA4MscARkv7Hu8jHbe0I0tKFkmcQZvFPUQiDoqI+SBp8E/faRv4hs6k2W96XAWQnOlQc
	WdHYZSJYHAM6wEF6kGN+lnFcjsapr45UmI03CvAEVXuzsdguFbBvnvwTf4DgDWryrbJy
	K6hQ==
MIME-Version: 1.0
X-Received: by 10.112.149.35 with SMTP id tx3mr17559360lbb.95.1368624225814;
	Wed, 15 May 2013 06:23:45 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Wed, 15 May 2013 06:23:45 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305140824360.23009@oneiric>
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
Date: Wed, 15 May 2013 09:23:45 -0400
Message-ID: <CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 May 2013 13:42:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 8:25 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Tue, 14 May 2013, Bruce Ashfield wrote:
>
>> On Tue, May 14, 2013 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> > On Mon, 13 May 2013, Khem Raj wrote:
>> >
>> >> can you try this
>> >>
>> >> add
>> >>
>> >> SRCREV_machine_qemumips64 = "bbefde394205a1b317eae31942bfc13afce0b0ac"
>> >>
>> >> to linux-yocto_3.8.bb
>> >>
>> >> and rebuild the kernel and see if that boots
>> >
>> >   ok, that gives me a successful boot (tried it twice, success both
>> > times) but i'm now at a boot prompt:
>> >
>> >   qemumips64 login:
>> >
>> > that's not accepting any keyboard input.  tried a couple more times,
>> > same result -- boot to login prompt, but no keyboard input. thoughts?
>>
>> I'm going to switch to an oe-core only, clean build today. The
>> commit that Khem referenced was my change where we prototyped this
>> work .. and I fixed the boot. But I'm still able to boot here, so I
>> was unaware that my -stable updates managed to break my own fix :)
>>
>> Stay tuned, but for now, I'd suggest waiting to hear back from me...
>
>   i will be sitting here, waiting on tenterhooks for someone to
> explain to me what "tenterhooks" are.

:) and the "good" news, is that I finally managed to get a boot to fail
locally. I'm not bisecting and debugging the problem. I've fixed this
before, so I don't expect it will take too long.

I see that Saul picked up the support and plumbing for this, so if that
merges, I'll send incremental updates to the SRCREVs. I'll ignore
any high priority bugzilla entries on principle, since this is still baking
and we just want to get the plumbing in place :)

Cheers,

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


