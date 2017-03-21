Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3832571A05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 19:00:49 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id d188so14167495vka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 12:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2+jlF1+fnohn/v554H0lN4hbJ3sSdf2iAdQTSjRJxSk=;
	b=Uvs1z1zGdmPyMs8cFBVqoSMBC2ZK+BoFqHGcsO68k3QV2iaKgZHtpjlPaGAVm6UwYj
	J474Ukym1QtSQ46ScRD55LpbfpbRFrSPx1TcDBu+p++z6Q5IEKX0hHnZDIHoWxLpQExD
	qegfxRAhAab+6UZ85ESl84nkaD85IovyUslEQ79zymDoe0A9xUdtDC95DdbOj9+fMHD/
	ZruRqTiytcFGJ0FHyOpE/faI3iiGqwu3yHPoCev0GA7e3twe9OTsUYqBEHg0+oq6M+Su
	OQMlcW6UDY+JHNGF4oxLVVU1+8PZIjCWdD5VX7Qa7LJ9dacvJG5UGkZa7TAjGilDIjC+
	tO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2+jlF1+fnohn/v554H0lN4hbJ3sSdf2iAdQTSjRJxSk=;
	b=cWjX8hM9phWyonIrzL2NN+otGKvxu+uFYDPy0WgJCPPXtM0ITJYrFnfpu/nPVGesab
	Bm8MEYeWZEfgGjrujscA2ZiwkMzeqUiwuaaC7vWeQhFDxjuZ6hlRRR5W4omuW3fM26Qh
	NBuUK0jnOJX4mijm0RGqHwDwPTkQsyb92OnB3PdsPNKA+vpAFk6333vVsmewbLwHI5pD
	tMZMGQXgD3KZiVx92ucpqPN5NSxNyNUkZGFes/RakhkfWJ817sLHcC4ppJKc2EfallD0
	/HV/TsDCbjf1cf1mbQaRxY3nOck+essyYi6xVwECe4BEQ1LJ8YCPCtuXnVrd58ZkSeEC
	/deQ==
X-Gm-Message-State: AFeK/H1lIrt2E9Ndev8HKlHnt9gFCJR2MvxKQiGTWW58nk+Ly8ulpvRy3nMd3Y9MuLfqAdbha+EFGIyZzdHJuw==
X-Received: by 10.176.6.170 with SMTP id g39mr16037267uag.34.1490122850648;
	Tue, 21 Mar 2017 12:00:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.43.65 with HTTP; Tue, 21 Mar 2017 12:00:50 -0700 (PDT)
In-Reply-To: <20170321185848.18733-1-twoerner@gmail.com>
References: <20170321185848.18733-1-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 21 Mar 2017 15:00:50 -0400
Message-ID: <CAHUNapSCe2g2ox7YPygkWj0hXo7xZu7BkYPALSCcLsw28vFcoA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/kernel.bbclass: revert 56fe5300ab5
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
X-List-Received-Date: Tue, 21 Mar 2017 19:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Oops, kernel config option is wrong in description.
v2 in 3, 2, 1...

On Tue, Mar 21, 2017 at 2:58 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> This commit effectively reverts 56fe5300ab5 (except doing a revert at this
> point is not clean).
>
> The Linux kernel contains a configuration option called CONFIG_LOCALVERSION
> which, if enabled, will change the boot log and "uname -a" from, for example,
> "4.10.2-yocto-standard" to "4.10.2-yocto-standard-00368-g827a1164b155".
>
> According to the log message for 56fe5300ab5, the Linux kernel's
> scripts/setlocalversion script was leaving or appending a '+' to the end of
> directory names (e.g. /lib/modules/2.6.37+). This conversation can be seen at:
>
>         http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053263.html
>
> The solution was to touch an empty .scmversion file, which causes the kernel's
> CONFIG_LOCAVERSION logic to be entirely circumvented. This seems like a very
> big hammer to use in order to fix a trailing '+'. If users were enabling this
> kernel option, it wasn't having any effect. Also, by default,
> CONFIG_LOCALVERSION is disabled in linux-yocto kernels.
>
> Commit 56fe5300ab5 was many years ago, and my current testing with
> CONFIG_LOCALVERSION enabled and 56fe5300ab5 reverted doesn't appear to cause
> trailing '+' characters to be appended to filenames in /lib/modules anymore.
> It appears as though the problem has been fixed somewhere else along the way.
> In which case, enable this functionality so setting this kernel option gives
> users the expected result.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 1e0646a437..c44978808b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -451,12 +451,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
>  do_configure[prefuncs] += "check_oldest_kernel"
>
>  kernel_do_configure() {
> -       # fixes extra + in /lib/modules/2.6.37+
> -       # $ scripts/setlocalversion . => +
> -       # $ make kernelversion => 2.6.37
> -       # $ make kernelrelease => 2.6.37+
> -       touch ${B}/.scmversion ${S}/.scmversion
> -
>         if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
>                 mv "${S}/.config" "${B}/.config"
>         fi
> --
> 2.12.0.rc1.48.g076c053
>

