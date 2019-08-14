Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB757E543
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 04:06:51 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i4so304611qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 21:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CSnKUL/p0vc/vRNF/3G3aFC2Z3kZjS/gqLs/fxpFjBA=;
	b=Bq66d2TaEI2NsIoUwBDjmNZ2MFwhbBqjKftezA6a50nJh8p+q5tuNLpXTOWOJFsLqZ
	u1wTkq6SYPqPC1u+6ZoNoHdATzAdqYPxfHrs8GTQy0AwPC9N2AcPDtfQTyMsvZ3kH7kq
	Zow/c5ltoqCcxDn8CFbW8BivHw8Cj8hz5PNTdl7KEfmrDxOy/OtzntEKhj43VfukX+ZO
	d3Y7h1hKfV2jPmGNpzWWv55WsGr85fpKtXVQxyHfAo1m4PCM/cAeht2dAb6G3Bt1VItf
	JU7ixKMBSKmezkYcTTL4l50Nr7F/aSj9uZJsR3uFq0jiJ4aDGqbF/ld44zSr9VgdA/Wq
	GN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CSnKUL/p0vc/vRNF/3G3aFC2Z3kZjS/gqLs/fxpFjBA=;
	b=Tv5GxS3h/aBmj2HvxBlhAaIkdVvAvzibfXRt0oic2i6wm6zBfIqxs+usIoGFiNB+yQ
	Cwqrdwg64eutGufHtQZ/7MVf3NvCrjzlYYvv3HiaHpIElmYykYcMPD/PQu1pR8EuZW4o
	avTOYGIqcKixeg7BARGElHwvZOUGdFFWG6pXxlSi5S70SZqGilQpf9isjb0OhO9zbsfY
	9IhwaqpHQOrKloecQu53wxM6rUdJmFfvDeLVAS4VTloTNC2tpORS4OqUAh1L711yQr0d
	LXWR2cDhV8uRWvRS1mCJv6/Q6xrx+2gJD+ITXO3Rg/+hbPSzGkTvrm48vibAZ6TS/REy
	Nxrg==
X-Gm-Message-State: APjAAAW6O/a9QrpQLMpMaZrShIAOl8zsN6Cm+ERSPh8LI2SBBJnXedjx
	PZmhvbqv1vh9HkpE15/1qBedY0fRKr7twYfgACs=
X-Google-Smtp-Source: APXvYqyB3M9Sc26T6zVJj7rUaj/2+5TrfzlxwT55V2uoS7kccJvXpnMpQ7UbIaimOagwDFZtK8Y3faOkLUlP7u7XqSE=
X-Received: by 2002:ac8:6997:: with SMTP id o23mr365766qtq.53.1565755612632;
	Tue, 13 Aug 2019 21:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
In-Reply-To: <2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 21:06:36 -0700
Message-ID: <CAMKF1sr-571m1-M8aPN1KnbcFuzBmzqW9jCwXkdcxO_knqAwJw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 04:06:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 12:18 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-08-13 at 10:04 +0100, Richard Purdie wrote:
> > On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:
> > > Comparing that build to a corresponding do-nothing build with Thud,
> > > the time difference matches those three minutes where I have no
> > > idea
> > > what bitbake is doing now that it didn=E2=80=99t need to do before=E2=
=80=A6
> > >
> > > Hopefully these time degradations can be solved, because the
> > > current
> > > state of bitbake is barely usable. We also need to look into
> > > possible
> > > ways to improve the cooker output when it is running the setscene
> > > tasks so it makes some kind of sense again.
> >
> > We talked on irc and you pointed at the commit things started to go
> > wrong. Just to summarise things for the benefit of the list, this is
> > some quick testing I did:
> >
> > "bitbake -p; time bitbake core-image-minimal -n"
> >
> > 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
> > 30.6s a0d941c787cf3ef030d190903279d311bc05d752
> > 40.3s 7df31ff36892c2f9c65326b06b4c70
> > 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e
> > 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c
> > 76.9s master-next
> >
> > So basically the original changes showed a 25% hit but the
> > performance
> > of -next is dire.
> >
> > This is with no hash equiv server configured.
> >
> > It will vary depending on the target used (numbers with -sato for the
> > above would be interesting for comparision) and how much was or is in
> > sstate, they type of sstate mirror configured and so on.
> >
> > I really need to focus on getting the new code functioning correctly
> > before we attempt to optimise but if nobody tests the new code due to
> > performance problems we have a different issue. We also have a
> > scaling
> > problem with the hash server itself I need to fix to stop the
> > autobuilder throwing weird errors. I'm therefore a bit challenged on
> > where to start with it all :/.
>
> I had a glance at the profile output from master-next and the problem
> wasn't where I thought it would be, it was in the scheduler code. That
> is good as those classes are effectively independent of the other
> changes and hence are a separate fix.
>
> I've put a patch in -next which takes the above test to 36s which is
> close to the older bitbake.
>
> Could be interesting to see how it looks for others and different
> workloads.
>

will try it tonight

> Cheers,
>
> Richard
>

