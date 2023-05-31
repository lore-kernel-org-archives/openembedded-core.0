Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA454C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:41:30 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.7824.1685515282899161959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=h2erWQZ4;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2af1e290921so56108371fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685515281; x=1688107281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtkN1UTUa2weIA1PF4azic2I/nFmsNv3hXX8ktSMRA8=;
        b=h2erWQZ4IYv5hXka5Au1H0AAes/I/EQ/D1bEvvifean5FGxQhn37bpHN89cf8ie7nE
         m73YSKe6LYdwt32yIXH10bLlAQmKk1o05bt9kf975OFLnx5oKLKMkpeXmXyA1WkL3HSw
         a+L4qu/yZK/UY5vE+SZgqRzyANuAz9ergziq0h62aI+eXlHclxm60wL/arExAAtmwEFY
         NI21gTfYakpRoA8ihXdqryXofQjaYhy/C4Fp0UkWCL/jTcvFyZUxB/Wv2/XtxB5ak8bB
         F1SIzucimaUzWLtpHVJfmX42myT0U+2F+J/r65Y2/xhv7p9LjvVcGwyeNJjfBiGZKSPY
         nlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685515281; x=1688107281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtkN1UTUa2weIA1PF4azic2I/nFmsNv3hXX8ktSMRA8=;
        b=NzWoA+0iqUCQkqKhNJRTegsn0ANgUgcO7TmgWqGR6MS2KdNQ+4z4IPpmmP7h2BTZwT
         J+WNujHljR4vtW3kDBwS8n/WMEueAK+wdW/UE9H/YrKiezgyuA4HL6dVomsmayS7hbIv
         CxliWGr+RNinaUyF6uxUFdsU2Vef1IJW4WAMHraA9yDQACIyl5TrVR9stRziySUyqtEj
         b8virx0K3qqWauzXcZEOK9gaTzlHkbZ8ve4VST14gy++7PPKp6LQ8jXz6ZaMnojd6Eyt
         s1NAzpJ2RPVXf+NB1DX4GD7UZzsH+AAKP39yuAGsq2unCNq2D4PCD3H9TetPtFhHAv3v
         cloQ==
X-Gm-Message-State: AC+VfDybnAdlDB725j1noGMV36IA6H9ZZEcAHzbJX/GQIw1/Z2CIoWtp
	wCzNot4kh+gaAcSRX2xPU+1B/W+oywHD8vlqdd4=
X-Google-Smtp-Source: ACHHUZ7uNKFxudWN696/RvlatGeDrnGQ1L+2bT6zGv44Wmxb6pIGkJ360SboX+A8ytL7c8t21Gz3lw7u0ltL2teUuFQ=
X-Received: by 2002:a2e:83d5:0:b0:2a8:bf74:61cc with SMTP id
 s21-20020a2e83d5000000b002a8bf7461ccmr1865147ljh.26.1685515280709; Tue, 30
 May 2023 23:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230530070823.4010-1-Riyaz.Khan@kpit.com> <CANNYZj89h-+LVWxEQ45Qi2XNW8asOHOY8X-37BpcsyCmY2vQ3A@mail.gmail.com>
 <BM1PR01MB3633DE4CABEC530FBEEFF376E8489@BM1PR01MB3633.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BM1PR01MB3633DE4CABEC530FBEEFF376E8489@BM1PR01MB3633.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 May 2023 08:41:08 +0200
Message-ID: <CANNYZj8Zj13cX94vJv=6sNJo58vaaGQ7JpTqhZHoSqC1NZhODA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v3] openssh: Remove BSD-4-clause
 contents completely from codebase
To: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
Cc: Riyaz Ahmed Khan <rak3033@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181993

That is not how it works. If the issue exists in both master and
kirkstone (which it does), it must be resolved in master first. Also
'resolves BSD-5 clause license issue' does not explain what the issue
is, and you need to provide a better explanation.

Alex

On Wed, 31 May 2023 at 07:49, Riyaz Ahmed Khan <Riyaz.Khan@kpit.com> wrote:
>
> Hi Alex,
>
> As openssh is pointing to LTS branch in kirkstone and openssh is still at=
 8.9 the usage of BSD-4 can be limited. Hence, we need  this patch to be in=
tegrated in kirkstone to resolve BSD-5 clause license issue for that the re=
ason this patch has been created to backport and remove the BSD-4 clause li=
cense. In the master branch it is closer to the latest version and can wait=
 for the official openssh release, but I hope there will not be a release t=
o kirkstone from master for this reason we created this patch.
>
> Hi Steve,
>
> Please take this patch for kirkstone as it will resolve BSD-5 clause lice=
nse issue.
>
> Regards,
> Riyaz
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Tuesday, May 30, 2023 13:38
> To: Riyaz Ahmed Khan <rak3033@gmail.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>; Riyaz Ahmed=
 Khan <Riyaz.Khan@kpit.com>
> Subject: Re: [OE-core][kirkstone][PATCH v3] openssh: Remove BSD-4-clause =
contents completely from codebase
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> What is the rationale for adding this patch to oe-core? Why can't this
> wait until openssh releases a version with this change?
>
> Alex
>
> On Tue, 30 May 2023 at 09:08, Riyaz Ahmed Khan <rak3033@gmail.com> wrote:
> >
> > As upstream removed this BSD-4-clause license, there are still some fil=
es
> > has this license. Below file affected by this BSD-4-clause contents whe=
n
> > below command is executed
> > grep -rl "All advertising materials mentioning features or use of this =
software"
> > *|grep -v \.1|grep -v \.5|grep -v \.8 | sort openbsd-compat/libressl-ap=
i-compat.c
> >
> > All advertising materials mentioning features or use of this software
> >
> > Openssh upstream removes the bsd-4 license compeletely from this commit
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2F7280401bdd77ca54be6867a154c=
c01e0d72612e0&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59aa415a79465897a8=
08db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63821030930732431=
1%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dcf0JSknfbKP1C4D2aEEzgJiKCoJV5ksh%=
2BwYeNbvQb1g%3D&reserved=3D0
> > Hence, Remove and backport this commit completely to remove license of =
BSD-4-clause
> > contents from codebase. Hunks are refreshed, removed couple of hunks fr=
om
> > configure.ac and openbsd-compat/libressl-api-compat.c as hunk code
> > is not prasent.
> >
> > Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> > ---
> >  ...401bdd77ca54be6867a154cc01e0d72612e0.patch | 984 ++++++++++++++++++
> >  .../openssh/openssh_8.9p1.bb                  |   1 +
> >  2 files changed, 985 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/7280401bd=
d77ca54be6867a154cc01e0d72612e0.patch
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54=
be6867a154cc01e0d72612e0.patch b/meta/recipes-connectivity/openssh/openssh/=
7280401bdd77ca54be6867a154cc01e0d72612e0.patch
> > new file mode 100644
> > index 0000000000..ebdff1ffe4
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a=
154cc01e0d72612e0.patch
> > @@ -0,0 +1,984 @@
> > +From 7280401bdd77ca54be6867a154cc01e0d72612e0 Mon Sep 17 00:00:00 2001
> > +From: Damien Miller <djm@mindrot.org>
> > +Date: Fri, 24 Mar 2023 13:56:25 +1100
> > +Subject: [PATCH] remove support for old libcrypto
> > +
> > +OpenSSH now requires LibreSSL 3.1.0 or greater or
> > +OpenSSL 1.1.1 or greater
> > +
> > +with/ok dtucker@
> > +
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2=
F7280401bdd77ca54be6867a154cc01e0d72612e0&data=3D05%7C01%7Criyaz.khan%40kpi=
t.com%7Cab59aa415a79465897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dcf0JS=
knfbKP1C4D2aEEzgJiKCoJV5ksh%2BwYeNbvQb1g%3D&reserved=3D0]
> > +Comment: Hunk are refreshed, removed couple of hunks from configure.ac=
 as hunk code is not prasent
> > +and backported to the existing code.
> > +Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> > +
> > +---
> > + .github/workflows/c-cpp.yml          |   7 -
> > + INSTALL                              |   8 +-
> > + cipher-aes.c                         |   2 +-
> > + configure.ac                         |  96 ++---
> > + openbsd-compat/libressl-api-compat.c | 556 +-------------------------=
-
> > + openbsd-compat/openssl-compat.h      | 151 +-------
> > + 6 files changed, 40 insertions(+), 780 deletions(-)
> > +
> > +diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
> > +index 3d9aa22dba5..d299a32468d 100644
> > +--- a/.github/workflows/c-cpp.yml
> > ++++ b/.github/workflows/c-cpp.yml
> > +@@ -40,18 +40,11 @@
> > +           - { os: ubuntu-20.04, configs: tcmalloc }
> > +           - { os: ubuntu-20.04, configs: musl }
> > +           - { os: ubuntu-latest, configs: libressl-master }
> > +-          - { os: ubuntu-latest, configs: libressl-2.2.9 }
> > +-          - { os: ubuntu-latest, configs: libressl-2.8.3 }
> > +-          - { os: ubuntu-latest, configs: libressl-3.0.2 }
> > +           - { os: ubuntu-latest, configs: libressl-3.2.6 }
> > +           - { os: ubuntu-latest, configs: libressl-3.3.4 }
> > +           - { os: ubuntu-latest, configs: libressl-3.4.1 }
> > +           - { os: ubuntu-latest, configs: openssl-master }
> > +           - { os: ubuntu-latest, configs: openssl-noec }
> > +-          - { os: ubuntu-latest, configs: openssl-1.0.1 }
> > +-          - { os: ubuntu-latest, configs: openssl-1.0.1u }
> > +-          - { os: ubuntu-latest, configs: openssl-1.0.2u }
> > +-          - { os: ubuntu-latest, configs: openssl-1.1.0h }
> > +           - { os: ubuntu-latest, configs: openssl-1.1.1 }
> > +           - { os: ubuntu-latest, configs: openssl-1.1.1k }
> > +           - { os: ubuntu-latest, configs: openssl-3.0.0 }
> > +diff --git a/INSTALL b/INSTALL
> > +index 68b15e13190..f99d1e2a809 100644
> > +--- a/INSTALL
> > ++++ b/INSTALL
> > +@@ -21,12 +21,8 @@ https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fzlib.net%2F&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59a=
a415a79465897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63=
8210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DO0v4Bt2uc28sUCDdBa=
MIKqWucYWRqPpV4OuSmUoZi04%3D&reserved=3D0
> > +
> > + libcrypto from either of LibreSSL or OpenSSL.  Building without libcr=
ypto
> > + is supported but severely restricts the available ciphers and algorit=
hms.
> > +- - LibreSSL (https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fwww.libressl.org%2F&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab=
59aa415a79465897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C638210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DFjy0K88AXoz5zUi=
4R%2F4SvzGbgsh8DT9gzesU5JmuDbg%3D&reserved=3D0)
> > +- - OpenSSL (https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fwww.openssl.org%2F&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59=
aa415a79465897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
38210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dh%2BNnD1N9wr8%2F3=
74hRS4bt8vdmihe0ZNlfBri%2FLtp3Ck%3D&reserved=3D0) with any of the following=
 versions:
> > +-   - 1.0.x >=3D 1.0.1 or 1.1.0 >=3D 1.1.0g or any 1.1.1
> > +-
> > +-Note that due to a bug in EVP_CipherInit OpenSSL 1.1 versions prior t=
o
> > +-1.1.0g can't be used.
> > ++ - LibreSSL (https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fwww.libressl.org%2F&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab=
59aa415a79465897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C638210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DFjy0K88AXoz5zUi=
4R%2F4SvzGbgsh8DT9gzesU5JmuDbg%3D&reserved=3D0) 3.1.0 or greater
> > ++ - OpenSSL (https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fwww.openssl.org%2F&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59=
aa415a79465897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
38210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dh%2BNnD1N9wr8%2F3=
74hRS4bt8vdmihe0ZNlfBri%2FLtp3Ck%3D&reserved=3D0) 1.1.1 or greater
> > +
> > + LibreSSL/OpenSSL should be compiled as a position-independent library
> > + (i.e. -fPIC, eg by configuring OpenSSL as "./config [options] -fPIC"
> > +diff --git a/cipher-aes.c b/cipher-aes.c
> > +index 8b101727284..87c763353d8 100644
> > +--- a/cipher-aes.c
> > ++++ b/cipher-aes.c
> > +@@ -69,7 +69,7 @@ ssh_rijndael_init(EVP_CIPHER_CTX *ctx, const u_char =
*key, const u_char *iv,
> > +
> > + static int
> > + ssh_rijndael_cbc(EVP_CIPHER_CTX *ctx, u_char *dest, const u_char *src=
,
> > +-    LIBCRYPTO_EVP_INL_TYPE len)
> > ++    size_t len)
> > + {
> > +       struct ssh_rijndael_ctx *c;
> > +       u_char buf[RIJNDAEL_BLOCKSIZE];
> > +diff --git a/configure.ac b/configure.ac
> > +index 22fee70f604..1c0ccdf19c5 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -2744,42 +2744,40 @@
> > +       #include <openssl/crypto.h>
> > +       #define DATA "conftest.ssllibver"
> > +               ]], [[
> > +-              FILE *fd;
> > +-              int rc;
> > ++              FILE *f;
> > +
> > +-              fd =3D fopen(DATA,"w");
> > +-              if(fd =3D=3D NULL)
> > ++              if ((f =3D fopen(DATA, "w")) =3D=3D NULL)
> > +                       exit(1);
> > +-#ifndef OPENSSL_VERSION
> > +-# define OPENSSL_VERSION SSLEAY_VERSION
> > +-#endif
> > +-#ifndef HAVE_OPENSSL_VERSION
> > +-# define OpenSSL_version      SSLeay_version
> > +-#endif
> > +-#ifndef HAVE_OPENSSL_VERSION_NUM
> > +-# define OpenSSL_version_num  SSLeay
> > +-#endif
> > +-              if ((rc =3D fprintf(fd, "%08lx (%s)\n",
> > ++              if (fprintf(f, "%08lx (%s)",
> > +                   (unsigned long)OpenSSL_version_num(),
> > +-                  OpenSSL_version(OPENSSL_VERSION))) < 0)
> > ++                  OpenSSL_version(OPENSSL_VERSION)) < 0)
> > ++                      exit(1);
> > ++#ifdef LIBRESSL_VERSION_NUMBER
> > ++              if (fprintf(f, " libressl-%08lx", LIBRESSL_VERSION_NUMB=
ER) < 0)
> > ++                      exit(1);
> > ++#endif
> > ++              if (fputc('\n', f) =3D=3D EOF || fclose(f) =3D=3D EOF)
> > +                       exit(1);
> > +-
> > +               exit(0);
> > +               ]])],
> > +               [
> > +-                      ssl_library_ver=3D`cat conftest.ssllibver`
> > ++                      sslver=3D`cat conftest.ssllibver`
> > ++                      ssl_showver=3D`echo "$sslver" | sed 's/ libress=
l-.*//'`
> > +                       # Check version is supported.
> > +-                      case "$ssl_library_ver" in
> > +-                      10000*|0*)
> > +-                              AC_MSG_ERROR([OpenSSL >=3D 1.0.1 requir=
ed (have "$ssl_library_ver")])
> > +-                              ;;
> > +-                      100*)   ;; # 1.0.x
> > +-                      101000[[0123456]]*)
> > +-                              # https://apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenssl%2Fopenssl%2Fpull%2F4613=
&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59aa415a79465897a808db60e51625%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638210309307324311%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&sdata=3Dg1%2BLRUm08tCZlPzNf73Xzl3MYEXeY4%2BKGGJOeMYjdY=
8%3D&reserved=3D0
> > +-                              AC_MSG_ERROR([OpenSSL 1.1.x versions pr=
ior to 1.1.0g have a bug that breaks their use with OpenSSH (have "$ssl_lib=
rary_ver")])
> > ++                      case "$sslver" in
> > ++                      100*|10100*) # 1.0.x, 1.1.0x
> > ++                              AC_MSG_ERROR([OpenSSL >=3D 1.1.1 requir=
ed (have "$ssl_showver")])
> > +                               ;;
> > +                       101*)   ;; # 1.1.x
> > +-                      200*)   ;; # LibreSSL
> > ++                      200*)   # LibreSSL
> > ++                              lver=3D`echo "$sslver" | sed 's/.*libre=
ssl-//'`
> > ++                              case "$lver" in
> > ++                              2*|300*) # 2.x, 3.0.0
> > ++                                      AC_MSG_ERROR([LibreSSL >=3D 3.1=
.0 required (have "$ssl_showver")])
> > ++                                      ;;
> > ++                              *) ;;   # Assume all other versions are=
 good.
> > ++                              esac
> > ++                              ;;
> > +                       300*)   ;; # OpenSSL 3
> > +                       301*)   ;; # OpenSSL development branch.
> > +                       *)
> > +@@ -2781,10 +2781,10 @@
> > +                       300*)   ;; # OpenSSL 3
> > +                       301*)   ;; # OpenSSL development branch.
> > +                       *)
> > +-                              AC_MSG_ERROR([Unknown/unsupported OpenS=
SL version ("$ssl_library_ver")])
> > ++                              AC_MSG_ERROR([Unknown/unsupported OpenS=
SL version ("$ssl_showver")])
> > +                               ;;
> > +                       esac
> > +-                      AC_MSG_RESULT([$ssl_library_ver])
> > ++                      AC_MSG_RESULT([$ssl_showver])
> > +               ],
> > +               [
> > +                       AC_MSG_RESULT([not found])
> > +@@ -2804,9 +2804,6 @@
> > +       #include <openssl/opensslv.h>
> > +       #include <openssl/crypto.h>
> > +               ]], [[
> > +-#ifndef HAVE_OPENSSL_VERSION_NUM
> > +-# define OpenSSL_version_num  SSLeay
> > +-#endif
> > +               exit(OpenSSL_version_num() =3D=3D OPENSSL_VERSION_NUMBE=
R ? 0 : 1);
> > +               ]])],
> > +               [
> > +@@ -2881,44 +2878,13 @@
> > +           )
> > +       )
> > +
> > +-      # LibreSSL/OpenSSL 1.1x API
> > ++      # LibreSSL/OpenSSL API differences
> > +       AC_CHECK_FUNCS([ \
> > +-              OPENSSL_init_crypto \
> > +-              DH_get0_key \
> > +-              DH_get0_pqg \
> > +-              DH_set0_key \
> > +-              DH_set_length \
> > +-              DH_set0_pqg \
> > +-              DSA_get0_key \
> > +-              DSA_get0_pqg \
> > +-              DSA_set0_key \
> > +-              DSA_set0_pqg \
> > +-              DSA_SIG_get0 \
> > +-              DSA_SIG_set0 \
> > +-              ECDSA_SIG_get0 \
> > +-              ECDSA_SIG_set0 \
> > +               EVP_CIPHER_CTX_iv \
> > +               EVP_CIPHER_CTX_iv_noconst \
> > +               EVP_CIPHER_CTX_get_iv \
> > +               EVP_CIPHER_CTX_get_updated_iv \
> > +               EVP_CIPHER_CTX_set_iv \
> > +-              RSA_get0_crt_params \
> > +-              RSA_get0_factors \
> > +-              RSA_get0_key \
> > +-              RSA_set0_crt_params \
> > +-              RSA_set0_factors \
> > +-              RSA_set0_key \
> > +-              RSA_meth_free \
> > +-              RSA_meth_dup \
> > +-              RSA_meth_set1_name \
> > +-              RSA_meth_get_finish \
> > +-              RSA_meth_set_priv_enc \
> > +-              RSA_meth_set_priv_dec \
> > +-              RSA_meth_set_finish \
> > +-              EVP_PKEY_get0_RSA \
> > +-              EVP_MD_CTX_new \
> > +-              EVP_MD_CTX_free \
> > +-              EVP_chacha20 \
> > +       ])
> > +
> > +       if test "x$openssl_engine" =3D "xyes" ; then
> > +@@ -3040,8 +3006,8 @@
> > +       fi
> > +       AC_CHECK_FUNCS([crypt DES_crypt])
> > +
> > +-      # Check for SHA256, SHA384 and SHA512 support in OpenSSL
> > +-      AC_CHECK_FUNCS([EVP_sha256 EVP_sha384 EVP_sha512])
> > ++      # Check for various EVP support in OpenSSL
> > ++      AC_CHECK_FUNCS([EVP_sha256 EVP_sha384 EVP_sha512 EVP_chacha20])
> > +
> > +       # Check complete ECC support in OpenSSL
> > +       AC_MSG_CHECKING([whether OpenSSL has NID_X9_62_prime256v1])
> > +diff --git a/openbsd-compat/libressl-api-compat.c b/openbsd-compat/lib=
ressl-api-compat.c
> > +index 498180dc894..59be17397c5 100644
> > +--- a/openbsd-compat/libressl-api-compat.c
> > ++++ b/openbsd-compat/libressl-api-compat.c
> > +@@ -1,129 +1,5 @@
> > +-/* $OpenBSD: dsa_lib.c,v 1.29 2018/04/14 07:09:21 tb Exp $ */
> > +-/* $OpenBSD: rsa_lib.c,v 1.37 2018/04/14 07:09:21 tb Exp $ */
> > +-/* $OpenBSD: evp_lib.c,v 1.17 2018/09/12 06:35:38 djm Exp $ */
> > +-/* $OpenBSD: dh_lib.c,v 1.32 2018/05/02 15:48:38 tb Exp $ */
> > +-/* $OpenBSD: p_lib.c,v 1.24 2018/05/30 15:40:50 tb Exp $ */
> > +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */
> > +-/* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
> > +- * All rights reserved.
> > +- *
> > +- * This package is an SSL implementation written
> > +- * by Eric Young (eay@cryptsoft.com).
> > +- * The implementation was written so as to conform with Netscapes SSL=
.
> > +- *
> > +- * This library is free for commercial and non-commercial use as long=
 as
> > +- * the following conditions are aheared to.  The following conditions
> > +- * apply to all code found in this distribution, be it the RC4, RSA,
> > +- * lhash, DES, etc., code; not just the SSL code.  The SSL documentat=
ion
> > +- * included with this distribution is covered by the same copyright t=
erms
> > +- * except that the holder is Tim Hudson (tjh@cryptsoft.com).
> > +- *
> > +- * Copyright remains Eric Young's, and as such any Copyright notices =
in
> > +- * the code are not to be removed.
> > +- * If this package is used in a product, Eric Young should be given a=
ttribution
> > +- * as the author of the parts of the library used.
> > +- * This can be in the form of a textual message at program startup or
> > +- * in documentation (online or textual) provided with the package.
> > +- *
> > +- * Redistribution and use in source and binary forms, with or without
> > +- * modification, are permitted provided that the following conditions
> > +- * are met:
> > +- * 1. Redistributions of source code must retain the copyright
> > +- *    notice, this list of conditions and the following disclaimer.
> > +- * 2. Redistributions in binary form must reproduce the above copyrig=
ht
> > +- *    notice, this list of conditions and the following disclaimer in=
 the
> > +- *    documentation and/or other materials provided with the distribu=
tion.
> > +- * 3. All advertising materials mentioning features or use of this so=
ftware
> > +- *    must display the following acknowledgement:
> > +- *    "This product includes cryptographic software written by
> > +- *     Eric Young (eay@cryptsoft.com)"
> > +- *    The word 'cryptographic' can be left out if the rouines from th=
e library
> > +- *    being used are not cryptographic related :-).
> > +- * 4. If you include any Windows specific code (or a derivative there=
of) from
> > +- *    the apps directory (application code) you must include an ackno=
wledgement:
> > +- *    "This product includes software written by Tim Hudson (tjh@cryp=
tsoft.com)"
> > +- *
> > +- * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
> > +- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
> > +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR=
 PURPOSE
> > +- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE L=
IABLE
> > +- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSE=
QUENTIAL
> > +- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE =
GOODS
> > +- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTI=
ON)
> > +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT=
, STRICT
> > +- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN =
ANY WAY
> > +- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILIT=
Y OF
> > +- * SUCH DAMAGE.
> > +- *
> > +- * The licence and distribution terms for any publically available ve=
rsion or
> > +- * derivative of this code cannot be changed.  i.e. this code cannot =
simply be
> > +- * copied and put under another distribution licence
> > +- * [including the GNU Public Licence.]
> > +- */
> > +-
> > +-/* $OpenBSD: dsa_asn1.c,v 1.22 2018/06/14 17:03:19 jsing Exp $ */
> > +-/* $OpenBSD: ecs_asn1.c,v 1.9 2018/03/17 15:24:44 tb Exp $ */
> > +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */
> > +-/* Written by Dr Stephen N Henson (steve@openssl.org) for the OpenSSL
> > +- * project 2000.
> > +- */
> > +-/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +- * Copyright (c) 2000-2005 The OpenSSL Project.  All rights reserved.
> > +- *
> > +- * Redistribution and use in source and binary forms, with or without
> > +- * modification, are permitted provided that the following conditions
> > +- * are met:
> > +- *
> > +- * 1. Redistributions of source code must retain the above copyright
> > +- *    notice, this list of conditions and the following disclaimer.
> > +- *
> > +- * 2. Redistributions in binary form must reproduce the above copyrig=
ht
> > +- *    notice, this list of conditions and the following disclaimer in
> > +- *    the documentation and/or other materials provided with the
> > +- *    distribution.
> > +- *
> > +- * 3. All advertising materials mentioning features or use of this
> > +- *    software must display the following acknowledgment:
> > +- *    "This product includes software developed by the OpenSSL Projec=
t
> > +- *    for use in the OpenSSL Toolkit. (https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fwww.openssl.org%2F&data=3D05%7C01%7Cri=
yaz.khan%40kpit.com%7Cab59aa415a79465897a808db60e51625%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C638210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&sdata=3DAcHjOTCMMYGdmyf5wBsy6vDunViWhBFhELKDNILFp5k%3D&reserved=3D0)"
> > +- *
> > +- * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be u=
sed to
> > +- *    endorse or promote products derived from this software without
> > +- *    prior written permission. For written permission, please contac=
t
> > +- *    licensing@OpenSSL.org.
> > +- *
> > +- * 5. Products derived from this software may not be called "OpenSSL"
> > +- *    nor may "OpenSSL" appear in their names without prior written
> > +- *    permission of the OpenSSL Project.
> > +- *
> > +- * 6. Redistributions of any form whatsoever must retain the followin=
g
> > +- *    acknowledgment:
> > +- *    "This product includes software developed by the OpenSSL Projec=
t
> > +- *    for use in the OpenSSL Toolkit (https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttp%3A%2F%2Fwww.openssl.org%2F&data=3D05%7C01%7Criy=
az.khan%40kpit.com%7Cab59aa415a79465897a808db60e51625%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C638210309307324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
sdata=3DAcHjOTCMMYGdmyf5wBsy6vDunViWhBFhELKDNILFp5k%3D&reserved=3D0)"
> > +- *
> > +- * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
> > +- * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, TH=
E
> > +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> > +- * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
> > +- * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> > +- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> > +- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> > +- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> > +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT=
,
> > +- * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> > +- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISE=
D
> > +- * OF THE POSSIBILITY OF SUCH DAMAGE.
> > +- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +- *
> > +- * This product includes cryptographic software written by Eric Young
> > +- * (eay@cryptsoft.com).  This product includes software written by Ti=
m
> > +- * Hudson (tjh@cryptsoft.com).
> > +- *
> > +- */
> > +-
> > +-/*    $OpenBSD: rsa_meth.c,v 1.2 2018/09/12 06:35:38 djm Exp $       =
 */
> > + /*
> > +- * Copyright (c) 2018 Theo Buehler <tb@openbsd.org>
> > ++ * Copyright (c) 2018 Damien Miller <djm@mindrot.org>
> > +  *
> > +  * Permission to use, copy, modify, and distribute this software for =
any
> > +  * purpose with or without fee is hereby granted, provided that the a=
bove
> > +@@ -147,192 +23,7 @@
> > + #include <stdlib.h>
> > + #include <string.h>
> > +
> > +-#include <openssl/err.h>
> > +-#include <openssl/bn.h>
> > +-#include <openssl/dsa.h>
> > +-#include <openssl/rsa.h>
> > + #include <openssl/evp.h>
> > +-#ifdef OPENSSL_HAS_ECC
> > +-#include <openssl/ecdsa.h>
> > +-#endif
> > +-#include <openssl/dh.h>
> > +-
> > +-#ifndef HAVE_DSA_GET0_PQG
> > +-void
> > +-DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q, const =
BIGNUM **g)
> > +-{
> > +-      if (p !=3D NULL)
> > +-              *p =3D d->p;
> > +-      if (q !=3D NULL)
> > +-              *q =3D d->q;
> > +-      if (g !=3D NULL)
> > +-              *g =3D d->g;
> > +-}
> > +-#endif /* HAVE_DSA_GET0_PQG */
> > +-
> > +-#ifndef HAVE_DSA_SET0_PQG
> > +-int
> > +-DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> > +-{
> > +-      if ((d->p =3D=3D NULL && p =3D=3D NULL) || (d->q =3D=3D NULL &&=
 q =3D=3D NULL) ||
> > +-          (d->g =3D=3D NULL && g =3D=3D NULL))
> > +-              return 0;
> > +-
> > +-      if (p !=3D NULL) {
> > +-              BN_free(d->p);
> > +-              d->p =3D p;
> > +-      }
> > +-      if (q !=3D NULL) {
> > +-              BN_free(d->q);
> > +-              d->q =3D q;
> > +-      }
> > +-      if (g !=3D NULL) {
> > +-              BN_free(d->g);
> > +-              d->g =3D g;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_DSA_SET0_PQG */
> > +-
> > +-#ifndef HAVE_DSA_GET0_KEY
> > +-void
> > +-DSA_get0_key(const DSA *d, const BIGNUM **pub_key, const BIGNUM **pri=
v_key)
> > +-{
> > +-      if (pub_key !=3D NULL)
> > +-              *pub_key =3D d->pub_key;
> > +-      if (priv_key !=3D NULL)
> > +-              *priv_key =3D d->priv_key;
> > +-}
> > +-#endif /* HAVE_DSA_GET0_KEY */
> > +-
> > +-#ifndef HAVE_DSA_SET0_KEY
> > +-int
> > +-DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key)
> > +-{
> > +-      if (d->pub_key =3D=3D NULL && pub_key =3D=3D NULL)
> > +-              return 0;
> > +-
> > +-      if (pub_key !=3D NULL) {
> > +-              BN_free(d->pub_key);
> > +-              d->pub_key =3D pub_key;
> > +-      }
> > +-      if (priv_key !=3D NULL) {
> > +-              BN_free(d->priv_key);
> > +-              d->priv_key =3D priv_key;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_DSA_SET0_KEY */
> > +-
> > +-#ifndef HAVE_RSA_GET0_KEY
> > +-void
> > +-RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e, const =
BIGNUM **d)
> > +-{
> > +-      if (n !=3D NULL)
> > +-              *n =3D r->n;
> > +-      if (e !=3D NULL)
> > +-              *e =3D r->e;
> > +-      if (d !=3D NULL)
> > +-              *d =3D r->d;
> > +-}
> > +-#endif /* HAVE_RSA_GET0_KEY */
> > +-
> > +-#ifndef HAVE_RSA_SET0_KEY
> > +-int
> > +-RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
> > +-{
> > +-      if ((r->n =3D=3D NULL && n =3D=3D NULL) || (r->e =3D=3D NULL &&=
 e =3D=3D NULL))
> > +-              return 0;
> > +-
> > +-      if (n !=3D NULL) {
> > +-              BN_free(r->n);
> > +-              r->n =3D n;
> > +-      }
> > +-      if (e !=3D NULL) {
> > +-              BN_free(r->e);
> > +-              r->e =3D e;
> > +-      }
> > +-      if (d !=3D NULL) {
> > +-              BN_free(r->d);
> > +-              r->d =3D d;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_SET0_KEY */
> > +-
> > +-#ifndef HAVE_RSA_GET0_CRT_PARAMS
> > +-void
> > +-RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BIGNUM *=
*dmq1,
> > +-    const BIGNUM **iqmp)
> > +-{
> > +-      if (dmp1 !=3D NULL)
> > +-              *dmp1 =3D r->dmp1;
> > +-      if (dmq1 !=3D NULL)
> > +-              *dmq1 =3D r->dmq1;
> > +-      if (iqmp !=3D NULL)
> > +-              *iqmp =3D r->iqmp;
> > +-}
> > +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */
> > +-
> > +-#ifndef HAVE_RSA_SET0_CRT_PARAMS
> > +-int
> > +-RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *iqmp)
> > +-{
> > +-      if ((r->dmp1 =3D=3D NULL && dmp1 =3D=3D NULL) ||
> > +-          (r->dmq1 =3D=3D NULL && dmq1 =3D=3D NULL) ||
> > +-          (r->iqmp =3D=3D NULL && iqmp =3D=3D NULL))
> > +-              return 0;
> > +-
> > +-      if (dmp1 !=3D NULL) {
> > +-              BN_free(r->dmp1);
> > +-              r->dmp1 =3D dmp1;
> > +-      }
> > +-      if (dmq1 !=3D NULL) {
> > +-              BN_free(r->dmq1);
> > +-              r->dmq1 =3D dmq1;
> > +-      }
> > +-      if (iqmp !=3D NULL) {
> > +-              BN_free(r->iqmp);
> > +-              r->iqmp =3D iqmp;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */
> > +-
> > +-#ifndef HAVE_RSA_GET0_FACTORS
> > +-void
> > +-RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **q)
> > +-{
> > +-      if (p !=3D NULL)
> > +-              *p =3D r->p;
> > +-      if (q !=3D NULL)
> > +-              *q =3D r->q;
> > +-}
> > +-#endif /* HAVE_RSA_GET0_FACTORS */
> > +-
> > +-#ifndef HAVE_RSA_SET0_FACTORS
> > +-int
> > +-RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q)
> > +-{
> > +-      if ((r->p =3D=3D NULL && p =3D=3D NULL) || (r->q =3D=3D NULL &&=
 q =3D=3D NULL))
> > +-              return 0;
> > +-
> > +-      if (p !=3D NULL) {
> > +-              BN_free(r->p);
> > +-              r->p =3D p;
> > +-      }
> > +-      if (q !=3D NULL) {
> > +-              BN_free(r->q);
> > +-              r->q =3D q;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_SET0_FACTORS */
> > +
> > + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV
> > + int
> > +@@ -392,249 +83,4 @@ EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx, const =
unsigned char *iv, size_t len)
> > + }
> > + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */
> > +
> > +-#ifndef HAVE_DSA_SIG_GET0
> > +-void
> > +-DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const BIGNUM **ps=
)
> > +-{
> > +-      if (pr !=3D NULL)
> > +-              *pr =3D sig->r;
> > +-      if (ps !=3D NULL)
> > +-              *ps =3D sig->s;
> > +-}
> > +-#endif /* HAVE_DSA_SIG_GET0 */
> > +-
> > +-#ifndef HAVE_DSA_SIG_SET0
> > +-int
> > +-DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s)
> > +-{
> > +-      if (r =3D=3D NULL || s =3D=3D NULL)
> > +-              return 0;
> > +-
> > +-      BN_clear_free(sig->r);
> > +-      sig->r =3D r;
> > +-      BN_clear_free(sig->s);
> > +-      sig->s =3D s;
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_DSA_SIG_SET0 */
> > +-
> > +-#ifdef OPENSSL_HAS_ECC
> > +-#ifndef HAVE_ECDSA_SIG_GET0
> > +-void
> > +-ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const BIGNUM =
**ps)
> > +-{
> > +-      if (pr !=3D NULL)
> > +-              *pr =3D sig->r;
> > +-      if (ps !=3D NULL)
> > +-              *ps =3D sig->s;
> > +-}
> > +-#endif /* HAVE_ECDSA_SIG_GET0 */
> > +-
> > +-#ifndef HAVE_ECDSA_SIG_SET0
> > +-int
> > +-ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
> > +-{
> > +-      if (r =3D=3D NULL || s =3D=3D NULL)
> > +-              return 0;
> > +-
> > +-      BN_clear_free(sig->r);
> > +-      BN_clear_free(sig->s);
> > +-      sig->r =3D r;
> > +-      sig->s =3D s;
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_ECDSA_SIG_SET0 */
> > +-#endif /* OPENSSL_HAS_ECC */
> > +-
> > +-#ifndef HAVE_DH_GET0_PQG
> > +-void
> > +-DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q, const B=
IGNUM **g)
> > +-{
> > +-      if (p !=3D NULL)
> > +-              *p =3D dh->p;
> > +-      if (q !=3D NULL)
> > +-              *q =3D dh->q;
> > +-      if (g !=3D NULL)
> > +-              *g =3D dh->g;
> > +-}
> > +-#endif /* HAVE_DH_GET0_PQG */
> > +-
> > +-#ifndef HAVE_DH_SET0_PQG
> > +-int
> > +-DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> > +-{
> > +-      if ((dh->p =3D=3D NULL && p =3D=3D NULL) || (dh->g =3D=3D NULL =
&& g =3D=3D NULL))
> > +-              return 0;
> > +-
> > +-      if (p !=3D NULL) {
> > +-              BN_free(dh->p);
> > +-              dh->p =3D p;
> > +-      }
> > +-      if (q !=3D NULL) {
> > +-              BN_free(dh->q);
> > +-              dh->q =3D q;
> > +-      }
> > +-      if (g !=3D NULL) {
> > +-              BN_free(dh->g);
> > +-              dh->g =3D g;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_DH_SET0_PQG */
> > +-
> > +-#ifndef HAVE_DH_GET0_KEY
> > +-void
> > +-DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv=
_key)
> > +-{
> > +-      if (pub_key !=3D NULL)
> > +-              *pub_key =3D dh->pub_key;
> > +-      if (priv_key !=3D NULL)
> > +-              *priv_key =3D dh->priv_key;
> > +-}
> > +-#endif /* HAVE_DH_GET0_KEY */
> > +-
> > +-#ifndef HAVE_DH_SET0_KEY
> > +-int
> > +-DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key)
> > +-{
> > +-      if (pub_key !=3D NULL) {
> > +-              BN_free(dh->pub_key);
> > +-              dh->pub_key =3D pub_key;
> > +-      }
> > +-      if (priv_key !=3D NULL) {
> > +-              BN_free(dh->priv_key);
> > +-              dh->priv_key =3D priv_key;
> > +-      }
> > +-
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_DH_SET0_KEY */
> > +-
> > +-#ifndef HAVE_DH_SET_LENGTH
> > +-int
> > +-DH_set_length(DH *dh, long length)
> > +-{
> > +-      if (length < 0 || length > INT_MAX)
> > +-              return 0;
> > +-
> > +-      dh->length =3D length;
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_DH_SET_LENGTH */
> > +-
> > +-#ifndef HAVE_RSA_METH_FREE
> > +-void
> > +-RSA_meth_free(RSA_METHOD *meth)
> > +-{
> > +-      if (meth !=3D NULL) {
> > +-              free((char *)meth->name);
> > +-              free(meth);
> > +-      }
> > +-}
> > +-#endif /* HAVE_RSA_METH_FREE */
> > +-
> > +-#ifndef HAVE_RSA_METH_DUP
> > +-RSA_METHOD *
> > +-RSA_meth_dup(const RSA_METHOD *meth)
> > +-{
> > +-      RSA_METHOD *copy;
> > +-
> > +-      if ((copy =3D calloc(1, sizeof(*copy))) =3D=3D NULL)
> > +-              return NULL;
> > +-      memcpy(copy, meth, sizeof(*copy));
> > +-      if ((copy->name =3D strdup(meth->name)) =3D=3D NULL) {
> > +-              free(copy);
> > +-              return NULL;
> > +-      }
> > +-
> > +-      return copy;
> > +-}
> > +-#endif /* HAVE_RSA_METH_DUP */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET1_NAME
> > +-int
> > +-RSA_meth_set1_name(RSA_METHOD *meth, const char *name)
> > +-{
> > +-      char *copy;
> > +-
> > +-      if ((copy =3D strdup(name)) =3D=3D NULL)
> > +-              return 0;
> > +-      free((char *)meth->name);
> > +-      meth->name =3D copy;
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_METH_SET1_NAME */
> > +-
> > +-#ifndef HAVE_RSA_METH_GET_FINISH
> > +-int
> > +-(*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa)
> > +-{
> > +-      return meth->finish;
> > +-}
> > +-#endif /* HAVE_RSA_METH_GET_FINISH */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC
> > +-int
> > +-RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int flen,
> > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int paddi=
ng))
> > +-{
> > +-      meth->rsa_priv_enc =3D priv_enc;
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC
> > +-int
> > +-RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int flen,
> > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int paddi=
ng))
> > +-{
> > +-      meth->rsa_priv_dec =3D priv_dec;
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET_FINISH
> > +-int
> > +-RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa))
> > +-{
> > +-      meth->finish =3D finish;
> > +-      return 1;
> > +-}
> > +-#endif /* HAVE_RSA_METH_SET_FINISH */
> > +-
> > +-#ifndef HAVE_EVP_PKEY_GET0_RSA
> > +-RSA *
> > +-EVP_PKEY_get0_RSA(EVP_PKEY *pkey)
> > +-{
> > +-      if (pkey->type !=3D EVP_PKEY_RSA) {
> > +-              /* EVPerror(EVP_R_EXPECTING_AN_RSA_KEY); */
> > +-              return NULL;
> > +-      }
> > +-      return pkey->pkey.rsa;
> > +-}
> > +-#endif /* HAVE_EVP_PKEY_GET0_RSA */
> > +-
> > +-#ifndef HAVE_EVP_MD_CTX_NEW
> > +-EVP_MD_CTX *
> > +-EVP_MD_CTX_new(void)
> > +-{
> > +-      return calloc(1, sizeof(EVP_MD_CTX));
> > +-}
> > +-#endif /* HAVE_EVP_MD_CTX_NEW */
> > +-
> > +-#ifndef HAVE_EVP_MD_CTX_FREE
> > +-void
> > +-EVP_MD_CTX_free(EVP_MD_CTX *ctx)
> > +-{
> > +-      if (ctx =3D=3D NULL)
> > +-              return;
> > +-
> > +-      EVP_MD_CTX_cleanup(ctx);
> > +-
> > +-      free(ctx);
> > +-}
> > +-#endif /* HAVE_EVP_MD_CTX_FREE */
> > +-
> > + #endif /* WITH_OPENSSL */
> > +diff --git a/openbsd-compat/openssl-compat.h b/openbsd-compat/openssl-=
compat.h
> > +index 61a69dd56eb..d0dd2c3450d 100644
> > +--- a/openbsd-compat/openssl-compat.h
> > ++++ b/openbsd-compat/openssl-compat.h
> > +@@ -33,26 +33,13 @@
> > + int ssh_compatible_openssl(long, long);
> > + void ssh_libcrypto_init(void);
> > +
> > +-#if (OPENSSL_VERSION_NUMBER < 0x1000100fL)
> > +-# error OpenSSL 1.0.1 or greater is required
> > ++#if (OPENSSL_VERSION_NUMBER < 0x10100000L)
> > ++# error OpenSSL 1.1.0 or greater is required
> > + #endif
> > +-
> > +-#ifndef OPENSSL_VERSION
> > +-# define OPENSSL_VERSION      SSLEAY_VERSION
> > +-#endif
> > +-
> > +-#ifndef HAVE_OPENSSL_VERSION
> > +-# define OpenSSL_version(x)   SSLeay_version(x)
> > +-#endif
> > +-
> > +-#ifndef HAVE_OPENSSL_VERSION_NUM
> > +-# define OpenSSL_version_num  SSLeay
> > +-#endif
> > +-
> > +-#if OPENSSL_VERSION_NUMBER < 0x10000001L
> > +-# define LIBCRYPTO_EVP_INL_TYPE unsigned int
> > +-#else
> > +-# define LIBCRYPTO_EVP_INL_TYPE size_t
> > ++#ifdef LIBRESSL_VERSION_NUMBER
> > ++# if LIBRESSL_VERSION_NUMBER < 0x3010000fL
> > ++#  error LibreSSL 3.1.0 or greater is required
> > ++# endif
> > + #endif
> > +
> > + #ifndef OPENSSL_RSA_MAX_MODULUS_BITS
> > +@@ -68,25 +55,6 @@ void ssh_libcrypto_init(void);
> > + # endif
> > + #endif
> > +
> > +-/* LibreSSL/OpenSSL 1.1x API compat */
> > +-#ifndef HAVE_DSA_GET0_PQG
> > +-void DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q,
> > +-    const BIGNUM **g);
> > +-#endif /* HAVE_DSA_GET0_PQG */
> > +-
> > +-#ifndef HAVE_DSA_SET0_PQG
> > +-int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> > +-#endif /* HAVE_DSA_SET0_PQG */
> > +-
> > +-#ifndef HAVE_DSA_GET0_KEY
> > +-void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
> > +-    const BIGNUM **priv_key);
> > +-#endif /* HAVE_DSA_GET0_KEY */
> > +-
> > +-#ifndef HAVE_DSA_SET0_KEY
> > +-int DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key);
> > +-#endif /* HAVE_DSA_SET0_KEY */
> > +-
> > + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV
> > + # ifdef HAVE_EVP_CIPHER_CTX_GET_UPDATED_IV
> > + #  define EVP_CIPHER_CTX_get_iv EVP_CIPHER_CTX_get_updated_iv
> > +@@ -101,112 +69,5 @@ int EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx,
> > +     const unsigned char *iv, size_t len);
> > + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */
> > +
> > +-#ifndef HAVE_RSA_GET0_KEY
> > +-void RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e,
> > +-    const BIGNUM **d);
> > +-#endif /* HAVE_RSA_GET0_KEY */
> > +-
> > +-#ifndef HAVE_RSA_SET0_KEY
> > +-int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
> > +-#endif /* HAVE_RSA_SET0_KEY */
> > +-
> > +-#ifndef HAVE_RSA_GET0_CRT_PARAMS
> > +-void RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BIG=
NUM **dmq1,
> > +-    const BIGNUM **iqmp);
> > +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */
> > +-
> > +-#ifndef HAVE_RSA_SET0_CRT_PARAMS
> > +-int RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *i=
qmp);
> > +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */
> > +-
> > +-#ifndef HAVE_RSA_GET0_FACTORS
> > +-void RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **=
q);
> > +-#endif /* HAVE_RSA_GET0_FACTORS */
> > +-
> > +-#ifndef HAVE_RSA_SET0_FACTORS
> > +-int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q);
> > +-#endif /* HAVE_RSA_SET0_FACTORS */
> > +-
> > +-#ifndef DSA_SIG_GET0
> > +-void DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const BIGNUM=
 **ps);
> > +-#endif /* DSA_SIG_GET0 */
> > +-
> > +-#ifndef DSA_SIG_SET0
> > +-int DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s);
> > +-#endif /* DSA_SIG_SET0 */
> > +-
> > +-#ifdef OPENSSL_HAS_ECC
> > +-#ifndef HAVE_ECDSA_SIG_GET0
> > +-void ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const BI=
GNUM **ps);
> > +-#endif /* HAVE_ECDSA_SIG_GET0 */
> > +-
> > +-#ifndef HAVE_ECDSA_SIG_SET0
> > +-int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s);
> > +-#endif /* HAVE_ECDSA_SIG_SET0 */
> > +-#endif /* OPENSSL_HAS_ECC */
> > +-
> > +-#ifndef HAVE_DH_GET0_PQG
> > +-void DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q,
> > +-    const BIGNUM **g);
> > +-#endif /* HAVE_DH_GET0_PQG */
> > +-
> > +-#ifndef HAVE_DH_SET0_PQG
> > +-int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> > +-#endif /* HAVE_DH_SET0_PQG */
> > +-
> > +-#ifndef HAVE_DH_GET0_KEY
> > +-void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM *=
*priv_key);
> > +-#endif /* HAVE_DH_GET0_KEY */
> > +-
> > +-#ifndef HAVE_DH_SET0_KEY
> > +-int DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key);
> > +-#endif /* HAVE_DH_SET0_KEY */
> > +-
> > +-#ifndef HAVE_DH_SET_LENGTH
> > +-int DH_set_length(DH *dh, long length);
> > +-#endif /* HAVE_DH_SET_LENGTH */
> > +-
> > +-#ifndef HAVE_RSA_METH_FREE
> > +-void RSA_meth_free(RSA_METHOD *meth);
> > +-#endif /* HAVE_RSA_METH_FREE */
> > +-
> > +-#ifndef HAVE_RSA_METH_DUP
> > +-RSA_METHOD *RSA_meth_dup(const RSA_METHOD *meth);
> > +-#endif /* HAVE_RSA_METH_DUP */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET1_NAME
> > +-int RSA_meth_set1_name(RSA_METHOD *meth, const char *name);
> > +-#endif /* HAVE_RSA_METH_SET1_NAME */
> > +-
> > +-#ifndef HAVE_RSA_METH_GET_FINISH
> > +-int (*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa);
> > +-#endif /* HAVE_RSA_METH_GET_FINISH */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC
> > +-int RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int flen,
> > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int paddi=
ng));
> > +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC
> > +-int RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int flen,
> > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int paddi=
ng));
> > +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */
> > +-
> > +-#ifndef HAVE_RSA_METH_SET_FINISH
> > +-int RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa));
> > +-#endif /* HAVE_RSA_METH_SET_FINISH */
> > +-
> > +-#ifndef HAVE_EVP_PKEY_GET0_RSA
> > +-RSA *EVP_PKEY_get0_RSA(EVP_PKEY *pkey);
> > +-#endif /* HAVE_EVP_PKEY_GET0_RSA */
> > +-
> > +-#ifndef HAVE_EVP_MD_CTX_new
> > +-EVP_MD_CTX *EVP_MD_CTX_new(void);
> > +-#endif /* HAVE_EVP_MD_CTX_new */
> > +-
> > +-#ifndef HAVE_EVP_MD_CTX_free
> > +-void EVP_MD_CTX_free(EVP_MD_CTX *ctx);
> > +-#endif /* HAVE_EVP_MD_CTX_free */
> > +-
> > + #endif /* WITH_OPENSSL */
> > + #endif /* _OPENSSL_COMPAT_H */
> > diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/=
recipes-connectivity/openssh/openssh_8.9p1.bb
> > index 6057d055f4..1d53c2488b 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > @@ -26,6 +26,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlo=
ok.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fport=
able%2Fopenssh-%24&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59aa415a79465=
897a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638210309307=
324311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DV7UxzThee3Rz5Lmc2EuREclppsBQ=
rs7FQP%2BMmm3RmVw%3D&reserved=3D0{PV}.tar
> >             file://add-test-support-for-busybox.patch \
> >             file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
> >             file://0001-Default-to-not-using-sandbox-when-cross-compili=
ng.patch \
> > +           file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
> >             "
> >  SRC_URI[sha256sum] =3D "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdac=
cd262380ae58bec5e7"
> >
> > --
> > 2.17.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#181902): https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2F=
message%2F181902&data=3D05%7C01%7Criyaz.khan%40kpit.com%7Cab59aa415a7946589=
7a808db60e51625%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63821030930732=
4311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DPTR307EHaPzt5Ef%2FPPoWhFP7OtqX=
D1ggM%2BF%2ByWYyTAA%3D&reserved=3D0
> > Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.openembedded.org%2Fmt%2F99215252%2F1686489&data=3D05%7C=
01%7Criyaz.khan%40kpit.com%7Cab59aa415a79465897a808db60e51625%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C638210309307324311%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DEXmqFe9Oz7rzxZI9v0bWBoyE7dmcllrD82hVT%2FR90so%3D&reserved=
=3D0
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%=
7C01%7Criyaz.khan%40kpit.com%7Cab59aa415a79465897a808db60e51625%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C638210309307324311%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&sdata=3D%2BNllbK8iUObLyrkWRQ3%2Fz6UCHvnX7BMP%2BUlZNXH%2F9as%3D&re=
served=3D0 [alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

