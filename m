Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E20B571B69
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 16:31:19 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b19-v6so672457qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TmwY8Bc4tAv71XUgPec8ruFpXwnijflnPYCv7rqJbOw=;
	b=o+AMwRaG3eGcNzgDGkwfZB19N3KPYdTBZSl94ZUiIJkY2s2CBpNYD78oOFtnOJ4dS/
	h+TdZ4Q+QLT2MjB5xt5y7rCYf4Jfstc6dLd0sOMVK3vUPp/nl5dOH+2y5iglKbSoCx3V
	RSkmnKY8e41cuAjBflkmidkqqsO21ovCOvhCnKuUTwAvWl7ro50Y1f+Ww9v8u+XGQy9E
	QbJty4eHzLz6ckceX71hatJESTLKJGG46kMMjQ1xayEIumivU6iVtZVkeg7kzDNjlFW0
	sTaqfhyBVYfIw244Aj1A+P55jLaTphF/1Gvh5uWgZVme2UOEDrrB91E8hSe3naxOUkOx
	SZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TmwY8Bc4tAv71XUgPec8ruFpXwnijflnPYCv7rqJbOw=;
	b=VNjoYHaCBdJsWnJ7t9dlUHGZudjxS9eCNPxLAyomROmtS/0nHqoSQNBeGqfrInoBh5
	/ybTl5MpvTZQPDa5uRnoZHzMxKwjUXwQI+cosEoY9cAmxUgaOiqx/EBtGjWI3ET5J4ED
	hbeLj0OyCNLvvoWYMGEBOl1kt5S1aJ8wm/Tvm1Q74QsYlQL0e6sMnP6zaYmKHAS7/cCn
	I2UsLcThs844MpKYHTSE94/cyrBAACd3QlAuDAnnG+q7SiLBvzPo8EZxPllkA9PircGb
	4RebWygtFyQAccGsyZZ1KWYFgoVHwF8tPBkNdt/OeTK8+/fKHuz79oR3ajpp6x13cD6/
	ippw==
X-Gm-Message-State: APzg51BRKbxIrLDj00nNA7Gz6drQ6HQ0uHjY4evwrJG7LDFOI7MnLKpt
	C5J2ZsesQgbFu2LCGuuM4dAZwek8P1WTbCtlzao=
X-Google-Smtp-Source: ANB0Vdbos59B5QwVQJo0fNmxQxbdQVHPdlElewjvO2rqzllVX5mdPnC5L8h2FX9LQK751420ENvhZFqkBM856OlsJMw=
X-Received: by 2002:a37:cbdc:: with SMTP id
	u89-v6mr25424238qkl.292.1535992280369; 
	Mon, 03 Sep 2018 09:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <1535981492-1670-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1535981492-1670-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Sep 2018 09:30:54 -0700
Message-ID: <CAMKF1sqgV3LvMF7c17QzE4WP=+wA67S1hpNTC6W9WThGSx5Qzg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: Remove `-fstack-protector-strong' from LDFLAGS
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
X-List-Received-Date: Mon, 03 Sep 2018 16:31:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 3, 2018 at 6:31 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> The `-fstack-protector-***' should be passed to gcc rather than linker,
> since `4ca946c security_flags: use -fstack-protector-strong', it was
> added to LDFLAGS, although there is no extra build failure introduced,
> but it is still unnecessary.(-Wl,** is for linker)
>

There are cases where CFLAGS is not combined into LDFLAGS by package
component builds
which creates the disjoint, If we remove this here then that will
start to show up. remember we do
not configure toolchains to provide the hardening flags by default as
yet, so we have to be explicit.
Do you see issues with current settings ?

> Reported-by: Lans Zhang <https://github.com/jiazhang0>
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 620978a..362b1db 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
>  SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>  SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>
> -SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
> -SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
> +SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
> +SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
>
>  # powerpc does not get on with pie for reasons not looked into as yet
>  GCCPIE_powerpc = ""
> --
> 2.7.4
>

