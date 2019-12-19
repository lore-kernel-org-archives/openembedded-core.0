Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB4D7FD6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 18:45:22 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b15so5086849lfc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8UVFLZ7/ApeQkLxV0wSJPP5b7sqBV/CIj2GknjRJ+Wc=;
	b=VeQTveLPI/UYG/IocWPzn0eszdxrIZpuA9z8mwSmIGgMAUQv+8FIW23x195nAFJHFC
	bYruhEHcRld5a0Yiq4PjFi60JkRbQo8ttJqcWG6OdqtcznNi83QKBNM/WKOE5yvax7gY
	cGtKO6/6iJVO9iC5Ra0K/SoKC20rpsUUfBCNlFnq2w5SPfEAM663sFSE5U0w+fnI461k
	oE2So5YvawRsA2y8sLCLwm1dOZeAzV8EaRVsM3uH6KuYSBwg2iDKs0L2VqFvotwhWYD9
	ts6qLiEjgISfOapw5APnNF29yZ9M5sFtSrRI9OwCm9gT2uPmJeDXPoPkjNvwK6gA8sV4
	HBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8UVFLZ7/ApeQkLxV0wSJPP5b7sqBV/CIj2GknjRJ+Wc=;
	b=qPsWF5hk3FP+38PwhWQXR3PUNvMTqCYXOLSc5LBD77DO2Vv4tuSIveUJJMKP7lUHfD
	K1YuxCiSG4GB2BXIyWIswtdX+8ZcbaolCm0xKuagXk+BcUV3TOb7sR1RmDjuXmUea6Kf
	X612a5ug3gxy9Fj4u9KRSdz3gvb9oNr6eAam78OI9Mycxl1V83DlOeJlLIJSZ/aLsLeC
	RjZqkmUyavFB0vAyzq4he/RUW/oOnfFQy0OVEL1d6w2uV3yOgORfuBbUotZ1bOVjqrrR
	ByrsDWPNoE7mOqSxwr7C827AoocGlvA5deR28V54J7kpDXGuMJ6mBv2VK8Eq6MHA5NZJ
	PX/Q==
X-Gm-Message-State: APjAAAU62KXTtj4mrLS4cdz9b75n9e0CTxcgO83RYJ1eYeREmiE28LNa
	r5RAITvdUJsDLUeSwHtUCkBph6HtG1FZXNlmgU/cL2Ly
X-Google-Smtp-Source: APXvYqwZq9BUk1YTHs3LFJNX/ZefoXLd07tv4EwNWfVs5QqN7M1BSgW+Bmnbv2kl0VEwhEtTvm7Wcnxs1I4FcNyiIAE=
X-Received: by 2002:a19:c80a:: with SMTP id y10mr6313126lff.177.1576781122853; 
	Thu, 19 Dec 2019 10:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
In-Reply-To: <20191219183759.3122153-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Dec 2019 13:45:11 -0500
Message-ID: <CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Apply patches from BSP
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
X-List-Received-Date: Thu, 19 Dec 2019 18:45:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> phases") appears to have inadvertently broken support for BSP .scc files
> to provide patches for the kernel. Restore this behavior by adding
> $bsp_definition to the list of files processed for patches.
> Additionally, the logic can be simplified now that the same elements are
> used for both configuration fragments and patches

Unfortunately no, we can't do this.

It would reapply all the patches that are already integrated into the
tree, and that distinction is the key part of that change.

What exactly are you trying to do ? Define a userspace BSP ? If so,
there are examples of this and I can dig them up and send them along.

Bruce

>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index ed9bcfa57c..08c02a8f50 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -193,12 +193,9 @@ do_kernel_metadata() {
>                 if [ $? -ne 0 ]; then
>                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>                 fi
> -       fi
>
> -       # run2: only generate patches for elements that have been passed on the SRC_URI
> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> -       if [ -n "${elements}" ]; then
> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> +               # run2: generate patches
> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>                 if [ $? -ne 0 ]; then
>                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>                 fi
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

