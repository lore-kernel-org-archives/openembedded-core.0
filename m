Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90685C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 03:51:36 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.6673.1693194692976616565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 20:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Iza66kQz;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57358a689d2so1372504eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693194692; x=1693799492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bExWBrewK/Z2Q4OuqT+a/i/cRmqr7tIE/sqKbOTneY=;
        b=Iza66kQz2AUSGzWLn4mUtyFOK4xaTMLV8459SABzpOcdLl71xUjoU32p+Z4Ey6ZmW8
         eaSCFst2HEu31+KhKLZgAavt0kf8rz/jk9Opaz8q9ZITf6XA2Mwm9p0Nz5SDPwn29uy3
         JdIDYbjxxg3KfGuIQqXooo60ZIDRHSMUZoy5XTQzYMRW1Qc5BYggYwfCJdaAtI80u6M/
         xH4FArEzjI1Pc6/7ViHR+NYaLkFEtc9Jcy+j6R00GahVv3LfNXBni90nDZjn8fqXa/oI
         hHDetjJrXqjfW8djqyFUN190fg0dVJrQ1XhcSCYxbYap5YS7yLfkKeFJFYe3YvZvQpns
         kv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693194692; x=1693799492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bExWBrewK/Z2Q4OuqT+a/i/cRmqr7tIE/sqKbOTneY=;
        b=l2okb/VMUzUUhWZrOzsY2lrIQtnN6nVy9cfFrg1NNi2OZgokMVme4ODBxRAQI193A0
         C0KZv6T+IXm8Sbs7GuWC3jl3qDupewFFdHwW+qa3RPJe7X55YsrIFOsW7/d5bG1FldCK
         TA7si0Y0gRlB0AiGKFsA9ZybLqB2Rp2adrcZnTC8CEU145lvTXCgERPqwqcDZunSLi4r
         Mz19qbDigN156aqcbJQ5xJ5LlTCdbJ100NtUB1n5mtxa+4RC5SgpJPDEITUm6HVD645t
         h24W0+ZxCqROkJ3TmFSwfSkiWmgzt4Z80Gebh7G0ysf3N9BmzUpLfV2VQ+ldojUyOBVG
         7HXw==
X-Gm-Message-State: AOJu0Yz7nnImkvdjzS2dX8Jt6mkN11517nBYqyNs6ArEwZB0heYmKzzU
	kBMLoar9w53bHe7VGi7H3Z3i3mqTWj6uu8MtIs0=
X-Google-Smtp-Source: AGHT+IFNlHTHbhvDyK/bjaE3ZUaWbjQGcmPWXcj/u1JWb1Drl2lKJ4TpPs8RoUKxB/7+D+B0L5dynXKhfCgVouLJz38=
X-Received: by 2002:a4a:3447:0:b0:566:ec2f:36d0 with SMTP id
 n7-20020a4a3447000000b00566ec2f36d0mr11428317oof.2.1693194692019; Sun, 27 Aug
 2023 20:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230828032114.2432518-2-abe.kohandel@gmail.com>
In-Reply-To: <20230828032114.2432518-2-abe.kohandel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Aug 2023 20:51:05 -0700
Message-ID: <CAMKF1sq44VEjH6bRs3TMuotR4Z=3P7+8-hB3yEGM+r7Ymvb0BA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v3] libdnf: resolve cstdint inclusion
 for newer gcc versions
To: Abe Kohandel <abe.kohandel@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186813

On Sun, Aug 27, 2023 at 8:23=E2=80=AFPM Abe Kohandel <abe.kohandel@gmail.co=
m> wrote:
>
> Depending on the host gcc version, libdnf fails to compile due to
> missing cstdint inclusions. These issue have already been addressed
> upstream, add the patches to resolve this for older versions of the
> library.
>
> These commits are taken directly from the libdnf project at
> https://github.com/rpm-software-management/libdnf
>
> Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
> ---
> v3: add 2 more patches from upstream that were missed as I incorrectly
> tested this by building libdnf instead of libdnf-native
> v2: change Upstream status to Backport as upstream pull is already
> merged
>  ...58-Don-t-assume-inclusion-of-cstdint.patch | 56 +++++++++++++++++++
>  ...onNumber.hpp-add-missing-cstdint-inc.patch | 33 +++++++++++
>  ...ite3-Sqlite3.hpp-add-missing-cstdint.patch | 36 ++++++++++++
>  meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  3 +
>  4 files changed, 128 insertions(+)
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don=
-t-assume-inclusion-of-cstdint.patch
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-=
OptionNumber.hpp-add-missing-cstdint-inc.patch
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils=
-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assu=
me-inclusion-of-cstdint.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fi=
x-1558-Don-t-assume-inclusion-of-cstdint.patch
> new file mode 100644
> index 0000000000..788bdd1020
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-incl=
usion-of-cstdint.patch
> @@ -0,0 +1,56 @@
> +From 779ea105564b6d717300af2fcb02a399737a536f Mon Sep 17 00:00:00 2001
> +From: ctxnop <ctxnop@gmail.com>
> +Date: Mon, 15 May 2023 19:30:16 +0200
> +Subject: [PATCH] Fix #1558: Don't assume inclusion of cstdint
> +
> +With last versions of gcc, some headers don't include cstdint anymore,
> +but some sources assume that it is.
> +
> +Upstream-Status: Backport

Backport [URL to upstream commit]

this wlll make it easy for future porters when these patches have to
dropped on next version upgrade

> +Signed-off-by: ctxnop <ctxnop@gmail.com>
> +---
> + libdnf/conf/ConfigMain.hpp    | 1 +
> + libdnf/conf/ConfigRepo.hpp    | 1 +
> + libdnf/conf/OptionSeconds.hpp | 2 ++
> + 3 files changed, 4 insertions(+)
> +
> +diff --git a/libdnf/conf/ConfigMain.hpp b/libdnf/conf/ConfigMain.hpp
> +index 19395c71..59f65c48 100644
> +--- a/libdnf/conf/ConfigMain.hpp
> ++++ b/libdnf/conf/ConfigMain.hpp
> +@@ -32,6 +32,7 @@
> + #include "OptionString.hpp"
> + #include "OptionStringList.hpp"
> +
> ++#include <cstdint>
> + #include <memory>
> +
> + namespace libdnf {
> +diff --git a/libdnf/conf/ConfigRepo.hpp b/libdnf/conf/ConfigRepo.hpp
> +index 2b198441..84cafbad 100644
> +--- a/libdnf/conf/ConfigRepo.hpp
> ++++ b/libdnf/conf/ConfigRepo.hpp
> +@@ -26,6 +26,7 @@
> + #include "ConfigMain.hpp"
> + #include "OptionChild.hpp"
> +
> ++#include <cstdint>
> + #include <memory>
> +
> + namespace libdnf {
> +diff --git a/libdnf/conf/OptionSeconds.hpp b/libdnf/conf/OptionSeconds.h=
pp
> +index dc714b23..a80a973f 100644
> +--- a/libdnf/conf/OptionSeconds.hpp
> ++++ b/libdnf/conf/OptionSeconds.hpp
> +@@ -25,6 +25,8 @@
> +
> + #include "OptionNumber.hpp"
> +
> ++#include <cstdint>
> ++
> + namespace libdnf {
> +
> + /**
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionN=
umber.hpp-add-missing-cstdint-inc.patch b/meta/recipes-devtools/libdnf/libd=
nf/0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
> new file mode 100644
> index 0000000000..b5424b28ea
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionNumber.h=
pp-add-missing-cstdint-inc.patch
> @@ -0,0 +1,33 @@
> +From f8af6399c4f6a65a35d33ecc191bb14094dc9e18 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Fri, 27 May 2022 22:13:48 +0100
> +Subject: [PATCH] libdnf/conf/OptionNumber.hpp: add missing <cstdint> inc=
lude
> +
> +Without the change libdnf build fails on this week's gcc-13 snapshot as:
> +
> +    In file included from /build/libdnf/libdnf/conf/ConfigMain.hpp:29,
> +                     from /build/libdnf/libdnf/conf/ConfigMain.cpp:21:
> +    /build/libdnf/libdnf/conf/OptionNumber.hpp:94:41: error: 'int32_t' i=
s not a member of 'std'; did you mean 'int32_t'?
> +       94 | extern template class OptionNumber<std::int32_t>;
> +          |                                         ^~~~~~~
> +
> +Upstream-Status: Backport
> +---
> + libdnf/conf/OptionNumber.hpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libdnf/conf/OptionNumber.hpp b/libdnf/conf/OptionNumber.hpp
> +index f7a7b3d6..a3a4dea6 100644
> +--- a/libdnf/conf/OptionNumber.hpp
> ++++ b/libdnf/conf/OptionNumber.hpp
> +@@ -25,6 +25,7 @@
> +
> + #include "Option.hpp"
> +
> ++#include <cstdint>
> + #include <functional>
> +
> + namespace libdnf {
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite=
3-Sqlite3.hpp-add-missing-cstdint.patch b/meta/recipes-devtools/libdnf/libd=
nf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
> new file mode 100644
> index 0000000000..a75995b82e
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlit=
e3.hpp-add-missing-cstdint.patch
> @@ -0,0 +1,36 @@
> +From 24b5d7f154cac9e322dd3459f6d0a5016abbbb57 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Fri, 27 May 2022 22:12:07 +0100
> +Subject: [PATCH] libdnf/utils/sqlite3/Sqlite3.hpp: add missing <cstdint>
> + include
> +
> +Without the change libdnf build fails on this week's gcc-13 snapshot as:
> +
> +    In file included from /build/libdnf/libdnf/sack/../transaction/Swdb.=
hpp:38,
> +                     from /build/libdnf/libdnf/sack/query.hpp:32,
> +                     from /build/libdnf/libdnf/dnf-sack-private.hpp:31,
> +                     from /build/libdnf/libdnf/hy-iutil.cpp:60:
> +    /build/libdnf/libdnf/sack/../transaction/../utils/sqlite3/Sqlite3.hp=
p:100:33: error: 'std::int64_t' has not been declared
> +      100 |         void bind(int pos, std::int64_t val)
> +          |                                 ^~~~~~~
> +
> +Upstream-Status: Backport
> +---
> + libdnf/utils/sqlite3/Sqlite3.hpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libdnf/utils/sqlite3/Sqlite3.hpp b/libdnf/utils/sqlite3/Sql=
ite3.hpp
> +index 3a7da23c..0403bb33 100644
> +--- a/libdnf/utils/sqlite3/Sqlite3.hpp
> ++++ b/libdnf/utils/sqlite3/Sqlite3.hpp
> +@@ -27,6 +27,7 @@
> +
> + #include <sqlite3.h>
> +
> ++#include <cstdint>
> + #include <map>
> + #include <memory>
> + #include <stdexcept>
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.66.0.bb
> index 2558f96851..bd06937ed8 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> @@ -11,6 +11,9 @@ SRC_URI =3D "git://github.com/rpm-software-management/l=
ibdnf;branch=3Ddnf-4-master;p
>             file://enable_test_data_dir_set.patch \
>             file://0001-drop-FindPythonInstDir.cmake.patch \
>             file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-d=
ata.patch \
> +           file://0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch =
\
> +           file://0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstd=
int.patch \
> +           file://0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-=
inc.patch \
>             "
>
>  SRCREV =3D "add5d5418b140a86d08667dd2b14793093984875"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186812): https://lists.openembedded.org/g/openembedde=
d-core/message/186812
> Mute This Topic: https://lists.openembedded.org/mt/101003704/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

