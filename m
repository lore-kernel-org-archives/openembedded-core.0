Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD8E71D40
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 14:43:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.19223.1695998584743838579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 07:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dhXuGS6N;
 spf=pass (domain: mvista.com, ip: 209.85.208.182, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c189dabcc3so48859051fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695998583; x=1696603383; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkKQHI+Ch6VNcz1c4saWU4IgEnNzVvbuQtaLQru2O4w=;
        b=dhXuGS6NbzsNBAQPwsXt83J8UReyLMkDLzLgfmlKsyzi1Ku4KsQGKNIcQjONtRkWiH
         9BaCxTVMP9E5y6JjOKYL+h9Hy/F4EwCHadgUwxrMQmNh5PyOCmHFjNqCuCzOH2obyV5y
         c0EtONxgDCXNmTGMGnuIHqaLFTf90KXTv/Nco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998583; x=1696603383;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkKQHI+Ch6VNcz1c4saWU4IgEnNzVvbuQtaLQru2O4w=;
        b=rV7azuM/rON9hqAObB0xnfqnMIaPVE+tCdHvkdXEb+ZaM3QMc7cfu+tjU7HspsAXe/
         DhygOfzgi3apQaZ1bjqgFcBjrWZJVJs0n6K9uG2V68qr14QEwJeZ4E6fQvuR/BxifpgQ
         aco2PzYYxognninJZylhtLjMdb/81YfiL5gVB0Ge9Pp3QT7SYzYZh2He6Y/wfLZsAnAR
         kLGPSW4BaK1lLH7bjc3Ix7E9i854Nj5YLBWtZmaKdtH7IFIg1dSNjYtXbHlM7YDeLz7x
         SVFr6urq41ml2loUnXEHDQBYdARzcIY+7e/8PAsvGrU8vsXamDJBi8ID9XR723Lcmghy
         Da4A==
X-Gm-Message-State: AOJu0YyDV+v5vWBMflPVqd1P9owfcO3ulTCi2/vDde+HgcBo/6y8l+42
	abPIFpdzcUB2GSbhAMX/7SH/p63s3MF1NfkXnxG16WI0cSX3i6V0
X-Google-Smtp-Source: AGHT+IEOUV6vPCWvqUR1YI1zTOIJZcMdaq4uSiXuqlSAdyYLceeMqJbX9PCxXQToCBUD6UD92OWv/4v3d0Dxs+xk7MU=
X-Received: by 2002:a2e:86da:0:b0:2bd:1f81:fc47 with SMTP id
 n26-20020a2e86da000000b002bd1f81fc47mr4354562ljj.22.1695998581812; Fri, 29
 Sep 2023 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230926043105.357527-1-vanusuri@mvista.com>
In-Reply-To: <20230926043105.357527-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 29 Sep 2023 20:12:50 +0530
Message-ID: <CANQUz1-0koph03N070QdMin3sG5LkTprRnhV4GV=ppgS2SQ_dg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] ghostscript: fix CVE-2023-36664
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000024616060680714b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 14:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188406

--000000000000024616060680714b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Any update on this ?

Thanks & Regards,
Vijay

On Tue, Sep 26, 2023 at 10:01=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Artifex Ghostscript through 10.01.2 mishandles permission validation for
> pipe devices (with the %pipe% prefix or the | pipe character prefix).
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2023-36664
>
> Upstream commits:
>
> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3D4ceaf9281530=
2863a8c86fcfcf2347e0118dd3a5
>
> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3D5e65eeae=
225c7d02d447de5abaf4a8e6d234fcea
>
> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3Dfb342fdb=
60391073a69147cb71af1ac416a81099
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../ghostscript/CVE-2023-36664-1.patch        | 145 ++++++++++++++++++
>  .../ghostscript/CVE-2023-36664-2.patch        |  60 ++++++++
>  .../ghostscript/CVE-2023-36664-pre1.patch     |  62 ++++++++
>  .../ghostscript/ghostscript_9.52.bb           |   3 +
>  4 files changed, 270 insertions(+)
>  create mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
>  create mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
>  create mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
>
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
> new file mode 100644
> index 0000000000..a3bbe958eb
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patc=
h
> @@ -0,0 +1,145 @@
> +From 5e65eeae225c7d02d447de5abaf4a8e6d234fcea Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Wed, 7 Jun 2023 10:23:06 +0100
> +Subject: [PATCH] Bug 706761: Don't "reduce" %pipe% file names for
> permission validation
> +
> +For regular file names, we try to simplfy relative paths before we use
> them.
> +
> +Because the %pipe% device can, effectively, accept command line calls, w=
e
> +shouldn't be simplifying that string, because the command line syntax ca=
n
> end
> +up confusing the path simplifying code. That can result in permitting a
> pipe
> +command which does not match what was originally permitted.
> +
> +Special case "%pipe" in the validation code so we always deal with the
> entire
> +string.
> +
> +Upstream-Status: Backport [
> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3D505eab7782b4=
29017eb434b2b95120855f2b0e3c
> ]
> +CVE: CVE-2023-36664
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + base/gpmisc.c   | 31 +++++++++++++++++++--------
> + base/gslibctx.c | 56 ++++++++++++++++++++++++++++++++++++-------------
> + 2 files changed, 64 insertions(+), 23 deletions(-)
> +
> +diff --git a/base/gpmisc.c b/base/gpmisc.c
> +index c4fffae..09ac6b3 100644
> +--- a/base/gpmisc.c
> ++++ b/base/gpmisc.c
> +@@ -1046,16 +1046,29 @@ gp_validate_path_len(const gs_memory_t *mem,
> +              && !memcmp(path + cdirstrl, dirsepstr, dirsepstrl)) {
> +           prefix_len =3D 0;
> +     }
> +-    rlen =3D len+1;
> +-    bufferfull =3D (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen=
 +
> prefix_len, "gp_validate_path");
> +-    if (bufferfull =3D=3D NULL)
> +-        return gs_error_VMerror;
> +-
> +-    buffer =3D bufferfull + prefix_len;
> +-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D
> gp_combine_success)
> +-        return gs_error_invalidfileaccess;
> +-    buffer[rlen] =3D 0;
> +
> ++    /* "%pipe%" do not follow the normal rules for path definitions, so
> we
> ++       don't "reduce" them to avoid unexpected results
> ++     */
> ++    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
> ++      bufferfull =3D buffer =3D (char
> *)gs_alloc_bytes(mem->thread_safe_memory, len + 1, "gp_validate_path");
> ++      if (buffer =3D=3D NULL)
> ++          return gs_error_VMerror;
> ++      memcpy(buffer, path, len);
> ++      buffer[len] =3D 0;
> ++      rlen =3D len;
> ++    }
> ++    else {
> ++      rlen =3D len+1;
> ++      bufferfull =3D (char *)gs_alloc_bytes(mem->thread_safe_memory, rl=
en
> + prefix_len, "gp_validate_path");
> ++      if (bufferfull =3D=3D NULL)
> ++          return gs_error_VMerror;
> ++
> ++      buffer =3D bufferfull + prefix_len;
> ++      if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D
> gp_combine_success)
> ++          return gs_error_invalidfileaccess;
> ++      buffer[rlen] =3D 0;
> ++    }
> +     while (1) {
> +         switch (mode[0])
> +         {
> +diff --git a/base/gslibctx.c b/base/gslibctx.c
> +index 20c5eee..355c0e3 100644
> +--- a/base/gslibctx.c
> ++++ b/base/gslibctx.c
> +@@ -719,14 +719,28 @@ gs_add_control_path_len(const gs_memory_t *mem,
> gs_path_control_t type, const ch
> +             return gs_error_rangecheck;
> +     }
> +
> +-    rlen =3D len+1;
> +-    buffer =3D (char *)gs_alloc_bytes(core->memory, rlen,
> "gp_validate_path");
> +-    if (buffer =3D=3D NULL)
> +-        return gs_error_VMerror;
> ++    /* "%pipe%" do not follow the normal rules for path definitions, so
> we
> ++       don't "reduce" them to avoid unexpected results
> ++     */
> ++    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1,
> "gs_add_control_path_len");
> ++      if (buffer =3D=3D NULL)
> ++          return gs_error_VMerror;
> ++      memcpy(buffer, path, len);
> ++      buffer[len] =3D 0;
> ++      rlen =3D len;
> ++    }
> ++    else {
> ++      rlen =3D len + 1;
> +
> +-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D
> gp_combine_success)
> +-        return gs_error_invalidfileaccess;
> +-    buffer[rlen] =3D 0;
> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, rlen,
> "gs_add_control_path_len");
> ++      if (buffer =3D=3D NULL)
> ++          return gs_error_VMerror;
> ++
> ++      if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D
> gp_combine_success)
> ++          return gs_error_invalidfileaccess;
> ++      buffer[rlen] =3D 0;
> ++    }
> +
> +     n =3D control->num;
> +     for (i =3D 0; i < n; i++)
> +@@ -802,14 +816,28 @@ gs_remove_control_path_len(const gs_memory_t *mem,
> gs_path_control_t type, const
> +             return gs_error_rangecheck;
> +     }
> +
> +-    rlen =3D len+1;
> +-    buffer =3D (char *)gs_alloc_bytes(core->memory, rlen,
> "gp_validate_path");
> +-    if (buffer =3D=3D NULL)
> +-        return gs_error_VMerror;
> ++    /* "%pipe%" do not follow the normal rules for path definitions, so
> we
> ++       don't "reduce" them to avoid unexpected results
> ++     */
> ++    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1,
> "gs_remove_control_path_len");
> ++      if (buffer =3D=3D NULL)
> ++          return gs_error_VMerror;
> ++      memcpy(buffer, path, len);
> ++      buffer[len] =3D 0;
> ++      rlen =3D len;
> ++    }
> ++    else {
> ++      rlen =3D len+1;
> +
> +-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D
> gp_combine_success)
> +-        return gs_error_invalidfileaccess;
> +-    buffer[rlen] =3D 0;
> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, rlen,
> "gs_remove_control_path_len");
> ++      if (buffer =3D=3D NULL)
> ++          return gs_error_VMerror;
> ++
> ++      if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D
> gp_combine_success)
> ++          return gs_error_invalidfileaccess;
> ++      buffer[rlen] =3D 0;
> ++    }
> +
> +     n =3D control->num;
> +     for (i =3D 0; i < n; i++) {
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
> new file mode 100644
> index 0000000000..e8c42f1deb
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patc=
h
> @@ -0,0 +1,60 @@
> +From fb342fdb60391073a69147cb71af1ac416a81099 Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Wed, 14 Jun 2023 09:08:12 +0100
> +Subject: [PATCH] Bug 706778: 706761 revisit
> +
> +Two problems with the original commit. The first a silly typo inverting
> the
> +logic of a test.
> +
> +The second was forgetting that we actually actually validate two candida=
te
> +strings for pipe devices. One with the expected "%pipe%" prefix, the oth=
er
> +using the pipe character prefix: "|".
> +
> +This addresses both those.
> +
> +Upstream-Status: Backport [
> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3Dfb342fdb6039=
1073a69147cb71af1ac416a81099
> ]
> +CVE: CVE-2023-36664
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + base/gpmisc.c   | 2 +-
> + base/gslibctx.c | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/base/gpmisc.c b/base/gpmisc.c
> +index 09ac6b3..01d449f 100644
> +--- a/base/gpmisc.c
> ++++ b/base/gpmisc.c
> +@@ -1050,7 +1050,7 @@ gp_validate_path_len(const gs_memory_t *mem,
> +     /* "%pipe%" do not follow the normal rules for path definitions, so
> we
> +        don't "reduce" them to avoid unexpected results
> +      */
> +-    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
> ++    if (path[0] =3D=3D '|' || (len > 5 && memcmp(path, "%pipe", 5) =3D=
=3D 0)) {
> +       bufferfull =3D buffer =3D (char
> *)gs_alloc_bytes(mem->thread_safe_memory, len + 1, "gp_validate_path");
> +       if (buffer =3D=3D NULL)
> +           return gs_error_VMerror;
> +diff --git a/base/gslibctx.c b/base/gslibctx.c
> +index 355c0e3..d8f74a3 100644
> +--- a/base/gslibctx.c
> ++++ b/base/gslibctx.c
> +@@ -722,7 +722,7 @@ gs_add_control_path_len(const gs_memory_t *mem,
> gs_path_control_t type, const ch
> +     /* "%pipe%" do not follow the normal rules for path definitions, so
> we
> +        don't "reduce" them to avoid unexpected results
> +      */
> +-    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
> ++    if (path[0] =3D=3D '|' || (len > 5 && memcmp(path, "%pipe", 5) =3D=
=3D 0)) {
> +       buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1,
> "gs_add_control_path_len");
> +       if (buffer =3D=3D NULL)
> +           return gs_error_VMerror;
> +@@ -819,7 +819,7 @@ gs_remove_control_path_len(const gs_memory_t *mem,
> gs_path_control_t type, const
> +     /* "%pipe%" do not follow the normal rules for path definitions, so
> we
> +        don't "reduce" them to avoid unexpected results
> +      */
> +-    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
> ++    if (path[0] =3D=3D '|' || (len > 5 && memcmp(path, "%pipe", 5) =3D=
=3D 0)) {
> +       buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1,
> "gs_remove_control_path_len");
> +       if (buffer =3D=3D NULL)
> +           return gs_error_VMerror;
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
> new file mode 100644
> index 0000000000..662736bb3d
> --- /dev/null
> +++
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
> @@ -0,0 +1,62 @@
> +From 4ceaf92815302863a8c86fcfcf2347e0118dd3a5 Mon Sep 17 00:00:00 2001
> +From: Ray Johnston <ray.johnston@artifex.com>
> +Date: Tue, 22 Sep 2020 13:10:04 -0700
> +Subject: [PATCH] Fix gp_file allocations to use thread_safe_memory.
> +
> +The gpmisc.c does allocations for gp_file objects and buffers used by
> +gp_fprintf, as well as gp_validate_path_len. The helgrind run with
> +-dBGPrint -dNumRenderingThreads=3D4 and PCL input showed up the gp_fprin=
tf
> +problem since the clist rendering would call gp_fprintf using the same
> +allocator (PCL's chunk allocator which is non_gc_memory). The chunk
> +allocator is intentionally not thread safe (for performance).
> +
> +Upstream-Status: Backport [
> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3D4ceaf9281530=
2863a8c86fcfcf2347e0118dd3a5
> ]
> +CVE: CVE-2023-36664 #Dependency Patch1
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + base/gpmisc.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/base/gpmisc.c b/base/gpmisc.c
> +index 34cd71f..c4fffae 100644
> +--- a/base/gpmisc.c
> ++++ b/base/gpmisc.c
> +@@ -435,7 +435,7 @@ generic_pwrite(gp_file *f, size_t count, gs_offset_t
> offset, const void *buf)
> +
> + gp_file *gp_file_alloc(gs_memory_t *mem, const gp_file_ops_t *prototype=
,
> size_t size, const char *cname)
> + {
> +-    gp_file *file =3D (gp_file *)gs_alloc_bytes(mem->non_gc_memory, siz=
e,
> cname ? cname : "gp_file");
> ++    gp_file *file =3D (gp_file *)gs_alloc_bytes(mem->thread_safe_memory=
,
> size, cname ? cname : "gp_file");
> +     if (file =3D=3D NULL)
> +         return NULL;
> +
> +@@ -449,7 +449,7 @@ gp_file *gp_file_alloc(gs_memory_t *mem, const
> gp_file_ops_t *prototype, size_t
> +         memset(((char *)file)+sizeof(*prototype),
> +                0,
> +                size - sizeof(*prototype));
> +-    file->memory =3D mem->non_gc_memory;
> ++    file->memory =3D mem->thread_safe_memory;
> +
> +     return file;
> + }
> +@@ -1047,7 +1047,7 @@ gp_validate_path_len(const gs_memory_t *mem,
> +           prefix_len =3D 0;
> +     }
> +     rlen =3D len+1;
> +-    bufferfull =3D (char *)gs_alloc_bytes(mem->non_gc_memory, rlen +
> prefix_len, "gp_validate_path");
> ++    bufferfull =3D (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen=
 +
> prefix_len, "gp_validate_path");
> +     if (bufferfull =3D=3D NULL)
> +         return gs_error_VMerror;
> +
> +@@ -1093,7 +1093,7 @@ gp_validate_path_len(const gs_memory_t *mem,
> +         break;
> +     }
> +
> +-    gs_free_object(mem->non_gc_memory, bufferfull, "gp_validate_path");
> ++    gs_free_object(mem->thread_safe_memory, bufferfull,
> "gp_validate_path");
> + #ifdef EACCES
> +     if (code =3D=3D gs_error_invalidfileaccess)
> +         errno =3D EACCES;
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> index 37e9ed8e84..0a2f9f5046 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> @@ -41,6 +41,9 @@ SRC_URI_BASE =3D "
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
>                  file://CVE-2021-3781_3.patch \
>                  file://CVE-2023-28879.patch \
>
>  file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
> +                file://CVE-2023-36664-pre1.patch \
> +                file://CVE-2023-36664-1.patch \
> +                file://CVE-2023-36664-2.patch \
>  "
>
>  SRC_URI =3D "${SRC_URI_BASE} \
> --
> 2.25.1
>
>

--000000000000024616060680714b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>Any update on this=
 ?</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Sep 26, 2023 at 10:01=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvi=
sta.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanus=
uri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Artifex Ghostscript through 10.01.2 mishandles permission validation for<br=
>
pipe devices (with the %pipe% prefix or the | pipe character prefix).<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-36664" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-36664</a><b=
r>
<br>
Upstream commits:<br>
<a href=3D"https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3D4ce=
af92815302863a8c86fcfcf2347e0118dd3a5" rel=3D"noreferrer" target=3D"_blank"=
>https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3D4ceaf92815302=
863a8c86fcfcf2347e0118dd3a5</a><br>
<a href=3D"https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=
=3D5e65eeae225c7d02d447de5abaf4a8e6d234fcea" rel=3D"noreferrer" target=3D"_=
blank">https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3D5e6=
5eeae225c7d02d447de5abaf4a8e6d234fcea</a><br>
<a href=3D"https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=
=3Dfb342fdb60391073a69147cb71af1ac416a81099" rel=3D"noreferrer" target=3D"_=
blank">https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3Dfb3=
42fdb60391073a69147cb71af1ac416a81099</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../ghostscript/CVE-2023-36664-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
45 ++++++++++++++++++<br>
=C2=A0.../ghostscript/CVE-2023-36664-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 60 ++++++++<br>
=C2=A0.../ghostscript/CVE-2023-36664-pre1.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
62 ++++++++<br>
=C2=A0.../ghostscript/<a href=3D"http://ghostscript_9.52.bb" rel=3D"norefer=
rer" target=3D"_blank">ghostscript_9.52.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A04 files changed, 270 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2023-36664-1.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2023-36664-2.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2023-36664-pre1.patch<br>
<br>
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1=
.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.pat=
ch<br>
new file mode 100644<br>
index 0000000000..a3bbe958eb<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch<=
br>
@@ -0,0 +1,145 @@<br>
+From 5e65eeae225c7d02d447de5abaf4a8e6d234fcea Mon Sep 17 00:00:00 2001<br>
+From: Chris Liddell &lt;<a href=3D"mailto:chris.liddell@artifex.com" targe=
t=3D"_blank">chris.liddell@artifex.com</a>&gt;<br>
+Date: Wed, 7 Jun 2023 10:23:06 +0100<br>
+Subject: [PATCH] Bug 706761: Don&#39;t &quot;reduce&quot; %pipe% file name=
s for permission validation<br>
+<br>
+For regular file names, we try to simplfy relative paths before we use the=
m.<br>
+<br>
+Because the %pipe% device can, effectively, accept command line calls, we<=
br>
+shouldn&#39;t be simplifying that string, because the command line syntax =
can end<br>
+up confusing the path simplifying code. That can result in permitting a pi=
pe<br>
+command which does not match what was originally permitted.<br>
+<br>
+Special case &quot;%pipe&quot; in the validation code so we always deal wi=
th the entire<br>
+string.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.ghostscript.com/?p=3Dgho=
stpdl.git;a=3Dcommit;h=3D505eab7782b429017eb434b2b95120855f2b0e3c" rel=3D"n=
oreferrer" target=3D"_blank">https://git.ghostscript.com/?p=3Dghostpdl.git;=
a=3Dcommit;h=3D505eab7782b429017eb434b2b95120855f2b0e3c</a>]<br>
+CVE: CVE-2023-36664<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ base/gpmisc.c=C2=A0 =C2=A0| 31 +++++++++++++++++++--------<br>
+ base/gslibctx.c | 56 ++++++++++++++++++++++++++++++++++++-------------<br=
>
+ 2 files changed, 64 insertions(+), 23 deletions(-)<br>
+<br>
+diff --git a/base/gpmisc.c b/base/gpmisc.c<br>
+index c4fffae..09ac6b3 100644<br>
+--- a/base/gpmisc.c<br>
++++ b/base/gpmisc.c<br>
+@@ -1046,16 +1046,29 @@ gp_validate_path_len(const gs_memory_t *mem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !memcmp(path +=
 cdirstrl, dirsepstr, dirsepstrl)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 rlen =3D len+1;<br>
+-=C2=A0 =C2=A0 bufferfull =3D (char *)gs_alloc_bytes(mem-&gt;thread_safe_m=
emory, rlen + prefix_len, &quot;gp_validate_path&quot;);<br>
+-=C2=A0 =C2=A0 if (bufferfull =3D=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
+-<br>
+-=C2=A0 =C2=A0 buffer =3D bufferfull + prefix_len;<br>
+-=C2=A0 =C2=A0 if (gp_file_name_reduce(path, (uint)len, buffer, &amp;rlen)=
 !=3D gp_combine_success)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_invalidfileaccess;<br>
+-=C2=A0 =C2=A0 buffer[rlen] =3D 0;<br>
+ <br>
++=C2=A0 =C2=A0 /* &quot;%pipe%&quot; do not follow the normal rules for pa=
th definitions, so we<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t &quot;reduce&quot; them to avoid une=
xpected results<br>
++=C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 if (len &gt; 5 &amp;&amp; memcmp(path, &quot;%pipe&quot;, 5=
) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 bufferfull =3D buffer =3D (char *)gs_alloc_bytes(mem=
-&gt;thread_safe_memory, len + 1, &quot;gp_validate_path&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(buffer, path, len);<br>
++=C2=A0 =C2=A0 =C2=A0 buffer[len] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 rlen =3D len;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 rlen =3D len+1;<br>
++=C2=A0 =C2=A0 =C2=A0 bufferfull =3D (char *)gs_alloc_bytes(mem-&gt;thread=
_safe_memory, rlen + prefix_len, &quot;gp_validate_path&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (bufferfull =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 buffer =3D bufferfull + prefix_len;<br>
++=C2=A0 =C2=A0 =C2=A0 if (gp_file_name_reduce(path, (uint)len, buffer, &am=
p;rlen) !=3D gp_combine_success)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_invalidfileaccess;<br>
++=C2=A0 =C2=A0 =C2=A0 buffer[rlen] =3D 0;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0while (1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (mode[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+diff --git a/base/gslibctx.c b/base/gslibctx.c<br>
+index 20c5eee..355c0e3 100644<br>
+--- a/base/gslibctx.c<br>
++++ b/base/gslibctx.c<br>
+@@ -719,14 +719,28 @@ gs_add_control_path_len(const gs_memory_t *mem, gs_p=
ath_control_t type, const ch<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gs_error_rangecheck=
;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 rlen =3D len+1;<br>
+-=C2=A0 =C2=A0 buffer =3D (char *)gs_alloc_bytes(core-&gt;memory, rlen, &q=
uot;gp_validate_path&quot;);<br>
+-=C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++=C2=A0 =C2=A0 /* &quot;%pipe%&quot; do not follow the normal rules for pa=
th definitions, so we<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t &quot;reduce&quot; them to avoid une=
xpected results<br>
++=C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 if (len &gt; 5 &amp;&amp; memcmp(path, &quot;%pipe&quot;, 5=
) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 buffer =3D (char *)gs_alloc_bytes(core-&gt;memory, l=
en + 1, &quot;gs_add_control_path_len&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(buffer, path, len);<br>
++=C2=A0 =C2=A0 =C2=A0 buffer[len] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 rlen =3D len;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 rlen =3D len + 1;<br>
+ <br>
+-=C2=A0 =C2=A0 if (gp_file_name_reduce(path, (uint)len, buffer, &amp;rlen)=
 !=3D gp_combine_success)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_invalidfileaccess;<br>
+-=C2=A0 =C2=A0 buffer[rlen] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 buffer =3D (char *)gs_alloc_bytes(core-&gt;memory, r=
len, &quot;gs_add_control_path_len&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (gp_file_name_reduce(path, (uint)len, buffer, &am=
p;rlen) !=3D gp_combine_success)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_invalidfileaccess;<br>
++=C2=A0 =C2=A0 =C2=A0 buffer[rlen] =3D 0;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0n =3D control-&gt;num;<br>
+=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; n; i++)<br>
+@@ -802,14 +816,28 @@ gs_remove_control_path_len(const gs_memory_t *mem, g=
s_path_control_t type, const<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gs_error_rangecheck=
;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 rlen =3D len+1;<br>
+-=C2=A0 =C2=A0 buffer =3D (char *)gs_alloc_bytes(core-&gt;memory, rlen, &q=
uot;gp_validate_path&quot;);<br>
+-=C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++=C2=A0 =C2=A0 /* &quot;%pipe%&quot; do not follow the normal rules for pa=
th definitions, so we<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t &quot;reduce&quot; them to avoid une=
xpected results<br>
++=C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 if (len &gt; 5 &amp;&amp; memcmp(path, &quot;%pipe&quot;, 5=
) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 buffer =3D (char *)gs_alloc_bytes(core-&gt;memory, l=
en + 1, &quot;gs_remove_control_path_len&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(buffer, path, len);<br>
++=C2=A0 =C2=A0 =C2=A0 buffer[len] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 rlen =3D len;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 rlen =3D len+1;<br>
+ <br>
+-=C2=A0 =C2=A0 if (gp_file_name_reduce(path, (uint)len, buffer, &amp;rlen)=
 !=3D gp_combine_success)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_invalidfileaccess;<br>
+-=C2=A0 =C2=A0 buffer[rlen] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 buffer =3D (char *)gs_alloc_bytes(core-&gt;memory, r=
len, &quot;gs_remove_control_path_len&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (buffer =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_VMerror;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (gp_file_name_reduce(path, (uint)len, buffer, &am=
p;rlen) !=3D gp_combine_success)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gs_error_invalidfileaccess;<br>
++=C2=A0 =C2=A0 =C2=A0 buffer[rlen] =3D 0;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0n =3D control-&gt;num;<br>
+=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; n; i++) {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2=
.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.pat=
ch<br>
new file mode 100644<br>
index 0000000000..e8c42f1deb<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch<=
br>
@@ -0,0 +1,60 @@<br>
+From fb342fdb60391073a69147cb71af1ac416a81099 Mon Sep 17 00:00:00 2001<br>
+From: Chris Liddell &lt;<a href=3D"mailto:chris.liddell@artifex.com" targe=
t=3D"_blank">chris.liddell@artifex.com</a>&gt;<br>
+Date: Wed, 14 Jun 2023 09:08:12 +0100<br>
+Subject: [PATCH] Bug 706778: 706761 revisit<br>
+<br>
+Two problems with the original commit. The first a silly typo inverting th=
e<br>
+logic of a test.<br>
+<br>
+The second was forgetting that we actually actually validate two candidate=
<br>
+strings for pipe devices. One with the expected &quot;%pipe%&quot; prefix,=
 the other<br>
+using the pipe character prefix: &quot;|&quot;.<br>
+<br>
+This addresses both those.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.ghostscript.com/?p=3Dgho=
stpdl.git;a=3Dcommit;h=3Dfb342fdb60391073a69147cb71af1ac416a81099" rel=3D"n=
oreferrer" target=3D"_blank">https://git.ghostscript.com/?p=3Dghostpdl.git;=
a=3Dcommit;h=3Dfb342fdb60391073a69147cb71af1ac416a81099</a>]<br>
+CVE: CVE-2023-36664<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ base/gpmisc.c=C2=A0 =C2=A0| 2 +-<br>
+ base/gslibctx.c | 4 ++--<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/base/gpmisc.c b/base/gpmisc.c<br>
+index 09ac6b3..01d449f 100644<br>
+--- a/base/gpmisc.c<br>
++++ b/base/gpmisc.c<br>
+@@ -1050,7 +1050,7 @@ gp_validate_path_len(const gs_memory_t *mem,<br>
+=C2=A0 =C2=A0 =C2=A0/* &quot;%pipe%&quot; do not follow the normal rules f=
or path definitions, so we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 don&#39;t &quot;reduce&quot; them to avoid une=
xpected results<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 if (len &gt; 5 &amp;&amp; memcmp(path, &quot;%pipe&quot;, 5=
) !=3D 0) {<br>
++=C2=A0 =C2=A0 if (path[0] =3D=3D &#39;|&#39; || (len &gt; 5 &amp;&amp; me=
mcmp(path, &quot;%pipe&quot;, 5) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bufferfull =3D buffer =3D (char *)gs_alloc_byte=
s(mem-&gt;thread_safe_memory, len + 1, &quot;gp_validate_path&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gs_error_VMerror;<br>
+diff --git a/base/gslibctx.c b/base/gslibctx.c<br>
+index 355c0e3..d8f74a3 100644<br>
+--- a/base/gslibctx.c<br>
++++ b/base/gslibctx.c<br>
+@@ -722,7 +722,7 @@ gs_add_control_path_len(const gs_memory_t *mem, gs_pat=
h_control_t type, const ch<br>
+=C2=A0 =C2=A0 =C2=A0/* &quot;%pipe%&quot; do not follow the normal rules f=
or path definitions, so we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 don&#39;t &quot;reduce&quot; them to avoid une=
xpected results<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 if (len &gt; 5 &amp;&amp; memcmp(path, &quot;%pipe&quot;, 5=
) !=3D 0) {<br>
++=C2=A0 =C2=A0 if (path[0] =3D=3D &#39;|&#39; || (len &gt; 5 &amp;&amp; me=
mcmp(path, &quot;%pipe&quot;, 5) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer =3D (char *)gs_alloc_bytes(core-&gt;memo=
ry, len + 1, &quot;gs_add_control_path_len&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gs_error_VMerror;<br>
+@@ -819,7 +819,7 @@ gs_remove_control_path_len(const gs_memory_t *mem, gs_=
path_control_t type, const<br>
+=C2=A0 =C2=A0 =C2=A0/* &quot;%pipe%&quot; do not follow the normal rules f=
or path definitions, so we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 don&#39;t &quot;reduce&quot; them to avoid une=
xpected results<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 if (len &gt; 5 &amp;&amp; memcmp(path, &quot;%pipe&quot;, 5=
) !=3D 0) {<br>
++=C2=A0 =C2=A0 if (path[0] =3D=3D &#39;|&#39; || (len &gt; 5 &amp;&amp; me=
mcmp(path, &quot;%pipe&quot;, 5) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer =3D (char *)gs_alloc_bytes(core-&gt;memo=
ry, len + 1, &quot;gs_remove_control_path_len&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gs_error_VMerror;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-p=
re1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pr=
e1.patch<br>
new file mode 100644<br>
index 0000000000..662736bb3d<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.pat=
ch<br>
@@ -0,0 +1,62 @@<br>
+From 4ceaf92815302863a8c86fcfcf2347e0118dd3a5 Mon Sep 17 00:00:00 2001<br>
+From: Ray Johnston &lt;<a href=3D"mailto:ray.johnston@artifex.com" target=
=3D"_blank">ray.johnston@artifex.com</a>&gt;<br>
+Date: Tue, 22 Sep 2020 13:10:04 -0700<br>
+Subject: [PATCH] Fix gp_file allocations to use thread_safe_memory.<br>
+<br>
+The gpmisc.c does allocations for gp_file objects and buffers used by<br>
+gp_fprintf, as well as gp_validate_path_len. The helgrind run with<br>
+-dBGPrint -dNumRenderingThreads=3D4 and PCL input showed up the gp_fprintf=
<br>
+problem since the clist rendering would call gp_fprintf using the same<br>
+allocator (PCL&#39;s chunk allocator which is non_gc_memory). The chunk<br=
>
+allocator is intentionally not thread safe (for performance).<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.ghostscript.com/?p=3Dgho=
stpdl.git;a=3Dcommit;h=3D4ceaf92815302863a8c86fcfcf2347e0118dd3a5" rel=3D"n=
oreferrer" target=3D"_blank">https://git.ghostscript.com/?p=3Dghostpdl.git;=
a=3Dcommit;h=3D4ceaf92815302863a8c86fcfcf2347e0118dd3a5</a>]<br>
+CVE: CVE-2023-36664 #Dependency Patch1<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ base/gpmisc.c | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/base/gpmisc.c b/base/gpmisc.c<br>
+index 34cd71f..c4fffae 100644<br>
+--- a/base/gpmisc.c<br>
++++ b/base/gpmisc.c<br>
+@@ -435,7 +435,7 @@ generic_pwrite(gp_file *f, size_t count, gs_offset_t o=
ffset, const void *buf)<br>
+ <br>
+ gp_file *gp_file_alloc(gs_memory_t *mem, const gp_file_ops_t *prototype, =
size_t size, const char *cname)<br>
+ {<br>
+-=C2=A0 =C2=A0 gp_file *file =3D (gp_file *)gs_alloc_bytes(mem-&gt;non_gc_=
memory, size, cname ? cname : &quot;gp_file&quot;);<br>
++=C2=A0 =C2=A0 gp_file *file =3D (gp_file *)gs_alloc_bytes(mem-&gt;thread_=
safe_memory, size, cname ? cname : &quot;gp_file&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0if (file =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ <br>
+@@ -449,7 +449,7 @@ gp_file *gp_file_alloc(gs_memory_t *mem, const gp_file=
_ops_t *prototype, size_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(((char *)file)+sizeof(*prototype)=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size - sizeof(*pro=
totype));<br>
+-=C2=A0 =C2=A0 file-&gt;memory =3D mem-&gt;non_gc_memory;<br>
++=C2=A0 =C2=A0 file-&gt;memory =3D mem-&gt;thread_safe_memory;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return file;<br>
+ }<br>
+@@ -1047,7 +1047,7 @@ gp_validate_path_len(const gs_memory_t *mem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0rlen =3D len+1;<br>
+-=C2=A0 =C2=A0 bufferfull =3D (char *)gs_alloc_bytes(mem-&gt;non_gc_memory=
, rlen + prefix_len, &quot;gp_validate_path&quot;);<br>
++=C2=A0 =C2=A0 bufferfull =3D (char *)gs_alloc_bytes(mem-&gt;thread_safe_m=
emory, rlen + prefix_len, &quot;gp_validate_path&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0if (bufferfull =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gs_error_VMerror;<br>
+ <br>
+@@ -1093,7 +1093,7 @@ gp_validate_path_len(const gs_memory_t *mem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 gs_free_object(mem-&gt;non_gc_memory, bufferfull, &quot;gp_=
validate_path&quot;);<br>
++=C2=A0 =C2=A0 gs_free_object(mem-&gt;thread_safe_memory, bufferfull, &quo=
t;gp_validate_path&quot;);<br>
+ #ifdef EACCES<br>
+=C2=A0 =C2=A0 =C2=A0if (code =3D=3D gs_error_invalidfileaccess)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D EACCES;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscrip=
t_9.52.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a> b/m=
eta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.52.bb" rel=
=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a><br>
index 37e9ed8e84..0a2f9f5046 100644<br>
--- a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.52.=
bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a><br>
+++ b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.52.=
bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a><br>
@@ -41,6 +41,9 @@ SRC_URI_BASE =3D &quot;<a href=3D"https://github.com/Arti=
fexSoftware/ghostpdl-downloads/releases/d" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d</a><b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-20=
21-3781_3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-20=
23-28879.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-B=
ug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-36=
664-pre1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-36=
664-1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-36=
664-2.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SRC_URI_BASE} \<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000024616060680714b--

