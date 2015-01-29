Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 46D5B60024
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 09:53:54 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id a141so25100459oig.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 01:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Au5iWn2Vu1bmCmt18m//RLaVMz0p0jx87Ow6EeLFQ/k=;
	b=SyQy1U23LLYNfBP6CrzrM8ANFrCwKTlMTo5EQnq5mXjSySpMfCOOcJuXdwjlg5gp0x
	2mgX5aitAFDD+SNHK+E/hRCuBCgSomBq3uUr3E3ANqLau3QTRNHYWsxiEE1+nq/6ky9x
	9yPHCeap8nK/Fs5Idu7n/CGrAD/djyjq7NXOTt32v5azECL+2hHOzZ3ZgAVELxKgQDOl
	+6YPpe1De+31lLnZjKL2CWiZRxvd7kpcVmX6WuNIm5b6vY1qcKQ92Gj0yJUy4ft2wAyg
	kyMBHK5EBnjX5ND0Ynpj+kU7FZZTCQEMk7rdz/YnAPWq34RiiKF1mHBjx5PGebW6GEJg
	ve9A==
X-Gm-Message-State: ALoCoQlddXLloNE0Eaa6OMWXOUTC+q6jLtZZ2zvoUUFZr+o2s3kxGu4meUr1G24WOay0rcznOtg4
X-Received: by 10.182.22.198 with SMTP id g6mr5124555obf.16.1422525235709;
	Thu, 29 Jan 2015 01:53:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Thu, 29 Jan 2015 01:53:35 -0800 (PST)
In-Reply-To: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 29 Jan 2015 10:53:35 +0100
Message-ID: <CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
To: Pengyu Ma <pengyu.ma@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Thu, 29 Jan 2015 09:54:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 28, 2015 at 9:57 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_10.4.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_10.4.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_10.3.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa_10.3.4.bb
> rename to meta/recipes-graphics/mesa/mesa_10.4.0.bb

why not 10.4.3 directly, instead?


> index 50092c9..7d3723e 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.3.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
> @@ -2,8 +2,8 @@ require ${BPN}.inc
>
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
>
> -SRC_URI[md5sum] = "fa0558a3d02c2bb8c208c030ccdc992e"
> -SRC_URI[sha256sum] = "e6373913142338d10515daf619d659433bfd2989988198930c13b0945a15e98a"
> +SRC_URI[md5sum] = "b7b37117eecbdfaaf3075acfb063d5a3"
> +SRC_URI[sha256sum] = "98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219"
>
>  S = "${WORKDIR}/Mesa-${PV}"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
> index b046ae2..e554ff4 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -4,8 +4,8 @@ DEFAULT_PREFERENCE = "-1"
>
>  LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
>
> -SRCREV = "c7b9a2e38a3e471562b50dab8be65db8ac6819f8"
> -PV = "10.3.4+git${SRCPV}"
> +SRCREV = "f70e4d4afd16e66506ce3b055edb3b71b1464890"
> +PV = "10.4.3+git${SRCPV}"

that's the commit for 10.4.3 tag, this isn't consistent with the
change you did in the non _git recipe.

