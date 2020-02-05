Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBAB61077
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 02:52:47 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so745834edp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 18:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tzEldXekQUrS+utygI0b5LN0vxRQtyM/KsQgw8BYEjQ=;
	b=azMvX9bGadmARpU3QAaEmgZSq8CG5aHMx01pVae+1juEsSKlq4lyTXHMFNBgUUoQiU
	XsjlaJ8rzNDUQzKp+A+7NI0vi98yu7ogDwontA16dEH8zxXFINiXwInlxYK6+469NG3i
	+TqC4gW4fwaTFBklWUyp2phHpFcTUClK8zxZy4CcOGPAwojInfgnhPdgoBc6NxlMP+YD
	5LmZ2DisvbAI23nFpdDzMbS4KUupzeX69OJ76NtLpIlob/ZvMsFt+8ho09ai2ijQnT1X
	nLjo5XzDYSdjbg7b4tJpDMoR9K74GzuUS5ULpXPeP3p7inyK5djIUIzK5h7AFk4ggaTs
	Uvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tzEldXekQUrS+utygI0b5LN0vxRQtyM/KsQgw8BYEjQ=;
	b=XtGBgkKuMEikLkwnA89RFJkeo+9r+dFWYfNypd6l5d+nrIQ7ktmvyXZKPEe4SZ59WX
	sADXUXSgex9jHMIFrQ1ShAkU+dqavXyu1S0b2pIc6ah1keQ/bfQHoVApX0TQF23J/Go+
	FpajdD3/5I9grb8vTME7jfqsFmEKGR4u5uRatg+MLFTGj+F1RUfN0R4HM2MOuQxOBuNJ
	QQhD2X9tm5xmiJLyTGV89Co/8vwVuDpIcDcI+uVfRDlNTTD3CUG+FHvKpyvjOr1luagY
	3ygwbfuncM3u7VQQ219FW8+WczsVLsl9X8JCANPRB5bz5QqDeJd8J5C1EDj0QO6QrLT9
	wGcQ==
X-Gm-Message-State: APjAAAXxGjieueT+5PRBrUf8onznu03OmPkiW6yxCF706iboJi0MDahC
	BbhwGl5MIlR2ORm1cETWD7yU4wTBb5OOaaxN0DE=
X-Google-Smtp-Source: APXvYqxCU339sh8DEpnqGg3R5bzCT0hBWr4qri0bcjbsAkzS6Ll0wahWzqFzkJXEQCGV7Cok/27DlMugX/1IlBnofB0=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr2945803edc.129.1580871168120; 
	Tue, 04 Feb 2020 18:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
	<20200205024241.27828-3-Martin.Jansa@gmail.com>
In-Reply-To: <20200205024241.27828-3-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Feb 2020 21:52:37 -0500
Message-ID: <CADkTA4NXO8+j6Dy+dZk8AKTH+t4ybs7yULSKegFr_v9XYW8npw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kern-tools-native: pass LD variable from shell environment to the make call
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
X-List-Received-Date: Wed, 05 Feb 2020 02:52:48 -0000
Content-Type: text/plain; charset="UTF-8"

I'll take this into the repo directly and send a SRCREV bump after
I've run it through a some of my kernel release steps.

Cheers,

Bruce

On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * since 5.4 kernel Kconfig will fail immediately when it detects
>   that LD points to gold linker:
>
>   scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not supported
>
> * in OE we already pass bfd linker in KERNEL_LD variable to merge_config.sh
>   but we need to pass it also into the make call here
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../kern-tools/kern-tools-native_git.bb       |  2 ++
>  ...pass-LD-variable-from-shell-environm.patch | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 57ec1abc6d..8053483355 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -22,3 +22,5 @@ do_install() {
>         cd ${S}/git
>         make DESTDIR=${D}${bindir} install
>  }
> +
> +SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch;patchdir=git"
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch b/meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch
> new file mode 100644
> index 0000000000..d7d3d9dd2b
> --- /dev/null
> +++ b/meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch
> @@ -0,0 +1,32 @@
> +From 091dbfede29c128a1a467d7f3c0aedc33ba3d2cb Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Wed, 5 Feb 2020 03:26:57 +0100
> +Subject: [PATCH] merge_config.sh: pass LD variable from shell environment to
> + make
> +
> +* since 5.4 kernel Kconfig will fail immediately when it detects
> +  that LD points to gold linker:
> +
> +  scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not supported
> +
> +* in OE we already pass bfd linker in KERNEL_LD variable to merge_config.sh
> +  but we need to pass it also into the make call here
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + tools/merge_config.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/merge_config.sh b/tools/merge_config.sh
> +index 296e759..11f3085 100755
> +--- a/tools/merge_config.sh
> ++++ b/tools/merge_config.sh
> +@@ -153,7 +153,7 @@ fi
> + # Use the merged file as the starting point for:
> + # alldefconfig: Fills in any missing symbols with Kconfig default
> + # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> +-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> ++make LD=$LD KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> +
> +
> + # Check all specified config values took (might have missed-dependency issues)
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

