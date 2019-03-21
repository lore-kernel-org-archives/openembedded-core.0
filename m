Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id EE4E07CF75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 18:48:06 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id z16so6389940qtn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AUjMVUu0X3hGdnCyoEchsTApuPfTu9kx74D2v4rMT88=;
	b=Y9frtPbfpZFMuN3lbOxwFqgvfyv7EtpbVHJmFtXgsmJmwVd5hauyxtbLVvcOKo8DHG
	rSrtSVcG3Dz7O9Ezfk5CsLpYO3mkgGmzqGWdHBvWxdU7U7LoWZ38ZMA4HUQuZAv3ahfc
	vZo2CIesEfh9FTYlBQI/sqBwuavRndFSeH3VaAFaFQPs13Lg4thCj/rs+O3oj7jI5933
	SK6I2M8XJeaR8cPU1sw+aZ2PbHVt+qkaHFPOGuXwiK/OsZeHYSCAkhrM91l09Cy6Q4Ti
	NoT9ij1C25rYAuexZOyJiPfWrJRSUIiLLlhD0KMq1WeyyLuF7kQV4lxPL8fmJghSXnDE
	NrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AUjMVUu0X3hGdnCyoEchsTApuPfTu9kx74D2v4rMT88=;
	b=YO5ctlOlvAdKhYR2ECQFLTP0aHLud0AtNxfMFtBM372mlKvA0sf6BMBsyDFdfAhO1P
	nnJ0lxMryqKL0P01xp1WTu+evdZPwP2JFyvGG7xqz+eiNpxBsZ/udfwvYiEYiABc7LLm
	8wVH3pHkG2/keT/l+ZBuh5cQKrxa2m0BiFmrF+tBafyCSHtMLIAljWkICICdNYecOPnx
	MYTD10pQRb9Y/IdfXBByFxEPEuROIsGfkv3ZqBXn0b6pMXwcwbrtBSZei9zquWxzJUjR
	uNNyuY7RH50bdCbLHZnrb3jfPTG2VVa8+b2xhf4QphWymEkdtQp/fDoe5jIWTiZIWyS/
	DbuQ==
X-Gm-Message-State: APjAAAU0dEZnW1ETvZmU13fQhdEzQKiJ1yhCIfB5H/w8Cf1tmwi9+ik+
	7EPu1j3Fx/FmApg8MuFHhWY9R79wl/bpf4dQ11dN6g==
X-Google-Smtp-Source: APXvYqyQMhie73UXVOxNo/nykf/wxV4cDuAnO5AV79DfZVlwW4GpZSBIV1dtKLAX2fowUDf3In/sNJgJaPBPyaabEHc=
X-Received: by 2002:a0c:b660:: with SMTP id q32mr4550887qvf.50.1553194087631; 
	Thu, 21 Mar 2019 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190320005410.254810-1-joe.slater@windriver.com>
	<20190320005410.254810-2-joe.slater@windriver.com>
In-Reply-To: <20190320005410.254810-2-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2019 11:47:41 -0700
Message-ID: <CAMKF1soyqhXnEH9vSqHPwu0PuC=aenaQoRB0B7qwP8N4mZ4_PA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: change tune to mips64r2
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
X-List-Received-Date: Thu, 21 Mar 2019 18:48:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 5:54 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Allows for mips32 multilib to be mips32r2, like qemumips.
>

This looks fine.

> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/conf/machine/qemumips64.conf | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
> index a166a10..970c0ce 100644
> --- a/meta/conf/machine/qemumips64.conf
> +++ b/meta/conf/machine/qemumips64.conf
> @@ -3,9 +3,11 @@
>  #@DESCRIPTION: mti-malta64-be
>
>  require conf/machine/include/qemu.inc
> -require conf/machine/include/tune-mips64.inc
> +require conf/machine/include/tune-mips64r2.inc
>  require conf/machine/include/qemuboot-mips.inc
>
> +QB_CPU = "-cpu MIPS64R2-generic"
> +
>  KERNEL_IMAGETYPE = "vmlinux"
>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

