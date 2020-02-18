Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id E39B061324
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 23:36:39 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 1so8172574uao.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 15:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d2RigUOgSKxDQsRnz9zOR5+W1OmZk8Z4573JZnQ1vgs=;
	b=DMcHnOcMIjHfPpiwnT4t0q7iRrj430vmO7rlYZruPbOYYIMRwtPN8DRPjhTgIhHD0u
	diwT5UR936H0U8cQDPkZu33JIDe9Vq1EyReBIza1e7nVN7rgC+i9jGepZS7pJT7+rb73
	RY7+NC393lDp2KWU8SAS9MIIJ4YQ0bNczA4Ishsyk49WC/RiSjc+kYzU2wQxYbs2n5LU
	RbiD+s54E7hS8q8xTBgwec2tNDK39VHli7yANCMqpQTH2u8QMKaNkZM7/QreZ5cNcfV+
	PBbIHhQVKTgsK4ujeGGQ9v6vV+svZveccsp46zJJKeYFqe6kh5kb/zXqxw7n02X0v0wz
	k81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d2RigUOgSKxDQsRnz9zOR5+W1OmZk8Z4573JZnQ1vgs=;
	b=LY22QzGoKPcZ4/falartriwJpa8KHxeojgSHCad8yMxaNf+XA1vGvjl+eAE0bNA7KF
	G51hxKXkS2FRe5KKd8v2JZwugy7JYUp3BEgGsXf8P8DQMMR2fz3zImHhRJCm5sCANOV+
	Rh6aeCKETkhQDmlliRMLWlH4IoaFLbF8LlzBgmn3OZtYLLD8VUducdMDfVG85toS6TMB
	/s1Vhd64nzHB/1FGoEpRJ/0GpMAVXvNifzgIGfE4vspwg1rKBwsNqmig6rKcP0VK4RsD
	PAFw/C9pfz5zsr73nTvmxgRk+hYVr353prEWOj247EvEqYw5V6DwTmgcIF3EJ0WHLGcJ
	smgQ==
X-Gm-Message-State: APjAAAVtknZ+o9GshGkznjIJUhA6E04P/Hn+NsDCNI8ul8VY0sPMzDkG
	i2n/rIVykrFER1jUHYnBhJhwyndeYWeK/eFFGCA=
X-Google-Smtp-Source: APXvYqyZSsjuoUWqxvNuT3gEBbEWG+Y7uyj2IWtJsWNJMhYCrDNL11p5AfXS26yUiHcttBwEHWBZx9k4Dm1jU2BsS8o=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr11814853uae.106.1582069000587;
	Tue, 18 Feb 2020 15:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20200218224455.14551-1-scott.branden@broadcom.com>
	<20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
In-Reply-To: <20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 18 Feb 2020 15:36:28 -0800
Message-ID: <CAJ86T=XXS=3Mzj3sc_M3UjCar6-+EHR8ZkkA6LJm+VrLsdsXYw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Tue, 18 Feb 2020 23:36:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 3:19 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of Scott Branden via
> > Openembedded-core
> > Sent: den 18 februari 2020 23:45
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink support to
> > iproute2
> >
> > Add devlink support to iproute2 recipe.
> >
> > Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> > ---
> >  meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> > b/meta/recipes-connectivity/iproute2/iproute2.inc
> > index fc31b8444e..98793af88e 100644
> > --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> > +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> > @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
> >
> >  CLEANBROKEN = "1"
> >
> > -PACKAGECONFIG ??= "tipc elf"
> > +PACKAGECONFIG ??= "tipc elf devlink"
> >  PACKAGECONFIG[tipc] = ",,libmnl,"
> >  PACKAGECONFIG[elf] = ",,elfutils,"
> > +PACKAGECONFIG[devlink] = ",,libmnl,"
> >
> >  EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
> > +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlink', '', d)}                                               \
> >                  ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>
> You can simplify the above to:
>
> EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>                 ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>
> but I also recommend to reformat it to make it more readable:
>
> EXTRA_OEMAKE = "\
>     CC='${CC}' \
>     KERNEL_INCLUDE=${STAGING_INCDIR} \
>     DOCDIR=${docdir}/iproute2 \
>     SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
>     SBINDIR='${base_sbindir}' \
>     LIBDIR='${libdir}' \
> "

You could take the cleanup one step further by merging the recipe and
the .inc file (and then including CCOPTS='${CFLAGS}' directly in the
definition of EXTRA_OEMAKE).

> >
> >  do_configure_append () {
> > @@ -46,7 +48,8 @@ PACKAGES =+ "${PN}-tc \
> >               ${PN}-rtacct \
> >               ${PN}-nstat \
> >               ${PN}-ss \
> > -             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
> > +             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)} \
> > +             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-devlink', '', d)}"
>
> Assuming that the tipc and devlink binaries are only created when tipc
> and devlink are included in SUBDIRS above, which seems reasonable, you
> can simplify the above and remove the PACKAGECONFIG checks since the
> packages will only be created if there actually are files to put in
> them, e.g.:
>
> PACKAGES =+ "\
>     ${PN}-tc \
>     ${PN}-lnstat \
>     ${PN}-ifstat \
>     ${PN}-genl \
>     ${PN}-rtacct \
>     ${PN}-nstat \
>     ${PN}-ss \
>     ${PN}-tipc \
>     ${PN}-devlink \
> "
>
> >  FILES_${PN}-tc = "${base_sbindir}/tc* \
> >                    ${libdir}/tc/*.so"
> >  FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
> > @@ -58,6 +61,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
> >  FILES_${PN}-nstat = "${base_sbindir}/nstat"
> >  FILES_${PN}-ss = "${base_sbindir}/ss"
> >  FILES_${PN}-tipc = "${base_sbindir}/tipc"
> > +FILES_${PN}-devlink = "${base_sbindir}/devlink"
> >
> >  ALTERNATIVE_${PN} = "ip"
> >  ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
> > --
> > 2.17.1
>
> //Peter
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

