Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15940C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:36:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.53719.1685378197728338736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QF1fccoO;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so3263827a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685378196; x=1687970196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxK4ixpTmuYqYq1PZGNuO3H25eELbQaGSwfiUpWZK/I=;
        b=QF1fccoOc1P81KRyrmF+1voBoK68SgXSqUPZ5GOmyTOo79qkms7lLbQB9rEIzaa0Ty
         UdHxSWoz7zRJfkW58Ol9bXlFBwibN5PJCpHbntlToLT69CkmtXGSFMhsvk48NEFglzsn
         P3f/BYCrAmAInXv/Zj1r9bTpb41ejEIwL+tIjCmv81/z4aJLU+TcStUjFC1sDQ6V0Zri
         DPuruh8+Dnjd2OcjWLuTAGqQB8crzvCh/AyobVdV6kyu6xpFGzqcO0/4RpG3ZqqxSx8c
         dQh9cDL4pljZG6HoTliUXnZYitpzyBQUMexBssn7Zs0A8sfPs29vtPS28yN8D79DhuUB
         72Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378196; x=1687970196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxK4ixpTmuYqYq1PZGNuO3H25eELbQaGSwfiUpWZK/I=;
        b=D0RbHDMKucDtFn+UnlPB+Jh+hd1pwyIm9SQDejpMMcQW9mlBuEU59p/FSgZQ2q226t
         Tp5a/0DKxDKu0Z8fZVSyHLlXKFTD/V7yDuzHJ5F1/5tadCAEvCME0Mys82JNtbsxw4TK
         dyjvIoDWJWbnPoL64U7xsch1Jk7jk3Ap3f/DiWRuJlgEYnGRLsP7kXjD74ujMMMTKm3F
         q3YpAX265p7KVttNOW3fHeuxCGYsP4gz4CvZzYnRGZjDIQauIUtXL46QYPht9k44o1Z5
         zRdglDqNWbgmOfzq1LvM4UZBXqVVSQ1gz2e3WsxtOkrr6h4UdTF04rbXxu94P6bNXjYe
         sEbA==
X-Gm-Message-State: AC+VfDwzua0gbJo25Sg7+4weq9I1+drw+hZRrrCnEs3b+mregrY0cPBV
	VLobwzTKKU7srCnqwE56+l2hviPD9SiUFRB/8FD/yQ==
X-Google-Smtp-Source: ACHHUZ58+fIBZQeIoG47KJr5BGXmY5PPll1gPaCROdQt7BQ8+rwcR8wABmMIutvEIVybM07RSulpkkbdGaaLkNA5jfU=
X-Received: by 2002:a17:907:3f0d:b0:895:58be:957 with SMTP id
 hq13-20020a1709073f0d00b0089558be0957mr11558568ejc.2.1685378195656; Mon, 29
 May 2023 09:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230529101550.21677-1-Riyaz.Khan@kpit.com>
In-Reply-To: <20230529101550.21677-1-Riyaz.Khan@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 May 2023 06:36:24 -1000
Message-ID: <CAOSpxdY4ZYPUwZ4ukWNTsK0BGw2EyQJSq=QuDXJVEC5mm776iA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] openssh: Remove BSD-4-clause
 contents completely from codebase
To: Riyaz Ahmed Khan <rak3033@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	riyaz.khan@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181875

On Mon, May 29, 2023 at 12:16=E2=80=AFAM Riyaz Ahmed Khan <rak3033@gmail.co=
m> wrote:
>
> As upstream removed this BSD-4-clause license, there are still some files
> has this license. Below file affected by this BSD-4-clause contents when
> below command is executed
> grep -rl "All advertising materials mentioning features or use of this so=
ftware"
> *|grep -v \.1|grep -v \.5|grep -v \.8 | sort openbsd-compat/libressl-api-=
compat.c
>
> All advertising materials mentioning features or use of this software
>
> Openssh upstream removes the bsd-4 license compeletely from this commit
> https://github.com/openssh/openssh-portable/commit/7280401bdd77ca54be6867=
a154cc01e0d72612e0
> Hence, Remove and backport this commit completely to remove license of BS=
D-4-clause
> contents from codebase. Hunks are refreshed, removed couple of hunks from
> configure.ac and openbsd-compat/libressl-api-compat.c as hunk code
> is not prasent.

I'm getting fuzz errors with this patch:

WARNING: openssh-8.9p1-r0 do_patch: Fuzz detected:

Applying patch 7280401bdd77ca54be6867a154cc01e0d72612e0.patch
patching file .github/workflows/c-cpp.yml
patching file INSTALL
Hunk #1 succeeded at 20 (offset -1 lines).
patching file cipher-aes.c
patching file configure.ac
Hunk #2 succeeded at 2781 with fuzz 2 (offset -64 lines).
Hunk #3 succeeded at 2804 (offset -73 lines).
Hunk #4 succeeded at 2878 (offset -72 lines).
Hunk #5 succeeded at 3006 with fuzz 2 (offset -8 lines).
patching file openbsd-compat/libressl-api-compat.c
patching file openbsd-compat/openssl-compat.h
Hunk #2 succeeded at 80 (offset 25 lines).
Hunk #3 succeeded at 94 (offset 25 lines).

Please correct and send v3

Steve
> Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> ---
>  ...401bdd77ca54be6867a154cc01e0d72612e0.patch | 986 ++++++++++++++++++
>  .../openssh/openssh_8.9p1.bb                  |   1 +
>  2 files changed, 987 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/7280401bdd7=
7ca54be6867a154cc01e0d72612e0.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be=
6867a154cc01e0d72612e0.patch b/meta/recipes-connectivity/openssh/openssh/72=
80401bdd77ca54be6867a154cc01e0d72612e0.patch
> new file mode 100644
> index 0000000000..d9c023e6b6
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a15=
4cc01e0d72612e0.patch
> @@ -0,0 +1,986 @@
> +
> +
> +From 7280401bdd77ca54be6867a154cc01e0d72612e0 Mon Sep 17 00:00:00 2001
> +From: Damien Miller <djm@mindrot.org>
> +Date: Fri, 24 Mar 2023 13:56:25 +1100
> +Subject: [PATCH] remove support for old libcrypto
> +
> +OpenSSH now requires LibreSSL 3.1.0 or greater or
> +OpenSSL 1.1.1 or greater
> +
> +with/ok dtucker@
> +
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/7280401bdd77ca54be6867a154cc01e0d72612e0]
> +Comment: Hunk are refreshed, removed couple of hunks from configure.ac a=
s hunk code is not prasent
> +and backported to the existing code.
> +Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> +
> +---
> + .github/workflows/c-cpp.yml          |   7 -
> + INSTALL                              |   8 +-
> + cipher-aes.c                         |   2 +-
> + configure.ac                         |  96 ++---
> + openbsd-compat/libressl-api-compat.c | 556 +--------------------------
> + openbsd-compat/openssl-compat.h      | 151 +-------
> + 6 files changed, 40 insertions(+), 780 deletions(-)
> +
> +diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
> +index 3d9aa22dba5..d299a32468d 100644
> +--- a/.github/workflows/c-cpp.yml
> ++++ b/.github/workflows/c-cpp.yml
> +@@ -40,18 +40,11 @@
> +           - { os: ubuntu-20.04, configs: tcmalloc }
> +           - { os: ubuntu-20.04, configs: musl }
> +           - { os: ubuntu-latest, configs: libressl-master }
> +-          - { os: ubuntu-latest, configs: libressl-2.2.9 }
> +-          - { os: ubuntu-latest, configs: libressl-2.8.3 }
> +-          - { os: ubuntu-latest, configs: libressl-3.0.2 }
> +           - { os: ubuntu-latest, configs: libressl-3.2.6 }
> +           - { os: ubuntu-latest, configs: libressl-3.3.4 }
> +           - { os: ubuntu-latest, configs: libressl-3.4.1 }
> +           - { os: ubuntu-latest, configs: openssl-master }
> +           - { os: ubuntu-latest, configs: openssl-noec }
> +-          - { os: ubuntu-latest, configs: openssl-1.0.1 }
> +-          - { os: ubuntu-latest, configs: openssl-1.0.1u }
> +-          - { os: ubuntu-latest, configs: openssl-1.0.2u }
> +-          - { os: ubuntu-latest, configs: openssl-1.1.0h }
> +           - { os: ubuntu-latest, configs: openssl-1.1.1 }
> +           - { os: ubuntu-latest, configs: openssl-1.1.1k }
> +           - { os: ubuntu-latest, configs: openssl-3.0.0 }
> +diff --git a/INSTALL b/INSTALL
> +index 68b15e13190..f99d1e2a809 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -21,12 +21,8 @@ https://zlib.net/
> +
> + libcrypto from either of LibreSSL or OpenSSL.  Building without libcryp=
to
> + is supported but severely restricts the available ciphers and algorithm=
s.
> +- - LibreSSL (https://www.libressl.org/)
> +- - OpenSSL (https://www.openssl.org) with any of the following versions=
:
> +-   - 1.0.x >=3D 1.0.1 or 1.1.0 >=3D 1.1.0g or any 1.1.1
> +-
> +-Note that due to a bug in EVP_CipherInit OpenSSL 1.1 versions prior to
> +-1.1.0g can't be used.
> ++ - LibreSSL (https://www.libressl.org/) 3.1.0 or greater
> ++ - OpenSSL (https://www.openssl.org) 1.1.1 or greater
> +
> + LibreSSL/OpenSSL should be compiled as a position-independent library
> + (i.e. -fPIC, eg by configuring OpenSSL as "./config [options] -fPIC"
> +diff --git a/cipher-aes.c b/cipher-aes.c
> +index 8b101727284..87c763353d8 100644
> +--- a/cipher-aes.c
> ++++ b/cipher-aes.c
> +@@ -69,7 +69,7 @@ ssh_rijndael_init(EVP_CIPHER_CTX *ctx, const u_char *k=
ey, const u_char *iv,
> +
> + static int
> + ssh_rijndael_cbc(EVP_CIPHER_CTX *ctx, u_char *dest, const u_char *src,
> +-    LIBCRYPTO_EVP_INL_TYPE len)
> ++    size_t len)
> + {
> +       struct ssh_rijndael_ctx *c;
> +       u_char buf[RIJNDAEL_BLOCKSIZE];
> +diff --git a/configure.ac b/configure.ac
> +index 22fee70f604..1c0ccdf19c5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2744,42 +2744,40 @@
> +       #include <openssl/crypto.h>
> +       #define DATA "conftest.ssllibver"
> +               ]], [[
> +-              FILE *fd;
> +-              int rc;
> ++              FILE *f;
> +
> +-              fd =3D fopen(DATA,"w");
> +-              if(fd =3D=3D NULL)
> ++              if ((f =3D fopen(DATA, "w")) =3D=3D NULL)
> +                       exit(1);
> +-#ifndef OPENSSL_VERSION
> +-# define OPENSSL_VERSION SSLEAY_VERSION
> +-#endif
> +-#ifndef HAVE_OPENSSL_VERSION
> +-# define OpenSSL_version      SSLeay_version
> +-#endif
> +-#ifndef HAVE_OPENSSL_VERSION_NUM
> +-# define OpenSSL_version_num  SSLeay
> +-#endif
> +-              if ((rc =3D fprintf(fd, "%08lx (%s)\n",
> ++              if (fprintf(f, "%08lx (%s)",
> +                   (unsigned long)OpenSSL_version_num(),
> +-                  OpenSSL_version(OPENSSL_VERSION))) < 0)
> ++                  OpenSSL_version(OPENSSL_VERSION)) < 0)
> ++                      exit(1);
> ++#ifdef LIBRESSL_VERSION_NUMBER
> ++              if (fprintf(f, " libressl-%08lx", LIBRESSL_VERSION_NUMBER=
) < 0)
> ++                      exit(1);
> ++#endif
> ++              if (fputc('\n', f) =3D=3D EOF || fclose(f) =3D=3D EOF)
> +                       exit(1);
> +-
> +               exit(0);
> +               ]])],
> +               [
> +-                      ssl_library_ver=3D`cat conftest.ssllibver`
> ++                      sslver=3D`cat conftest.ssllibver`
> ++                      ssl_showver=3D`echo "$sslver" | sed 's/ libressl-=
.*//'`
> +                       # Check version is supported.
> +-                      case "$ssl_library_ver" in
> +-                      10000*|0*)
> +-                              AC_MSG_ERROR([OpenSSL >=3D 1.0.1 required=
 (have "$ssl_library_ver")])
> +-                              ;;
> +-                      100*)   ;; # 1.0.x
> +-                      101000[[0123456]]*)
> +-                              # https://github.com/openssl/openssl/pull=
/4613
> +-                              AC_MSG_ERROR([OpenSSL 1.1.x versions prio=
r to 1.1.0g have a bug that breaks their use with OpenSSH (have "$ssl_libra=
ry_ver")])
> ++                      case "$sslver" in
> ++                      100*|10100*) # 1.0.x, 1.1.0x
> ++                              AC_MSG_ERROR([OpenSSL >=3D 1.1.1 required=
 (have "$ssl_showver")])
> +                               ;;
> +                       101*)   ;; # 1.1.x
> +-                      200*)   ;; # LibreSSL
> ++                      200*)   # LibreSSL
> ++                              lver=3D`echo "$sslver" | sed 's/.*libress=
l-//'`
> ++                              case "$lver" in
> ++                              2*|300*) # 2.x, 3.0.0
> ++                                      AC_MSG_ERROR([LibreSSL >=3D 3.1.0=
 required (have "$ssl_showver")])
> ++                                      ;;
> ++                              *) ;;   # Assume all other versions are g=
ood.
> ++                              esac
> ++                              ;;
> +                       300*)   ;; # OpenSSL 3
> +                       301*)   ;; # OpenSSL development branch.
> +                       *)
> +@@ -2847,10 +2845,10 @@ if test "x$openssl" =3D "xyes" ; then
> +                               CPPFLAGS=3D"$CPPFLAGS -DOPENSSL_API_COMPA=
T=3D0x10100000L"
> +                               ;;
> +                       *)
> +-                              AC_MSG_ERROR([Unknown/unsupported OpenSSL=
 version ("$ssl_library_ver")])
> ++                              AC_MSG_ERROR([Unknown/unsupported OpenSSL=
 version ("$ssl_showver")])
> +                               ;;
> +                       esac
> +-                      AC_MSG_RESULT([$ssl_library_ver])
> ++                      AC_MSG_RESULT([$ssl_showver])
> +               ],
> +               [
> +                       AC_MSG_RESULT([not found])
> +@@ -2879,9 +2877,6 @@ if test "x$openssl" =3D "xyes" ; then
> +       #include <openssl/opensslv.h>
> +       #include <openssl/crypto.h>
> +               ]], [[
> +-#ifndef HAVE_OPENSSL_VERSION_NUM
> +-# define OpenSSL_version_num  SSLeay
> +-#endif
> +               exit(OpenSSL_version_num() =3D=3D OPENSSL_VERSION_NUMBER =
? 0 : 1);
> +               ]])],
> +               [
> +@@ -2955,44 +2950,13 @@ if test "x$openssl" =3D "xyes" ; then
> +           )
> +       )
> +
> +-      # LibreSSL/OpenSSL 1.1x API
> ++      # LibreSSL/OpenSSL API differences
> +       AC_CHECK_FUNCS([ \
> +-              OPENSSL_init_crypto \
> +-              DH_get0_key \
> +-              DH_get0_pqg \
> +-              DH_set0_key \
> +-              DH_set_length \
> +-              DH_set0_pqg \
> +-              DSA_get0_key \
> +-              DSA_get0_pqg \
> +-              DSA_set0_key \
> +-              DSA_set0_pqg \
> +-              DSA_SIG_get0 \
> +-              DSA_SIG_set0 \
> +-              ECDSA_SIG_get0 \
> +-              ECDSA_SIG_set0 \
> +               EVP_CIPHER_CTX_iv \
> +               EVP_CIPHER_CTX_iv_noconst \
> +               EVP_CIPHER_CTX_get_iv \
> +               EVP_CIPHER_CTX_get_updated_iv \
> +               EVP_CIPHER_CTX_set_iv \
> +-              RSA_get0_crt_params \
> +-              RSA_get0_factors \
> +-              RSA_get0_key \
> +-              RSA_set0_crt_params \
> +-              RSA_set0_factors \
> +-              RSA_set0_key \
> +-              RSA_meth_free \
> +-              RSA_meth_dup \
> +-              RSA_meth_set1_name \
> +-              RSA_meth_get_finish \
> +-              RSA_meth_set_priv_enc \
> +-              RSA_meth_set_priv_dec \
> +-              RSA_meth_set_finish \
> +-              EVP_PKEY_get0_RSA \
> +-              EVP_MD_CTX_new \
> +-              EVP_MD_CTX_free \
> +-              EVP_chacha20 \
> +       ])
> +
> +       if test "x$openssl_engine" =3D "xyes" ; then
> +@@ -3050,8 +3014,8 @@ if test "x$openssl" =3D "xyes" ; then
> +               ]
> +       )
> +
> +-      # Check for SHA256, SHA384 and SHA512 support in OpenSSL
> +-      AC_CHECK_FUNCS([EVP_sha256 EVP_sha384 EVP_sha512])
> ++      # Check for various EVP support in OpenSSL
> ++      AC_CHECK_FUNCS([EVP_sha256 EVP_sha384 EVP_sha512 EVP_chacha20])
> +
> +       # Check complete ECC support in OpenSSL
> +       AC_MSG_CHECKING([whether OpenSSL has NID_X9_62_prime256v1])
> +diff --git a/openbsd-compat/libressl-api-compat.c b/openbsd-compat/libre=
ssl-api-compat.c
> +index 498180dc894..59be17397c5 100644
> +--- a/openbsd-compat/libressl-api-compat.c
> ++++ b/openbsd-compat/libressl-api-compat.c
> +@@ -1,129 +1,5 @@
> +-/* $OpenBSD: dsa_lib.c,v 1.29 2018/04/14 07:09:21 tb Exp $ */
> +-/* $OpenBSD: rsa_lib.c,v 1.37 2018/04/14 07:09:21 tb Exp $ */
> +-/* $OpenBSD: evp_lib.c,v 1.17 2018/09/12 06:35:38 djm Exp $ */
> +-/* $OpenBSD: dh_lib.c,v 1.32 2018/05/02 15:48:38 tb Exp $ */
> +-/* $OpenBSD: p_lib.c,v 1.24 2018/05/30 15:40:50 tb Exp $ */
> +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */
> +-/* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
> +- * All rights reserved.
> +- *
> +- * This package is an SSL implementation written
> +- * by Eric Young (eay@cryptsoft.com).
> +- * The implementation was written so as to conform with Netscapes SSL.
> +- *
> +- * This library is free for commercial and non-commercial use as long a=
s
> +- * the following conditions are aheared to.  The following conditions
> +- * apply to all code found in this distribution, be it the RC4, RSA,
> +- * lhash, DES, etc., code; not just the SSL code.  The SSL documentatio=
n
> +- * included with this distribution is covered by the same copyright ter=
ms
> +- * except that the holder is Tim Hudson (tjh@cryptsoft.com).
> +- *
> +- * Copyright remains Eric Young's, and as such any Copyright notices in
> +- * the code are not to be removed.
> +- * If this package is used in a product, Eric Young should be given att=
ribution
> +- * as the author of the parts of the library used.
> +- * This can be in the form of a textual message at program startup or
> +- * in documentation (online or textual) provided with the package.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that the following conditions
> +- * are met:
> +- * 1. Redistributions of source code must retain the copyright
> +- *    notice, this list of conditions and the following disclaimer.
> +- * 2. Redistributions in binary form must reproduce the above copyright
> +- *    notice, this list of conditions and the following disclaimer in t=
he
> +- *    documentation and/or other materials provided with the distributi=
on.
> +- * 3. All advertising materials mentioning features or use of this soft=
ware
> +- *    must display the following acknowledgement:
> +- *    "This product includes cryptographic software written by
> +- *     Eric Young (eay@cryptsoft.com)"
> +- *    The word 'cryptographic' can be left out if the rouines from the =
library
> +- *    being used are not cryptographic related :-).
> +- * 4. If you include any Windows specific code (or a derivative thereof=
) from
> +- *    the apps directory (application code) you must include an acknowl=
edgement:
> +- *    "This product includes software written by Tim Hudson (tjh@crypts=
oft.com)"
> +- *
> +- * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
> +- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, TH=
E
> +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR P=
URPOSE
> +- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIA=
BLE
> +- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQU=
ENTIAL
> +- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GO=
ODS
> +- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION=
)
> +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, =
STRICT
> +- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN AN=
Y WAY
> +- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY =
OF
> +- * SUCH DAMAGE.
> +- *
> +- * The licence and distribution terms for any publically available vers=
ion or
> +- * derivative of this code cannot be changed.  i.e. this code cannot si=
mply be
> +- * copied and put under another distribution licence
> +- * [including the GNU Public Licence.]
> +- */
> +-
> +-/* $OpenBSD: dsa_asn1.c,v 1.22 2018/06/14 17:03:19 jsing Exp $ */
> +-/* $OpenBSD: ecs_asn1.c,v 1.9 2018/03/17 15:24:44 tb Exp $ */
> +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */
> +-/* Written by Dr Stephen N Henson (steve@openssl.org) for the OpenSSL
> +- * project 2000.
> +- */
> +-/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +- * Copyright (c) 2000-2005 The OpenSSL Project.  All rights reserved.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that the following conditions
> +- * are met:
> +- *
> +- * 1. Redistributions of source code must retain the above copyright
> +- *    notice, this list of conditions and the following disclaimer.
> +- *
> +- * 2. Redistributions in binary form must reproduce the above copyright
> +- *    notice, this list of conditions and the following disclaimer in
> +- *    the documentation and/or other materials provided with the
> +- *    distribution.
> +- *
> +- * 3. All advertising materials mentioning features or use of this
> +- *    software must display the following acknowledgment:
> +- *    "This product includes software developed by the OpenSSL Project
> +- *    for use in the OpenSSL Toolkit. (http://www.OpenSSL.org/)"
> +- *
> +- * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be use=
d to
> +- *    endorse or promote products derived from this software without
> +- *    prior written permission. For written permission, please contact
> +- *    licensing@OpenSSL.org.
> +- *
> +- * 5. Products derived from this software may not be called "OpenSSL"
> +- *    nor may "OpenSSL" appear in their names without prior written
> +- *    permission of the OpenSSL Project.
> +- *
> +- * 6. Redistributions of any form whatsoever must retain the following
> +- *    acknowledgment:
> +- *    "This product includes software developed by the OpenSSL Project
> +- *    for use in the OpenSSL Toolkit (http://www.OpenSSL.org/)"
> +- *
> +- * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
> +- * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> +- * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
> +- * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> +- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> +- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
> +- * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
> +- * OF THE POSSIBILITY OF SUCH DAMAGE.
> +- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +- *
> +- * This product includes cryptographic software written by Eric Young
> +- * (eay@cryptsoft.com).  This product includes software written by Tim
> +- * Hudson (tjh@cryptsoft.com).
> +- *
> +- */
> +-
> +-/*    $OpenBSD: rsa_meth.c,v 1.2 2018/09/12 06:35:38 djm Exp $        *=
/
> + /*
> +- * Copyright (c) 2018 Theo Buehler <tb@openbsd.org>
> ++ * Copyright (c) 2018 Damien Miller <djm@mindrot.org>
> +  *
> +  * Permission to use, copy, modify, and distribute this software for an=
y
> +  * purpose with or without fee is hereby granted, provided that the abo=
ve
> +@@ -147,192 +23,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> +-#include <openssl/err.h>
> +-#include <openssl/bn.h>
> +-#include <openssl/dsa.h>
> +-#include <openssl/rsa.h>
> + #include <openssl/evp.h>
> +-#ifdef OPENSSL_HAS_ECC
> +-#include <openssl/ecdsa.h>
> +-#endif
> +-#include <openssl/dh.h>
> +-
> +-#ifndef HAVE_DSA_GET0_PQG
> +-void
> +-DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q, const BI=
GNUM **g)
> +-{
> +-      if (p !=3D NULL)
> +-              *p =3D d->p;
> +-      if (q !=3D NULL)
> +-              *q =3D d->q;
> +-      if (g !=3D NULL)
> +-              *g =3D d->g;
> +-}
> +-#endif /* HAVE_DSA_GET0_PQG */
> +-
> +-#ifndef HAVE_DSA_SET0_PQG
> +-int
> +-DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> +-{
> +-      if ((d->p =3D=3D NULL && p =3D=3D NULL) || (d->q =3D=3D NULL && q=
 =3D=3D NULL) ||
> +-          (d->g =3D=3D NULL && g =3D=3D NULL))
> +-              return 0;
> +-
> +-      if (p !=3D NULL) {
> +-              BN_free(d->p);
> +-              d->p =3D p;
> +-      }
> +-      if (q !=3D NULL) {
> +-              BN_free(d->q);
> +-              d->q =3D q;
> +-      }
> +-      if (g !=3D NULL) {
> +-              BN_free(d->g);
> +-              d->g =3D g;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_DSA_SET0_PQG */
> +-
> +-#ifndef HAVE_DSA_GET0_KEY
> +-void
> +-DSA_get0_key(const DSA *d, const BIGNUM **pub_key, const BIGNUM **priv_=
key)
> +-{
> +-      if (pub_key !=3D NULL)
> +-              *pub_key =3D d->pub_key;
> +-      if (priv_key !=3D NULL)
> +-              *priv_key =3D d->priv_key;
> +-}
> +-#endif /* HAVE_DSA_GET0_KEY */
> +-
> +-#ifndef HAVE_DSA_SET0_KEY
> +-int
> +-DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key)
> +-{
> +-      if (d->pub_key =3D=3D NULL && pub_key =3D=3D NULL)
> +-              return 0;
> +-
> +-      if (pub_key !=3D NULL) {
> +-              BN_free(d->pub_key);
> +-              d->pub_key =3D pub_key;
> +-      }
> +-      if (priv_key !=3D NULL) {
> +-              BN_free(d->priv_key);
> +-              d->priv_key =3D priv_key;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_DSA_SET0_KEY */
> +-
> +-#ifndef HAVE_RSA_GET0_KEY
> +-void
> +-RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e, const BI=
GNUM **d)
> +-{
> +-      if (n !=3D NULL)
> +-              *n =3D r->n;
> +-      if (e !=3D NULL)
> +-              *e =3D r->e;
> +-      if (d !=3D NULL)
> +-              *d =3D r->d;
> +-}
> +-#endif /* HAVE_RSA_GET0_KEY */
> +-
> +-#ifndef HAVE_RSA_SET0_KEY
> +-int
> +-RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
> +-{
> +-      if ((r->n =3D=3D NULL && n =3D=3D NULL) || (r->e =3D=3D NULL && e=
 =3D=3D NULL))
> +-              return 0;
> +-
> +-      if (n !=3D NULL) {
> +-              BN_free(r->n);
> +-              r->n =3D n;
> +-      }
> +-      if (e !=3D NULL) {
> +-              BN_free(r->e);
> +-              r->e =3D e;
> +-      }
> +-      if (d !=3D NULL) {
> +-              BN_free(r->d);
> +-              r->d =3D d;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_SET0_KEY */
> +-
> +-#ifndef HAVE_RSA_GET0_CRT_PARAMS
> +-void
> +-RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BIGNUM **d=
mq1,
> +-    const BIGNUM **iqmp)
> +-{
> +-      if (dmp1 !=3D NULL)
> +-              *dmp1 =3D r->dmp1;
> +-      if (dmq1 !=3D NULL)
> +-              *dmq1 =3D r->dmq1;
> +-      if (iqmp !=3D NULL)
> +-              *iqmp =3D r->iqmp;
> +-}
> +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */
> +-
> +-#ifndef HAVE_RSA_SET0_CRT_PARAMS
> +-int
> +-RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *iqmp)
> +-{
> +-      if ((r->dmp1 =3D=3D NULL && dmp1 =3D=3D NULL) ||
> +-          (r->dmq1 =3D=3D NULL && dmq1 =3D=3D NULL) ||
> +-          (r->iqmp =3D=3D NULL && iqmp =3D=3D NULL))
> +-              return 0;
> +-
> +-      if (dmp1 !=3D NULL) {
> +-              BN_free(r->dmp1);
> +-              r->dmp1 =3D dmp1;
> +-      }
> +-      if (dmq1 !=3D NULL) {
> +-              BN_free(r->dmq1);
> +-              r->dmq1 =3D dmq1;
> +-      }
> +-      if (iqmp !=3D NULL) {
> +-              BN_free(r->iqmp);
> +-              r->iqmp =3D iqmp;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */
> +-
> +-#ifndef HAVE_RSA_GET0_FACTORS
> +-void
> +-RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **q)
> +-{
> +-      if (p !=3D NULL)
> +-              *p =3D r->p;
> +-      if (q !=3D NULL)
> +-              *q =3D r->q;
> +-}
> +-#endif /* HAVE_RSA_GET0_FACTORS */
> +-
> +-#ifndef HAVE_RSA_SET0_FACTORS
> +-int
> +-RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q)
> +-{
> +-      if ((r->p =3D=3D NULL && p =3D=3D NULL) || (r->q =3D=3D NULL && q=
 =3D=3D NULL))
> +-              return 0;
> +-
> +-      if (p !=3D NULL) {
> +-              BN_free(r->p);
> +-              r->p =3D p;
> +-      }
> +-      if (q !=3D NULL) {
> +-              BN_free(r->q);
> +-              r->q =3D q;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_SET0_FACTORS */
> +
> + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV
> + int
> +@@ -392,249 +83,4 @@ EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx, const un=
signed char *iv, size_t len)
> + }
> + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */
> +
> +-#ifndef HAVE_DSA_SIG_GET0
> +-void
> +-DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const BIGNUM **ps)
> +-{
> +-      if (pr !=3D NULL)
> +-              *pr =3D sig->r;
> +-      if (ps !=3D NULL)
> +-              *ps =3D sig->s;
> +-}
> +-#endif /* HAVE_DSA_SIG_GET0 */
> +-
> +-#ifndef HAVE_DSA_SIG_SET0
> +-int
> +-DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s)
> +-{
> +-      if (r =3D=3D NULL || s =3D=3D NULL)
> +-              return 0;
> +-
> +-      BN_clear_free(sig->r);
> +-      sig->r =3D r;
> +-      BN_clear_free(sig->s);
> +-      sig->s =3D s;
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_DSA_SIG_SET0 */
> +-
> +-#ifdef OPENSSL_HAS_ECC
> +-#ifndef HAVE_ECDSA_SIG_GET0
> +-void
> +-ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const BIGNUM **=
ps)
> +-{
> +-      if (pr !=3D NULL)
> +-              *pr =3D sig->r;
> +-      if (ps !=3D NULL)
> +-              *ps =3D sig->s;
> +-}
> +-#endif /* HAVE_ECDSA_SIG_GET0 */
> +-
> +-#ifndef HAVE_ECDSA_SIG_SET0
> +-int
> +-ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
> +-{
> +-      if (r =3D=3D NULL || s =3D=3D NULL)
> +-              return 0;
> +-
> +-      BN_clear_free(sig->r);
> +-      BN_clear_free(sig->s);
> +-      sig->r =3D r;
> +-      sig->s =3D s;
> +-      return 1;
> +-}
> +-#endif /* HAVE_ECDSA_SIG_SET0 */
> +-#endif /* OPENSSL_HAS_ECC */
> +-
> +-#ifndef HAVE_DH_GET0_PQG
> +-void
> +-DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q, const BIG=
NUM **g)
> +-{
> +-      if (p !=3D NULL)
> +-              *p =3D dh->p;
> +-      if (q !=3D NULL)
> +-              *q =3D dh->q;
> +-      if (g !=3D NULL)
> +-              *g =3D dh->g;
> +-}
> +-#endif /* HAVE_DH_GET0_PQG */
> +-
> +-#ifndef HAVE_DH_SET0_PQG
> +-int
> +-DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> +-{
> +-      if ((dh->p =3D=3D NULL && p =3D=3D NULL) || (dh->g =3D=3D NULL &&=
 g =3D=3D NULL))
> +-              return 0;
> +-
> +-      if (p !=3D NULL) {
> +-              BN_free(dh->p);
> +-              dh->p =3D p;
> +-      }
> +-      if (q !=3D NULL) {
> +-              BN_free(dh->q);
> +-              dh->q =3D q;
> +-      }
> +-      if (g !=3D NULL) {
> +-              BN_free(dh->g);
> +-              dh->g =3D g;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_DH_SET0_PQG */
> +-
> +-#ifndef HAVE_DH_GET0_KEY
> +-void
> +-DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv_k=
ey)
> +-{
> +-      if (pub_key !=3D NULL)
> +-              *pub_key =3D dh->pub_key;
> +-      if (priv_key !=3D NULL)
> +-              *priv_key =3D dh->priv_key;
> +-}
> +-#endif /* HAVE_DH_GET0_KEY */
> +-
> +-#ifndef HAVE_DH_SET0_KEY
> +-int
> +-DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key)
> +-{
> +-      if (pub_key !=3D NULL) {
> +-              BN_free(dh->pub_key);
> +-              dh->pub_key =3D pub_key;
> +-      }
> +-      if (priv_key !=3D NULL) {
> +-              BN_free(dh->priv_key);
> +-              dh->priv_key =3D priv_key;
> +-      }
> +-
> +-      return 1;
> +-}
> +-#endif /* HAVE_DH_SET0_KEY */
> +-
> +-#ifndef HAVE_DH_SET_LENGTH
> +-int
> +-DH_set_length(DH *dh, long length)
> +-{
> +-      if (length < 0 || length > INT_MAX)
> +-              return 0;
> +-
> +-      dh->length =3D length;
> +-      return 1;
> +-}
> +-#endif /* HAVE_DH_SET_LENGTH */
> +-
> +-#ifndef HAVE_RSA_METH_FREE
> +-void
> +-RSA_meth_free(RSA_METHOD *meth)
> +-{
> +-      if (meth !=3D NULL) {
> +-              free((char *)meth->name);
> +-              free(meth);
> +-      }
> +-}
> +-#endif /* HAVE_RSA_METH_FREE */
> +-
> +-#ifndef HAVE_RSA_METH_DUP
> +-RSA_METHOD *
> +-RSA_meth_dup(const RSA_METHOD *meth)
> +-{
> +-      RSA_METHOD *copy;
> +-
> +-      if ((copy =3D calloc(1, sizeof(*copy))) =3D=3D NULL)
> +-              return NULL;
> +-      memcpy(copy, meth, sizeof(*copy));
> +-      if ((copy->name =3D strdup(meth->name)) =3D=3D NULL) {
> +-              free(copy);
> +-              return NULL;
> +-      }
> +-
> +-      return copy;
> +-}
> +-#endif /* HAVE_RSA_METH_DUP */
> +-
> +-#ifndef HAVE_RSA_METH_SET1_NAME
> +-int
> +-RSA_meth_set1_name(RSA_METHOD *meth, const char *name)
> +-{
> +-      char *copy;
> +-
> +-      if ((copy =3D strdup(name)) =3D=3D NULL)
> +-              return 0;
> +-      free((char *)meth->name);
> +-      meth->name =3D copy;
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_METH_SET1_NAME */
> +-
> +-#ifndef HAVE_RSA_METH_GET_FINISH
> +-int
> +-(*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa)
> +-{
> +-      return meth->finish;
> +-}
> +-#endif /* HAVE_RSA_METH_GET_FINISH */
> +-
> +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC
> +-int
> +-RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int flen,
> +-    const unsigned char *from, unsigned char *to, RSA *rsa, int padding=
))
> +-{
> +-      meth->rsa_priv_enc =3D priv_enc;
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */
> +-
> +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC
> +-int
> +-RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int flen,
> +-    const unsigned char *from, unsigned char *to, RSA *rsa, int padding=
))
> +-{
> +-      meth->rsa_priv_dec =3D priv_dec;
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */
> +-
> +-#ifndef HAVE_RSA_METH_SET_FINISH
> +-int
> +-RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa))
> +-{
> +-      meth->finish =3D finish;
> +-      return 1;
> +-}
> +-#endif /* HAVE_RSA_METH_SET_FINISH */
> +-
> +-#ifndef HAVE_EVP_PKEY_GET0_RSA
> +-RSA *
> +-EVP_PKEY_get0_RSA(EVP_PKEY *pkey)
> +-{
> +-      if (pkey->type !=3D EVP_PKEY_RSA) {
> +-              /* EVPerror(EVP_R_EXPECTING_AN_RSA_KEY); */
> +-              return NULL;
> +-      }
> +-      return pkey->pkey.rsa;
> +-}
> +-#endif /* HAVE_EVP_PKEY_GET0_RSA */
> +-
> +-#ifndef HAVE_EVP_MD_CTX_NEW
> +-EVP_MD_CTX *
> +-EVP_MD_CTX_new(void)
> +-{
> +-      return calloc(1, sizeof(EVP_MD_CTX));
> +-}
> +-#endif /* HAVE_EVP_MD_CTX_NEW */
> +-
> +-#ifndef HAVE_EVP_MD_CTX_FREE
> +-void
> +-EVP_MD_CTX_free(EVP_MD_CTX *ctx)
> +-{
> +-      if (ctx =3D=3D NULL)
> +-              return;
> +-
> +-      EVP_MD_CTX_cleanup(ctx);
> +-
> +-      free(ctx);
> +-}
> +-#endif /* HAVE_EVP_MD_CTX_FREE */
> +-
> + #endif /* WITH_OPENSSL */
> +diff --git a/openbsd-compat/openssl-compat.h b/openbsd-compat/openssl-co=
mpat.h
> +index 61a69dd56eb..d0dd2c3450d 100644
> +--- a/openbsd-compat/openssl-compat.h
> ++++ b/openbsd-compat/openssl-compat.h
> +@@ -33,26 +33,13 @@
> + int ssh_compatible_openssl(long, long);
> + void ssh_libcrypto_init(void);
> +
> +-#if (OPENSSL_VERSION_NUMBER < 0x1000100fL)
> +-# error OpenSSL 1.0.1 or greater is required
> ++#if (OPENSSL_VERSION_NUMBER < 0x10100000L)
> ++# error OpenSSL 1.1.0 or greater is required
> + #endif
> +-
> +-#ifndef OPENSSL_VERSION
> +-# define OPENSSL_VERSION      SSLEAY_VERSION
> +-#endif
> +-
> +-#ifndef HAVE_OPENSSL_VERSION
> +-# define OpenSSL_version(x)   SSLeay_version(x)
> +-#endif
> +-
> +-#ifndef HAVE_OPENSSL_VERSION_NUM
> +-# define OpenSSL_version_num  SSLeay
> +-#endif
> +-
> +-#if OPENSSL_VERSION_NUMBER < 0x10000001L
> +-# define LIBCRYPTO_EVP_INL_TYPE unsigned int
> +-#else
> +-# define LIBCRYPTO_EVP_INL_TYPE size_t
> ++#ifdef LIBRESSL_VERSION_NUMBER
> ++# if LIBRESSL_VERSION_NUMBER < 0x3010000fL
> ++#  error LibreSSL 3.1.0 or greater is required
> ++# endif
> + #endif
> +
> + #ifndef OPENSSL_RSA_MAX_MODULUS_BITS
> +@@ -68,25 +55,6 @@ void ssh_libcrypto_init(void);
> + # endif
> + #endif
> +
> +-/* LibreSSL/OpenSSL 1.1x API compat */
> +-#ifndef HAVE_DSA_GET0_PQG
> +-void DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q,
> +-    const BIGNUM **g);
> +-#endif /* HAVE_DSA_GET0_PQG */
> +-
> +-#ifndef HAVE_DSA_SET0_PQG
> +-int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> +-#endif /* HAVE_DSA_SET0_PQG */
> +-
> +-#ifndef HAVE_DSA_GET0_KEY
> +-void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
> +-    const BIGNUM **priv_key);
> +-#endif /* HAVE_DSA_GET0_KEY */
> +-
> +-#ifndef HAVE_DSA_SET0_KEY
> +-int DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key);
> +-#endif /* HAVE_DSA_SET0_KEY */
> +-
> + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV
> + # ifdef HAVE_EVP_CIPHER_CTX_GET_UPDATED_IV
> + #  define EVP_CIPHER_CTX_get_iv EVP_CIPHER_CTX_get_updated_iv
> +@@ -101,112 +69,5 @@ int EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx,
> +     const unsigned char *iv, size_t len);
> + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */
> +
> +-#ifndef HAVE_RSA_GET0_KEY
> +-void RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e,
> +-    const BIGNUM **d);
> +-#endif /* HAVE_RSA_GET0_KEY */
> +-
> +-#ifndef HAVE_RSA_SET0_KEY
> +-int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
> +-#endif /* HAVE_RSA_SET0_KEY */
> +-
> +-#ifndef HAVE_RSA_GET0_CRT_PARAMS
> +-void RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BIGNU=
M **dmq1,
> +-    const BIGNUM **iqmp);
> +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */
> +-
> +-#ifndef HAVE_RSA_SET0_CRT_PARAMS
> +-int RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *iqm=
p);
> +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */
> +-
> +-#ifndef HAVE_RSA_GET0_FACTORS
> +-void RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **q)=
;
> +-#endif /* HAVE_RSA_GET0_FACTORS */
> +-
> +-#ifndef HAVE_RSA_SET0_FACTORS
> +-int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q);
> +-#endif /* HAVE_RSA_SET0_FACTORS */
> +-
> +-#ifndef DSA_SIG_GET0
> +-void DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const BIGNUM *=
*ps);
> +-#endif /* DSA_SIG_GET0 */
> +-
> +-#ifndef DSA_SIG_SET0
> +-int DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s);
> +-#endif /* DSA_SIG_SET0 */
> +-
> +-#ifdef OPENSSL_HAS_ECC
> +-#ifndef HAVE_ECDSA_SIG_GET0
> +-void ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const BIGN=
UM **ps);
> +-#endif /* HAVE_ECDSA_SIG_GET0 */
> +-
> +-#ifndef HAVE_ECDSA_SIG_SET0
> +-int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s);
> +-#endif /* HAVE_ECDSA_SIG_SET0 */
> +-#endif /* OPENSSL_HAS_ECC */
> +-
> +-#ifndef HAVE_DH_GET0_PQG
> +-void DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q,
> +-    const BIGNUM **g);
> +-#endif /* HAVE_DH_GET0_PQG */
> +-
> +-#ifndef HAVE_DH_SET0_PQG
> +-int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> +-#endif /* HAVE_DH_SET0_PQG */
> +-
> +-#ifndef HAVE_DH_GET0_KEY
> +-void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **p=
riv_key);
> +-#endif /* HAVE_DH_GET0_KEY */
> +-
> +-#ifndef HAVE_DH_SET0_KEY
> +-int DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key);
> +-#endif /* HAVE_DH_SET0_KEY */
> +-
> +-#ifndef HAVE_DH_SET_LENGTH
> +-int DH_set_length(DH *dh, long length);
> +-#endif /* HAVE_DH_SET_LENGTH */
> +-
> +-#ifndef HAVE_RSA_METH_FREE
> +-void RSA_meth_free(RSA_METHOD *meth);
> +-#endif /* HAVE_RSA_METH_FREE */
> +-
> +-#ifndef HAVE_RSA_METH_DUP
> +-RSA_METHOD *RSA_meth_dup(const RSA_METHOD *meth);
> +-#endif /* HAVE_RSA_METH_DUP */
> +-
> +-#ifndef HAVE_RSA_METH_SET1_NAME
> +-int RSA_meth_set1_name(RSA_METHOD *meth, const char *name);
> +-#endif /* HAVE_RSA_METH_SET1_NAME */
> +-
> +-#ifndef HAVE_RSA_METH_GET_FINISH
> +-int (*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa);
> +-#endif /* HAVE_RSA_METH_GET_FINISH */
> +-
> +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC
> +-int RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int flen,
> +-    const unsigned char *from, unsigned char *to, RSA *rsa, int padding=
));
> +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */
> +-
> +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC
> +-int RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int flen,
> +-    const unsigned char *from, unsigned char *to, RSA *rsa, int padding=
));
> +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */
> +-
> +-#ifndef HAVE_RSA_METH_SET_FINISH
> +-int RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa));
> +-#endif /* HAVE_RSA_METH_SET_FINISH */
> +-
> +-#ifndef HAVE_EVP_PKEY_GET0_RSA
> +-RSA *EVP_PKEY_get0_RSA(EVP_PKEY *pkey);
> +-#endif /* HAVE_EVP_PKEY_GET0_RSA */
> +-
> +-#ifndef HAVE_EVP_MD_CTX_new
> +-EVP_MD_CTX *EVP_MD_CTX_new(void);
> +-#endif /* HAVE_EVP_MD_CTX_new */
> +-
> +-#ifndef HAVE_EVP_MD_CTX_free
> +-void EVP_MD_CTX_free(EVP_MD_CTX *ctx);
> +-#endif /* HAVE_EVP_MD_CTX_free */
> +-
> + #endif /* WITH_OPENSSL */
> + #endif /* _OPENSSL_COMPAT_H */
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_8.9p1.bb
> index 6057d055f4..1d53c2488b 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://add-test-support-for-busybox.patch \
>             file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
>             file://0001-Default-to-not-using-sandbox-when-cross-compiling=
.patch \
> +           file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
>             "
>  SRC_URI[sha256sum] =3D "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd=
262380ae58bec5e7"
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181864): https://lists.openembedded.org/g/openembedde=
d-core/message/181864
> Mute This Topic: https://lists.openembedded.org/mt/99197122/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

