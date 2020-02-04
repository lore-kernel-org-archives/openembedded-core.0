Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45787611FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 08:16:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so21754981wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 00:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P59zs51FR5jMO+FBEpApA+Xj6GpEW/TSs6E5KL1xIIk=;
	b=cFcgBN0g/tY0dJrCiWD7PoDs9pNnGHJzLNn1SG4m61QgivJy+yMjoKfMKQn5dgoZlE
	HokvqwKguy2m7FGL5vhZ0AGUp6giHri9/N5IUkx9aDffXcYnhnmw0gqn1xgfbb6pBGm+
	gv8bwDRJPPUkB3UynD/2S7watSeuVrYj0kf7s5fHtiFg3NYEbRwq67aN4UmafIXshLQb
	i7upBqlQoOcpM/eWSO6b8mn+Ei6jCFq+109fHCXyZYyulZ/F3qEJNfu3ln7nuDfaPfXS
	IPIlUKCiw17ngvHx8awfmp09vF4cxs2sicQhw78mbPSReSxcz/88NY5zJr6zZm2uoZBQ
	PU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P59zs51FR5jMO+FBEpApA+Xj6GpEW/TSs6E5KL1xIIk=;
	b=mynoS0yYyFXw3fjROlJGN8C6eA+dNey87cl8dpAhYWbktSrYxlchhtBcA0jKzNew+V
	eyVHnX7itJTr4zPynZsRmswBlSJHfWUBScv1M1kbSH11oG8TcEN/8lkL2rHF1+qHgvPs
	tgkcE3QhiLyRfMWix4C4FPvzv0kVU5hP7RYYzfLnfyalerSXQjl1tVrHbZfb3MJYJnnG
	ZPvjcqvgdQtWwULcOwvWrB1BHPFl7TKQYfeV2UnlhEb+LKHBo8/grsVF+dBI1NVRkEla
	543tVdl3PkctZs0b9QaknXbGaW9iWq2PFr9OpEGl7En4xUW5qPutQOw8LQ+9B5HS74rs
	KveA==
X-Gm-Message-State: APjAAAViAOCk5zPG4hxkPNN3hX6zuCXZUChIQYC6R374dbioPLnSQscC
	228MAhQVI127sulu+8Tzr7G9pVBSFs2e9JK3pbE5cIya
X-Google-Smtp-Source: APXvYqyUQoIKHt3Ke+k41WmkasLI4odgHDUHWn9mf0213EO37kcT9PVaGRNbE664KCAc/qR5Grry9pbGKcrCvrAVp8k=
X-Received: by 2002:adf:f44a:: with SMTP id f10mr21838261wrp.16.1580804207735; 
	Tue, 04 Feb 2020 00:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20200131220751.106516-1-mark.hatle@kernel.crashing.org>
	<CA+aJhH0a5VSwdhGqg=5Ez+=TzDm0=Esu1kebDERWZTjkRp=7Ew@mail.gmail.com>
	<8a54da63-ab5a-8222-f401-aaea7debcfc5@kernel.crashing.org>
In-Reply-To: <8a54da63-ab5a-8222-f401-aaea7debcfc5@kernel.crashing.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 4 Feb 2020 18:16:32 +1000
Message-ID: <CA+aJhH2DGeMOTM71yHhPvnZDc6N0wrrwYAv9Xf6VOaKTtW2X1A@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] microblaze tune: Correct two minor issues with the microblaze tune
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
X-List-Received-Date: Tue, 04 Feb 2020 08:16:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2020 at 04:55, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 1/31/20 10:49 PM, Nathan Rossi wrote:
> > On Sat, 1 Feb 2020 at 08:13, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> >>
> >> From: Mark Hatle <mark.hatle@xilinx.com>
> >>
> >> TUNE_ARCH - microblazeeb is not a valid architecture, microblaze is big
> >>             endian, microblazeel is the little endian version.
> >>
> >> Version arguments:
> >>   If a version feature is not defined, then we don't want to set either
> >>   TUNE_CCARGS or MBPKGARCH_VERSION.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> >> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> >> ---
> >>  meta/conf/machine/include/microblaze/arch-microblaze.inc      | 2 +-
> >>  .../include/microblaze/feature-microblaze-versions.inc        | 4 ++--
> >>  2 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> >> index eab7171cb2..265898b6b6 100644
> >> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
> >> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> >> @@ -46,7 +46,7 @@ require conf/machine/include/microblaze/feature-microblaze-versions.inc
> >>  require conf/machine/include/microblaze/feature-microblaze-math.inc
> >>
> >>  # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
> >
> > Worth updating the comment at the same time.
> >
> >> -TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
> >> +TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
> >
> > This change will break some things in oe-core (and probably
> > meta-xilinx too). They should be updated at the same time.
>
> Do you have an example of what?  Cause without this, all autoconf invocation of
> big endian failed for me due to invalid architecture.

So core-image-minimal builds were working when I had been testing, but
that was a number of releases ago now.

There are only a few instances in oe-core that check for "microblazeeb".

classes/meson.bbclass:60:    elif arch == "microblazeel" or arch ==
"microblazeeb":
Probably just arch.startswith("microblaze") here

classes/kernel-arch.bbclass:37:    elif re.match('microblazee[bl]',
a):        return 'microblaze'
This one won't break, since "microblaze" is already a valid kernel
arch. But for clean up just needs to be microblazeel.

recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h

>
> > Might also be worth removing the microblazeeb references in siteinfo,
> > and elf.py. Since they were added to support this.
>
> I looked at these and left them "just in case", as they didn't seem to conflict
> with anything that I saw.

Leaving them is fine, though removal to avoid confusion and for clean
up in general is probably a good idea.

Thanks,
Nathan


>
> --Mark
>
> > Regards,
> > Nathan
> >
> >>
> >>  # Package Architecture formatting
> >>  TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
> >> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> >> index 3221e2aab7..003fde3e07 100644
> >> --- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> >> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> >> @@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
> >>  TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
> >>
> >>  # Version flags
> >> -TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
> >> -MBPKGARCH_VERSION = "-${@microblaze_current_version(d)}"
> >> +TUNE_CCARGS += "${@'-mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
> >> +MBPKGARCH_VERSION = "${@'-${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

