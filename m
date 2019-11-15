Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA6AC7FAAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 00:34:46 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b20so6611057lfp.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 16:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nTVYdvB0LWxemFP+6PtUUQ0PTOrXYLGCMTIssRwaHcs=;
	b=QtZBdSwYpahVVecnpaLtvosvd+ZME2TfvWy+LLbKC4TsZiJT5H+gIPUda3rSptXme2
	hyFPyqhIAmJjrAAIfPW8gIVMwNtdig2qLVUQH6Ls1XTPSdWKL7ve7QdqqVUavhnb+QWo
	YBF6z0hK4V4mTrU0MCFZ+PLsT3kBzMKgHxREYRv2/Vix7JEBtD6dMSXnn06gtGkkOkLq
	+m0HjDyUm/sZMt4C+9AJbAfwM2UA+QBJOMzMlme8RgRi70s1nUmH1xdAK9CFWBNXiY0p
	zLWxImv9AJsKCAwj+UYctxckB9aPE6cX42cJtRbtuUR1F8PTnQqy6Tm5VgChkhka+ZRb
	+yMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nTVYdvB0LWxemFP+6PtUUQ0PTOrXYLGCMTIssRwaHcs=;
	b=ftRRwclTn+qiMAFrOtrZ8eM2vChVm3Sts/CcdlD68zpZzScdAYoNAK8CZyD93yDjp2
	jvn/xmdHJmE6O75UdgFzRfdMouKxE2ErrtEv86Xfd0wFdNeYFVVATFIcoR67sNbdNXQu
	+GPZOJjnk7lQtLgo7pwVai4Cb40vNY4pPHeCS2eAB0g5r8lyoQP9261dGsHQsSe4iWof
	uOGJlQlOXkier8jDjPuflpnNxIi41FvF53MOFgr2zEPzNTNTFE5SjTYakmAXc5nyCHya
	7A5C2uyBKfmXbb7A0WwMyEW1AWKe3SiU0vbX8t4otW2lnKl2I1ZjyAyy608QzmGgvwPq
	otWw==
X-Gm-Message-State: APjAAAUiupcayPDdrU9H7RUu567kaPWBawxT7tmp6+zu9afY1eLNsA4H
	agsNkaBCkJnND/TeZLZnujUDCE+/3IlIIC56h7Vj/A==
X-Google-Smtp-Source: APXvYqw7hrxEOHP4X8uoQB+7RRxmYq1ljsCYPDCO5/b65dAr8nYKgPe1r6bs3svfoqI0Rn6IxQC7EaC9k/XKK+PU3mI=
X-Received: by 2002:ac2:48b8:: with SMTP id u24mr7641697lfg.133.1573778087328; 
	Thu, 14 Nov 2019 16:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20191024183426.23676-1-daniel.diaz@linaro.org>
	<CAEUSe780NPpCJw_DsqZC9es6bQ4ex5BQ=7VrPOELQUL4guyatg@mail.gmail.com>
	<CADkTA4N9kt8rZvyT7M_H71VrkdSZ+Hg4sK0FRaJS4UdKohXU6w@mail.gmail.com>
In-Reply-To: <CADkTA4N9kt8rZvyT7M_H71VrkdSZ+Hg4sK0FRaJS4UdKohXU6w@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 14 Nov 2019 18:34:36 -0600
Message-ID: <CAEUSe780KBp2uy4r7RQgo-ET07gWfk4d2hOKV5MTuG3VoF+tmQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Fri, 15 Nov 2019 00:34:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Mon, 4 Nov 2019 at 17:42, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
> On Mon, Nov 4, 2019 at 5:56 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> =
wrote:
> > On Thu, 24 Oct 2019 at 13:34, Daniel D=C3=ADaz <daniel.diaz@linaro.org>=
 wrote:
> > > As of linux-next-20191022, we need bpf_helpers_doc.py in order to
> > > build libbpf, which lives in /scripts. Otherwise, do_compile fails
> > > with:
> > > | /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0=
/scripts/bpf_helpers_doc.py: not found
> > > | Makefile:184: recipe for target 'bpf_helper_defs.h' failed
> > >
> > > See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
> > > endian, tracing}.h into libbpf") from linux-next.
> > >
> > > Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> > > ---
> > >  meta/recipes-kernel/perf/perf.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/p=
erf/perf.bb
> > > index 8201c0cb60..a463eebc52 100644
> > > --- a/meta/recipes-kernel/perf/perf.bb
> > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > @@ -113,6 +113,7 @@ PERF_SRC ?=3D "Makefile \
> > >               tools/Makefile \
> > >               tools/perf \
> > >               tools/scripts \
> > > +             scripts \
> > >  "
> > >
> > >  PERF_EXTRA_LDFLAGS =3D ""
> > > --
> > > 2.20.1
> >
> > Ping.
>
> I just went through trying to reduce the amount of source that we copy
> for perf, since it has often ended up causing us maintenance pain.
>
> Can we just copy the one script we need, versus a complete copy of the
> directory ?
>
> My patch from a few weeks ago, makes it safe to copy a single file, so
> it should be doable.

I am unable to test that as I'm still stuck on Sumo. I can confirm
that "scripts/bpf_helpers_doc.py" doesn't work in such an old version,
whereas "scripts" does.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

