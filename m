Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBDA7F856
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 23:42:45 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a21so14581232edj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 15:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KInJNBgAyQwAic95humRkTp6D1zE0s1z5XrIPaUj7SI=;
	b=ukpmFgN60zKdJ0bfX2oHRoyYM0GPuV7PhiCrg8mFhmUKbRGeXxC+kSoB2ftDHTpAKO
	oRaE/rDrGA2cmcGW/kPtoM6mteCwwrl4V7Jd25Q4yhRUPSjeZIOngeVnpitDxbS+mTkP
	1pSnQsEdO4csl347bsUBIDyiQDcxIHh0jg6hk9bsyCuOU6IHo6Mjyygh+pCmdxyuOO1d
	Uii40+071Pq64FlaRpeW/4Mf7G3mg6Bk6pBHcmfUptnNKWo2JjVcLX8dX3oCMLrqQmld
	n32THDWj3s6/mfYDD3r1NeHgqjAf6WGsu4qYg2IhsS59jspIvQmqv4yTr7BZu7Z6CQ59
	JRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KInJNBgAyQwAic95humRkTp6D1zE0s1z5XrIPaUj7SI=;
	b=hi27B3t6aYc6OfnWF6Rp19zDGqFixP3nUCiFJubzPcGb+1Iei5UjGDN+t26Rq8YdAy
	9RoSM3mg5i+ezJpL5hkWICo/6e7bULQc8oRFB1VPTDeUMC+rTv10k3b7IH8kUTQ0N5Iu
	tMHFTkgXmjISU9/Qllhko/LTVQaYIyzYyhmQEi/0Y/M2bX3KB3PX0QHG5GRMqapyKkt0
	wtg3L1BgFg3BbSyjldtO8UxozhYEfqXj/yRM8E60hoTRkyoEGhLkSHLWZeFbo0pagjP2
	AEZP+mKdjpfpy7ZHvPp9685T2/+k3gMPMTPr2d0ZxaGuRuOv5xAdZHuvknV5BEmru3l7
	I2SA==
X-Gm-Message-State: APjAAAWNfNIqURuu3av2rbGCDgUIMXOHS/nbMgQ1qKU+VRHWP64SFL2P
	NKtXpH3bMrNCQGgd4zr4Z6qpGqI0p7VWlhq4WF0=
X-Google-Smtp-Source: APXvYqwmjjWyfRysI0ehN93DI8gGOBVdi9bopZFtqCxScjxpszKBfJpRfK5AIXLFumWcO1hDXVtQUnmy0RcyNRN9o4Y=
X-Received: by 2002:a17:906:a457:: with SMTP id
	cb23mr13486561ejb.191.1572910966194; 
	Mon, 04 Nov 2019 15:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20191024183426.23676-1-daniel.diaz@linaro.org>
	<CAEUSe780NPpCJw_DsqZC9es6bQ4ex5BQ=7VrPOELQUL4guyatg@mail.gmail.com>
In-Reply-To: <CAEUSe780NPpCJw_DsqZC9es6bQ4ex5BQ=7VrPOELQUL4guyatg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Nov 2019 18:42:34 -0500
Message-ID: <CADkTA4N9kt8rZvyT7M_H71VrkdSZ+Hg4sK0FRaJS4UdKohXU6w@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add /scripts to sources
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
X-List-Received-Date: Mon, 04 Nov 2019 23:42:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 5:56 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> wr=
ote:
>
> Hello!
>
> On Thu, 24 Oct 2019 at 13:34, Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
> > As of linux-next-20191022, we need bpf_helpers_doc.py in order to
> > build libbpf, which lives in /scripts. Otherwise, do_compile fails
> > with:
> > | /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0/s=
cripts/bpf_helpers_doc.py: not found
> > | Makefile:184: recipe for target 'bpf_helper_defs.h' failed
> >
> > See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
> > endian, tracing}.h into libbpf") from linux-next.
> >
> > Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
> > index 8201c0cb60..a463eebc52 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -113,6 +113,7 @@ PERF_SRC ?=3D "Makefile \
> >               tools/Makefile \
> >               tools/perf \
> >               tools/scripts \
> > +             scripts \
> >  "
> >
> >  PERF_EXTRA_LDFLAGS =3D ""
> > --
> > 2.20.1
>
> Ping.

I just went through trying to reduce the amount of source that we copy
for perf, since it has often ended up causing us maintenance pain.

Can we just copy the one script we need, versus a complete copy of the
directory ?

My patch from a few weeks ago, makes it safe to copy a single file, so
it should be doable.

Cheers,

Bruce

>
> Daniel D=C3=ADaz
> daniel.diaz@linaro.org
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

