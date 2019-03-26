Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5474A6D548
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:06:38 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n11so10393438ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 04:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7w5ZROSwvbtHg6sYtP5C+BIdaUF+Yf5C7hUcB+hgMjs=;
	b=OPQOolncJbE9nZtrGoH47ggVw8NuUATp66yVyj1ts2KJOMfrLdAK1vBMSvc6XdOdzh
	PBLVnQX8w3t30OJyYjAh0bNFxXIoCFg3Ixl+Vn8vqwlqrKHej1ucQTaCJLtkB9Y+Pofb
	fYDLkl0SpTRHoTF+z0COBD33Io0tFNWfNh4AkAQVAeOG758/vOQ6vwO4sjHaOlAAgNY9
	rnFc68v4ld35xhjUHftG5A7ItOzr3h7OaBhhMIr99f/pevQ1n8ne6Oc3UvoNgUVbM/xN
	RyQLziKmJ8zlkg9XhBTKWmcwzoJDxkJ11tgKXhReKVOmna01qe2p6t1iGEPIanMCKHtT
	ybfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7w5ZROSwvbtHg6sYtP5C+BIdaUF+Yf5C7hUcB+hgMjs=;
	b=XJCNx5wj2CTdE0Tf6hKQTdM0i03m7+AeOqZkOT1+qM2sGwpD0aABDTmn+YCLuwYIJp
	Lawz09Q078WW4U6cExtSKV1Eb5r2LH4hK1ppojEWvghJUbbTldyJRkJXt9b/uB8pE3b+
	GR+4fzlWUHMiReWRPjGJuZd4N+kvitPHBt8IZeg3LcvPFsRsE2VeNRSNOnUtyJ7eoHUF
	b2yx1xk05BmvltzBbTFsl/zjfBYPfio/pfNgoJ4csAMOB2nvoGcZat7fBc/it3vIRJhw
	EBEV/3GpKiklcUrQkZ4JRmHe+B7nOR9eZgpJ5DvFnPXitCdNXpFjVJji9rTOYyp91Dw2
	0PoQ==
X-Gm-Message-State: APjAAAXOpda7ScYRMyWbocyDPzVKILRrmUgReqv+5ydW8DY+JeEt9uqI
	HvUTtJSUE0MTKyC9UQdcTTbDe0JsqKq+UuA6X83b3g==
X-Google-Smtp-Source: APXvYqyCepCspApp+w/xex3C+KVbHvlJ3PJ8i6xaENawfuTC3rW7y4a7iA5t0lEWF25bpJebNBQFWRlieF3lL4mATPA=
X-Received: by 2002:a6b:1495:: with SMTP id 143mr19487731iou.201.1553598398073;
	Tue, 26 Mar 2019 04:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama>
	<CAJTo0LaFy7s7gjzxxB9yBn6613wCz=Jp=LtVbz8UsDxk1Ls58A@mail.gmail.com>
	<20190326110158.GB1929@jama>
In-Reply-To: <20190326110158.GB1929@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2019 11:06:26 +0000
Message-ID: <CAJTo0LaMM7pSnivmdH=mSNdMfM-V6m=dcOm09XXAmtZtoQwc_Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 11:06:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2019 at 11:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> git fetcher fetches whatever SRCREV is defined in the recipe, no matter
> what PV says, I've seen enough recipe upgrades which just renamed the
> recipe to have new version in filename updating SRCREV and even claimed
> that the upgrade was properly tested, because nothing got broken :).
>
> In webOS we got a bit further and PV+SRCREV are defined in one variable
> WEBOS_VERSION and do_fetch qa check tests that the SRCREV points to
> matching annotated version tag in the component.

Agreed that is a genuine problem and is definitely something patchtest
should be catching these days.

> Next time someone needs to include few bugfixes from stable branch
> included just after the release, should he update the SRCREV or add them
> as .patch files?

Patches ideally, as we can pick them without other unintended changes.

> FWIW: in webOS we don't use any version in filename, most recipes are
> called just PN.bb and it works fine as well for us, less renames and
> version consistently defined inside the recipes.

That makes complete sense, PV in filename is pretty much legacy from
the old days, along with recipes split into a bb/inc where there's
only one recipe.

Ross

