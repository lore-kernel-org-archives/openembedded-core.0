Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0A51460079
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 21:26:55 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id q12-v6so6519943qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M+yln117zgzeBfLCf6eqpFFF2pdaQXbxoVyy8zsF6dw=;
	b=QxlFRw1DI5/qq3CcqsyGRgvL5nzDN5FA7P8J+26kYu/2uqgVM0rcO7+xt8QgqXMOH4
	nxlYeNHqETdyguz9k0R/8xZVRg2WTvmAZ0UYdj6aTsivoKqRZdbEXaiVsuAZXcN1mUrJ
	P4PZTp83103WN0FT9EgFDKIJpqdjuKA338HT51eLXRLaStSPWNoNWyzIxFaR1crNkiG0
	I6BH+BaovuEdOLsRr36lwgF/ctx/Fvj8xS+1uQx21+sKM6XvyOvDPx5Ro4oDFilQ+Zlg
	Q5trjtn+ryfVPMwCT3nEUb0fqDegg6ZysSHFfDAVqdqbZtha6T4Bgssf9JeogrKxchyz
	gqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M+yln117zgzeBfLCf6eqpFFF2pdaQXbxoVyy8zsF6dw=;
	b=BF2qlA039yXqgUvx4EnLbIKzx3fPlnsaFqJYTolhKxHzYZF30mF8vxAx1eHNS7MsPK
	a7ap+EGLIVmZ1sfwNGwwPWPRirYR+b83yoLPkO+Vwk7F4QbhiECeAbQe+b3uDBXYnPzn
	NI5VM10w4kbQKOeY48R1ToScautBpgvC0/MDKqLneVLOQ+Mmxty1DLeEJwsHcN4L0Bjf
	14yQyWCf6lZQOSjUdIntPXV7nQqc7JWpRgKkUDrjNMrb8JgZqg6ffF9Psp4Tvy401SrU
	yGxfJCdPVBNPSCDvH87C36Aa7LAPPUM8jrscrzkbsIjX2zZL7mwWI9Ukb/UWtJtbeqjB
	MdWQ==
X-Gm-Message-State: AOUpUlFrfHrX4WqIjsdocOXEdNxjNPE4Y9mL56Lx1hFZIcDLgELq/BIX
	1JAyRhWjdPTdsKdSoDjkoaxF1m4zLreHCKsonqw=
X-Google-Smtp-Source: AAOMgpdJMo5rwbLbRRY2V66IhZaNRFph4JyVTkciQ/Fjc1jaGGAw1s0bv2F7X5pzBUvV7tpFDuJuxeVaQmhG4b0NJ5w=
X-Received: by 2002:a0c:d2f3:: with SMTP id
	x48-v6mr7325728qvh.214.1532726816597; 
	Fri, 27 Jul 2018 14:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
	<CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
	<084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
In-Reply-To: <084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 14:26:30 -0700
Message-ID: <CAMKF1srwY--+D5fyj-TF-PYjbkvBTTjCPv=mVtZMim6vYHy8pg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Fri, 27 Jul 2018 21:26:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 27, 2018 at 1:49 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 24 juli 2018 16:12
> > To: ChenQi <Qi.Chen@windriver.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] defaultsetup.conf: Enable security
> > flags+pie by default
> >
> > On Tue, Jul 24, 2018 at 12:30 AM ChenQi <Qi.Chen@windriver.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > The comments in security-flags.inc also needs to be modified to
> > remove
> > > 'poky-lsb' info.
> > >
> > > I'd suggest we still put it into distro conf file (poky.conf) instead
> > of
> > > defaultsetup.conf, because defaultsetup.conf is included by
> > > bitbake.conf. I think things in defaultsetup.conf should be necessary
> > > default values to build things out. I don't think security flags is
> > > necessary to build things out.
> >
> > this is the default setup, even non-poky users will get consistent
> > experience.
>
> I have to agree with Chen here. I think requiring security_flags.inc from
> defaultsetup.conf is the wrong thing to do. We use security_flags.inc in
> our setup, and I know how much trouble it has brought. To me, using it
> should be a distro decision, not something that is enforced by the use
> of bitbake.

Thats fine, I can move this to poky distro settings, using it by
default would have
been in sync for all since reference distro is using it would be
easier for others when
submitting patches, as a phase 2 I was also thinking of defaulting to
hardeing in the toolchain itself
and remove this file completely that would have made it much better,
then folks who dont want hardeing could just disable
it in toolchain. but I am fine to leave it a distro decision for now.

>
> > > Also, I got a question when I just looked at this file.
> > > Do you think we should adjust CFLAGS and LDFALGS in security_flags.inc
> > > instead of the current TARGET_CC_ARCH and TARGET_LDFLAGS?
> >
> > in many cases packages do not honor CFLAGS/LDFLAGS say during configure
> >
> > > We are naming
> > > variables to SECURITY_CFLAGS and SECURITY_LDFLAGS, it seems that they
> > > belong to CFLAGS and LDFLAGS naturally. But I'm not sure about it.
> > >
> > yes they do, but this makes it easy to override the setting for
> > packages where these options are needed to be overridden or modified.
>
> Actually, with the changes introduced in Pyro, SECURITY_CFLAGS became a
> mess. Before Pyro, you either set SECURITY_CFLAGS to
> "${SECURITY_NO_PIE_CFLAGS}" (to disable the use of -fpie), or you set it
> to the empty string (to disable all security options). With Pyro and later,
> you instead have to set SECURITY_CFLAGS to "${SECURITY_NO_PIE_CFLAGS}
> ${SECURITY_NOPIE_CFLAGS}" to make sure -fpie is disabled, or set it to
> "${SECURITY_NOPIE_CFLAGS}" to disable everything. Alternatively you can
> set SECURITY_PIE_CFLAGS to "${SECURITY_NOPIE_CFLAGS}" to only disable
> -fpie.
>
> I have considered to suggest changing the definition of
> SECURITY_NOPIE_CFLAGS to:
>
> SECURITY_NOPIE_CFLAGS ?= "${@'-no-pie -fno-PIE' if '${GCCPIE}' else ''}"
>
> and then change SECURITY_NO_PIE_CFLAGS to:
>
> SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${SECURITY_NOPIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>
> That would better have matched the situation before Pyro, in that one yet
> again would set SECURITY_CFLAGS to "${SECURITY_NO_PIE_CFLAGS}" to disable
> -fpie. Unfortunately one would still have to set SECURITY_CFLAGS to
> "${SECURITY_NOPIE_CFLAGS}" to disable everything.
>
> > > Best Regards,
> > > Chen Qi
> > >
> > >
> > > On 07/24/2018 03:09 AM, Khem Raj wrote:
> > > > This has been an opt-in for so long, some distributions e.g.
> > > > poky-lsb uses it by default however, since most of linux
> > > > distros have started to default to these settings for security
> > > > enhancements, time has come for OE to make it default too
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >   meta/conf/distro/defaultsetup.conf | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/conf/distro/defaultsetup.conf
> > b/meta/conf/distro/defaultsetup.conf
> > > > index ca2f9178d2..352e279596 100644
> > > > --- a/meta/conf/distro/defaultsetup.conf
> > > > +++ b/meta/conf/distro/defaultsetup.conf
> > > > @@ -1,6 +1,7 @@
> > > >   include conf/distro/include/default-providers.inc
> > > >   include conf/distro/include/default-versions.inc
> > > >   include conf/distro/include/default-distrovars.inc
> > > > +require conf/distro/include/security_flags.inc
> > > >   include conf/distro/include/world-broken.inc
> > > >
> > > >   TCMODE ?= "default"
>
> //Peter
>

