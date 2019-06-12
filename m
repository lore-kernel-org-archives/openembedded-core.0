Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id D082F7E6EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:50:26 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y13so12522570lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HNvWw7PxhsXUsV7n/QNSG4wqZVKuvDb/pr/7PBWq/uU=;
	b=doJjNbfj3x/KPjSAhU82XCvtHqW4qlb6vlHw//iKgOt2faaPMXiD44YUo9/xrid41P
	TlfJ8/qS4On5iKfXPgcV0xyAnX2QtV/5j7bg0eG4DiLwuqcxLbQjLSuTLFxBXEVbbwyY
	ZbELv548LFJXyl5QSxgYqWEs67Za+PXY34nV380+U1Jxh84MZHYUKviPaFLP9pF0LfgU
	lirTFz9+VweGJA3bPO9qzS01RUhQpLmHQSvmO0LtDtyDVATDTpcojdp7+FjzRp/o2eSv
	uGwTC7qj0LZInJDxqNim9Dj/Gw5lsnOWz2dbDazFThezO+sTai50zeQ5ApPXhmKVg3ou
	U5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HNvWw7PxhsXUsV7n/QNSG4wqZVKuvDb/pr/7PBWq/uU=;
	b=c/VIkqqa57cEHcmplkS4Hwx09lyHtDj6OoQajGkvW+U/mMMBfSO+stOiZLPZag15/b
	SVFGxXaV+bDmmoMqBlV3niIsl+PkEadw6HSeyfvAed4K535fr9RjMTpU2SZ+HNhk4AF7
	BzFet0zxXWfpkEv534ENwH8ZCMTWeW0lyM+xwyd2STveukkJjMbIQZZ3+YNQb0Iayzh7
	+kuA3EpM1wI3ePylS2aiol/Ry+ZgqKD2psmBB59PGWCKRmeJ1zZFhOgPJ0E7IrprAACf
	awCGoIBg1w8krkoq6oYYMUK2A581ZiEL5dNZHrz6Ua6Hpoqxl6V7ezuVHghd5DZKeLJ2
	REpQ==
X-Gm-Message-State: APjAAAXbMRb80qGiThP9BvHhlbbwUhHzNFmbH1MuBMYu+tuyMP1rmuMU
	Mcn3POBGNPNhapMZUz7kF+k992HmpxmDQQOXVdI=
X-Google-Smtp-Source: APXvYqyG3glk6UUppHdE8bptYBStB2KfVSCWQG1ulnHPaGvBGlb9xFzFsaW4SiqMBGRIeecJVhVxI6KEPWvFUbw1Rbo=
X-Received: by 2002:ac2:5b0c:: with SMTP id v12mr28523055lfn.184.1560354627165;
	Wed, 12 Jun 2019 08:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
	<fddad43f3c2052f390bddeb16fce29b30999b5d1.camel@linuxfoundation.org>
In-Reply-To: <fddad43f3c2052f390bddeb16fce29b30999b5d1.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Jun 2019 11:50:16 -0400
Message-ID: <CADkTA4MM57OAdFO_oeJJdTrqf6uTU3EsEeesqKHYPED1y9oTZA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 15:50:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 12, 2019 at 8:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-06-12 at 19:12 +0800, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > The git based recipe is for those who want to build lttng-modules with bleeding
> > edge kernel, to avoid regularly backporting patches from upstream.
> >
> > Note that PREFERRED_VERSION needs to be set to select the git recipe instead of
> > the tar ball one.
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> > v2: Correct a typo in SOB in 0001
> > v3: Use devupstream to make it more clean and clear
> >
> >  meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > index 70a6843..dfd166a 100644
> > --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > @@ -11,7 +11,6 @@ inherit module
> >
> >  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
> >
> > -#https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
> >  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> >             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > @@ -34,3 +33,13 @@ python do_package_prepend() {
> >          bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
> >  }
> >
> > +BBCLASSEXTEND = "devupstream:target"
> > +LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
> > +DEFAULT_PREFERENCE_class-devupstream = "-1"
> > +SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=master \
> > +           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> > +           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > +           "
> > +SRCREV_class-devupstream = "${AUTOREV}"
> > +PV_class-devupstream = "2.11.0-rc+git${SRCPV}"
> > +S_class-devupstream = "${WORKDIR}/git"
>
> OE-Core can't access the network by default so this will need to be a
> specific SRCREV which you can set to AUTOREV in local config if that
> makes sense.

Agreed. I was going to comment on the AUTOREV,  and I see that
everyone beat me to it.

The _git recipe does *not* need to be AUTOREV (unless as you say,
someone wants to do that locally), it just has to be branch and SRCREV
based, so we can easily bump it forward to an intermediate point that
makes sense while working with new kernels.

Bruce

>
> I've sent a separate email to openembedded-architecture about a better
> syntax for some of this but that isn't anything wrong with this patch,
> more just the way devupstream works.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

