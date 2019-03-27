Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id AB6E37D097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 13:05:32 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id t8so9481169otp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ovdQsPev7xmX0IwA61rAMHspyYgNj/nzzfkpgTxSC1U=;
	b=gogEZ94FatELdTBbwT7DxfutngKjyUxbEmRZ1J/Lf2jyl+reQGAsyXMfgj3XwoIaQk
	WZfC7JFN2Bc9LSViYAO7l4ULvVQHT2uVvkESXUC9XXJQjiVRFvRlqS4Rb3WXaT+ebuW0
	n421XIoMsdrpGyrEk5LFM5uMjsidLcObXvTzOrbNhclVO0rUjQC3BvvDp280zM/9D4Wc
	B7fYpKPDB5yTuy0TnA6EDwY0eOCVP0nReX2fygvcFaj2KF1ui6fg7l2VR04JSjjcSzFi
	XXHJ9KzvutIIus5wYE8ChaqymB/nNOGgT2Xukcivzm/QPCR6io9/5/QuCUZ/CpwWxD1G
	+XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ovdQsPev7xmX0IwA61rAMHspyYgNj/nzzfkpgTxSC1U=;
	b=UH/8TlPCGyJJmbBjf32liLLU5Es7EVFklh2ir+c8kWRX/IFApb4IQy9/PcasyN1ze8
	0xGTwVRyI4Ml0Ad72i3xg+DY6Xqea2nyiJjgyJJoO79+3rV+YJX6HjC45bVe/W8Cx6zX
	mS4n5nyb9uKErNzeGyyPtGlCL+y/sLXoKrJphyWs/9WzJpbw5mjVtWirrmRh6U9SWUHR
	S7Nx9m5rS+bcisTej7A/5PF1bvsUwbXlLOAYLKGwRa9CLartLNy+CQJY4/sLy73Gq44D
	FrlgxwBgbF7UvPhLS41Xe7Ya43YiuJIWWR6kuNECj9hxCJ578oeaHY61MGuFuG1RpbSD
	T4Jw==
X-Gm-Message-State: APjAAAW+WRY7t9BEPdHjSEon2mSy28MOu6dMyPzGAu4ZkXGJivRcv02a
	RvCrla7VXeRp5teMnqrV1X9jPQOuTGPfwr8J4KQ=
X-Google-Smtp-Source: APXvYqwPqf7UqECXGUy4LzAwOVboFZdLXliaBZffc80/BJq6+xUU1g5laakwuQDkDNyd9u6J07rdAztayu4IeLn6vvc=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr9874073otf.326.1553691933738; 
	Wed, 27 Mar 2019 06:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <1553691563-28778-1-git-send-email-vincent.prince.fr@gmail.com>
In-Reply-To: <1553691563-28778-1-git-send-email-vincent.prince.fr@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2019 14:05:21 +0100
Message-ID: <CANNYZj_z8ZcXniKCB63Q82mcez7BnEcBkeF2=Z5JugjjK7zamw@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
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
X-List-Received-Date: Wed, 27 Mar 2019 13:05:32 -0000
Content-Type: text/plain; charset="UTF-8"

Can you specify in detail what the failure is please? It is not
happening on the AB.

Alex

On Wed, 27 Mar 2019 at 13:59, Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index 60499f7..85472a8 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -20,6 +20,7 @@ DUMMYPROVIDES = "\
>      libxml-parser-perl \
>      perl-module-bytes \
>      perl-module-carp \
> +    perl-module-config \
>      perl-module-constant \
>      perl-module-data-dumper \
>      perl-module-errno \
> @@ -35,10 +36,12 @@ DUMMYPROVIDES = "\
>      perl-module-getopt-long \
>      perl-module-io-file \
>      perl-module-overload \
> +    perl-module-overloading \
>      perl-module-posix \
>      perl-module-thread-queue \
>      perl-module-threads \
>      perl-module-warnings \
> +    perl-module-warnings-register \
>      /bin/sh \
>      /bin/bash \
>      /usr/bin/env \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

