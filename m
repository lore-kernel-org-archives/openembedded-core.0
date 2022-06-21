Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3B2C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 00:10:10 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.37781.1655770209619666380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 17:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nbaTnLQz;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id d128so8950045qkg.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vET4iK3CpEELmrEx70D0zKPsxIp71sGX6OEI59IxI3E=;
        b=nbaTnLQzrBc9TZYZRjLZn2JoO3Xe794vkXB/r0+n+e5IjbpfPytUoNh1GsbWEfu99Q
         1ocNVvWAfbSbd+dLY8NZrGKHoabRtr7PfA4qkg0R+RJAlddXBmWMwlFSCv5t8hC1g9nN
         w4wUnJtLKPqfIBp8UvhxnvXYdULIgoFf68f0+5BlPj3pmypKy6yHluUo86Upzc3pvuUj
         8rOqzK4Op3B3suREn8KnxOho6NLtIDKaXWBmbwhIm/QvHHEHAEjSEY1h3DCuFjz8O3FJ
         fbFtnYmydxXC+8ApV7Qf/Ih+F1DOLApU6pVL9g8uEca36Y37rph5fVvszRz2Y8eYnkWf
         eG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vET4iK3CpEELmrEx70D0zKPsxIp71sGX6OEI59IxI3E=;
        b=TWrCpzCVhwC4//+eYd1KjlbiyeAxjCc+1ahWwisaMCi6wd0eH/dtFOhvs8a8aV9XSB
         8K58LhQl6oTRjgLvqfgM7EMWCLCm50piKbYk/u0Cq+Mk43vGVsnwPTlkbHyBO2wR1IQ2
         mFTLtWFkrxSsNdZMR8Rokp/8ud4zSetXndUtOGHskks8qvUOC7/GtPYc4YqYnyCRm6HF
         xFOOvuHhz7rQI5CS0YjceEg9YftkBdUlAofOoJjO8waxf6EN1rqMd/mZM+pO9hKG5OwG
         vS2xQI2wGlZs6zS3les9TuSx7ZsQ+ei69oPLYv3nGITE5P0DZMR8LvP9VBIkxdQ7LNeW
         dUBQ==
X-Gm-Message-State: AJIora/UUAIwS75M8Mpnzi9ZR6VQihYjd1wlLVu6nCVWcAOSXgcfLvkG
	q+bzIdfOJ9x/23DRbFkhNJ8pq+4QryA1B9dtkPg=
X-Google-Smtp-Source: 
 AGRyM1ufvVuWam28VPltYRvRsxuoJH3FduPTW4iwl3zWAGrJ17mZKJUZ7N5hL4BQrS8E8lz5H5ECwUAppS+KjuTR6UM=
X-Received: by 2002:ae9:d60b:0:b0:6a6:ab28:3c05 with SMTP id
 r11-20020ae9d60b000000b006a6ab283c05mr18051282qkk.180.1655770208596; Mon, 20
 Jun 2022 17:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220620161228.5267-1-pavel@zhukoff.net>
In-Reply-To: <20220620161228.5267-1-pavel@zhukoff.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jun 2022 05:39:57 +0530
Message-ID: 
 <CAMKF1sre0sgi_WJ4G=OvNy6m1BQiVD9g9OScw08USsdkRRhgbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Add missed sys/file.h includes for
 musl
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001cf88205e1ea0b1d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 00:10:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167127

--0000000000001cf88205e1ea0b1d
Content-Type: text/plain; charset="UTF-8"

This could be a generic patch and also submit it upstream

On Mon, Jun 20, 2022 at 9:43 PM Pavel Zhukov <pavel@zhukoff.net> wrote:

> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../0001-Add-sys-file.h-for-LOCK_.patch       | 80 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_251.2.bb    |  2 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
> b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
> new file mode 100644
> index 0000000000..25a1042a9d
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
> @@ -0,0 +1,80 @@
> +From 7ae39374fda539aa613caeeee09be8d050a9bb79 Mon Sep 17 00:00:00 2001
> +From: Pavel Zhukov <pavel.zhukov@huawei.com>
> +Date: Mon, 20 Jun 2022 11:24:52 +0200
> +Subject: [PATCH] Add sys/file.h for LOCK_
> +Cc: pavel@zhukoff.net
> +
> +Upstream-Status: Inappropriate [musl specific]
> +
> +Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> +---
> + src/core/namespace.c       | 1 +
> + src/dissect/dissect.c      | 1 +
> + src/shared/dissect-image.c | 2 ++
> + src/sysext/sysext.c        | 1 +
> + src/test/test-loop-block.c | 1 +
> + 5 files changed, 6 insertions(+)
> +
> +diff --git a/src/core/namespace.c b/src/core/namespace.c
> +index 926aa96174..39f9e21c93 100644
> +--- a/src/core/namespace.c
> ++++ b/src/core/namespace.c
> +@@ -7,6 +7,7 @@
> + #include <sys/mount.h>
> + #include <unistd.h>
> + #include <linux/fs.h>
> ++#include <sys/file.h> // For LOCK_ musl-specific
> +
> + #include "alloc-util.h"
> + #include "base-filesystem.h"
> +diff --git a/src/dissect/dissect.c b/src/dissect/dissect.c
> +index bd94a755db..a0d2a6f287 100644
> +--- a/src/dissect/dissect.c
> ++++ b/src/dissect/dissect.c
> +@@ -6,6 +6,7 @@
> + #include <stdio.h>
> + #include <sys/ioctl.h>
> + #include <sys/mount.h>
> ++#include <sys/file.h> // musl specific for LOCK_
> +
> + #include "architecture.h"
> + #include "chase-symlinks.h"
> +diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
> +index 1ab88839aa..a9e3fe4b44 100644
> +--- a/src/shared/dissect-image.c
> ++++ b/src/shared/dissect-image.c
> +@@ -4,6 +4,8 @@
> + #include <valgrind/memcheck.h>
> + #endif
> +
> ++#include <sys/file.h> // For LOCK (musl specific)
> ++
> + #include <linux/blkpg.h>
> + #include <linux/dm-ioctl.h>
> + #include <linux/loop.h>
> +diff --git a/src/sysext/sysext.c b/src/sysext/sysext.c
> +index 364af195e0..85686c0fab 100644
> +--- a/src/sysext/sysext.c
> ++++ b/src/sysext/sysext.c
> +@@ -5,6 +5,7 @@
> + #include <linux/loop.h>
> + #include <sys/mount.h>
> + #include <unistd.h>
> ++#include <sys/file.h> // LOCK_ (musl-specific)
> +
> + #include "capability-util.h"
> + #include "chase-symlinks.h"
> +diff --git a/src/test/test-loop-block.c b/src/test/test-loop-block.c
> +index d1793222f0..6886c4cd31 100644
> +--- a/src/test/test-loop-block.c
> ++++ b/src/test/test-loop-block.c
> +@@ -3,6 +3,7 @@
> + #include <fcntl.h>
> + #include <linux/loop.h>
> + #include <pthread.h>
> ++#include <sys/file.h> // LOCK_ (Musl specific)
> +
> + #include "alloc-util.h"
> + #include "dissect-image.h"
> +--
> +2.35.1
> diff --git a/meta/recipes-core/systemd/systemd_251.2.bb
> b/meta/recipes-core/systemd/systemd_251.2.bb
> index 8370bec0ca..88216ccf6e 100644
> --- a/meta/recipes-core/systemd/systemd_251.2.bb
> +++ b/meta/recipes-core/systemd/systemd_251.2.bb
> @@ -35,7 +35,6 @@ SRC_URI_MUSL = "\
>
> file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
>
> file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
>                 file://0008-add-missing-FTW_-macros-for-musl.patch \
> -
>  file://0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
>                 file://0010-Use-uintmax_t-for-handling-rlim_t.patch \
>
> file://0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
>
> file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
> @@ -51,6 +50,7 @@ SRC_URI_MUSL = "\
>                 file://0001-pass-correct-parameters-to-getdents64.patch \
>                 file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
>                 file://0001-Adjust-for-musl-headers.patch \
> +               file://0001-Add-sys-file.h-for-LOCK_.patch \
>                 "
>
>  PAM_PLUGINS = " \
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167121):
> https://lists.openembedded.org/g/openembedded-core/message/167121
> Mute This Topic: https://lists.openembedded.org/mt/91880524/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001cf88205e1ea0b1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This could be a generic patch and also submit it upstream=
=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Jun 20, 2022 at 9:43 PM Pavel Zhukov &lt;<a href=3D"mail=
to:pavel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel.zhukov@huawei=
.com" target=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Add-sys-file.h-for-LOCK_.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 8=
0 +++++++++++++++++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_251.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 +=
-<br>
=C2=A02 files changed, 81 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-Add-sys-fil=
e.h-for-LOCK_.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK=
_.patch b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.p=
atch<br>
new file mode 100644<br>
index 0000000000..25a1042a9d<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch=
<br>
@@ -0,0 +1,80 @@<br>
+From 7ae39374fda539aa613caeeee09be8d050a9bb79 Mon Sep 17 00:00:00 2001<br>
+From: Pavel Zhukov &lt;<a href=3D"mailto:pavel.zhukov@huawei.com" target=
=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>
+Date: Mon, 20 Jun 2022 11:24:52 +0200<br>
+Subject: [PATCH] Add sys/file.h for LOCK_<br>
+Cc: <a href=3D"mailto:pavel@zhukoff.net" target=3D"_blank">pavel@zhukoff.n=
et</a><br>
+<br>
+Upstream-Status: Inappropriate [musl specific]<br>
+<br>
+Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel.zhukov@huawei.com"=
 target=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>
+---<br>
+ src/core/namespace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
+ src/dissect/dissect.c=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
+ src/shared/dissect-image.c | 2 ++<br>
+ src/sysext/sysext.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
+ src/test/test-loop-block.c | 1 +<br>
+ 5 files changed, 6 insertions(+)<br>
+<br>
+diff --git a/src/core/namespace.c b/src/core/namespace.c<br>
+index 926aa96174..39f9e21c93 100644<br>
+--- a/src/core/namespace.c<br>
++++ b/src/core/namespace.c<br>
+@@ -7,6 +7,7 @@<br>
+ #include &lt;sys/mount.h&gt;<br>
+ #include &lt;unistd.h&gt;<br>
+ #include &lt;linux/fs.h&gt;<br>
++#include &lt;sys/file.h&gt; // For LOCK_ musl-specific<br>
+<br>
+ #include &quot;alloc-util.h&quot;<br>
+ #include &quot;base-filesystem.h&quot;<br>
+diff --git a/src/dissect/dissect.c b/src/dissect/dissect.c<br>
+index bd94a755db..a0d2a6f287 100644<br>
+--- a/src/dissect/dissect.c<br>
++++ b/src/dissect/dissect.c<br>
+@@ -6,6 +6,7 @@<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;sys/ioctl.h&gt;<br>
+ #include &lt;sys/mount.h&gt;<br>
++#include &lt;sys/file.h&gt; // musl specific for LOCK_<br>
+<br>
+ #include &quot;architecture.h&quot;<br>
+ #include &quot;chase-symlinks.h&quot;<br>
+diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c<br>
+index 1ab88839aa..a9e3fe4b44 100644<br>
+--- a/src/shared/dissect-image.c<br>
++++ b/src/shared/dissect-image.c<br>
+@@ -4,6 +4,8 @@<br>
+ #include &lt;valgrind/memcheck.h&gt;<br>
+ #endif<br>
+<br>
++#include &lt;sys/file.h&gt; // For LOCK (musl specific)<br>
++<br>
+ #include &lt;linux/blkpg.h&gt;<br>
+ #include &lt;linux/dm-ioctl.h&gt;<br>
+ #include &lt;linux/loop.h&gt;<br>
+diff --git a/src/sysext/sysext.c b/src/sysext/sysext.c<br>
+index 364af195e0..85686c0fab 100644<br>
+--- a/src/sysext/sysext.c<br>
++++ b/src/sysext/sysext.c<br>
+@@ -5,6 +5,7 @@<br>
+ #include &lt;linux/loop.h&gt;<br>
+ #include &lt;sys/mount.h&gt;<br>
+ #include &lt;unistd.h&gt;<br>
++#include &lt;sys/file.h&gt; // LOCK_ (musl-specific)<br>
+<br>
+ #include &quot;capability-util.h&quot;<br>
+ #include &quot;chase-symlinks.h&quot;<br>
+diff --git a/src/test/test-loop-block.c b/src/test/test-loop-block.c<br>
+index d1793222f0..6886c4cd31 100644<br>
+--- a/src/test/test-loop-block.c<br>
++++ b/src/test/test-loop-block.c<br>
+@@ -3,6 +3,7 @@<br>
+ #include &lt;fcntl.h&gt;<br>
+ #include &lt;linux/loop.h&gt;<br>
+ #include &lt;pthread.h&gt;<br>
++#include &lt;sys/file.h&gt; // LOCK_ (Musl specific)<br>
+<br>
+ #include &quot;alloc-util.h&quot;<br>
+ #include &quot;dissect-image.h&quot;<br>
+--<br>
+2.35.1<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_251.2.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_251.2.bb</a><br>
index 8370bec0ca..88216ccf6e 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_251.2.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_251.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_251.2.bb</a><br>
@@ -35,7 +35,6 @@ SRC_URI_MUSL =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-src-bas=
ic-missing.h-check-for-missing-strndupa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-don-t-f=
ail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-add-mis=
sing-FTW_-macros-for-musl.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-fix-mis=
sing-of-__register_atfork-for-non-glibc-build.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0010-Use-uin=
tmax_t-for-handling-rlim_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-test-si=
zeof.c-Disable-tests-for-missing-typedefs-in-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-don-t-p=
ass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \<br>
@@ -51,6 +50,7 @@ SRC_URI_MUSL =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pass-co=
rrect-parameters-to-getdents64.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Add-sys=
-stat.h-for-S_IFDIR.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Adjust-=
for-musl-headers.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-sys=
-file.h-for-LOCK_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167121): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167121" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167121</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91880524/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91880524/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001cf88205e1ea0b1d--

