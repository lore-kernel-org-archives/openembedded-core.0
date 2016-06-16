Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0647608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 00:20:37 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id l81so5461227qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 17:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x0P3+3CsoinLfclU7S953iM8R87ooGmx+TLDk9GrBlc=;
	b=vDKoCXInpM5j4Du4xiBc00X1Hi/EeacxfDZxdxLZC/aYoVSZkvvD9ugi3CAb5bUg3P
	lJ9ovuUZaFysFd4PzJa1U3aKoi3MIIBYXt52AP276nTMdXc9CG0EDnXLB1u/eV6MFt7R
	ftggAabwQfaP4Pj7wOqJ/kTTKl4dyjObUyAIBCwck5pG5yhTZMz4/94ZuPbyV9rBG9u/
	zwnbf/uSyCfTF5n0CC3ZSQHSq3GE9fMM6suh56Lr9SgsspRjSpr3eqZz+92RlKKa7gca
	d7kMJgDfsgzYsd1aZ0DiFByZd1TqLyWQQIcRj/rN/h8pwR/E2h6cNV9of2hR2jhm83HB
	9KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x0P3+3CsoinLfclU7S953iM8R87ooGmx+TLDk9GrBlc=;
	b=TIyY1KOHGNjUZgOJMnlAPjpsOaUsYb44NLXexsQu0oVYS32W94z+jlX/DHf+EkIDxK
	jk00GWdBumOVFFeIBxvbNeTLtdDrddZt04/Zj3heOEZPRkGWzIwiKRT383xnU2M5oeP3
	GHXCYPpFTZ1KxF+eIalxgHIcJ4eurAHNNUOjHicTQoO8iAR7k03OKoBdbuiFVmmOyeC4
	h+dubmKoU4NnUq6T8oGQ0z4Xt1n6CIJRi/wfnwT3Bm2EOT0XC5dZGqv53oEvNQJ8Lp1h
	WnJchfn8Lx/GS+cvnBVeQdd0H3LVzYBKlugzJ34Eu7nRbkqT3QZsCvZWCxH3Wmw3VUBo
	0eBg==
X-Gm-Message-State: ALyK8tJJrzeqPEZwtyA3U42/xMhmAHgp+O09g7XxZnLMSWQo3QxrXWrDlBZ3hLv9VC81NYv34/MYkiBmeUroSg==
X-Received: by 10.233.239.18 with SMTP id d18mr1786036qkg.41.1466036437780;
	Wed, 15 Jun 2016 17:20:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 17:20:08 -0700 (PDT)
In-Reply-To: <1465571533-21604-2-git-send-email-git@andred.net>
References: <1465571533-21604-1-git-send-email-git@andred.net>
	<1465571533-21604-2-git-send-email-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 17:20:08 -0700
Message-ID: <CAMKF1srfaxLS3wn5d5Fu46i5-hU+kGj3dViD_v7YyF3wut013A@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] uclibc: never build with SSP
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
X-List-Received-Date: Thu, 16 Jun 2016 00:20:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 8:12 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> This doesn't work, as the initial gcc that is used for compiling
> uclibc doesn't have support for SSP yet (since that will only
> be available once uclibc has been compiled). Since during that
> same compilation step uclibc is trying to build its own utils
> those are failing to compile with SSP enabled as the
> initial gcc doesn't have access to the required libraries,
> yet.

Please look at how we do this for glibc based systems. This patch is
not something we need.

>
> We never used to set UCLIBC_BUILD_SSP in the past, this was
> only changed as part of the upgrade to uclibc-ng in
> commit 63bdadc (uclibc: Switch to using uclibc-ng), so here
> we now simply restore the previous behaviour.
>
> Note that we still enable SSP support inside uclibc for
> everybody else to use, though.
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
>  meta/recipes-core/uclibc/uclibc-config.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-co=
re/uclibc/uclibc-config.inc
> index ed7b522..8b9e41c 100644
> --- a/meta/recipes-core/uclibc/uclibc-config.inc
> +++ b/meta/recipes-core/uclibc/uclibc-config.inc
> @@ -119,7 +119,6 @@ def features_to_uclibc_settings(d):
>      uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
>      uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, re=
m)
>      uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
> -    uclibc_cfg('ssp',       distro_features, 'UCLIBC_BUILD_SSP', cnf, re=
m)
>      uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, re=
m)
>      uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WC=
HAR', cnf, rem)
>      return "\n".join(cnf), "\n".join(rem)
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

