Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web08.1438.1628296275880372635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 17:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dlcPuU7+;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id p145so18165518ybg.6
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 17:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WA+7iiaYcq66bfbcGLETtmCfOwBj/+gW61cx5CvIuts=;
        b=dlcPuU7+eGqA1uomCntkN16sQqELbJMCrrxpHvu85eRX3WwRPA/zLtBWZUuD4i/GKH
         CtQr1FIscB2FcB5rDz3axUJ4M7JwzB1e+SuN5RPaJ+gbnmSpNdeNz2yRY5xnmaG9C/HE
         uBetJ2Dv+x37DIaqskEF/m+SLlY91h2IvmExDo7VLbUB8U0G5WywG9zCArDTg7iow6f4
         NW6C2CcvJ2EFP8i+ithjxA+GAtCuKOsSFi+hzjvhFE3MgxtvZXIm1BFRi+ANYV1hCa8u
         T3TmSnd1OW00A6MY0jFOdUAj6lnF28tOaIinLiDv/x4vnVzi6tM8pZyregV5EFbKX78p
         SRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WA+7iiaYcq66bfbcGLETtmCfOwBj/+gW61cx5CvIuts=;
        b=ehHcWs3BLyohVYm+kI3t1YMZnkaqMhS9DlPm/Lf64fZvssotghHW9STvJ3+ONZ7P4S
         DMEw07kdOmQdMG1WwhpKDT5nJVQixS4SKVYWjW7QK/q5zpK5pp3DOgwxLHsBbqZohuO2
         VO26ydhC4tGRvmF/qcsfPEuoC2x+H5pUPFbrf0djLXc/oVYz3CD2ExRVV46IBpmc2Sv9
         c+b3H3X0RpATGxb+H4t7EAo51ftba+Ct70ERtIiUj6MZwbiGvS4iSu2R7e4Qo4mWB15e
         pPENp/Gvtz2n8BetmOqJcdLbNG0eW2Ag2Lku9YD6qFl4ZHT45S45x8avZt9iz2jKjjNs
         859w==
X-Gm-Message-State: AOAM5310LZknxbP/bsCu6SgwuWw3T3vcrBgBYTpAwK+o+IjTwFOfrZt5
	9Ucmg/iEld3YavL8QguOmw4aWzk+nMxLvHENPT0=
X-Google-Smtp-Source: ABdhPJxaz98TdnSKd2iJ7tE0iIl5LRkD7NEgf4gwp2HDSdVowPKr6lbY6eIVLRysOUsJWFO4NCgXe6W5UYl3jnbcDo4=
X-Received: by 2002:a25:dc4c:: with SMTP id y73mr15624955ybe.168.1628296275061;
 Fri, 06 Aug 2021 17:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210805055400.12437-1-ranjitsinh.rathod@kpit.com>
In-Reply-To: <20210805055400.12437-1-ranjitsinh.rathod@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 6 Aug 2021 14:31:02 -1000
Message-ID: <CAGDS+n=pF5-tqmzbsYL89XBa=jU=igNmh4QuhFNX0dytjdydbg@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH v2] systemd: Add fix for CVE-2020-13529 and CVE-2021-33910
To: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 4, 2021 at 7:54 PM Ranjitsinh Rathod
<ranjitsinh.rathod@kpit.com> wrote:
>
> Added fix for below CVEs from below Link
> http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_237-3ubuntu1=
0.50.debian.tar.xz
>
> 1. CVE-2020-13529
> Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e9=
80a6a5a3442c2f48b1f827284388096d8ca5]
>
> 2. CVE-2021-33910
> Upstream-Status: Backport [https://github.com/systemd/systemd/pull/20256/=
commits/441e0115646d54f080e5c3bb0ba477c892861ab9]

This patch is throwing warnings on the autobuilder:

WARNING: systemd-1_244.5-r0 do_patch: Fuzz detected:

Applying patch CVE-2020-13529.patch
patching file src/libsystemd-network/sd-dhcp-client.c
Hunk #1 succeeded at 1392 with fuzz 1 (offset 87 lines).

The context lines in the patches can be updated with devtool:

    devtool modify systemd
    devtool finish --force-patch-refresh systemd <layer_path>

Could you fix this and send a V3 so that we have clean builds on the
autobuilder?

Steve

> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  .../systemd/systemd/CVE-2020-13529.patch      | 42 ++++++++++++
>  .../systemd/systemd/CVE-2021-33910.patch      | 67 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_244.5.bb    |  2 +
>  3 files changed, 111 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.patc=
h
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.patc=
h
>
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch b/met=
a/recipes-core/systemd/systemd/CVE-2020-13529.patch
> new file mode 100644
> index 0000000000..4c013e2532
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
> @@ -0,0 +1,42 @@
> +From 38e980a6a5a3442c2f48b1f827284388096d8ca5 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Thu, 24 Jun 2021 01:22:07 +0900
> +Subject: [PATCH] sd-dhcp-client: tentatively ignore FORCERENEW command
> +
> +This makes DHCP client ignore FORCERENEW requests, as unauthenticated
> +FORCERENEW requests causes a security issue (TALOS-2020-1142, CVE-2020-1=
3529).
> +
> +Let's re-enable this after RFC3118 (Authentication for DHCP Messages)
> +and/or RFC6704 (Forcerenew Nonce Authentication) are implemented.
> +
> +Fixes #16774.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e=
980a6a5a3442c2f48b1f827284388096d8ca5]
> +CVE: CVE-2020-13529
> +
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +---
> + src/libsystemd-network/sd-dhcp-client.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +--- a/src/libsystemd-network/sd-dhcp-client.c
> ++++ b/src/libsystemd-network/sd-dhcp-client.c
> +@@ -1305,9 +1305,17 @@ static int client_handle_forcerenew(sd_d
> +         if (r !=3D DHCP_FORCERENEW)
> +                 return -ENOMSG;
> +
> ++#if 0
> +         log_dhcp_client(client, "FORCERENEW");
> +
> +         return 0;
> ++#else
> ++        /* FIXME: Ignore FORCERENEW requests until we implement RFC3118=
 (Authentication for DHCP
> ++         * Messages) and/or RFC6704 (Forcerenew Nonce Authentication), =
as unauthenticated FORCERENEW
> ++         * requests causes a security issue (TALOS-2020-1142, CVE-2020-=
13529). */
> ++        log_dhcp_client(client, "Received FORCERENEW, ignoring.");
> ++        return -ENOMSG;
> ++#endif
> + }
> +
> + static int client_handle_ack(sd_dhcp_client *client, DHCPMessage *ack, =
size_t len) {
> +
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch b/met=
a/recipes-core/systemd/systemd/CVE-2021-33910.patch
> new file mode 100644
> index 0000000000..be042165a0
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
> @@ -0,0 +1,67 @@
> +Backport of:
> +
> +From 441e0115646d54f080e5c3bb0ba477c892861ab9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
> +Date: Wed, 23 Jun 2021 11:46:41 +0200
> +Subject: [PATCH 1/2] basic/unit-name: do not use strdupa() on a path
> +
> +The path may have unbounded length, for example through a fuse mount.
> +
> +CVE-2021-33910: attacked controlled alloca() leads to crash in systemd a=
nd
> +ultimately a kernel panic. Systemd parses the content of /proc/self/moun=
tinfo
> +and each mountpoint is passed to mount_setup_unit(), which calls
> +unit_name_path_escape() underneath. A local attacker who is able to moun=
t a
> +filesystem with a very long path can crash systemd and the whole system.
> +
> +https://bugzilla.redhat.com/show_bug.cgi?id=3D1970887
> +
> +The resulting string length is bounded by UNIT_NAME_MAX, which is 256. B=
ut we
> +can't easily check the length after simplification before doing the
> +simplification, which in turns uses a copy of the string we can write to=
.
> +So we can't reject paths that are too long before doing the duplication.
> +Hence the most obvious solution is to switch back to strdup(), as before
> +7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/20256=
/commits/441e0115646d54f080e5c3bb0ba477c892861ab9]
> +CVE: CVE-2021-33910
> +
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +---
> + src/basic/unit-name.c | 13 +++++--------
> + 1 file changed, 5 insertions(+), 8 deletions(-)
> +
> +--- a/src/basic/unit-name.c
> ++++ b/src/basic/unit-name.c
> +@@ -370,12 +370,13 @@ int unit_name_unescape(const char *f, ch
> + }
> +
> + int unit_name_path_escape(const char *f, char **ret) {
> +-        char *p, *s;
> ++        _cleanup_free_ char *p =3D NULL;
> ++        char *s;
> +
> +         assert(f);
> +         assert(ret);
> +
> +-        p =3D strdupa(f);
> ++        p =3D strdup(f);
> +         if (!p)
> +                 return -ENOMEM;
> +
> +@@ -387,13 +388,9 @@ int unit_name_path_escape(const char *f,
> +                 if (!path_is_normalized(p))
> +                         return -EINVAL;
> +
> +-                /* Truncate trailing slashes */
> ++                /* Truncate trailing slashes and skip leading slashes *=
/
> +                 delete_trailing_chars(p, "/");
> +-
> +-                /* Truncate leading slashes */
> +-                p =3D skip_leading_chars(p, "/");
> +-
> +-                s =3D unit_name_escape(p);
> ++                s =3D unit_name_escape(skip_leading_chars(p, "/"));
> +         }
> +         if (!s)
> +                 return -ENOMEM;
> +
> diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-co=
re/systemd/systemd_244.5.bb
> index 8c95648ca0..7a7eddcd45 100644
> --- a/meta/recipes-core/systemd/systemd_244.5.bb
> +++ b/meta/recipes-core/systemd/systemd_244.5.bb
> @@ -20,6 +20,8 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://99-default.preset \
>             file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
> +           file://CVE-2021-33910.patch \
> +           file://CVE-2020-13529.patch \
>             "
>
>  # patches needed by musl
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
>=20
>
