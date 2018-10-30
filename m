Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF8C74775
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 17:02:58 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id z18so3598893uam.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CpFQgjMN4aWPPv1/jdkcJDa/vCGNxQwxaqnEuNYiQ7c=;
	b=dZhwsIBBWVspD7DzLceUabcEY0xEG/3RGULgFbxSdsak1ob7z74b7egjdBjpid/tBv
	RHzi5HamCqlm45p4qvZjvyQ9kAKk3O2YFRlE4L55uC1I0fhsBXO1NBb9pWuOMctCGhp6
	G33oMxjNUIcw+jomoV9EJy+suULn59+n5UhMKPO5xlFKEbzvV5YhBm3mhvICH1dbQKlj
	UsPIO88H7pkylp982RyLMNzsTsR8DCFvIyIhhA8Ol+grRwgWyHvDdKab6RreCs1Gb4KB
	EQQmM/sUNH/DzvcbtAX79xFCz9ZpzKN+xc+G7QyEKtMFKSbUwYIfhC4f1uFecsdz8GsM
	ClQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CpFQgjMN4aWPPv1/jdkcJDa/vCGNxQwxaqnEuNYiQ7c=;
	b=tygDS996fhaKLQLEMGyR96HnTknW7oq9G6MxpQmc0akpDrOzHCK5N9jBriAcRCAsOm
	C3AWP3ub54iacbval+VwRcLTxEXKGG33lKzjrECEnLD+LN+K7KQcwES83dTBzryR0NoD
	bHCNdMkAwNcXjey/NWmYHcFdsGX08IsnGpN+7uuh3F/UmNVKA4yY0EjFd2BFcoYeRMSm
	3s4+00LTb8Cchokmjqa65lWFNGHI/ydqjlXRgS27GsOeUk8K6IUu2mJRxeGS6gM1oBuR
	cUXWB9Hqdxjkr49fRmiMNZD0LpQVPqdjMflgxLk/xjl8gw8ttV3wiPE9DKnqMFnVBrnw
	Zv/Q==
X-Gm-Message-State: AGRZ1gI0G4PGeZYLI5U1LuNYiaZzN0f1bSXAImbtKMP40xuoJHcpmDGQ
	pazrCP8acPITi7mj0nfmR4dS73Ji8FuasHiOi6I=
X-Google-Smtp-Source: AJdET5fw+0Lm+yHectubiHj3sR0p5svGmMGUYuxhJmtyK34OAz2Pzxj98yuFV/XZUL098P+qATi+cVgXtIx88DsmbIc=
X-Received: by 2002:ab0:1553:: with SMTP id p19mr8785024uae.47.1540918979280; 
	Tue, 30 Oct 2018 10:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
In-Reply-To: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Oct 2018 10:02:47 -0700
Message-ID: <CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 17:02:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> As was warned by commit 312ee68752fa [kconfig: announce removal of
> oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.
>
> So we switch our default mode to olddefconfig.
>
> commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
> and keep the old name as an alias] introduced olddefconfig in the 3.10
> kernel, we shuffle oldnoconfig to the fallback target.
>
> The fallback mode allows kernels between 3.10 and the currently listed
> oldest kernel of 3.2 to continue to configure.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> v2: Tweaked to add a fallback mode as suggested by Andre McCurdy
>
> Not for the release, just wanted to get this in the queue for
> when master reopens so we'll be ready for 4.20+ kernel versions
>
> Bruce
>
>
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e04d2fe00434..8fe207165ae8 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>         :
>  }
>
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"

There's no "yes" needed with oldnoconfig. The new fallback should just
be the existing default command.

>  python check_oldest_kernel() {
>      oldest_kernel = d.getVar('OLDEST_KERNEL')
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

