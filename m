Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 500B772F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 15:56:36 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id u75so100088867qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+OdEwzk6SwPjF/wNPqAWAxjz4AlaW+eDP5hrHNgRRsM=;
	b=Dik5iPUKeumd4LrgfCREoHecWki9Ydsnso44/wvXfr5F/kvggFSq02A1D4Fru6rTKh
	tn+K8cCTQ6BMA8bm+i03b1HoMwa9Qp2XbZIQJD4PxFxnM44+A3ADTm1TcjxfTl+wjtB6
	XrJmzUgSla6QCo1iqZK/D9T3PPYgKpjAesfCrpjdvaTNajQOckbFfCx+siur2qTZiK2k
	kkMXcS1tlN0AWIXrCjKQbCrOhz1YXjLhjExr4YPE1VCIZF1OaH2owdXGvUE5jC+gzXna
	acBo5Z7N4DXCHcKuxiopA7ufSHKMDz0ucYu8xdsgVD9QFoNbur5QrgXWRQ/a4Ciz12EN
	bgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+OdEwzk6SwPjF/wNPqAWAxjz4AlaW+eDP5hrHNgRRsM=;
	b=JLvwVBwYpyuH3Lc43NXkh22KXe5tBs23EhYeD2WDMuqpCiDLIldM5S7KSDc+ezWvvg
	T5tk/ACGddc17EoZZNbIlFcvRuiefrj0u8Tdv0PFA1l3tRXMAsitfOZzL3phCJPTzw8+
	9M/chLfX8x8dZ4z3pFVcZLgC7BMnEJJLVA4aqxuzUe1rLh+kdHLwrIcaVSob09MX1Ane
	TGWa/kJso7w0EoHUk7+oRSTgUuG0w2bLOYrVX9r+33NgbfSqwpNDRHrkRaYQODlhwPCF
	jSJKHKlUCYKpu+YFhBqj+yAmYptIlT/qdpwWoo1Jp0V4CSuMEHpGiyZQsZi5t1QOLo+v
	+1ng==
X-Gm-Message-State: AODbwcCAcKl8d4+8Ir4QHwZRJzdaeOv4DUO5MuZfT4SWdnKBEKZZ8lv4
	j8BiDMPu2kO7AZx8AGDQQsudB6egeg==
X-Received: by 10.80.169.193 with SMTP id n59mr5319548edc.127.1494863797673;
	Mon, 15 May 2017 08:56:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 15 May 2017 08:56:07 -0700 (PDT)
In-Reply-To: <CAHiDW_Hzk8mXfRtJFf6gdeQcSCtXp6G-n0ngbB-Dj4XdDPGNyQ@mail.gmail.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
	<63467164-76aa-2aa7-efab-ec82251b7aaf@linux.intel.com>
	<CAHiDW_Hzk8mXfRtJFf6gdeQcSCtXp6G-n0ngbB-Dj4XdDPGNyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 08:56:07 -0700
Message-ID: <CAMKF1sp7WMEAaEhdw92PbS+4QcxU4V4gv+7Jv60NqiD0BBLJfA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 May 2017 15:56:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 15, 2017 at 5:36 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 11 May 2017 at 10:53, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> On 05/09/2017 12:24 PM, Burton, Ross wrote:
>>>
>>> The development of Wayland does make the long-term prospect of Sato
>>> interesting: do we port Sato to Wayland too, or keep the Wayland images
>>> using the standard Weston demo shell?
>>
>>
>> There is a third option: find a functional, pretty, lightweight wayland
>> shell, and provide that. I think the prime candidate for that at the moment
>> is Maynard, but it has its own issues, mainly that upstream isn't really
>> developing it anymore. Jussi is OOO this week, maybe he can add his 2c a bit
>> later.
>>
>> https://github.com/raspberrypi/maynard/wiki
>
>
> You pretty much said my 2c: Maynard wouldn't need that much development and
> maintenance to be useful as a minimal DE that scales to different devices.
> Unfortunately it's not getting the love and care it needs. Writing wayland
> compositors/desktops seems to be common pastime so I'm a little sad someone
> hasn't picked up Maynard as their hobby project.
>
> Even if Maynard was maintained it would fill a similar niche as Sato now
> does for X: not something we'd especially expect people to ship on products.

some users of OE make SBCs for them having a good light weight DE is
desired, thats where XFCE and MATE LXDE LXQT etc fill in since they
are light enough
and well used in desktop world too, so you get the right fit, other users of OE
who do graphics and video dont really use DEs, so they are fine with
GL context but there is a shift towards wayland and embedded
compositors around wayland since weston is quite generic e.g. see

https://github.com/rdkcmf/westeros

I am pretty sure one of above DEs will pick wayland at some point but
until then we have weston

