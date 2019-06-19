Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 742787E701
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 01:15:28 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y198so10720825lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 18:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vmGqEaetF4lzoHHJiHXdvC4mrXxbOHrDJHGoyawT+Xk=;
	b=DU0Oh1oO/rRA2GKf8pnNwWumd23PLFy1m3VHZrfWXOVp+ruMcVgGulSISBQkcHFYLU
	zaCIDMlbBtgXBdYtjBVoudBg6zF97mSYA5FIwdCxRP7yTiXaRYJEEffU86/1dw4mfpZE
	ix5nqFYqDd00ZRdEOk7D85touHv1DAolsYzmRev2hTg2u6J38Kfb99bDuBlQwe2DwToh
	pUEoEcRGcU+zqi+ZE/y0wiDMi49IjVF1VdSH/r2lZ6thWZj/b0h5vEc/RXSWf1TrQGpo
	7wZyVn7mDhA4cQxwKmhgU6ceYjoBOCqOVKOFVz6t22mEDJ3UONmtmULdpzU7FOFriF/E
	bWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vmGqEaetF4lzoHHJiHXdvC4mrXxbOHrDJHGoyawT+Xk=;
	b=QvPT5uT1ysaEcYx2fb0+rslr9S23KGRDMpzVTjQVpK6rhcQQGpkyKpRMf5jQXQvBEz
	whGaWxMvoPXlZQ1UE/HdvbgpNG8dD2fGSECwjiov7pXQHKLRIcO03D38cpNFJHDmjLyk
	BOyoE79/eonRqXH8W5aeq1EF2/FSnEdIDnntkZVCZn7y22a1d15rqh6ykL910kb6CQxp
	qFcwuu0REhgkCuERrPgYEqozcz+GKjeDBsU+5HhLmlnG2JsG1TUS9m43vyWcf1whA6iD
	gRo4voma+J5t8nAO0jXYIMLKJ6Kzv1E9C3ubWWcGlnL1LGUKU6bo3cZ8EDzjpONxUPpa
	S+1w==
X-Gm-Message-State: APjAAAWCm/5YxiYpOYQvzH7s7LJUSjdzuVC9F++a1sffkFxRTXSj2biG
	Bnzxoyvdx5VnQGLs9Rdr74kMI/RPvyIWj2YuMH0=
X-Google-Smtp-Source: APXvYqzc77Dr+Dnj6s4R/8tRGAGDeIqObQlCV8hRbUPsoevjUdPPimBCllRYaYWkAFYm35qht7HVTdLQ6KL0N9wtFaI=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr60631117lfi.140.1560906928936;
	Tue, 18 Jun 2019 18:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190619005541.17834-1-alistair.francis@wdc.com>
	<20190619005541.17834-3-alistair.francis@wdc.com>
In-Reply-To: <20190619005541.17834-3-alistair.francis@wdc.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Jun 2019 21:15:17 -0400
Message-ID: <CADkTA4MZFFzPjJFgPJ=8y2eMmOpCo3XnNPTwm7i3Hnvq4Z6wvg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/4] linux-yocto: Mark qemuriscv64 as compatible
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
X-List-Received-Date: Wed, 19 Jun 2019 01:15:28 -0000
Content-Type: text/plain; charset="UTF-8"

Looks good. Thanks for the v2, that clarifies things!

RP: I'll pull this into my queue, but not a big deal if it gets merged
otherwise. I'll have a new pull request out in a day or so.

Bruce

On Tue, Jun 18, 2019 at 8:58 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index 8aec315084..a8ced4866f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -7,6 +7,7 @@ KBRANCH_qemuarm  ?= "v5.0/standard/arm-versatile-926ejs"
>  KBRANCH_qemuarm64 ?= "v5.0/standard/qemuarm64"
>  KBRANCH_qemumips ?= "v5.0/standard/mti-malta32"
>  KBRANCH_qemuppc  ?= "v5.0/standard/qemuppc"
> +KBRANCH_qemuriscv64  ?= "v5.0/standard/base"
>  KBRANCH_qemux86  ?= "v5.0/standard/base"
>  KBRANCH_qemux86-64 ?= "v5.0/standard/base"
>  KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
> @@ -15,6 +16,7 @@ SRCREV_machine_qemuarm ?= "9161b2fa2f1cec0ba02976c389c788445858e0de"
>  SRCREV_machine_qemuarm64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>  SRCREV_machine_qemumips ?= "7de9b8f0db98e51a666477c8e2b64f1964b45410"
>  SRCREV_machine_qemuppc ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>  SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>  SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>  SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
> @@ -41,7 +43,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
> -COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> --
> 2.22.0
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

