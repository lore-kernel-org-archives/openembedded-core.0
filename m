Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2859F796E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:25:15 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id t39-v6so13160346qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aiPXa1icvGK9U//XI4RuFwLxhoSMO5s13m3q3wFfl38=;
	b=Tep7e5aG9zpchdbCx79ToH77myI1GYNeQlWwbdRXMkRJerchv6awdMycvWXRESD3/2
	8M1SOkdli12E8GfNC4pSyC9XsKboWPV6aPINW+mzSPWpcRvEISJf2NzX0FfGc3WF86zZ
	fw198f68AmyllJ7cbI0DOmSS867dQ8pAS4lJHI70HuA43Het6SsW7Ek31eXUQkF5UJBW
	PlNVmG7D5nbTKYSqkIE9M465+ybiFPxv7G/N6TGRdDMEN2ODXOVDmBY0a9Xjgge4sJP0
	0JMJyz91mkGjCGP+SytO8Y3Agc0NCS7U3WUMZftDfbTNtPxQ1Ie0AhDwUZVq8UxVe8Af
	uqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aiPXa1icvGK9U//XI4RuFwLxhoSMO5s13m3q3wFfl38=;
	b=Bt/LoGCeyAJIHvQKW3sL4muwQv9X0mZ2UtphF5ygbON/D+V5571mLdA5ib0gMqPMIN
	Q1m+aPucRrfXbtYsb770uTRN5yiExfgjr1ylFdpZgnmNohtwLUVGUL93sZ7UfX7NBas/
	evlnaqEqIgTJd9swae6+xkzp5o3nCIBl1aTgulb5IkgYqEhP6bKIwHALlekbDFenoVDF
	QURhRR/QjHERBI5EEF3pdbcNH1fqHnucl/1Pe+5krRKsrY7jG9Inz/T0TsqxrN3cbwLL
	EH/NFm1uNY2w7piLQxvEtJoibxqYfX1A4QgOiC/DzGlpDBh6ZlgHDtA9i4X4utnKRiEc
	xW9A==
X-Gm-Message-State: APzg51COsArA2Q3/Yu06VB7yglG6NTv/lDAR45xImkLvSMnD2ojZG9Vh
	yEMVgIEMHYmkjmyjY6A+DXt1nM5PcyTLAYO8o+I=
X-Google-Smtp-Source: ANB0VdbGsIYLxHmI650BdIvXdrrhMv9PDJdZRH6SeghOeK94+6cVPodxljlhirNWiHmLf+wWQBp0Ix54jy7ovu1WfNs=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr2955085qth.314.1536254715981;
	Thu, 06 Sep 2018 10:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180906150727.24915-1-ross.burton@intel.com>
In-Reply-To: <20180906150727.24915-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 10:24:48 -0700
Message-ID: <CAMKF1so6CnZzfYsNDymQbH+R_v60XCgEJfuDQ2jcRf7PqY0caQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: disable LLVM on x86
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
X-List-Received-Date: Thu, 06 Sep 2018 17:25:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 8:07 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Whilst turning on the LLVM drivers is a honourable goal, the performance impact
> is *huge*.  Instead let specific BSPs turn it on as required.
>

Can we turn this into a variable so we can add it in a bbappend ?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index dd626d9f00c..5afd0db4b7d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -48,9 +48,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
>                    "
>
> -PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
> -PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
> -
>  # "gbm" requires "dri", "opengl"
>  PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

