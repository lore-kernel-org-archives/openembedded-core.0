Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4E74878067
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 16:37:55 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k67so6983690wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W9zUEQu3X+W3HUPCpgvF0G6+JFji28Lv1EKCinj49c4=;
	b=FFHGLT+oiNpv+O9fK4cm5ujTtYx6QQED/F32El+oJXADdLeBW/Z+y0WRSRB0tJvANH
	Reay9mCwHJHG6Hs54LNAMZ/0p58+kgcKqUbda3mRGEiqOv27XJdbxzFxMcSA9Y7NfEMz
	3l/qh4FKdMGv5gpa8MaIWIdFc/2SZ/3VBYuHKnnbGdYLuReC3BJ+BStp1L5SKHAbWGEX
	hE7+GhMBLFiL0hsaBG0ulySgJM7ZkE22QN0jljRp8OGWWADyGXBoDq8qmIoPIvXRag8O
	LTNVpD1D3aGcG3upBSAX81K3ln05bPn2RTJvHlEewky+eQDntBWygrhtf+ORv1b/GWE4
	sjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W9zUEQu3X+W3HUPCpgvF0G6+JFji28Lv1EKCinj49c4=;
	b=H1sC49sT+39s9SB81l/IsuhHfZquCWxXk570r7BlPUED+3NMrkoyh8V447VJV4S44Z
	g8rd2uIZx8x6HqmWOmWHo/oEUcPGznsdScOM/hIly1aBI18fKMhYY5yQhr/wnA/We4Fg
	zhDighd23zAK2hXZfRBQ7utuaB6gsFXh2dJl4SeEXzo/yPa6j9ynkmRIDFTL1IiOvQyB
	Zr+ptZD3BX4QHMCR2P66h79NiWgH/L0BBv5LuVxiYJlrmTTJo5in0OzWLmiXyqnevzEl
	/Bx2OA3Elk+edgDpEC7z+3gb+vINJ2YL3qSo/upzqT6/me9b00C0BWyEPuIOrcHgbFtu
	MVGg==
X-Gm-Message-State: AIVw111ATMgNCAQa1KjWZEc19VTF1k3CJsDSniJf+ZsimgCjTy6waLGL
	AKeHkOfq9LDTpZ3kyKN9nLyu5b+f5w==
X-Received: by 10.80.162.38 with SMTP id 35mr6623786edl.99.1499877476745; Wed,
	12 Jul 2017 09:37:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Wed, 12 Jul 2017 09:37:26 -0700 (PDT)
In-Reply-To: <cover.1499860838.git.jussi.kukkonen@intel.com>
References: <cover.1499860838.git.jussi.kukkonen@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jul 2017 09:37:26 -0700
Message-ID: <CAMKF1sqa0HmRTs3Zfe3h3oo4OxByN-dnNHD8HUX625s7vQ5dxQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] mesa: Improve Khronos header handling
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
X-List-Received-Date: Wed, 12 Jul 2017 16:37:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 12, 2017 at 5:11 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Andrea: can you please confirm if this fixes the issue with
> meta-raspberrypi (the second patch is just cosmetic)?
>
> This should fix mesa-gl and RPi userland conflict by not installing
> khrplatform.h in mesa-gl. I decided to do an actual mesa patch instead
> of a do_install_append() based on positive comments from upstream.
>
> As a side note: the header is now installed in libegl-mesa-dev which
> is not really correct. I'll see about fixing this in a later patch.
>

you might have to express dependencies on it explicitly, so it get included
into rootfs. but it looks a good solution for now.

> Cheers,
>   Jussi
>
> The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:
>
>   yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib jku/khr-headers
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/khr-headers
>
> Jussi Kukkonen (2):
>   mesa: Avoid installing khrplatfrom.h when not needed
>   mesa-gl: Clean recipe
>
>  ...ly-install-khrplatform.h-with-EGL-or-GLES.patch | 52 ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb       |  4 --
>  meta/recipes-graphics/mesa/mesa_17.1.4.bb          |  1 +
>  3 files changed, 53 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

