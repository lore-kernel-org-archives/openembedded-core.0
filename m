Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id D2611798BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:38:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 203-v6so11460253ljj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m99wSPmqmwM73pM+CRxuyrZuAm5bQYKiJxqgI0Riows=;
	b=nyALU9T0Rb/nDp7tRGG870N4yWLefZ2N4zJ8tK3e+0tkIZFMmVi/rQs+6LHFoJmM7n
	qtbij5/ifr/VchmHgZGDITBSgPiIZXXed6UJEbUqRqNqNBEEEjTIMMQoZBrPReC4FZ5l
	J8xp67ztQLFLcDf5mEb98kd8JNYFK2devHEqAQYuCWyJU47E+lcM8SvwnYdLTyJnaTTU
	nBYnebxICfb/wpEMUQOGmxjEWjO9fwcmXdZd4viR26vgzwmeqngUa2/oOU4iP++XpO7V
	/82JgPBwYZ2Y5ya47yhe6EBxbKWvLMOz4wCxe0X0hUTb1jykfMlxb/zKwYAxjn/0DyPe
	RBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m99wSPmqmwM73pM+CRxuyrZuAm5bQYKiJxqgI0Riows=;
	b=VkYq6STJ7m7N8TX1AVAusixEKfjKSSCjYzhMTmLOdh6jRgsk6ufjrl/FabH2mgLTOB
	4AiQjO9dfYPCtxKwPUHn2tWhTRnFxD0VZrh7GLYtx2slkHTEDay7HZADLxLJRtc9DuMv
	GbL7+XIxTaWLT6XD30nONOx36+Smdf3u2u4n4xqbfah9XHWB5PXxb+IykKtIEv16tnBo
	bnOQqPjaMvz8QkvOFHc+wEHKUfPqcCQ0nusoJ/qsKTViPqOcFRocT+HmRgnb6Hupecs2
	qIj8kj2rtF/634Nev0t/1kdvajCUYXrdAD4NMyfHJF4SgdwhlAiTqkFrCXdbI8Zoixbr
	zDqg==
X-Gm-Message-State: APzg51CSuFJVTiGe2QtiD8FMVy9OZTTyu2pvt+jSMZs994PsiEc2JUjk
	gIHjOp+E7oqOB+uLNsyQ/FAZaFMAi2Vq1P8mlxg=
X-Google-Smtp-Source: ACcGV62YDOjTAwg4PkHT+Mo9JOBHQCHNnHUDK/6qxcoc3NGsq2y5mdDc+uHxkFO8bXS9KztNx1w9VHamxyo3LyBqxuc=
X-Received: by 2002:a2e:800e:: with SMTP id
	j14-v6mr1669784ljg.114.1537533483144; 
	Fri, 21 Sep 2018 05:38:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Fri, 21 Sep 2018 05:38:02
	-0700 (PDT)
In-Reply-To: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Sep 2018 08:38:02 -0400
Message-ID: <CADkTA4MowSWh3CnWU4YuRDYW-kDeqGXPnAVcYKtEAAKuZMWjMw@mail.gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Fri, 21 Sep 2018 12:38:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 21, 2018 at 7:49 AM, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
> This change enables kernel recipes to share files with other
> recipes. Firmware, modules and kernel-depmod are still not shared
> since according to git history they cause problems with multiarch,
> but all others are allowed. Examples of shared files are
> kernel version and recipe specific headers and scripts which
> are not needed by common linux-libc-headers to bootstrap glibc.
>
> For example, if a kernel recipe wants to share headers, it can do:
>
> PACKAGES =+ "${PN}-headers"
>
> do_install_append() {
>     install -d "${D}${includedir}/${PN}"
>     oe_runmake INSTALL_HDR_PATH="${D}${includedir}/${PN}" headers_install
> }

This is what I've always done in the past (and in fact, there's an
open Yocto bug
to track this), but I haven't actually needed to do what you are
modifying in the
bbclass itself.

If you call the sysroot stage routines directly in that
install_append, are you really
not seeing the files appear in the recipe's sysroot ?

Have you confirmed that we get a warning/error from bitbake about
conflicting files
from multiple recipes if someone doesn't know to use a custom path for their
headers ? That has always been the main concern about allowing something like
this.

Cheers,

Bruce

>
> FILES_${PN}-headers = "\
>                       ${includedir}/${PN}/* \
>                       "
>
> Users can find the headers from ${includedir}/${PN} and they don't conflict
> with the generic linux-libc-headers which are used to boostrap userspace.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/kernel.bbclass | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index bfb4243..acf9c2c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -487,10 +487,14 @@ do_shared_workdir () {
>         fi
>  }
>
> -# We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
> -sysroot_stage_all () {
> -       :
> -}
> +# We don't need to stage modules/firmware since those would clash with linux-firmware, but
> +# kernel recipes can still expose kernel version specific headers or scripts to userspace
> +# sysroot.
> +SYSROOT_DIRS_BLACKLIST_append += "\
> +    ${datadir}/kernel-depmod \
> +    ${base_libdir}/modules \
> +    ${base_libdir}/firmware \
> +"
>
>  KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

