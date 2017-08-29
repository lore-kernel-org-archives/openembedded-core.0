Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B702278291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 17:48:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x189so4474287wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 10:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E/ado6CLZ2LFEUVMFzErF1uPseSCYDUXqsKXq+zRUAE=;
	b=OgBm3WlmRsWVXZO1jcaYDh0l/4M5CVfWgwFqvtqt8v2663iQZhM6v+i/XVa2Kp10Cj
	elMUwuzZ1OpR9OK19ufXyG5th48nB/NX7NJ7LqJnHaxhU6gUzPpVpk6GRQCeyfMxTv39
	TY5tDVHy/tpgohs2wJDwsxyuyY6K54dLCFk8pAD54fO2bF20pUR12zDroatmYJuvoMZM
	zOCXS9zVQmdlBg6ZXfVzVKxUpNYoF1jk2gMOfyfAMBx98s1pNeWBGjeXEUIzJW2TCRrD
	OVNPADKz5tNu+cQCkRiQyHQ7/7hmrxG3SlUWuB05KCwkYgVivjfqymbLL54hgv058MAW
	wW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E/ado6CLZ2LFEUVMFzErF1uPseSCYDUXqsKXq+zRUAE=;
	b=Y8YCxz3QIPHufKRpm9BB03EZva3muGARXt1r7fb48VwIHbLVundwiHq8W7cz8vVYbG
	kQc/vWDM+GAuOSiN8ajS/2H/rLygTrv//PXoKKZsgBodACnPVrucq4H1vv9Jg6KqQxq3
	ZHMyHgpyqceBbe2eKABvArAjb3amPOjw5u1vX0FU0OZJ4Q8gGPPB0wXzxgLH5vA3fmgL
	GOJl/JAxRlsIpAeRDlFLsRrHzBVossql6/GgcAdmmeNeYdialvgO/n5tYAXyUa/1eESy
	EIxAcbj/zbtWcaJu6k0+ehQDlRe3Tf82dlmjTdJzGc+jiRgjztYImNadAczHgvbosuSR
	KxDw==
X-Gm-Message-State: AHYfb5iYLMfEuk0vk1nFQ3mRXgfxVYcFVMi8GC3sBWvJ4mJxLCb8jNUy
	LFzSQJVnPTkdlQXNrfzT027WJ/TmdonB
X-Received: by 10.28.185.12 with SMTP id j12mr168291wmf.100.1504028925261;
	Tue, 29 Aug 2017 10:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.147 with HTTP; Tue, 29 Aug 2017 10:48:44 -0700 (PDT)
In-Reply-To: <20170827214858.19410-1-otavio@ossystems.com.br>
References: <20170827214858.19410-1-otavio@ossystems.com.br>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 Aug 2017 10:48:44 -0700
Message-ID: <CAJ86T=UG+eJC0EQk8-ONgLn1bQCA4uoBZw+5EdU6Cp+F3SexDw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Tue, 29 Aug 2017 17:48:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2017 at 2:48 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> There is no COMPATIBLE_HOST in the recipe neither it makes sense for
> this to be machine specific.
>
> Possibly, initramfs-framework's based modules may be machine specific
> but if there is the case they can just RDEPENDS on
> initramfs-framework-base and provide the specific module as another
> recipe.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v3:
> - Add the new dependencies to the hash whitelist
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 9d69a696f1..94bf1756e3 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -3,12 +3,10 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
>
> -PR = "r2"
> +PR = "r3"
> +
> +inherit allarch
>
> -# While the packages maybe an allarch due to it being a
> -# simple script, reality is that it is Host specific based
> -# on the COMPATIBLE_HOST below, which needs to take precedence
> -#inherit allarch
>  INHIBIT_DEFAULT_DEPS = "1"

The allarch class sets INHIBIT_DEFAULT_DEPS, so that line could be removed.

>  SRC_URI = "file://init \
> --
> 2.14.1

