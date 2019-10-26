Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 592C77F7E4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:04:24 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o25so7087245qtr.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uriIw6fdH1GzUYrwwxgDii0kwk2CzpkqAxGK23z4tII=;
	b=NB2VCYL2ymMcVhDt9E/7zC2TggKnAWVooPSShLnX5FpdUt8NHY55L2bUgvIsQhGwiZ
	0W+wMNSdqDmsakp1RsVF8GAjSyfFY9x+/bp6h7H46gH0xCdBbPoQ9m+nacsmjFEKo9lo
	4I0cFMdfQrI8bptx41umgaQu3kNrigWkL082/+uwpR8KFXYdbBkmIKguWMHCNyw8cd4t
	3Na1W9d3WLFjc7f0DDfPp9iut0U5IeFhH7j0puh+fAmcJV9nUC/CAHYa2JoSV6x+2xX1
	EjJOEvV/hGLBYML31ZK6z8MToumOiFVd6Duvhv2MCckpPySVIA+dk0u8X2MVUGBt4YJY
	CZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uriIw6fdH1GzUYrwwxgDii0kwk2CzpkqAxGK23z4tII=;
	b=GWa7fLd2oVVkGbInUAfX5lAEEWB7ifK9KYb1X9gnrvuo2CjDhuEqIfrVGZuDVxuD7Q
	+ZzYaXAiTRjuMOyjtRsMrnOSoMPxzZ+Tl3W6sxtWt9+lcJrL5Btnovh8lbAy2KiM9Yz3
	1Ym1GFJ3x8S9Aav9jY3Tf7fgJTF/PqRgzT3flBdu78vHtAr6wYGd67rYXUcme69aVs50
	gUDSTDqjX1TFf4Rwjpwbh2uwvh2ke7M0RTuKVDDSB2lzvUsGYIpZ8wVIWugsL9nIbUVX
	7aGz4QwekYj729Ou+a9Acpf/cFXKvzrg2K0kjdTY1Lm4YF9mmdRmy9L2D3vXR4v8C15h
	5ulw==
X-Gm-Message-State: APjAAAWyAFj3AVXSj/Ht3oDKIl8OdkPgFRF42G12UkbUOaIEty7dncxq
	crElcr3LRkXIn5fVK2ZdsyS3rpeuxpSObnvOa3w=
X-Google-Smtp-Source: APXvYqz13RcZ7nQIBxn0+PDZrHddYN5P51ELIyiTPwhOUR/29l3HMLAlf1DpAztJEvo1QQvW4tWqY8lnoleHGN9XtjM=
X-Received: by 2002:a0c:ff44:: with SMTP id y4mr7250538qvt.99.1572080664799;
	Sat, 26 Oct 2019 02:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191025202008.23715-1-twoerner@gmail.com>
In-Reply-To: <20191025202008.23715-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 10:03:58 +0100
Message-ID: <CAMKF1soPy2WuaB_z8CPPbTgKXsnztTVTVVVEv+gWSbt569qWSQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcap-ng: undefined reference to `pthread_atfork'
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
X-List-Received-Date: Sat, 26 Oct 2019 09:04:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 25, 2019 at 9:20 PM Trevor Woerner <twoerner@gmail.com> wrote:
>
> Some hosts need -lpthread in order to link properly (e.g. openSUSE 15.1).
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
> index 6e6de45494..01ea9a1490 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
> +++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
> @@ -3,6 +3,7 @@ require libcap-ng.inc
>  inherit lib_package autotools
>
>  EXTRA_OECONF += "--without-python --without-python3"
> +LDFLAGS_append_class-native = " -lpthread"

Please use -pthread instead of -lpthread

>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.23.0.37.g745f681289
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

