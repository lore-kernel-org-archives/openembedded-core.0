Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 81BAD77DE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:20:34 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id w126-v6so56841622oie.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LbaxObjGvMS6rTHYu3MZSB9OmeNTwK5sxaJRS2GL+9I=;
	b=kJ4+ucI6+497cRInCk1Yfy/ey4NNB1HsdsRQpIKl+i7WC/a45lnalmbpuTlyDaPEeX
	yLuE7BIGJZ4u507qvAG8zYkIMLJw91gQGG1Etm0xbncVlJXbDTA/H9asqFCzDJ5B7vqx
	ja9LsXzNVqSziF2dfsqHh48vGtBhGQZQsrk6+RU73/12EnkrKfyXhuAO6L1JdW+x7sGI
	vJ21c0hzJQ943rPWNwpCxP9J2/QlZ9IrSoAFnfs/k+MMZQe7CL/JXAlF/Jn0o1631Ngx
	0Yb5XFuVBu6m/TZaHChMYeiG73yxw0ZeS6N1h1hHg6nW8oPiOrL3bA491wQimBkp/3bt
	SjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LbaxObjGvMS6rTHYu3MZSB9OmeNTwK5sxaJRS2GL+9I=;
	b=bK+17rac06x71FWgqwELvCZtEsgSK81mvYYQiDWTURVh8Y1jpNzWBMBQWs7M7r0S44
	2zmwNp4BwITkZBma/UWEu8mCGH8FwniC4zdSu+3M9C/D0J3E0I/ziZgOJnVq+c1msvjg
	1cGQLcLm1dvuObRJ4wtWNaFxJmV6362eiJLT/P6Q2T/dcEjx9B/4HMyNtFs/CuhsUa6H
	xc51ibDUwMOK4mgTzRxAedfSx67KU/3X8hUOC+Y2MIEh64FB3qTuEBdDffppX2cMAi06
	mgQJe0mopsKiLodjS8WpnFvW4gq8ocmma3MPYwTe5JQoKD+/wuaUDWAVExgSQ3ydI2CG
	Yi3Q==
X-Gm-Message-State: AOUpUlGY80Tt+/qVM9heOWmGu0uDgAEP+q4Z7zq8Zn1kh3y9s+qHMwZK
	LrES0F5ymkzPeg4eAQEZnPiQre1ZjX5RuT8+LSfwUA==
X-Google-Smtp-Source: AAOMgpdlkoRCdFKMHNfbPDmz2nihbRb7dQkADwmtZLmG/Xog2TF8PBkoQ4a55gfIKlAvWvrXXw6wwgMYWp217FhmuD0=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr3292324oia.170.1531412435522; 
	Thu, 12 Jul 2018 09:20:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:20:14
	-0700 (PDT)
In-Reply-To: <CAFeBWL6aUFRraua-xyf49HYvHq=BGMNcZrmo1k6GtpvCpYETSg@mail.gmail.com>
References: <CAFeBWL6aUFRraua-xyf49HYvHq=BGMNcZrmo1k6GtpvCpYETSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 17:20:14 +0100
Message-ID: <CAJTo0LYeM6ob7-d+FxNeFgLszvhry0=9Tcb90a-1vU+PXjFppQ@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using IMAGE_INSTALL_remove and PNBLACKLIST
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
X-List-Received-Date: Thu, 12 Jul 2018 16:20:34 -0000
Content-Type: text/plain; charset="UTF-8"

Write your own custom image which doesn't include
packagegroup-arago-tisdk-addons?

Ross

On 12 July 2018 at 16:19, Adam Lee <adam.yh.lee@gmail.com> wrote:
> I am attempting to exclude a package from my system image with this in my
> local.conf:
>
> IMAGE_INSTALL_remove += "tiovx-app-host-examples"
> IMAGE_INSTALL_remove += "tiovx-lib-host"
> IMAGE_INSTALL_remove += "tiovx-app-host"
>
> PNBLACKLIST[tiovx-lib-host] = "Build break"
> PNBLACKLIST[tiovx-app-host] = "Build break"
> PNBLACKLIST[tiovx-app-host-examples] = "Build break"
>
> My build is still failing unfortunately:
>
> ERROR: Nothing RPROVIDES 'tiovx-app-host-examples' (but
> /home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'tiovx-app-host-examples' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['tiovx-app-host-examples']
> ERROR: Required build target 'packagegroup-arago-tisdk-addons' has no
> buildable providers.
> Missing or unbuildable dependency chain was:
> ['packagegroup-arago-tisdk-addons', 'tiovx-app-host-examples']
>
> Is there something else I have to do to eliminate a package that is runtime
> dependent? Thoughts?
>
> Adam
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

