Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Uc58H-000150-T9
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:38:30 +0200
Received: by mail-la0-f53.google.com with SMTP id eo20so3933lab.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 19:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=TdkpsB0+Xl82RzMUMQMZdFftui0zqRKYjuOvG7NPfiA=;
	b=sAxJgtuqEWkOG8/+cBVazMkQwF2oJO+yAgt0/cGUGSZcrfNTnUTCO5XRhzgfeTRTjG
	9pBa481hURjpow/vERcTjEw+7+Wy8gVoNNndEV2yuwEX2qgSiS76NVNOqjAAvBuqZ9CO
	31RRkZGdXGwDLpxJST+b7vR/LfrTyV+9AWlgcq7JJXpxMtWNzSfLxmazu/WdJ1keP8cr
	nspGEv9EoLQodRObuAo2c2RKBt2L/oR22eaTpLy3wM26WpsFDvWSV5brTmwTSwpIXSxr
	cjJrx7CwNv3BEDTesWJfJri3E+Pj8XnTZ1+VMshx+6Gh7DmnHHVKrK4oO1rRRhNOPcXT
	MWvw==
MIME-Version: 1.0
X-Received: by 10.152.121.105 with SMTP id lj9mr14500299lab.6.1368498019067;
	Mon, 13 May 2013 19:20:19 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Mon, 13 May 2013 19:20:18 -0700 (PDT)
In-Reply-To: <CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
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
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
Date: Mon, 13 May 2013 22:20:18 -0400
Message-ID: <CADkTA4NtEvRk_nTG528TAxPhdHZt1ob0NQBas85Z3oz2PhCi6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
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
X-List-Received-Date: Tue, 14 May 2013 02:38:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 10:18 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Mon, May 13, 2013 at 10:03 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, May 13, 2013 at 10:01 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>> By adding:
>>>
>>>     PREFERRED_VERSION_linux-yocto := "3.8%"
>>
>> Yep. This is what I was about to recommend, but did you apply Khem's patches, or
>> use his contrib branch ?
>
> His contrib branch:
>
> Build Configuration:
> BB_VERSION        = "1.19.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "openSUSE-project-12.3"
> TARGET_SYS        = "mips64-poky-linux"
> MACHINE           = "qemumips64"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3+snapshot-20130514"
> TUNE_FEATURES     = "n64 bigendian fpu-hard"
> TARGET_FPU        = ""
> meta-yocto        = "master:a9f5bf0ed398bf9cb861feaa8b6fefd8645b1d09"
> meta              = "kraj/qemumips64:b0592ab08273e17cb1511384ad189281f88c8b03"
>
>
> Are there patches to apply too?

The four patch series that you just replied to :) That's all you need on top of
oe-core master.

Bruce



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


