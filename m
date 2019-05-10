Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC687D743
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 12:18:31 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id q132so8960575itc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 05:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dbWKEP7+6qHyaievPucbelbmHcxGy27+tiXRAPSizHk=;
	b=veUmmg/YKy7531em+TN5U5rZU+BenR2ec/mmF3m8/gexrKlw8fLQ4SyWlP+NKklTfK
	DtnRmj4+JUoxRUbUHuSUuYQd+VY1IVG6UDGsBCA/EFTxvlD0XuD9TCiTP9GnLxFefLGd
	LScQDhVjG1JmtUs1bWKsSQcFX1i/hHrT95ah/Kt1eACUeoCjK/EThjL0DS6mth0ecVy6
	i0Sn4/XkthvnXtfhdOLZ6bICycBDnk4WFCkQOMh/uSmlC58cNFQA+l78fLsAlEPO6SZ6
	JuWAtR9LwmMHwnNGPi5OFMKQqi+lrPnP3S/j9GZ4g3GQTuwx3EvY+IVNSBjFyrzvraWY
	124Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dbWKEP7+6qHyaievPucbelbmHcxGy27+tiXRAPSizHk=;
	b=VYhn8DDjeT5HWqQGR9PAOyIE136gpzgf+kIvkm7BTegk0ri35LnOKu2mKQdKO/RL1m
	vFN5HGyuWjXgAm6auCH4ssmzjbsEMG8NJMYWTOoXkG4hWGEohSq3iWaACbSl7ke7Yk0V
	yLZQD7vXNQJBUJrAWiwC4wiJ6ZSo7TVqjxMxMheM8i7XSIpzeSvzNH+VSYUH+S73OJjE
	9s3F5We/s30LQ+fhervgbHug+A1jZIBrr01d8ZFTgJ9eoy9vU3XLWiYWk+Mwp9GEbQLz
	UaZ4nlRJ0iUIRSSJnSho/KnICZodZUoukZSBWUZkiOJ6VCs7ksh/sVPWhBkUOzDO0QTX
	iB7Q==
X-Gm-Message-State: APjAAAW0YhtAxQKdT7g98UIpFPGJmGBlXzBF1KaymEsbIVsBH19gzXu3
	8M5XNYDM81GN1ba6uexUXcRnmr41hiM/dsTTfgImdQ==
X-Google-Smtp-Source: APXvYqxWSI6RL9knkT/cnjzySMRSatdl+i3eLSMPoM6Q5Q1f6wlPq3T2U/gxJNWn+0OLU9OKpV5PcoSs7rMIZ8In7W4=
X-Received: by 2002:a24:4145:: with SMTP id x66mr7707741ita.130.1557490712453; 
	Fri, 10 May 2019 05:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
	<20190508140708.GC25917@localhost> <20190508142232.GC3459@hiutale>
	<24616adf-6d73-ec86-e506-85f860f43731@prevas.dk>
In-Reply-To: <24616adf-6d73-ec86-e506-85f860f43731@prevas.dk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 May 2019 13:18:21 +0100
Message-ID: <CAJTo0LZLLOQGunyBmUeYiZs=qgUTaptnQcW4NfrzvoYjYkH_OQ@mail.gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"bunk@stusta.de" <bunk@stusta.de>
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Fri, 10 May 2019 12:18:31 -0000
Content-Type: text/plain; charset="UTF-8"

I'm very dubious of the need to make this a dependency, as the
hardware RNG should be used.  Note that there's been a slew of fixes
to the kernel to enable this with modern stacks, for example:

https://github.com/torvalds/linux/commit/62f95ae805fa9e1e84d47d3219adddd97b2654b7

Maybe the IMX driver needs the same patch?

Ross

On Thu, 9 May 2019 at 09:46, Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 08/05/2019 16.22, Mikko.Rapeli@bmw.de wrote:
> > On Wed, May 08, 2019 at 05:07:08PM +0300, Adrian Bunk wrote:
> >> On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:
> >>> Since openssl 1.1.1 and openssh which uses it, sshd
> >>> startup is delayed. The delays range from few seconds
> >>> to minutes and even to hours. The delays are visible
> >>> in host keys generation and when sshd process is started
> >>> in response to incoming TCP connection but is failing
> >>> to provide SSH version string and clients or tests time out.
> >>>
> >>> In all cases traces show that sshd is waiting for getentropy()
> >>> system call to return from Linux kernel, which returns only
> >>> after kernel side random number pool is initialized. The pool
> >>> is initialized via various entropy source which may be
> >>> missing on embedded development boards or via rngd from
> >>> rng-tools package from userspace. HW random number generation
> >>> and kernel support help but rngd is till needed to feed that data
> >>> back to the Linux kernel.
> >>>
> >>> Example from an NXP imx8 board shows that kernel random number pool
> >>> initialization can take over 400 seconds without rngd,
> >>> and with rngd it is initialized at around 4 seconds after boot.
> >>> The completion of initialization is visible in kernel dmesg with line
> >>> "random: crng init done".
> >>> ...
> >>> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> >>> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> >>> @@ -148,6 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
> >>>
> >>>  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> >>>  RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> >>> +RDEPENDS_${PN}-sshd += "rng-tools"
> >>> ...
> >>
> >> This should only be an RRECOMMENDS so that people can opt out of it.
> >>
> >> E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same
> >> problem without using rng-tools on some platforms.
> >
> > I think this is a stronger dependency than just RRECOMMENDS. We build
> > images and disable recommends but we care that sshd starts as fast as in
> > sumo and earlier yocto releases for testing etc purposes.
>
> But why should boards without a hwrng be forced to spend disk space and
> run-time resources on a daemon which they don't benefit from at all?
>
> I don't think RANDOM_TRUST_CPU works, though. That's just for stuff like
> rdrand(), i.e. instructions built into the CPU - not for some other
> on-chip hwrng. Whether those are used for seeding early on (i.e.,
> without rngd doing its thing) depends on the ->quality parameter set by
> the individual hwrng drivers. Very few set one, so they get assigned the
> default_quality, which is a module parameter that defaults to 0.
>
> IOW, I think (but I haven't got around to testing this) one should set
> rng_core.default_quality=512 (or something) on the kernel command line
> to make the kernel start the hwrng_fill thread that will seed the
> entropy pool from the hwrng. At least if I'm reading
> drivers/char/hw_random/core.c correctly.
>
> Rasmus
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

