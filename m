Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 752557DE7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 03:59:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 14so9840291qtf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 20:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wIWdlF5tcOXAKBpRozUT0dFd6uvCJaogSPg/6dMfIfg=;
	b=T/fZwx8VeDaFtVvTR82vq8cDVBwVjdgT64tRctm0Owuh8MF/3PwVJ/P1C20fEzHowR
	XpLv8v6EF9k2yaqlfwmUT9uyh4r78/1VHl/r3125ZzECyFvUtxEmWsGoqc/LnZWLMeX9
	dgBMi21ZrQMkdinJZi2uTN6S15mD7I+//08/zED4WHJuwGBgNSDZv+qZMp2KNbJHcTnt
	r7kRLOxX7nYedlv907qoBiZ5x7J3QDYOU0Bx6JCoXeIaySEYGo7mp+Gt4yYeEdqdDDLw
	lfDC2yRmILaqmgYY+enI3EqmPsa3SU74azkR1aji1d7pJsaMhkwAojbJvKetvGfH7Cht
	6Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wIWdlF5tcOXAKBpRozUT0dFd6uvCJaogSPg/6dMfIfg=;
	b=dkmeKar9VnfClVKUkFoFOFsp+8R/9aQf1WEhgi2XVNI6NLaVThOpLzDZB45pWih8lY
	Xx9ww514rDep7xlrqq/IJZapSR0B+OQCnfQrq93V3M1vey2i6ZWjbqKMdJZ9viPzTTQp
	xe0nE+l9sHb5aAhKRZ1ua/LoWnoIWwoIwze5RII0xkou9/Qbi42VafjUN/c7tmrJI9bw
	TC9WtXGYuSWVIxiomiDWRphScXKQkbrs9J/c75e8yk09bZPgRUgA/cf9esyDvJM+QSYp
	u/chsaNQz3VRlnq1HacJyoGUtnfjxnh8YHugxNhA1xDXBY+1kudPk2ofrviiagSq3oPm
	cOvw==
X-Gm-Message-State: APjAAAX4s8CAOQt6ahYTUjXD9bgzegLp3z9Tz+YCfelHaRLsVFXnQUU4
	LiZplOcVHKpFjIQmiOK18bcT4HS5gPH8yhaabJQ=
X-Google-Smtp-Source: APXvYqyJqRjjnI9eQlaTGMh/KN+xIahl1P+/7x4DsVDEuF7yITABjHd+20V7IjkMZhxTaPf67nwkfYRA39DZel1qyHU=
X-Received: by 2002:a0c:b09a:: with SMTP id o26mr6828558qvc.68.1559275176796; 
	Thu, 30 May 2019 20:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190530183138.1348-1-JPEWhacker@gmail.com>
In-Reply-To: <20190530183138.1348-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 May 2019 05:59:09 +0200
Message-ID: <CAMKF1sqHfrV4gFpg-3bhXC=xATr1=mO-o8WX9RT6SoG8k30QPA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: DEPEND on virtual/libc
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
X-List-Received-Date: Fri, 31 May 2019 03:59:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 30, 2019 at 8:31 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> The restriction against glibc-locale depending on virtual/libc is
> removed now that libc-initial no longer exists.
>
> Adding the DEPENDS on virtual/libc fixes a race (and reproducibility
> issue) where the packages created by this recipe would have different
> runtime dependencies depending on if libc had generated its packages yet
> or not.

technically locales are intertwined with glibc so it does not matter
but I understand the dependency race point
so lets take it in


>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index a985d26c75d..f033635bd0d 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -12,9 +12,7 @@ BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
>  BINUTILSDEP_class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
>  do_package[depends] += "${BINUTILSDEP}"
>
> -# localedef links with libc.so and glibc-collateral.inc inhibits all default deps
> -# cannot add virtual/libc to DEPENDS, because it would conflict with libc-initial in RSS
> -RDEPENDS_localedef += "glibc"
> +DEPENDS += "virtual/libc"
>
>  # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
>  # is set. The idea is to avoid running localedef on the target (at first boot)
> --
> 2.21.0
>

