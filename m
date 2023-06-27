Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B531EEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:25:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14743.1687875917907020038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 07:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=dPmQ4xcz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-313f61890fbso1811395f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687875916; x=1690467916;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vth58E33cgKkO1HLTDu1SttK2JC+/d8mdekPi9AbllI=;
        b=dPmQ4xczQ51A9ObXjiYOQT2OfuJIhZF50jfTVH0akWY4vmpI96VOKWD0wCgMjIlwAY
         f0DpDwXVAi+/ii3IOMvyKMQwNeXiCononYymV+iuJ3F0oJS7ns/F0wvfbc6NNFkuQHe0
         2qLp6CQRfBMc0ekwGrhKk5cU1NlbhTxYzukmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687875916; x=1690467916;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vth58E33cgKkO1HLTDu1SttK2JC+/d8mdekPi9AbllI=;
        b=JHZlTrTMQPV1eUlKm27CcHVwjc8vtoU0qXhQdTGODVaJwatqq1WtpxnVSvWNQ1nc4P
         y7tQObeafs/frgB6Pu3VA0SlRDRZHyvC0rR9i8Z2ZZCK8OsDJ5flMKWvqqr+uSluFL0N
         CA45WAPWl35+9jNEjRR2q9Ekt5kBTgRlgf787WglJQ2/U1uRhMvlDPdcGs2lxDNHJIXL
         4pOXxivyCXNUMUslNVpfu+zs/f8c6NaBhcHKDl9feT/y5QlxlSVK32wz+gqPFFrv0qPn
         FiH4sDoR4q0dvqTNDWl4R8/KmUDT9z60OJNU1CrR61H3pEz0bLgPa9MnXFXT0O1IAyI6
         Xdug==
X-Gm-Message-State: AC+VfDzFHvn2UWlMrvbWeoyrQFBm+dxfs5vsr+bgqXfmlVZeRKt/zDY4
	i6hQi5jBgPI8dEWRaQQkCnnxtQ==
X-Google-Smtp-Source: ACHHUZ7dCdpu+3wkYAePjgKIhZSaA0XoWWMvP6XX1iXho7tFMMA0/R+bx3+NL1XAxvwG2KtuM6jn1g==
X-Received: by 2002:a5d:66c6:0:b0:313:ebf3:f817 with SMTP id k6-20020a5d66c6000000b00313ebf3f817mr6007559wrw.22.1687875916199;
        Tue, 27 Jun 2023 07:25:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90b7:e2b1:2368:2244? ([2001:8b0:aba:5f3c:90b7:e2b1:2368:2244])
        by smtp.gmail.com with ESMTPSA id q5-20020a05600000c500b0031401bd6387sm1571372wrx.102.2023.06.27.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:25:15 -0700 (PDT)
Message-ID: <833c9684091b2d7ec5326e00a6f76a7aa2c4baf2.camel@linuxfoundation.org>
Subject: Re: [PATCH] [OE-core] [PATCH] gettext: upgrade 0.21.1 -> 0.22
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2023 15:25:15 +0100
In-Reply-To: <1687850250-20040-15-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
	 <1687850250-20040-15-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 14:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183489

On Tue, 2023-06-27 at 15:17 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * PO file format:
>   - When a #: line contains references to file names that contain spaces,
>     these file names are surrounded by Unicode characters U+2068 and U+20=
69.
>     This makes it possible to parse such references correctly.
>=20
> * Improvements for maintainers:
>   - The AM_GNU_GETTEXT macro now defines two variables localedir_c and
>     localedir_c_make, that can be used in C code or in Makefiles,
>     respectively, for representing the value of the --localedir configure
>     option.
>=20
> * Programming languages support:
>   - C, C++:
>     o xgettext now supports gettext-like functions that take wide strings
>       (of type 'const wchar_t *', 'const char16_t *', or 'const char32_t =
*')
>       as arguments.
>     o xgettext now recognizes numbers with digit separators, as defined b=
y
>       ISO C 23, as tokens.
>     o xgettext and msgfmt now recognize the format string directive %b
>       (for binary integer output, as defined by ISO C 23) in format strin=
gs.
>     o xgettext and msgfmt now recognize the argument size specifiers
>       w8, w16, w32, w64, wf8, wf16, wf32, wf64 (as defined by ISO C 23)
>       in format strings.
>     o xgettext and msgfmt now recognize C++ format strings, as defined by
>       ISO C++ 20.  They are marked as 'c++-format' in POT and PO files.
>       A new example has been added, 'hello-c++20', that illustrates how
>       to use these format strings with gettext.
>   - Java:
>     o The build system and tools now also support Java versions newer tha=
n
>       Java 11. This is known to work up to Java 20, at least. On the othe=
r
>       hand, support for old versions of Java (Java 1.5 and GCJ) has been
>       dropped.
>   - Tcl: xgettext now supports the \x, \u, and \U escapes as defined in
>     Tcl 8.6.
>=20
> * Portability:
>   - On systems with musl libc, the *gettext() functions in libc now work
>     with MO files generated from PO files with an encoding other than UTF=
-8.
>     To this effect, the msgfmt program now converts the messages to UTF-8
>     encoding before storing them in a MO file.  You can prevent this by
>     using the msgfmt --no-convert option.
>   - On systems with musl libc, the *gettext() functions in libc now work
>     with MO files generated from PO files with ISO C 99 <inttypes.h> form=
at
>     string directive macros.  To this effect, the msgfmt program pre-expa=
nds
>     strings with such macros.  You can prevent this by using the msgfmt
>     --no-redundancy option.
>=20
> * xgettext:
>   - The xgettext option '--sorted-output' is now deprecated.
>   - xgettext input files of type PO that are not all ASCII and not UTF-8
>     encoded are now handled correctly.
>=20
> * The base Unicode standard is now updated to 15.0.0.
>=20
> * Emacs PO mode:
>   Fix an incompatibility with Emacs version 29 or newer.
>=20
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../0001-init-env.in-do-not-add-C-CXX-parameters.patch          | 0
>  .../0001-tests-autopoint-3-unset-MAKEFLAGS.patch                | 0
>  .../gettext/{gettext-0.21.1 =3D> gettext-0.22}/parallel.patch     | 0
>  .../gettext/{gettext-0.21.1 =3D> gettext-0.22}/run-ptest          | 0
>  .../{gettext-0.21.1 =3D> gettext-0.22}/serial-tests-config.patch  | 0
>  .../{gettext-0.21.1 =3D> gettext-0.22}/use-pkgconfig.patch        | 0
>  .../{gettext-minimal-0.21.1 =3D> gettext-minimal-0.22}/COPYING    | 0
>  .../Makefile.in.in                                              | 0
>  .../aclocal/gettext.m4                                          | 0
>  .../aclocal/host-cpu-c-abi.m4                                   | 0
>  .../aclocal/iconv.m4                                            | 0
>  .../aclocal/intlmacosx.m4                                       | 0
>  .../aclocal/lib-ld.m4                                           | 0
>  .../aclocal/lib-link.m4                                         | 0
>  .../aclocal/lib-prefix.m4                                       | 0
>  .../aclocal/nls.m4                                              | 0
>  .../aclocal/po.m4                                               | 0
>  .../aclocal/progtest.m4                                         | 0
>  .../config.rpath                                                | 0
>  .../remove-potcdate.sin                                         | 0
>  ...-minimal-native_0.21.1.bb =3D> gettext-minimal-native_0.22.bb} | 0
>  .../recipes-core/gettext/{gettext_0.21.1.bb =3D> gettext_0.22.bb} | 2 +-
>  22 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/0001=
-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/0001=
-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/para=
llel.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/run-=
ptest (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/seri=
al-tests-config.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/use-=
pkgconfig.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/COPYING (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/Makefile.in.in (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/gettext.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/host-cpu-c-abi.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/iconv.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/intlmacosx.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/lib-ld.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/lib-link.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/lib-prefix.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/nls.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/po.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/aclocal/progtest.m4 (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/config.rpath (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal-0.22}/remove-potcdate.sin (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb =3D> =
gettext-minimal-native_0.22.bb} (100%)
>  rename meta/recipes-core/gettext/{gettext_0.21.1.bb =3D> gettext_0.22.bb=
} (99%)

When you upgraded this recipe did you check if there were changes to
any of the files in gettext-minimal in the new version? I'm a little
surprised none of the files change at all...

Cheers,

Richard



