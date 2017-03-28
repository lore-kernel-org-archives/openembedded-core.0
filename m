Return-Path: <raltherr@google.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D1CFC77B99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 22:37:02 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id x124so10624108wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 15:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PTHAk0M3G2zDGE0N7qeDe8bNmvPtyZaoPFkEuC+S8DM=;
	b=QbEB3Ujwb9rzNbhYzRX2oj6wdCwIEX/6E1A0l6ja6sqiF7RHjjAhsaW8P2LI+/iaWq
	VffoGedao/FzJa2rsSqTzqXZjidlVei55iJVg1/Q+/Q4Do30ps72cFcv6M1tT2Q/lnON
	imAZ3Hot8868/YEAZc61SOe2znR+0U8mpjNvORm9bZ8nCv2J1cyQtTnblIFsk4Iplku6
	VnqdjswIlWSg5sOA3cKQbEFXDIVAOEWtuYGMg6HGDzBu5JZVxG1tewdLaIwaEi17BDCe
	9paPPy5SAmQQVlDXFJK3+HO2S+9ReE01M68Ve7Tmat79o4/dWypnyYxGk4Ec7FaloAgQ
	rrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PTHAk0M3G2zDGE0N7qeDe8bNmvPtyZaoPFkEuC+S8DM=;
	b=lXKtPbBHM1FYM5oV/jOKDaeP/aHWiPYYTCwtMFUm9ChfcnhzpRlD/0uQ9y0kMCEH/m
	JCAK1hcqRjsEJR4VJjcfnTym6cJkT4dL0/hZM8eSbLs0ugy87weVMI7VCIP6ML63LbjO
	naAfSqRYLYPvn3bwhI6PWAInWXc2+ViuSKmCFFtZXRjWhDAIZ2qPaqvvb2ZR3cDGRP7c
	DXfgKoYZKaJjadE/oNb6EvYHL0hGF1ksTaweba5egFZiRyHyv4b+f+BAH5+P5B0lCPvz
	W60kwAJ9aKDf/DG3efyYnL6tWtRIupnKZVNEmASQH/yrWUhkCcOvUIDdTvQydzFL99Pc
	wX+Q==
X-Gm-Message-State: AFeK/H01nuusuqFSVJsXrMDuzdbVy9Jx7CtKSR/mEsS41MOXI1rzzQk8qNe1b2Y5Vc0dVXjkwiLK9s9ZU7DSR0UL
X-Received: by 10.28.63.22 with SMTP id m22mr6132235wma.142.1490740622890;
	Tue, 28 Mar 2017 15:37:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Tue, 28 Mar 2017 15:37:02 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
References: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 28 Mar 2017 15:37:02 -0700
Message-ID: <CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there OE support for building multi-image/component FIT image files?
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
X-List-Received-Date: Tue, 28 Mar 2017 22:37:03 -0000
Content-Type: text/plain; charset=UTF-8

kernel-fitimage.bbclass loops through all the DTBs listed in
KERNEL_DEVICETREE and adds a FIT section for each one.  It looks like
only the first one is put into a config section though.

On Tue, Mar 28, 2017 at 3:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   not sure i even know if i'm asking the right question, but i already
> know that i can build a *basic* FIT image file for (as an example) a
> mpc8315e-rdb target, just goofing around. the .its file contains a
> node for the kernel, and the dtb file, and the corresponding
> configuration node, so everything is fine.
>
>   however, let's say i was building for a beaglebone black, for which,
> when you build the kernel. you get *multiple* dtb files for numerous
> related targets.
>
>   is there OE support for defining .its files that contain multiple
> kernels, and/or multiple dtb files, that automatically generates
> multiple configurations nodes to cover those possibilities?
>
>   i realize you can do all that manually with the "mkimage" command,
> i'm just not sure how far you can push creating FIT image files with
> stock OE support.
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
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

