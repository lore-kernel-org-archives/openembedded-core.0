Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBF3797B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:14:47 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j7-v6so24832647qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RZEFg/n4UVExeVuz5smZcT3sWKmleD8XC26bpckhRr0=;
	b=FcIkZmOjyGOZbFnBzJZu1M3ZptZ99a3a8zsUASHgDNsswoEpXp1QzrJDzy6UJ5TOwz
	9iL6uD3H/0Pb/vcFCoTjUq10iNlTYF/950NufyPSfVUduklRM6yYr9DIs7FZ8p/HLBEd
	sI7bVTmNM0xrl2zzOHh1XMxzqNsxZ7GMr7c0vERwfA4Bo8pqlIqQyNk1mcj9QbAIp7sa
	IfNUz2PJfS/jEQ5Hdr8uBwoIev5QgHJx5Q/f8aGVc3WJLSmTaNRHpcFBSoOENs4ogYB/
	BfaNwDQD/26Ll/Rq7XxkknHhdog0nO45uzTsgVbg7UDuGVVhijUlTGgeYEBBkQqtIp75
	u68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RZEFg/n4UVExeVuz5smZcT3sWKmleD8XC26bpckhRr0=;
	b=NVJOxlpyOsmjvRB+JqCQE9WuZMvpbbSKBFO/EFP4J2cX+lPIpd5Clj2v1uzNQNTtW7
	SiCC505mBAyxAKXPtkfNbzUtGPwNl5MLnVb5wDMSoT4b/ZiwQv/miBvYohXNbVyKdYKt
	qSqymh1f0IFRaPRaTBMfGnNTWvzUicHMDXCmifILGyF1SznxJRw9oV1mwnrGkUIS0hY2
	iZ7Gri+giEApMicEbCMToJI2Fsrn1hHutLsEYO7WZFgFbqXMJLM/nhrRlZoVwo/obR3r
	qJJ56pElcxrj6l24ZspdRmpwC0OP1Y3NR9QJ9JVGg4u0KD6MhITxY2+Jmxdt3bOF5ksi
	L9AA==
X-Gm-Message-State: APzg51DE6z+woGnYd7JgNCb2xtcQfIEmMTcoRXXCHm6euttDc+fMiD0D
	UYF4F53AQX17QpNBg7VSacxS2gCfMLoxnDDsZfj+2A==
X-Google-Smtp-Source: ANB0VdY1N32TCnQ9Wv7HM/rpdihc6IlJu1dJgmqPHZjOWrV/QqEfTBt7MTrT3XKCStSwG/xMq6ZElum/iH1yJz47zh4=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr16967455qtq.161.1536596088469; 
	Mon, 10 Sep 2018 09:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180910124503.21183-1-nathan@nathanrossi.com>
In-Reply-To: <20180910124503.21183-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 09:14:22 -0700
Message-ID: <CAMKF1sq=i8METMpL_gL0PorPWu-VbJRQTQstC4WB2ZmcMSW_rw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tclibc-baremetal.inc: Remove BASEDEPENDS on compilerlibs
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
X-List-Received-Date: Mon, 10 Sep 2018 16:14:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 5:45 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> Without a libc the gcc-runtime provider of compilerlibs does not
> compile. As such avoid the default dependence on the
> virtual/${TARGET_PREFIX}compilerlibs provider.
>

compilerlibs is compiler runtime, do we not have crtstuff and libgcc
for baremetal ?

> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/conf/distro/include/tclibc-baremetal.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> index b00917913f..e04f8c8812 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -21,6 +21,9 @@ LIBC_DEPENDENCIES = ""
>  EXTRA_OECONF_pn-gcc-cross-${TARGET_ARCH}_append = " --without-headers"
>  DEPENDS_remove_pn-meta-toolchain = "virtual/libc virtual/${TARGET_PREFIX}compilerlibs"
>
> +# certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs
> +BASEDEPENDS_remove_class-target = "virtual/${TARGET_PREFIX}compilerlibs"
> +
>  TARGET_OS = "elf"
>  TARGET_OS_arm = "eabi"
>
> ---
> 2.18.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

