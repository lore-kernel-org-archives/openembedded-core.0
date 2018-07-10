Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id EBC507559A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 04:38:19 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id h22-v6so11699251vke.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 21:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vLjSjtzyUtJesC6xAWccPZ+H4wo7mScqT8Qn/Uxwp/U=;
	b=FXime4AnRWA4s/CcGz0AY9Dc0BKavqSUMK/AZy6jLpMN/BkH2kK2r9ZvBP/1tR6N2q
	qZsBreFP27znF6fuQ1nOmkTr6A6piQBXAqcPApT4PJcXndqNcDcdplvL8/g0jNYB9vKX
	LMeRyQvTzDjUXiKf6u3aJMT3bc6bf+r0ruz8N4qhj9FIseDik6cVb4/Y2Fid2VXtVbOY
	F3gQyydRwXq1BFJhA/fRN7fr1qkhDy34+d5LRrTGYC9EQhUIKJ4GP29TiHTvheRrN+K+
	GrLxxPL4+cxbamuou6Ko8zUkstKHpA6pTOluwkGf3u2df9tCG1hIKOEEyGRg2SP1o9bX
	7COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vLjSjtzyUtJesC6xAWccPZ+H4wo7mScqT8Qn/Uxwp/U=;
	b=g2hElwkV5TwMBpB/r8kYMtCNZtGv+ITuSB7/wz2D7JYvoJjJ5yq5ngsEEX5s9Imp+f
	i5EkSABq9nDbyFTrFoZIxXA4HcXwnuum6HHQyNKQivtxhGxsHbFQS8fi93f9Q1P8dTIo
	CPqmKVuaAjxWZZ/pvz3FIL1fLLvzRfd1z5WU3DhvOIInUrORmwhBJG6Pf6FIkCQ3YIKU
	ETOzTo4VuJe/eAlDQda2upCN+y3xh+oAElHB1lhechtUxMeRX3388z7jrrgaIGKKis7L
	efRSj0O2caQbpGqemKjasFjdrQwfRosZhcoLs/QBQfQMPCqVXld+pM0qF8qR3IcHHUnF
	CPNw==
X-Gm-Message-State: APt69E3v7z+cShyH5DBqMSsDUgqch9e3yFvZCz3VX1a3rynakgG4TXX+
	7Nln9rSXxUqoBheUovW254yOcmhIPbaJDWieIQ0=
X-Google-Smtp-Source: AAOMgpf7M7Qg9auqvo7vMYCKDPmt5ebkRiQADtKTyChXJWwRGgc+HYdZi45z75fmopFKweSvdN4gQCe5GEdH2BydAfo=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr13046690vkh.4.1531197500481;
	Mon, 09 Jul 2018 21:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
	<20180710024207.6296-4-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180710024207.6296-4-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2018 21:37:54 -0700
Message-ID: <CAMKF1sphbXqpqeTkEd5P_pjrV7eoJDg5UrcRf5iAjw7_ew1a-A@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] icu:61.1 -> 62.1
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
X-List-Received-Date: Tue, 10 Jul 2018 04:38:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 9, 2018 at 7:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade icu from 61.1 to 62.1.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/icu/{icu_61.1.bb => icu_62.1.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/icu/{icu_61.1.bb => icu_62.1.bb} (80%)
>
> diff --git a/meta/recipes-support/icu/icu_61.1.bb b/meta/recipes-support/icu/icu_62.1.bb
> similarity index 80%
> rename from meta/recipes-support/icu/icu_61.1.bb
> rename to meta/recipes-support/icu/icu_62.1.bb
> index ffaf350..ec9db7d 100644
> --- a/meta/recipes-support/icu/icu_61.1.bb
> +++ b/meta/recipes-support/icu/icu_62.1.bb
> @@ -16,14 +16,13 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
>  SRC_URI = "${BASE_SRC_URI} \
>             file://icu-pkgdata-large-cmd.patch \
>             file://fix-install-manx.patch \
> -           file://0001-i18n-Drop-include-xlocale.h.patch \

It seems you forgot to delete the patch file along.

>             "
>
>  SRC_URI_append_class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[md5sum] = "68fe38999fef94d622bd6843d43c0615"
> -SRC_URI[sha256sum] = "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef"
> +SRC_URI[md5sum] = "490ad9d920158e0314e10ba74ae9a150"
> +SRC_URI[sha256sum] = "3dd9868d666350dda66a6e305eecde9d479fb70b30d5b55d78a1deffb97d5aa3"
>
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
>  UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

