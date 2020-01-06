Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C29177FD79
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:33:01 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z14so38855894qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9QmE7UcERfyWGTI5Fv9BD3EfAitwR0ClpGfhtaXpO8Y=;
	b=V2X+nrf+7gv0BerXG0nH3r9kKujM6ak9KtvqvQtVYFUB9QCkGGTsFOxUKzE4yq+ddQ
	5zWmqQMU2bqyi65IV6rWppmAdaahq7zU0pwq6bx6peu/1Tjl72lG+G62iTWRdJW04Dte
	1Yi7gtFDe+aomI9uYMGb/1pwBl7eIeyECEjuWugzi32K1wsNL2S/yU7o8kqSPx4jhyAm
	ni2fshovOL3VbTBpvAs9DDqY/NsaAMQLA96GoY9RlryQZDCT4S+unVgF8EFiBcLNWhFk
	kR8gQLfbEhVTZ9YLG8zqNMeZdad4NO0XWQiuMhC/yR2T8v+8tt3YFVRTmy9cVQKAafkW
	nYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9QmE7UcERfyWGTI5Fv9BD3EfAitwR0ClpGfhtaXpO8Y=;
	b=S5IEEV3q04fBfY1hkolK2SGByfiQD2/k+YYzOY5t0ZwSHVfht76hN4y85Hr7vDiyFc
	9hmZ9yAutqa67Q2nqP41z1fvOOFz7zxep54tiL5GLj5VFgCK7i38wFAFUsNbZ119MNBo
	0fP57r/UsH2BT4H7xe0jWV15s8b+XonNELdJ6EoC6lN5lVGL7VVO/M37/kJvQ4Hm/IT8
	kbJKYYtvk5qxEDl3Z+Ek+ka/3ePFhuu66SkNKq4lZxyXDC889q+4R7kUmoNBw+kCPWnR
	LKHHhObUCDGeBs3EskSLoTYcQCUHpexzhLhSyNW4Ha/WzUhQ7kguVZWstgwSlWMbdDtA
	Jf9Q==
X-Gm-Message-State: APjAAAUdR3aeA5+dsPbC5KqV02pbAHyAFk51r9sbRc9a1VTbwC7qKGE+
	u/C0mGRA5+YeXmv1eH0adR2xnCijB6i20rNiC5OYNYyD++A=
X-Google-Smtp-Source: APXvYqwP8lsSgORIGj7UeoU21UtFOs9fcT1njSDJ7XQC4hhI+iKq8AFcakfxXqKgoiBANa1KQTCgaA8N4pan8KUALjI=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr84241538qke.212.1578331982523; 
	Mon, 06 Jan 2020 09:33:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578035913.git.raj.khem@gmail.com>
	<f8e251c9d729cabcb7f9eb0ee536c6a894e58e87.1578035913.git.raj.khem@gmail.com>
	<68f893a224c39ed4778f1d35b6e38ac06faca346.camel@andred.net>
In-Reply-To: <68f893a224c39ed4778f1d35b6e38ac06faca346.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jan 2020 09:32:35 -0800
Message-ID: <CAMKF1srDeOU9zFNwZ387WOWkxGLHXKm5Co1brZUxy+qqurofbA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags
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
X-List-Received-Date: Mon, 06 Jan 2020 17:33:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2020 at 9:08 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> On Thu, 2020-01-02 at 23:21 -0800, Khem Raj wrote:
> > This is needed for 64bit time_t support on 32bit architectures
> > see [1]
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit?id=3D152194fe9c3f
>
> As per the above, __USE_TIME_BITS64 is a glibc-internal macro, to be defi=
ned (by glibc),
> when the application requestion 64 bit time_t via #define _TIME_BITS 64
>
> Is the behaviour different on musl? Should this patch instead set _TIME_B=
ITS?
>
For musl we wont need it since it is now the default.
this has now been defined in musl itself lately [1], so we don't need
to add this define externally anymore This was not the case when the
patchset was done.

I will test out a patch to remove it with latest musl and see if it
all works ok.

[1] https://git.musl-libc.org/cgit/musl/commit/?id=3Df12bd8e05c8bb2c3e2b91d=
635887ec424ef8fbd9

> Cheers,
> Andre'
>
>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/tclibc-musl.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distr=
o/include/tclibc-musl.inc
> > index 8badbbb40a..22f8214ba3 100644
> > --- a/meta/conf/distro/include/tclibc-musl.inc
> > +++ b/meta/conf/distro/include/tclibc-musl.inc
> > @@ -18,6 +18,7 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
> >  #USE_NLS ?=3D "no"
> >
> >  CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> > +TARGET_CC_ARCH +=3D "-D__USE_TIME_BITS64"
> >
> >  IMAGE_LINGUAS =3D ""
> >
> > --
> > 2.24.1
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

