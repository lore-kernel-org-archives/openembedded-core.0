Return-Path: <nirbheek.chauhan@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2495478960
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 09:57:29 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id e20so17893903iof.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yfq06w5tTo2VS7+zmRX1S6uKC5Gk5JUm1KNThigp2uE=;
	b=sXo0gAg3QbeqQPA2kK0JwjzBqeVKSsuztISy4RglsjjR8B+nUG2s4u4+35EXAFXI6J
	6uOu7BjbJ9wIpB1ZXmvqOYOH8kOiX/6ohQv3Gh2PKnoeFb/w3PSLHAqR+RnV9jzePlxq
	lNcA5zjPtsyqcAZPMSjSNZ4VG5i79+R2nJfbXeBhfZEoCTRKDpU7CT0eRaHDmRnWpiLx
	TgQ2+4RR1USF5RjhFD+dSvf7q99/RDKKYHrWSxirfwWNcPPTjzsmpGavtFXKMG5NaBHp
	jVixNAfeW8psfX5lnhUVjaJtuvB1z7DQuJMjkkkSMYqmVWH2pmkFnJvnzl8kt613kVC5
	bhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yfq06w5tTo2VS7+zmRX1S6uKC5Gk5JUm1KNThigp2uE=;
	b=AmGiRF6JOWkOHu3kJiQanpgg9n1MSdcSS2DMW4qejZiYnJP5gJyTZxaqAUbaDPM58G
	pAPbpU8TtfqWKcxdI5zID2zyndu5PTjbZTUw44X0Zihx3UCwNHj94m2Mb0jZ616R6B67
	kbC8XNjZfcWHfRbHphSEqWELlOQpSnKShVV7iwuW8yKv7L0hTsInbizgHoK4w4X7Nlo9
	cpTR66r5xOoK0tA3XTzxNB+AzQc5EPQJgzR3xZIilxtt0qjCgFXXAlyYb7fDVdSA+d+9
	gU+DbZBJ/NQALb52DdYoFTVguwfS/0tPY08qalH9pgxEKc4z2s5MpA9bgj8s3HUaD9Jr
	k0BQ==
X-Gm-Message-State: AKGB3mIqhkgHOlYVSjlHClifEBGBVRhAyTNCJewwId7sCMh4vGlMr3IX
	w/0AF/QHyAck4+mgCy7M5w8ec3LAF/BQ6ZmVa58=
X-Google-Smtp-Source: ACJfBovb44CFAIUj8qHNXX4Xz5Sea2t1a5r3em5gsBIrr+WoCngUJ1Cym8gAnNCJmQK96l6IT2yWp2MFmprTyCHNhTI=
X-Received: by 10.107.131.157 with SMTP id n29mr15240961ioi.260.1515491850984; 
	Tue, 09 Jan 2018 01:57:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.20.194 with HTTP; Tue, 9 Jan 2018 01:57:10 -0800 (PST)
In-Reply-To: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
From: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Tue, 9 Jan 2018 15:27:10 +0530
Message-ID: <CADqQcK5W6hUCGQy12z4PCh8v-kQTJXZEAehHC_odCKAm_WnwNw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Tue, 09 Jan 2018 09:57:30 -0000
Content-Type: text/plain; charset="UTF-8"

(re-sending because the previous one was automatically rejected
because I wasn't subscribed)

On Tue, Jan 9, 2018 at 5:21 AM, Martin Kelly <mkelly@xevo.com> wrote:
> [Jussi Pakkanen, Nirbheek Chauhan, I know you may not be on the list; I
> added you to get Yocto/OE and meson upstream all on the same thread to
> discuss integrating the two]
>
> Hi all,
>
> Recently, we got meson added to OE-core as part of Yocto (thanks Alexander
> Kanavin!).

Great to hear that! Thanks for your work, Alexander :)

[snip]
> - meson assumes that CC, CXX, CFLAGS, and other vars point to native tools.
> However, in an OE SDK, they point to cross-tools. Thus meson fails under the
> SDK when because it tries to use the cross-tools for native tasks (I get the
> error "nm does not work" because meson tried to use the cross-nm for symbol
> extraction).
>
> - The cross-file does not support relocatable cross-tools. This is an issue
> because OE SDKs are self-extracting shell scripts that can be installed
> anywhere on a machine. Once installed, they populate the env with --sysroot=
> and other flags pointing into the installed SDK location. For example, if I
> install an ARM SDK into /tmp/sdk, I would get something like this:
>

It does support that as of 0.43:

http://mesonbuild.com/Release-notes-for-0-43-0.html#can-override-executables-in-the-cross-file

I believe this should solve your problems with cross-tools at least.
Note that this also works for pkg-config, g-ir-compiler, g-ir-scanner,
etc.

> $ echo $CC
> arm-poky-linux-gnueabi-gcc -march=armv7ve -marm -mfpu=neon-vfpv4
> -mfloat-abi=hard -mcpu=cortex-a7
> --sysroot=/tmp/sdk/sysroots/cortexa7hf-neon-vfpv4-poky-linux-gnueabi
>
> If we want to setup a cross-file to use these arguments, we would have to
> generate the cross-file on-the-fly (not good).

Out of interest, why is that not good? That is precisely what Gentoo
does and it has to solve the same problems here that Yocto is facing.

> The way the cmake toolchain
> file solves this is by encoding env vars into the toolchain file, which then
> picks up the dynamically set CC, CXX, CFLAGS that point to the cross-tools:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
>
> I'm not a meson expert, so I don't know if these are the right solutions,
> but here are my proposed solutions just so I can get the discussion started:
>

Meson tries to reduce reliance on env vars as much as possible; the
cross file is meant to be a standalone object. I would be happier if
we could find a way to make things work for Yocto within that
framework to keep complexity down. If that's not possible, we can look
at changing things around.

> - When --cross-file is specified, make meson not assume that env vars like
> CC and CXX and similar point to native tools. Instead, just ignore them and
> look for native tools in the normal way that meson does when these vars are
> unspecified. We still may wan to inject CFLAGS, LDFLAGS, etc into the build
> because people may mess with them interactively during development.
>

Would it be possible to tell Yocto to not set those vars when building
a recipe that uses meson?

> - Add the ability to reference env vars in cross files to support
> relocatable toolchains.
>

That's one idea, but it adds a certain amount of complexity. Let's
keep that on the table for now.

Cheers,
Nirbheek

