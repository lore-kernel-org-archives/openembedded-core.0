Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E33657449A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 21:38:44 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l27so4125949pfk.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ioD2Rrp4QNr7RzItK6EBXg5NeWlTjOpgTkpp8P3r2no=;
	b=kaEVHvKWkjzdmn6fxdID30a1EAG3F+WF4jDoEWOEGhdqVVvuB+8Ubi+fOUwT3lujGV
	H60VX0iiL7sBmv41kr2sjiYkHg3WFY28j+8y6sDtOQHUNrqkPdUVZPJ98L6gstWCuaTe
	lN1VChtmSGBz6v+53boQphJVhEWubzvDzG20fTXoIzQ8QBEodsl/D/hzUPoTmc2bdlKt
	WNEhG7YByZaNcSRsTmYrZ9UYjYxKqykzou+uUUVk77+ikfrpp/QHEhT5UHaSS2lG3zqO
	wCeK/RM+4V5OZjvZdmq60K/mmyinULfyMlNMNYr6zRY4/6ke3Vkshnj0q2SkmP20BpP5
	oKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ioD2Rrp4QNr7RzItK6EBXg5NeWlTjOpgTkpp8P3r2no=;
	b=O1I3OjS6xNC/gwX1MvhgLpD12gDUhkiddm1dqJ8pkkYGb6uL635Cu4aaZMrsuTKzJV
	auJAo/xESE/GezOvoy04KFH1zPagPCPKN9DvqvrvD9Tm0UNTYMHRe5cN6/ajCc/NEuwH
	clAPtgXAj+MCDdo5/D+A/E2QYkmf0DryDIN/MZhJjugSaW75JM4EMLIR/6MaWxk04Iax
	eXm7FL2DggQCZUJ2i5rMOug/pqD7UrhpPXHzZ7AhJ88XQNuf1rsalcCMiuaGh3/spVsX
	mXCGWud8v1SIHdGIwGOhBs/QaECxuJaUeNRdhXRVpR5WYk4DyeqJXNV6jiwIM3HJawfC
	Apzw==
X-Gm-Message-State: AElRT7EU9EfMrF7ckpetgPY0cnqiMeYfdoqlkencU3lf7+AtdaBldvPT
	Hsm2/YARjVdNUjH7basVM49A+lPNSlsmVdjnVzQ=
X-Google-Smtp-Source: AIpwx4+qT0pxG+NblsIrOZOkd1IDMHMfO/rBhNuypaPNkA67sp/Jp8OtAfgDGF4xS0RGiB075j7ffOoI/AyaG+nDG0Q=
X-Received: by 10.101.73.207 with SMTP id t15mr6782557pgs.204.1522359525598;
	Thu, 29 Mar 2018 14:38:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.227.8 with HTTP; Thu, 29 Mar 2018 14:38:15 -0700 (PDT)
In-Reply-To: <1522354745-69082-1-git-send-email-juro.bystricky@intel.com>
References: <1522354745-69082-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Mar 2018 14:38:15 -0700
Message-ID: <CAMKF1sowHcmk2=3=PpKYfFfVhHyH7k0dOOU8G9z=0J0H9SL4kA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libc6-dbg: improve reproducibility
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
X-List-Received-Date: Thu, 29 Mar 2018 21:38:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 1:19 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Prevent bison from generating #line comments containing build
> host paths references.
>
> [YOCTO #12625]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../glibc/0029-plural_c_no_preprocessor_lines.patch | 21 +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.27.bb               |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-plural_c_no_preprocessor_lines.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0029-plural_c_no_preprocessor_lines.patch b/meta/recipes-core/glibc/glibc/0029-plural_c_no_preprocessor_lines.patch
> new file mode 100644
> index 0000000..6f03e1c
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-plural_c_no_preprocessor_lines.patch
> @@ -0,0 +1,21 @@
> +Improve reproducibility:
> +Do not put any #line preprocessor commands in bison generated files.
> +These lines contain absolute paths containing file locations on
> +the host build machine.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +diff --git a/intl/Makefile b/intl/Makefile
> +index 2219717..a203780 100644
> +--- a/intl/Makefile
> ++++ b/intl/Makefile
> +@@ -151,7 +151,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
> +
> + CPPFLAGS += -D'LOCALEDIR="$(localedir)"' \
> +           -D'LOCALE_ALIAS_PATH="$(localedir)"'
> +-BISONFLAGS = --yacc --name-prefix=__gettext --output
> ++BISONFLAGS = --yacc --no-lines --name-prefix=__gettext --output
> +

LGTM

> + $(inst_localedir)/locale.alias: locale.alias $(+force)
> +       $(do-install)
> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
> index 827857d..f626467 100644
> --- a/meta/recipes-core/glibc/glibc_2.27.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0026-reset-dl_load_write_lock-after-forking.patch \
>             file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
>             file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
> +           file://0029-plural_c_no_preprocessor_lines.patch \
>  "
>
>  NATIVESDKFIXES ?= ""
> --
> 2.7.4
>

