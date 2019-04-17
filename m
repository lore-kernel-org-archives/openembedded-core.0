Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 85DAD7D1F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 20:35:48 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id u65so6609609itc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sjbYZZHDnhWny0JK3VQQ0xRLs3Gt13MdBy3ZW7Vl5ak=;
	b=J3891blfOed5QfunGEC5GeXk00XluoRnF9KxEj/jfE3bwmP42MqUESu1V0PZQZ0NGf
	iKp8bOF4F3HfgSlfziS18q8IozxlvFx2BfaNJl/CuWl/f2VmIPowIi4NkvNWfVuAzLai
	fFKPizf5m2yuHjt9cTu8aCLaU8iXYJJmIPdnFRC+WeN2qx0sNKHPdyFtdh2HcjahU+ir
	HsDy8og7m+2yAE4j1jTjgaLok9xpFY75InhX4ifWnDPgT7ZEMkIjOvgbBRKYoy/cymJX
	Y1PMhKLwRwFti0SqvKYn1Bh1ZX2YACoQXvTJtI9X48yHSuP4gewG85mZw2DvuJsR3Q3K
	A0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sjbYZZHDnhWny0JK3VQQ0xRLs3Gt13MdBy3ZW7Vl5ak=;
	b=T3twndRhQgRfmCeyEcriftOBdpl7QURUw+NWmo8nb+ukJJLRjgMD6DVM0jBA6LMZsD
	9cwhPRsB4kyoVtpRphWiqEF3N8NuJMK1qL56g8CS6iAnD1y5L6Jb0u979RMmqAY04Tu0
	Ls7Ce0MRkd3td8TYVQaWHqow1w+wcY89Ll+12oh5pK59u3IY+doTmTaLfrFkGm25ZxUg
	YN6V49JR1ul+PiiIF0J0DSNS3oXyF4CcwtBIbkyidreH8usyHXqneXV+1on7lq5LSokH
	rHeWXJinfXsp3jdc9bk6thRiXoCqdU5OqqvS7AGSC1TMek6Fq0kmwHnHP1KAMFfug6yY
	1vKQ==
X-Gm-Message-State: APjAAAXwCVE9TV27I25w4e9WRzhxMJ+W62ePG0XnLpaiU0PGau1oZ4jJ
	oJKqcG85cn6bE/J1aO6xl60Gksb+hAgMfV7veXU=
X-Google-Smtp-Source: APXvYqwaJKdH0MgdKKsexj2iNHpjfQr0o5wJqx3cKFWedvxrVQkbL/pKBbni7MIOZ9JlRmwlj5J5COqpSxnUKyKmOBk=
X-Received: by 2002:a24:5c10:: with SMTP id q16mr437178itb.81.1555533349420;
	Wed, 17 Apr 2019 13:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LYTPzM_YPZJ4AH1uwbGE0vMRYqX-VFaS4cqsG3H9SHvUg@mail.gmail.com>
	<1555525297-26931-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRS05HmvF2ka5GNBP4XP1cp+WpbxW1Ss4RzMp6ggBPzUEQ@mail.gmail.com>
In-Reply-To: <CALbNGRS05HmvF2ka5GNBP4XP1cp+WpbxW1Ss4RzMp6ggBPzUEQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 17 Apr 2019 22:35:38 +0200
Message-ID: <CALbNGRQ7LMGUO8zeTmUczBBJrjaWBumzDydR3KezyF4=jEfcmA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xfconf: fix 'Failed to get connection to xfconfd' during do_rootfs
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
X-List-Received-Date: Wed, 17 Apr 2019 20:35:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forgot the link

[1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14789

On Wed, Apr 17, 2019 at 10:33 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Wed, Apr 17, 2019 at 8:22 PM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> Seems that there are configurations where it xfconf causes trouble
> even at runtime (not only at headless builds) [1]
>
> So adding a PACKAGECONFIG disabled by default is OK.
>
> Could you please send this to meta-oe with
>
> PACKAGECONFIG[gsettings-backend] =3D
> "--enable-gsettings-backend,--disable-gsettings-backend,"
>
> Thanks
>
> Andreas
> >
> > Packages such as gdk-pixbuf can result in the following error during
> > the rootfs construction:
> >   CRITICAL **: 16:51:57.223: Failed to get connection to xfconfd: Canno=
t autolaunch D-Bus without X11 $DISPLAY
> >
> > This is hit during the postinst-intercepts/update_pixbuf_cache.
> >
> > Based on discussions upstream this appears to be an issue for xfconf
> > and has an upstream update
> >
> > https://git.xfce.org/xfce/xfconf/commit?id=3D6f11cc65a2213f424728b5a0d2=
5b1b63c19e773e
> >
> > Drawing from this change we can go ahead and use PACKAGECONFIG to
> > emulate it.
> >
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >
> > Guys,
> >
> > This is still broken in Yocto and I would like to see it fixed. I haven=
't
> > dug into the issue as much as you two so I wanted to float this fix
> > out there but hold back from calling it a proper fix. Please let
> > me know what you think or feel free to take this, evaluate it and
> > modify it into a full fledged fix.
> >
> > MarkA
> >
> >
> >  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce=
/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > index 2667ff9..22a7bc1 100644
> > --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > @@ -16,3 +16,5 @@ FILES_${PN} +=3D "${libdir}/xfce4/xfconf/xfconfd \
> >                  ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> >
> >  FILES_${PN}-dev +=3D "${libdir}/gio/modules/libxfconfgsettingsbackend.=
la"
> > +
> > +PACKAGECONFIG[gsettings-backend] =3D ",--disable-gsettings-backend,"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

