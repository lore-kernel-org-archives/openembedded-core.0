Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 07BF961502
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 02:12:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m13so22942798edb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 18:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zos8C8sHp0AqfqxWjywNxqFTxAhQPBOvFWtZrIrMw+I=;
	b=Ny8CTiEn0SF9OXL3rFJ7h4bT11mVEKXGU3dj6lRzL33R6J8UL+onetoKdYUWmFlMQi
	T0hp1rXo4E/TayUc312Q76KMTR1YHJ4xRtZ5Uz+HAhD2xCx/ll50rxHZDj033O7DfNf5
	hIcR5W7t36v/+QnGzV58z3OyS+1vNjrruraGc+ETCmR3bPdEKvMSUPvCMOLpcsX5/Mji
	W8ccBa1jeMTIgDDpCEcBYX/sCgNzsv0PlNCgiDdCHF0bfcOkJbSad+XQ51Y/KIbfwKQp
	CFmpy/GacPXQJX4/pA5z1dLMGRwJvBPCDS3iYD6WDN+Owm8fLpi4N8mK/Tmec1VnSAAm
	wvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zos8C8sHp0AqfqxWjywNxqFTxAhQPBOvFWtZrIrMw+I=;
	b=tOVNtasrf6Kdq6Jb5PC7ZHl59x3d4yemtWq7hnLT4G0FD2Td2ikPiz8M+Pf/n28ocF
	VSXNasrjbADk9Jtu7RSj/Ys63Glyo4YCOVsNXVXawjxLYTOdP03nZbLMMBUA9SVgUFdV
	b7lv3r+hNtyvXeAP+Q2uZKgw8yP/G9HbUwH/sgZxXgBc7qQdjHLTSlopk92Lla6X3DAM
	D3XOP9h+/ITbyl6NlK5KQMgpmI3VFjFg8y9OGO782J8+IN1/m8NNhGtYc1ktnFfnHZ1k
	Hycsym2rTkoDwXVWkhLmhHHvuQhffMnWG6ol/keODPLNVOXrQy4pOPMhr4fkyzE5i52s
	ycXw==
X-Gm-Message-State: APjAAAVKwIF39PAG35S8sQmSQ+xdSvzW/A/y5oCNeIW1y39GWTTEmdvJ
	uULXYuERkgSX5SJuVAOPeqHD1JAQu2B4orAEnWDqR83V
X-Google-Smtp-Source: APXvYqz5Cu03P2onbpxxjuPEQrbhNA+UsilNoAeBBBRcBTbIrK6LntZQtCG3rzjsCuTxePf7+uDquwAFrA+CTpdt/84=
X-Received: by 2002:a05:6402:1a4e:: with SMTP id
	bf14mr15888637edb.365.1581991967561; 
	Mon, 17 Feb 2020 18:12:47 -0800 (PST)
MIME-Version: 1.0
References: <1581991613-30949-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1581991613-30949-1-git-send-email-li.zhou@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Feb 2020 21:12:36 -0500
Message-ID: <CADkTA4Oo=uvRps0UUcbrk+eZDhaN3Fi8M-RDcdKuLz-zAOGM3A@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix missing generated files from the packet
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
X-List-Received-Date: Tue, 18 Feb 2020 02:12:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 9:07 PM Li Zhou <li.zhou@windriver.com> wrote:
>
> The file arch/arm/include/generated/asm/unistd-nr.h is needed by some
> external kernel module. Error occurs when building the module with
> the SDK.
>
> Add arch/${ARCH}/include/generated dir and files under it to
> kernel-devsrc package to solve this issue.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index b6f2dbc..8621fe1 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -108,6 +108,12 @@ do_install() {
>         fi
>
>         cp -a include $kerneldir/build/include
> +
> +       if [ -d arch/${ARCH}/include/generated ]; then
> +           mkdir -p $kerneldir/build/arch/${ARCH}/include
> +           cp -r arch/${ARCH}/include/generated $kerneldir/build/arch/${ARCH}/include
> +       fi

This is just papering over the real problem.

Anything that is generated, should be regenerated when the headers are
used/prepared.

What is missing and/or why isn't that happening with this ?

Bruce

> +
>      )
>
>      # now grab the chunks from the source tree that we need
> --
> 1.9.1
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

