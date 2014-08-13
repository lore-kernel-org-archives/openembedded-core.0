Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id D0787610F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:48:47 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so11823035igq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aQE0TSP7In6BBbagpgK1GuIatKmWT+zjiawSR5DY618=;
	b=Kz2SMM1SP7sctLxBdgAP/NlxI3foOVtEUUmRlKSxkGQlaxAAsDLVpDf3O5NbRPpBDg
	nIhQUaKQb1vnZIHHWdXdKiazzpeasvR0c0rd0vK9Z9QAnwd/u+2O5gEyMTgV+XgXek44
	UuBMfzQaCCt4SoDAVA8WulztjUpi3Lq4RyTcmwPq0SBNyxQ51VdqXp4tg4ImZOroSBGL
	acGr4qWKJu+B8Xcu3Hk0kf2RiZqcHO258NTOl6GOMOD69qP7O/74BxuulJizLNbtijeO
	eqdSLkcwX37O6nbZQZkRSNoNZXZPJ9weyZQJRCg+GGa3nrUe0MUoSq1HjSeUMc8djX9/
	/lDw==
X-Received: by 10.50.176.202 with SMTP id ck10mr53806285igc.2.1407970128959;
	Wed, 13 Aug 2014 15:48:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 15:48:18 -0700 (PDT)
In-Reply-To: <1407963825-20257-4-git-send-email-pab@pabigot.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
	<1407963825-20257-4-git-send-email-pab@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 15:48:18 -0700
Message-ID: <CAMKF1srV7DwLb_Jf0=LwGRpsjoV5Jwaq0bJ+Z68C8O-=8=CUBA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gcc-4.9: Ensure c++ includes are in /usr/include/c++/${BINV}
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
X-List-Received-Date: Wed, 13 Aug 2014 22:48:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 2:03 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> Apply to gcc 4.9 the recent fix to the --with-gxx-include-dir override.
>
> Original OE-Core rev: 5a2ff3e8f7cd7a47a5ab4e581847ecc4df87fca
>

this is good.

> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 01dfde1..bdea3405e 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -120,7 +120,7 @@ EXTRA_OECONF_INTERMEDIATE = "\
>  EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
>
>  EXTRA_OECONF_PATHS = "\
> -    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
> +    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \
>      --with-sysroot=${STAGING_DIR_TARGET} \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
> --
> 1.8.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

