Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id B5DA878AE3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 01:16:48 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id g6-v6so10378072lfb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 18:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c+Ri0/u5xZ3KbM4rKAKv5YkusxC9dcavQ7YWx9BI+44=;
	b=TcDCqLZbIMDc0eYIaYxCpoRFB0VROJkb1jMurZOm9/j0J+cTbiAicM6mkzB4MODxgH
	kbNg31XsJdWvadyk+0s6N1z4E8XctRFoYYiACZ7gFIGpXiHARrR16DQ8hnJyWN0Rduzu
	u6yDiQFHCLUNcjkn19y2A66Jbh/6couiw6X3iWz2S2Yyoncb842CqFMw9mazPpBqf/cA
	iwJF/pm+7KuZI3zqroctxdrnM7Vl9sMtZU+0QAS7R2glybfUUVTgeHNTr/PjlwZhlD7D
	kH/IyiFUJIjR828XOYDKiiCZU+dodbJUR0oybQsNElHoDVcDzZAwQMsqkHPI2POYD1SO
	0mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c+Ri0/u5xZ3KbM4rKAKv5YkusxC9dcavQ7YWx9BI+44=;
	b=DQoeX99U9FA/Ap7mS10jeKQzQD+Lr1/aGJxhanCdMD/8vTntvlRg3OAKNJ7RwAfCXF
	pZFCbZe62FsTwGkB/nJ1pmTDkpa8xHFdCL+KciQgQp2t7run4vX6unyM315US5jVNzzs
	plUq7bGcPbHggpm5wG6RuxbYYSEg9034R1sk1hUQamM78Ukl2eSkFzTmC36ScYDdg+p9
	cOr4CgLbjeonmOee3jKNaVjEIEerXBGWElKWzDgGE12zp+jHF7Ddf3+IL02JXJIRdGAp
	TNz9xVgXEPkVCRJD/jqzTa67zzN6Bv16ZWHdQZGawN0IidG712ZaEVJiL00A6XhYGX8P
	cxnA==
X-Gm-Message-State: AOUpUlGZjL2RlJ9F9mjLHYNXCwqmQYG6Yx1GftPwAGheNsmjxO1+vnIk
	ylCvlkRbggqpLoKXR5goRkXB2mpCEKlkqvyF3BM=
X-Google-Smtp-Source: AAOMgpfHZKOdGOCwmJDvI1rknkmgespxQEx0dt8O52+O1QVNn4qaZIt0GUq6cNZKTIXHBZqi2BfdFhxfzyT+up8RoQU=
X-Received: by 2002:a19:cb44:: with SMTP id
	b65-v6mr13111303lfg.12.1533604608981; 
	Mon, 06 Aug 2018 18:16:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 18:16:48 -0700 (PDT)
In-Reply-To: <1533572407-3066-3-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
	<1533572407-3066-3-git-send-email-akuster808@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Aug 2018 22:16:48 -0300
Message-ID: <CADkTA4PcNUgg4G2E=ehxdZhwQuoSUAk-z65iYtGSuQbJsoF20g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] linux-yocto/4.4: update to 4.4.141
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
X-List-Received-Date: Tue, 07 Aug 2018 01:16:49 -0000
Content-Type: text/plain; charset="UTF-8"

Don't apply any of the linux-yocto SRCREVs to master, only grab these
for -stable branches that may need them.

I have a complete series that I'll send shortly that drops kernels,
introduces 4.18 and updates all the active kernels in master.

Cheers,

Bruce

On Mon, Aug 6, 2018 at 1:20 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index 97c16d5..094e4fb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "400c0f39b954cd8fffdf53e6ec97852b73fea7af"
> -SRCREV_machine_qemuarm64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
> -SRCREV_machine_qemumips ?= "fb03a9472367b6c177729ac631326aafd5d17c92"
> -SRCREV_machine_qemuppc ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
> -SRCREV_machine_qemux86 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
> -SRCREV_machine_qemux86-64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
> -SRCREV_machine_qemumips64 ?= "26b8ba186a6d39728fc1510bd2264110c75842f5"
> -SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
> -SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
> +SRCREV_machine_qemuarm ?= "acf04f09f4f2d2b568618b20171cf45afd6b2e28"
> +SRCREV_machine_qemuarm64 ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
> +SRCREV_machine_qemumips ?= "df50bef6ecd2df365c203cc400920f6560e26a8c"
> +SRCREV_machine_qemuppc ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
> +SRCREV_machine_qemux86 ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
> +SRCREV_machine_qemux86-64 ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
> +SRCREV_machine_qemumips64 ?= "27acba48690468efe0a888fcd68493c82658c7c2"
> +SRCREV_machine ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
> +SRCREV_meta ?= "b41a36ffe53f73c86a0f3672d32b5ebec59ab15e"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
>
> -LINUX_VERSION ?= "4.4.113"
> +LINUX_VERSION ?= "4.4.141"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

