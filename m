Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6941ACE79CE
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 13:13:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.38741.1695215588149534011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 06:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CcC2oiI/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32003aae100so631986f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695215586; x=1695820386; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKePc+LUFm7opJFhap/tl6RfN00Ehe+km4pK+OerSL8=;
        b=CcC2oiI/dHmk8P5kJzyiPWK0uKZkmSkmgsVyYYrsm1u16sdt40p9pVd09OaeHANYhj
         sYYQId1nmLLYF4TsVsBj1DzkoZJ+6q8wxnQ8d/tEtDvlSFXLnpUXFfwclw6/dyf1hY0N
         vMxmE7NPuEpygb/UZ2OzCgArDQT82d0x+rA6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695215586; x=1695820386;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKePc+LUFm7opJFhap/tl6RfN00Ehe+km4pK+OerSL8=;
        b=tqmASJToUvf4HvMmZXqrwXTWVo6LHmAg17mmj9epfCmtYBuwGSjrE0fW/qhxZbnQUv
         cuoUxUDZbinR38WISvo35eEcJeQjvQ+AFSK832FQ+vEpi5ycLooPKHpza5/1347H3j8I
         jllmJwNHz8Ucbq5fWZ2cOTslabGdQagWB3GRQ+GJrxQAZ2oIauaB/snR7ZItpUE926Id
         cYGHZj7YpxiLTgpORcmwCcOocYgjl+HCXWEelg5mbPNFdutikHmYsipy0iZN4NxXNWOR
         TMBfgnbP5gB9DGKNIlakgYrdHTRgI0l7MB9p85Lf9lnC8/8HPeXqlUBr0RT1SP3VXJYz
         4k7A==
X-Gm-Message-State: AOJu0Yxz/uB4AtnoSb4Htj3v5mE/lyFb+oUfr+LfUs9wp6JiUzjSjcyv
	TWf6hrYeZBYtjKCD2ZRau/L0fA==
X-Google-Smtp-Source: AGHT+IESu2OpnVuLPTOJtcoVYMMp2SOswU4gS7Qskq33+blA1d8hPM8St4G0bHbho8eYGD4G/IsfCg==
X-Received: by 2002:a5d:6b88:0:b0:320:2b29:7041 with SMTP id n8-20020a5d6b88000000b003202b297041mr4031970wrx.24.1695215586515;
        Wed, 20 Sep 2023 06:13:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:34a6:a1c2:97a:851d? ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm1966374wml.4.2023.09.20.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 06:13:05 -0700 (PDT)
Message-ID: <7a38037e9ff2603f364307ada2227a6c4901decd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] bsd-headers: Update cdef.h and add error.h
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2023 14:13:05 +0100
In-Reply-To: <20230920043309.265060-2-raj.khem@gmail.com>
References: <20230920043309.265060-1-raj.khem@gmail.com>
	 <20230920043309.265060-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187923

On Tue, 2023-09-19 at 21:33 -0700, Khem Raj wrote:
> error.h is used in many packages and we can use this to provide for
> these packages and report the portability problems upstream without
> patching the packages here.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/bsd-headers.bb      |  4 +-
>  meta/recipes-core/musl/bsd-headers/error.h | 60 ++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/musl/bsd-headers/error.h
>=20
> diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/mu=
sl/bsd-headers.bb
> index 887a8160313..91dc239f888 100644
> --- a/meta/recipes-core/musl/bsd-headers.bb
> +++ b/meta/recipes-core/musl/bsd-headers.bb
> @@ -1,7 +1,7 @@
>  # Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
>  # Released under the MIT license (see COPYING.MIT for the terms)
> =20
> -SUMMARY =3D "BSD compatible headers"
> +SUMMARY =3D "Legacy compatible headers for musl libc"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://sys-queue.h;beginline=3D1;endline=3D32;md5=
=3Dc6352b0f03bb448600456547d334b56f"
>  SECTION =3D "devel"
> @@ -9,6 +9,7 @@ SECTION =3D "devel"
>  SRC_URI =3D "file://sys-queue.h \
>             file://sys-tree.h \
>             file://sys-cdefs.h \
> +           file://error.h \
>            "
>  do_configure[noexec] =3D "1"
>  do_compile[noexec] =3D "1"
> @@ -21,6 +22,7 @@ do_install() {
>  	install -Dm 0644 ${S}/sys-queue.h ${D}${includedir}/sys/queue.h
>  	install -Dm 0644 ${S}/sys-tree.h ${D}${includedir}/sys/tree.h
>  	install -Dm 0644 ${S}/sys-cdefs.h ${D}${includedir}/sys/cdefs.h
> +	install -Dm 0644 ${S}/error.h ${D}${includedir}/error.h
>  }
>  #
>  # We will skip parsing for non-musl systems
> diff --git a/meta/recipes-core/musl/bsd-headers/error.h b/meta/recipes-co=
re/musl/bsd-headers/error.h
> new file mode 100644
> index 00000000000..9a4e1f8d006
> --- /dev/null
> +++ b/meta/recipes-core/musl/bsd-headers/error.h
> @@ -0,0 +1,60 @@
> +#ifndef _ERROR_H_
> +#define _ERROR_H_
> +
> +#include <stdarg.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#warning usage of non-standard #include <error.h> is deprecated
> +
> +static unsigned int error_message_count =3D 0;
> +
> +static inline void error(int status, int errnum, const char* format, ...=
)
> +{
> +	/* should be fflush(stdout), but that's unspecified if stdout has been =
closed;
> +	 * stick with fflush(NULL) for simplicity (glibc checks if the fd is st=
ill valid) */
> +	fflush(NULL);
> +
> +	va_list ap;
> +	fprintf(stderr, "%s: ", program_invocation_name);
> +	va_start(ap, format);
> +	vfprintf(stderr, format, ap);
> +	va_end(ap);
> +	if (errnum)
> +		fprintf(stderr, ": %s", strerror(errnum));
> +	fprintf(stderr, "\n");
> +	error_message_count++;
> +	if (status)
> +		exit(status);
> +}
> +
> +static int error_one_per_line =3D 0;
> +
> +static inline void error_at_line(int status, int errnum, const char *fil=
ename,
> +		unsigned int linenum, const char *format, ...)
> +{
> +	va_list ap;
> +	if (error_one_per_line) {
> +		static const char *old_filename;
> +		static int old_linenum;
> +		if (linenum =3D=3D old_linenum && filename =3D=3D old_filename)
> +			return;
> +		old_filename =3D filename;
> +		old_linenum =3D linenum;
> +	}
> +	fprintf(stderr, "%s: %s:%u: ", program_invocation_name, filename, linen=
um);
> +	va_start(ap, format);
> +	vfprintf(stderr, format, ap);
> +	va_end(ap);
> +	if (errnum)
> +		fprintf(stderr, ": %s", strerror(errnum));
> +	fprintf(stderr, "\n");
> +	error_message_count++;
> +	if (status)
> +		exit(status);
> +}
> +
> +
> +#endif	/* _ERROR_H_ */

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5743/step=
s/14/logs/stdio

multiconfig.MultiConfig.test_multiconfig fails

along with:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7819/step=
s/11/logs/stdio

and

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7840/step=
s/11/logs/stdio

Cheers,

Richard




