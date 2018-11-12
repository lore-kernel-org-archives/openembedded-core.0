Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 156F16C29E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 17:43:31 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d135so14750437qkc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 09:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EV8yva04v6uAMeBvOk3InKdB3BR3kWzFxcz24N6hqJk=;
	b=UFBD9anJMtYNuz9m2zOrnzuc2o1QvyZLZ+I7jaJEwBnQzeQkf4RjjDvQcPPH7LvHp2
	xnVKjTm+7HqzivfM8tJsNFHRmbQAvqQae5r2CHEZt11lktzU4FJwJ5UcSKlwY9W3mbOC
	+5pyrdfBr65JzAYBOjynxpY9/SkJqbfKy6YX/OBDs6a3qioWfoBWWUH5opERbUM4s78B
	TIPXpRKRMLzaLbTrqNETfrZ5EPBc9bMPpTa7wQ3wiZVFT8kq7SkanMnil2N9kydpbvUU
	Mi2Q1Aaj6s7oZmrfW5CiRBUv8p+qjVuI5vXq4qKvzZjgEAQcsudlNtXfJNofqKQ7MdQW
	SULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EV8yva04v6uAMeBvOk3InKdB3BR3kWzFxcz24N6hqJk=;
	b=n790b7o6SvyRb50Va/NtdkkoIO9OtoukjVxDtHM67oiV1lqsah5nDOshD1NeXMcuh/
	Nr2B5x7KtM8co7PetRWd46n8AWLw4pzzbgckeMpUe52hskDcOpl274+7Oi+4dZ4DRewj
	OJtGnPtXfJ8GN7RTNMXlBv+mPS8pPX+cdEEzn8v4B53z9P23Q8vRmcPlTAzOy3KnHkWv
	FIs6qQRpRhg5oGb7gTSrCisYw4Ku2AIJlJ39sJ3Gt6HcjPtCcuxCnG/zx63LzsMBYxIW
	WVapzCQ9UxkLGE+obrIlNZysnhYvjjYZVE/f3zituQbBLh0ulSwvkL4VGA1c1mm1oasr
	WC1Q==
X-Gm-Message-State: AGRZ1gLL7zCCBNCzcdcLlKPQnDdnWXXlP5CN0OuceemDj1A4+3lQvg2S
	8ooJavjeANy8RUfI13w0qhE6uTMEb3XttLGdgHHMK03l
X-Google-Smtp-Source: AJdET5cZxyB1Tq9WU3aIT3x5EiTD9nROEbtpdcTRMTTM/e1/WuQT0OoeNSYF04Nnlfb0/2qx6R/4xPPRGm3nHN8G5p4=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr1757140qkf.223.1542044612819; 
	Mon, 12 Nov 2018 09:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20181112092742.123289-1-mingli.yu@windriver.com>
In-Reply-To: <20181112092742.123289-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Nov 2018 09:43:06 -0800
Message-ID: <CAMKF1sqep_O3KB5H+THsR1+f8Xd2WfqBMDR2uHn+q8iwU+aLtA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: Disable asm on x86
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
X-List-Received-Date: Mon, 12 Nov 2018 17:43:32 -0000
Content-Type: text/plain; charset="UTF-8"

LGTM
On Mon, Nov 12, 2018 at 1:27 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The previous commit as below only fixes the
> textrel issue with musl on x86, update it also to
> fix the issue such as with glibc on x86.
> 74ea4f280c1 x264: Disable asm on musl/x86
>
> [YOCTO #11770]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-multimedia/x264/x264_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
> index 4174cb28196..842ea2547c3 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>  inherit lib_package pkgconfig perlnative
>
>  X264_DISABLE_ASM = ""
> -X264_DISABLE_ASM_x86_libc-musl = "--disable-asm"
> +X264_DISABLE_ASM_x86 = "--disable-asm"
>  X264_DISABLE_ASM_armv4 = "--disable-asm"
>  X264_DISABLE_ASM_armv5 = "--disable-asm"
>  X264_DISABLE_ASM_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
> --
> 2.17.1
>

