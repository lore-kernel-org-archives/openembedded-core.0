Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D78DC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:12:01 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.51430.1681146720063333542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okkx5GCF;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1842cddca49so6855440fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681146719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEWwLEdpOys0XYzHLRTkMn1z20wScTDaSlkyGjJuoY0=;
        b=okkx5GCFDsNvqz/gEfIjElgYSmMYGOhSD0CwcTjWoZJS5rRf0B+J/PvYq6JAye477K
         Lex34bbN0lpodzPv/+fDqI+/XIQfl7x9DbQzuXQXqO+PIGGz7hbqdpoBpRoMG2DuJVkD
         qZHLSHv5LxYoQ+pC0mOWXGLB6pC7HKQyxXbiSkBba3e1rMqgjAvsZjo5Gr6e0RHho674
         5bnbni9y3xsKeZgxouwaXvVaiLaCX72OtCEBZ915sFDnbY239benhFmYYGbuBesTahu9
         gwnjNNiQ7SnNNKEz4Z2GFdp07uTFPUKLv/9ohR3lBCYoTrmn/8omPOzhG00TuhSfv2CR
         6q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681146719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEWwLEdpOys0XYzHLRTkMn1z20wScTDaSlkyGjJuoY0=;
        b=DczVmvtu466tLlwD8HkdQpZK3X4PwHUfbBandbxPdq9RrxOoFSqE8wT6XfrKtwPy0S
         hk5vL5wCAohU4xYJS1hyzML2QUjPO6+7aJOIJ29jSIooSd6c+onNC2HnBEEXSpLS6Dw3
         L9xDjn2x+vLAczDbhZDLJf6wu218/2sWIbi6lEkby6GyZ1umvbh7pnCIcci3+m2mM6cv
         C8xfgIh9XH+eQcIoewKYQKakudcCelQjBFU/AYCuOAoW60Frh4nQ72DawMjMBqyD2SbQ
         1tyzEeKkMvFZ+qN5XSpBuZyH/ZrM8lf5jziV2TWk2BGKjlagRvko3I9N1TU/dt15ZZ/T
         26SQ==
X-Gm-Message-State: AAQBX9d9UqfaWMA5kO1wSj/AtDUCc1fWgawmWUEnH52nobIqjCYdOSge
	C+xDEVexITR5ENfkJ2J4/7lDHYdzUvRDcwy6xl8P7oouKsg=
X-Google-Smtp-Source: AKy350aWyLp1uD5Uz5ZKumAUgw5OzXSyOG149mNoaR5P+BhDXPxR63CXbMxDEzH6rQfVc/Ba+oiYserhgeegMQhUbhc=
X-Received: by 2002:a05:6870:1217:b0:17e:a9eb:196b with SMTP id
 23-20020a056870121700b0017ea9eb196bmr4017260oan.4.1681146719088; Mon, 10 Apr
 2023 10:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com> <1681117459-24898-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1681117459-24898-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Apr 2023 10:11:33 -0700
Message-ID: <CAMKF1srcb8FzzHeG1PcJ-iTLw10n4srcJ6pe1etO1gb8uj4VMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: upgrade 253.1 -> 253.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179896

This also upgrades systemd and not only systemd-boot, Secondly also
check a musl build with systemd when doing upgrades to ensure
the musl patches can still apply cleanly, otherwise it leaves some
cleanup for others, See [1]

[1] https://lists.openembedded.org/g/openembedded-core/message/179895

On Mon, Apr 10, 2023 at 2:04=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> https://github.com/systemd/systemd-stable/blob/v253.3/NEWS
>
> 0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
> removed since it's included in 253.3
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...md-boot_253.1.bb =3D> systemd-boot_253.3.bb} |  0
>  meta/recipes-core/systemd/systemd.inc         |  3 +-
>  ...citly-cast-the-constants-to-uint64_t.patch | 44 -------------------
>  3 files changed, 1 insertion(+), 46 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_253.1.bb =3D> systemd-boo=
t_253.3.bb} (100%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0025-systemctl-expl=
icitly-cast-the-constants-to-uint64_t.patch
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_253.1.bb b/meta/recip=
es-core/systemd/systemd-boot_253.3.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_253.1.bb
> rename to meta/recipes-core/systemd/systemd-boot_253.3.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index 14608f9abc..d50f2c9cba 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,11 +14,10 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
>
> -SRCREV =3D "6c327d74aa0d350482e82a247d7018559699798d"
> +SRCREV =3D "ed18c2ab79e8b94182d5dcf31d58457763f3e3e1"
>  SRCBRANCH =3D "v253-stable"
>  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
>             file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__W=
CHA.patch \
> -           file://0025-systemctl-explicitly-cast-the-constants-to-uint64=
_t.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-=
cast-the-constants-to-uint64_t.patch b/meta/recipes-core/systemd/systemd/00=
25-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
> deleted file mode 100644
> index d840de870f..0000000000
> --- a/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-th=
e-constants-to-uint64_t.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From fad29ce1f5cc7b12bc13671d9ad80775771a67eb Mon Sep 17 00:00:00 2001
> -From: Frantisek Sumsal <frantisek@sumsal.cz>
> -Date: Fri, 3 Mar 2023 12:17:27 +0100
> -Subject: [PATCH] systemctl: explicitly cast the constants to uint64_t
> -
> -Otherwise under certain conditions `va_arg()` might get garbage instead
> -of the expected value, i.e.:
> -
> -$ sudo build-o0/systemctl disable asdfasfaf
> -sd_bus_message_appendv: Got uint64_t: 0
> -Failed to disable unit: Unit file asdfasfaf.service does not exist.
> -
> -$ sudo build-o1/systemctl disable asdfasfaf
> -sd_bus_message_appendv: Got uint64_t: 7954875719681572864
> -Failed to disable unit: Invalid argument
> -
> -(reproduced on an armv7hl machine)
> -
> -Resolves: #26568
> -Follow-up to: bf1bea43f15
> -Related issue: https://github.com/systemd/systemd/pull/14470#discussion_=
r362893735
> -
> -Upstream-Status: Backport [https://github.com/systemd/systemd/commit/c63=
bfd0884cf20e48befbee49d41f667660a8802]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/systemctl/systemctl-enable.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/systemctl/systemctl-enable.c b/src/systemctl/systemctl-=
enable.c
> -index 86d9f602fa..f94a286122 100644
> ---- a/src/systemctl/systemctl-enable.c
> -+++ b/src/systemctl/systemctl-enable.c
> -@@ -211,7 +211,7 @@ int verb_enable(int argc, char *argv[], void *userda=
ta) {
> -
> -                 if (send_runtime) {
> -                         if (streq(method, "DisableUnitFilesWithFlagsAnd=
InstallInfo"))
> --                                r =3D sd_bus_message_append(m, "t", arg=
_runtime ? UNIT_FILE_RUNTIME : 0);
> -+                                r =3D sd_bus_message_append(m, "t", arg=
_runtime ? (uint64_t) UNIT_FILE_RUNTIME : UINT64_C(0));
> -                         else
> -                                 r =3D sd_bus_message_append(m, "b", arg=
_runtime);
> -                         if (r < 0)
> ---
> -2.39.2
> -
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179866): https://lists.openembedded.org/g/openembedde=
d-core/message/179866
> Mute This Topic: https://lists.openembedded.org/mt/98172014/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

