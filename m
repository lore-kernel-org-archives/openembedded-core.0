Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id A166F7F289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:11:53 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h27so616797lfp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=biyEx+LEkEXYagaci+NBlp7dzcOD8ObVKuuab/dyI4c=;
	b=EA+xNuGKprM/R1OlvZwGNDHEquJIsmwn88I6i4SBUs8fy3w8s6ALStFgdIPgnS17pK
	sh1dFmH6hiku+QvkaWeAbBKT8keFMm0RA68OLUD7GPubcH4A1rBWfAuMoMNohvDrE0km
	OKnBqvrCfsGMZXebXY9zjf/rPP6EHQzEB6zJ/qSTmRzc9CCQWTFp1r+R9UNJ8M5kCi6o
	OPH3Jt730RkOjW8i+k8AaqswP5Hb5+eaWWQEho1zXLyDVjHsVDXauXhPJyO+D/D8fmuz
	QfiDUkn/FekKyCEzwpwQZ99BsD9mOAatU4zvZWKtVPcQfFCjK7fjdpM2G+L7Vf/roeSV
	VIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=biyEx+LEkEXYagaci+NBlp7dzcOD8ObVKuuab/dyI4c=;
	b=jPnxqbgCwEb1F+QC0+12cDA5xZ+GKkjpONK58lVK1Hs+WEy2Sn/awCx/1bRrLa9UoY
	IK+7tBHX4RI+M4tSAyikmuXyhzKE3BeES5CmdLQeD5OQnNVGjmaiT/eroV++Tmxg1w35
	Uue1pN8e316unENjgfy/UsYpZELiPycVfsn4V60nWoCmjMFq7oiiMQ9OEbyHgjcYRwhu
	oo71AzHAs33k7ZOIt29Qi64MsOEvhxr9C+WSozWTlk2ScXRUoNN512DO6bo1mFisRi+1
	y1SG94ioN1UaYXfiE5EPZlUmDOejB0K7Puyr54OZGale1VsObY645u6fuYZlu4ztdsfd
	16RA==
X-Gm-Message-State: APjAAAVofSA8IHGvLzuIon3qbAd20UWJH/54lCY4h/agSSm8hVVvfVuj
	zMVLK16+8oQpUgOnUlO6SAp9qxdlawFSj1Fy9b4=
X-Google-Smtp-Source: APXvYqxH2S/NZhlgJH6nBVG1IPaHwh8HMU3fcQUz3TxDG/CVqUCYC9H9J+MZ6ddbNUfqmaFGPMxufna1rnKQIrLWp5I=
X-Received: by 2002:a19:428f:: with SMTP id p137mr3783178lfa.149.1567023114087;
	Wed, 28 Aug 2019 13:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
In-Reply-To: <20190828200536.GD3044@localhost>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 16:11:43 -0400
Message-ID: <CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 20:11:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 4:05 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Aug 28, 2019 at 03:28:38PM -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Witht the approaching EOL of python2, the kernel packages need to
> > be updated to depend on python3.
> >...
>
> Yocto 3.0 ships and supports Python 2.7, so there is no urgent need for
> last-minute Python 2 -> 3 changes.

Actually, there is.

This was discussed in detail on the yocto dev call, Richard is waiting
for these changes. In particular, since the support window for this
release goes out past the EOL, and one of the stretch goals was a
python2 free image. There's zero risk to these, and no reason to sit
on them.

Bruce

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

