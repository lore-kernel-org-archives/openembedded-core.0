Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T4Faz-0002X5-5Z
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:24:01 +0200
Received: by qadc11 with SMTP id c11so43235qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=saMC1hdRfMGwz/D7s0aq54W5CRhw5tYPxUXBCGdq3IA=;
	b=uWeVr041uucuGmjpBgrEJzY9zKLI1qgYUXQnL9IkzJUhjYZaK0uxIQ2XwII7E9RZvd
	mn8VZW3jAPwMcHWH/4ZI+dYw91isefvdT+SLxjZdfO2l0HM48lOLe53zjSalpaYrWD/5
	YuA3dlw0aJCXbq9xO69EMQV3PQ5DpZ9aY7l9LWJH64a5fBejVq7dEFT6Pw0v5/gzr+eV
	nyX0NPptPzg8xbqzQjUWZDYDlqbb0+k4xHTOlJLcujZLaNDWhi9rOVxVg2HqvuFvzwLc
	8db1qoNdRoqZ8mRltEoYalE2F++MaCOjpRQkoF2PwoUcaBHvBq2zMzwcCjvajRRO39wM
	M47Q==
MIME-Version: 1.0
Received: by 10.229.136.82 with SMTP id q18mr17087403qct.108.1345659115323;
	Wed, 22 Aug 2012 11:11:55 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 22 Aug 2012 11:11:55 -0700 (PDT)
In-Reply-To: <1345658390-19692-2-git-send-email-raj.khem@gmail.com>
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
	<1345658390-19692-2-git-send-email-raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 14:11:55 -0400
Message-ID: <CADkTA4MdBtk2aQHTdTt2e7w1ubi4yDOoX_B4_DcjDzXyY5xZ2A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] linux-yocto: Remove parens from COMPATIBLE_MACHINE regexp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 18:24:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 22, 2012 at 1:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This helps in appending to this regexp from bbappends
> coming from other layers who want to leverage linux-yocto
> with minimum tweaks by using a standard prefefined machine
> from linux-yocto

Fine with me.

We had a long winded discussion over a year ago about how the parens
could be present, and still allow us to easily append, but my search
didn't turn it up.

I can't see where this would cause a problem (others may though), so

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce


>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> index f5e812e..4d19664 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -26,7 +26,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;b
>
>  SRC_URI += "file://noslang.patch"
>
> -COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
> +COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>
>  # Functionality flags
>  KERNEL_FEATURES = "features/netfilter"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> index b254251..c3fb252 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> @@ -26,7 +26,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;b
>
>  SRC_URI += "file://noslang.patch"
>
> -COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
> +COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>
>  # Functionality flags
>  KERNEL_FEATURES="features/netfilter"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 8ac2402..691d789 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -22,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "meta"
>
> -COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
> +COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>
>  # Functionality flags
>  KERNEL_REVISION_CHECKING=""
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


