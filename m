Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB0D744F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 22:50:28 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 20-v6so5519524oip.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 15:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z+0TiYWDMGLsbQXaUEFN1AGpEJ/sQ2qz/c1M9qeHDLs=;
	b=lUESI8C4X7+8YoYu1P+NQMJxeKyggxEB3B507eKLxDCqCBMQdoD4cwhTMBMHrwyscM
	dvHfAaqMB50IVGUirBM5ISHM9YMcvWq/EpZtkFPjpeot4YcFaT9+8i0salxzjXjmYz6P
	L4BVn3wveHB0yHWdTKiYv11/ugkTShu6C9OpiAO5HF9gdxE3mlWmKGnCGYUwsp17vIvl
	ST4MEecIorBO79jffSAIZ/1O2MRyG3o3YeXWx7Vmg7VYDx+uSi5nQUOGXicm2k6LYdGt
	Tb8HJDF3jXOe020E5Rz1wsJLIG5vADNfCIvbIb16x48npxSX4MvhfGfnhxGpxpk8ObI5
	nFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z+0TiYWDMGLsbQXaUEFN1AGpEJ/sQ2qz/c1M9qeHDLs=;
	b=EhTfvjnlPeGzNKFOmU/+Xix0u6SEleOYGG8uX6EygRm+RBK84eMToNHs32PQicBJj1
	oZeWeS8pM3Qp9eiK7zdKKqKsqfjWP2eURTZWHGXQMyafMF8U3pbIr61vPXXQmDMyuKwb
	ykPIXTQ3pdiS8Kcq/kO/Jp/YhzlilMATVCM6B3OSAae/j/FI0Eb9AKYzWeAe7GBARZSG
	dP3H+VqMw5MZ+enTjvMqWeSBrs00EIssVFZ5B1eENvUapOCuuTDc6tatycBWRJx4mULj
	BsU8OLkpHosVM2CHOSiO6WFqtSttavy/3m5NQ5PlQh2GAqv+qW8XbmXO8vdPdv0cL+yo
	4VUA==
X-Gm-Message-State: AGRZ1gKdbtVTw/30TGz+GTkEi2961frPdIof4c46jOMXFbf2eXo6GFte
	MN+/73HmmEI2lTQHeYO3keW0PLgRwuQ9uCSlQds=
X-Google-Smtp-Source: AJdET5cH84xpXNTwa+7HVutVpqMPHYTSjr3pt+T0ZiDAHoGIfjjpMttcJ/xCzNZGD1/ErreFeVFdf8vsGYYbbnBE4Wk=
X-Received: by 2002:aca:3f87:: with SMTP id
	m129-v6mr2318891oia.228.1540421429844; 
	Wed, 24 Oct 2018 15:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181024115135.10434-1-schnitzeltony@gmail.com>
	<dd89dabb53db006d0b4ba34028361d27e1e3cfe4.camel@linuxfoundation.org>
In-Reply-To: <dd89dabb53db006d0b4ba34028361d27e1e3cfe4.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 25 Oct 2018 00:50:16 +0200
Message-ID: <CALbNGRTSRcb-PbJU25ovrCUb8bg1jh9VUyKq4Gr9m-AdXOFDbw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-conf: add CLEANBROKEN
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
X-List-Received-Date: Wed, 24 Oct 2018 22:50:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2018 at 11:32 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-10-24 at 13:51 +0200, Andreas M=C3=BCller wrote:
> > > DEBUG: Executing shell function do_configure
> > > NOTE: make clean
> > > make: *** No rule to make target 'clean'.  Stop.
> > > ERROR: oe_runmake failed
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd-conf.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-conf.bb
> > b/meta/recipes-core/systemd/systemd-conf.bb
> > index c694efbbf14..111ef2497a3 100644
> > --- a/meta/recipes-core/systemd/systemd-conf.bb
> > +++ b/meta/recipes-core/systemd/systemd-conf.bb
> > @@ -18,6 +18,8 @@ FILES_${PN} =3D "${sysconfdir}/machine-id
> > ${sysconfdir}/systemd"
> >
> >  do_compile[noexec] =3D '1'
> >
> > +CLEANBROKEN =3D "1"
> > +
>
> I suspect a do_configure[noexec] =3D '1' may be a better way to fix this?
Have no idea if there (path-)replacements done during configure which
would not be performed and break install then.

Andreas
>
> I also suspect Mark's other patch needs this tweak too?
>
> Cheers,
>
> Richard
>

