Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 535097C37C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 16:10:18 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w25so8940388otm.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tS2izn6xajrV+57F7bWVrWH+uiuRa2aqkTpgEfajt7w=;
	b=G5i3r7EU0FzX4R5i5pmiXXpQaJacOQss1/eBHRbOD/aqQlRkRYMUTCvTzMESRgwUtI
	VbLze4y/lpF8RJcIOcqVQrLu6kSV5TAxeMl/X9ycpgQcGzOqogYpIptZy/8y7VJ84pg+
	FGPohXHtRpzaMX2C//iS3w+IsFGVHddv2InJw41HzzvpfJurN523TWXfgq85JXaK4g67
	VA7NBrS+zwnn9V3WGhdMdJ8LigFWsQoS9OYGdQekSOGXlXE8i4Ot9Ac0t6308USJBGVj
	OH4Jl6NWX4wCHBQgGmnPQl+nFL9Zk4L/nMtNh5f7Hd0UHjb4cDGLrdm2lqlge0kH5FA8
	8ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tS2izn6xajrV+57F7bWVrWH+uiuRa2aqkTpgEfajt7w=;
	b=GJIGHWnIJID5dpe8C3lcmf8OUW3xrwB+2mbqWqndLTUW3Xp2nZxHsJzCiQ1TOvkzMT
	6wu4R1nxhKVZkOmUUDicfpbDzu3MRthBfexTWUTBlsK5DunlgFQdO2JNXI39+eM7U8sO
	ujUWGpaSveKbSDqoJwotoKcrcJ0EeD0Nb0AU4Vdu3/q5ev1pn8PZIhG78yQTWKKbyHHw
	cwEBQgczHkG5+NOHhxM5GAIF1a8ufllybfaBF+0ukEkQGmrQ3OtIF+XXim/UtVgpkjaV
	kb4ecbRij5f6kT5NWiwSDX+FqOxIslKggM8FjUJJVhFsbCl0ml0UBuGHRPiSTWyifL4+
	x7Tg==
X-Gm-Message-State: AJcUukekw5RyVEaJ8Wz/AM7ja5F0FJ2pjLQ6MgvI+PFPRZzsVAjCZLVB
	lIwA5yIEmxIkNAwIwOEYHihNDoEzXnS/9nekjy0=
X-Google-Smtp-Source: ALg8bN6D/Xtt+q5i3JckhF5msh2HlWOcY73sFj3PAPRlraPgCUjEtYxj48P93eHUwzoWY34yyPJogCI6/V+lkklL7wU=
X-Received: by 2002:a9d:4c88:: with SMTP id m8mr1129436otf.360.1548432618098; 
	Fri, 25 Jan 2019 08:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
	<CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
	<CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
	<c207a65d9262320feaf5d32ee7d906beee506102.camel@gmail.com>
	<12e06882b3c8cf4e17e0e6663dc8fa50c770d46a.camel@linuxfoundation.org>
In-Reply-To: <12e06882b3c8cf4e17e0e6663dc8fa50c770d46a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Jan 2019 17:10:06 +0100
Message-ID: <CANNYZj92Q=4HN+exKycMR5tnn+LjAbMEzqAx3B3dkxHjpQsixA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Fri, 25 Jan 2019 16:10:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jan 2019 at 16:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > There is a similar issue in multilib for target packages (a warning
> > > because qemu usermode support is missing):
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/214/steps/7/logs/warnings
> > >
> > > I'm as well not sure how to handle this:
> > > 1. Keep these two warnings as warnings so users see them in their
> > > local builds, but
> > >  add some kind of string pattern to AB so it excludes missing qemu
> > > support and missing wine support warnings.
> > >
> > > 2. Turn them into notes, which means they will go to the logs only,
> > > and users are not going to see them ever. On the other hand, the
> > > postinsts tend to
> > > create things like font caches and similar, which should not
> > > generally
> > > be needed at compile time (which is what SDKs are for).
> > >
> > > I'm leaning towards option two.
> >
> > I was leaning toward keeping them warnings and then suppressing them in
> > the cases where we know they don't work and are unnecessary (perhaps
> > with a variable like POSTINST_INTERCEPT_${PN} = "0" ?)
> >
> > That way if a user enables a package where it's not going to run and we
> > haven't previously evaluated it to be OK, they will at least see the
> > warning. I naively think this might help reduce the number of bugs
> > filed, or at least make them easier to triage :)
>
> I think this may be safer...

The postinst_intercepts are not executed per package (and accordingly
can't be suppressed in that manner), they are run as a set of scripts
available in scripts/postinst-intercepts/ during "populate_sdk" phase
for an image. I have sent a patch where both specific failures are
turned from warning to note (mingw, populating the target sysroot for
nativesdk) - both should be actually okay to suppress, as
a) mingw case never worked and has not been a problem as Joshua says;
b) target nativesdk sysroot should not be a problem either, as it will
be used just to build stuff, in a way similar to target Yocto builds,
where those intercept scripts are not executed either, at least not
until we populate a rootfs for the final image - and this has not been
an issue for anyone. The scripts all create some kind of 'caches'
which are only needed at runtime really.

Hope this helps,
Alex

