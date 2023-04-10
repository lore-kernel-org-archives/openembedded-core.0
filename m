Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3362AC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:24:01 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.50530.1681147431167314005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nZGccp4D;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id j12so3710743oij.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681147430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKs5/2TTVjPOPQOQoLJ9TLTpZ6FCgwG4EWAnp5TBsKQ=;
        b=nZGccp4DhUCMi+TwZyre0KlAweqtU6NdEer21czWs88s8P9CSCPqCwZZ1T5kMyKIT6
         ekrpaX9AeFXbFj0uRcGIHDxzgT65O52X58aWnXjEHlu9B113FRxZuUZKNharWz6nfR/t
         XxsGbQ8XPXTXTejKfPT6aMY6JmQMcFTqGJmIs5G2ZlFOfexNUcSrkxpkXz7zmdIETLHL
         +0qn9LdjLQqCicFZvjxMWdOf3oX3ziEJnH65q1+17grhBZBD1UiZKtlEjSjJl7jOoX/M
         3RKzOabYdqrkRnM4FKNIAGj8bBrKdpmaJtOVI2OdnWZ97n89iMaXG5C2Hidv1gtfaMPJ
         I3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681147430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKs5/2TTVjPOPQOQoLJ9TLTpZ6FCgwG4EWAnp5TBsKQ=;
        b=X+YDregBEyhzCWYYANoQ0EsyY/Ei0KhmHH7/SuQOiPEle6oCJujP6pYzV7pX+KgEhp
         7t2u1joTJcsiEK7eceQymNM+K+JYbWibUiqeqZOViQvbJFbZp3/RMWCkHkD9DCEkPUxm
         B1fnuTVqzv1Co528PEqmTztaXFlyi3TrMd0OID06UMce3nl4HVKN1Q277tDvcP84U2Ss
         I+sFXNzKlju+rWt55XuRvrd4DCqySj+9ImCYb929cFdS0jL3sjDfMjrMeKWXCqbKT5R6
         WL4nbqhLqzxgNMRrb65qEw0vEe1kMdS9XeRpXDh5OfmuqBAVn9KlFxchPkRG5HbiP8YA
         biig==
X-Gm-Message-State: AAQBX9ciPiIZUAODSz8UK7bhT4Edt6VU5HXeH5h/BhpHodaLz9OAOId9
	CNvMrd6cZmKjAo4YCYsIrkHs7H1XBls+oqbrIUs=
X-Google-Smtp-Source: AKy350a+OqhyY0u6SfFpB1RDlgv3NQXBtI7Qo6l9rrI2/IieB/Z1ZmeT3bogqnCVYtUjUaLi3AR/wSlQUEJ94vQTzrY=
X-Received: by 2002:aca:348a:0:b0:387:251b:71fa with SMTP id
 b132-20020aca348a000000b00387251b71famr2970993oia.4.1681147430354; Mon, 10
 Apr 2023 10:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <1681117314-24836-1-git-send-email-wangmy@fujitsu.com> <1681117314-24836-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1681117314-24836-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Apr 2023 10:23:24 -0700
Message-ID: <CAMKF1srqG=97Y0ZHL+z6h9ic43KW4SZPifEqDWyg=djiSwUF3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] squashfs-tools: upgrade 4.5.1 -> 4.6.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179898

On Mon, Apr 10, 2023 at 2:02=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> https://github.com/plougher/squashfs-tools/blob/master/CHANGES
>
> 0001-install-manpages.sh-do-not-write-original-timestamps.patch
> removed since it's included in 4.6.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ....sh-do-not-write-original-timestamps.patch | 30 -------------------
>  .../squashfs-tools/squashfs-tools_git.bb      |  5 ++--
>  2 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-insta=
ll-manpages.sh-do-not-write-original-timestamps.patch
>
> diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-install-manp=
ages.sh-do-not-write-original-timestamps.patch b/meta/recipes-devtools/squa=
shfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.=
patch
> deleted file mode 100644
> index ed1d2f5b3b..0000000000
> --- a/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh=
-do-not-write-original-timestamps.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From b44b00dae195d8587857c7e8054e9be4eaa1f8b3 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Thu, 7 Apr 2022 09:26:09 +0200
> -Subject: [PATCH] install-manpages.sh: do not write original timestamps i=
nto
> - .gz metadata
> -
> -This helps binary reproducibility.
> -
> -Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/p=
ull/177]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - generate-manpages/install-manpages.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/generate-manpages/install-manpages.sh b/generate-manpages/i=
nstall-manpages.sh
> -index d4c9e91..6a43b89 100755
> ---- a/generate-manpages/install-manpages.sh
> -+++ b/generate-manpages/install-manpages.sh
> -@@ -56,7 +56,7 @@ for i in mksquashfs unsquashfs sqfstar sqfscat; do
> -               exit 1
> -       fi
> -
> --      if ! gzip -f9 $2/$i.1; then
> -+      if ! gzip -n -f9 $2/$i.1; then
> -               echo "$0: Compressing installed manpage failed.  Aborting=
" >&2
> -               exit 1
> -       fi
> ---
> -2.30.2
> -
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index 4e009d2625..51963fe696 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb

rename the recipe to squashfs-tools_4.6.0.bb


> @@ -7,10 +7,9 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -PV =3D "4.5.1"
> -SRCREV =3D "afdd63fc386919b4aa40d573b0a6069414d14317"
> +PV =3D "4.6.0"

remove this.

> +SRCREV =3D "8c7c87ea85546dd51651ce0ce898a4a2a54311d0"
>  SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dmaster \
> -           file://0001-install-manpages.sh-do-not-write-original-timesta=
mps.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179859): https://lists.openembedded.org/g/openembedde=
d-core/message/179859
> Mute This Topic: https://lists.openembedded.org/mt/98171996/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

