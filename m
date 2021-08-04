Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.11613.1628095038050720519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fCX8w9af;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so1623187wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MQGrfOOYMiATYf2f8J14uK8krNVm3PrHiInu1U779is=;
        b=fCX8w9afvU65R+0EJEBUU3GUrTLHETP1iKBclDv1TUJy0voPTUZW1XzA8PnSIRIVEu
         695y//YoGaALJvdhN6NxatFr8seGwYU5511SJYSixH7RThqiLs7zxlzciLH34mdQG+Ch
         udo/Jjdnf7wPh+hNUNjZlDr9NKFDkYZO5EGjWJb1Kz1xwYYDET9tWD8XbrHO8ZFeFa6A
         NSQ9qnObzkic/SOZHOZCcV+eWztLXFEFf0N3BhGpAnvpgmvewzsXS12zRAwcJSc7QAnM
         KXVUMw+8/Z2Y8OWGaIpU6pZzKzyL1vCt1GrjgBpq/75tQEtw6kEhQLL1M5wfthx/SMU7
         VV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MQGrfOOYMiATYf2f8J14uK8krNVm3PrHiInu1U779is=;
        b=fLSGfmcWyEGweHO//hAKxjGEtjOVtj5IFfyp53CamlGfyNBXxgyb8WmdE/fTJ6pa19
         0ad3Fu4jnJ+Qa9gKy3OXebDaShMMS5afiCjmAzfvLOx0VqF+/nBkM2SZ2brE/ITxliJK
         magFqF3NrESI7ccQpJx3SQln3K2EE6Bw4HwngzfuNtFd6CN8qK5EeCtEONUzfiIpY1pd
         zB/yG/gZBw1wbm/07HK8lBNdFRK3b9qMPKdtZHGbkCYLGtItXgom9fRhd1bU6Sy21jo3
         u18QOMbxAkYUbmR+AjdsO2WYAfUoa+P8TDr0tZgYPf4kQcXHOcLsKOTnqbJqFkqNozSI
         OPGw==
X-Gm-Message-State: AOAM533xYIRPtBRFyt9CzcLwwD1vWymliyuHlXe8aFTYs7LbSSphMxmZ
	+fxve0ruEeNVtf43BA1oCVJCkiM6zd1nhi5Z/FYsVA==
X-Google-Smtp-Source: ABdhPJzz2hQFqxjBYBKTkp4zwnbVj8T99X3dkcf588/ZPW96TxZUWsUqMgabUroghLupDQTUEVMnHHGHGawoRWWAczw=
X-Received: by 2002:a7b:c416:: with SMTP id k22mr10698711wmi.177.1628095036431;
 Wed, 04 Aug 2021 09:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210804153959.15503-1-ranjitsinh.rathod@kpit.com>
In-Reply-To: <20210804153959.15503-1-ranjitsinh.rathod@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 4 Aug 2021 06:37:04 -1000
Message-ID: <CAOSpxdbO1W-yPwHG=5mNumvdnNrsMcLbj_jOurh2UHtusRfs4Q@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] systemd: Add fix for CVE-2020-13529 and CVE-2021-33910
To: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 4, 2021 at 5:40 AM Ranjitsinh Rathod
<ranjitsinh.rathod@kpit.com> wrote:
>
> Added fix for below CVEs
> 1. CVE-2020-13529
> 2. CVE-2021-33910
> Link: http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_237-3=
ubuntu10.50.debian.tar.xz
>
> Upstream-Status: Pending

This needs to be in the patch files, along with a CVE: tag and your
signed-off-by.

See the "Patch name convention and commit message" section at:
https://wiki.yoctoproject.org/wiki/Security

Thanks for helping with CVEs!

Steve

>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  .../systemd/systemd/CVE-2020-13529.patch      | 37 +++++++++++
>  .../systemd/systemd/CVE-2021-33910.patch      | 62 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_244.5.bb    |  2 +
>  3 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.pat=
ch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.pat=
ch
>
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2020-13529.patch
> new file mode 100644
> index 0000000000..80ae2bd883
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
> @@ -0,0 +1,37 @@
> +From 38e980a6a5a3442c2f48b1f827284388096d8ca5 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Thu, 24 Jun 2021 01:22:07 +0900
> +Subject: [PATCH] sd-dhcp-client: tentatively ignore FORCERENEW command
> +
> +This makes DHCP client ignore FORCERENEW requests, as unauthenticated
> +FORCERENEW requests causes a security issue (TALOS-2020-1142, CVE-2020-=
13529).
> +
> +Let's re-enable this after RFC3118 (Authentication for DHCP Messages)
> +and/or RFC6704 (Forcerenew Nonce Authentication) are implemented.
> +
> +Fixes #16774.
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
> ++        /* FIXME: Ignore FORCERENEW requests until we implement RFC311=
8 (Authentication for DHCP
> ++         * Messages) and/or RFC6704 (Forcerenew Nonce Authentication),=
 as unauthenticated FORCERENEW
> ++         * requests causes a security issue (TALOS-2020-1142, CVE-2020=
-13529). */
> ++        log_dhcp_client(client, "Received FORCERENEW, ignoring.");
> ++        return -ENOMSG;
> ++#endif
> + }
> +
> + static int client_handle_ack(sd_dhcp_client *client, DHCPMessage *ack,=
 size_t len) {
> +
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2021-33910.patch
> new file mode 100644
> index 0000000000..9932962749
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
> @@ -0,0 +1,62 @@
> +Backport of:
> +
> +From 441e0115646d54f080e5c3bb0ba477c892861ab9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek=
@in.waw.pl>
> +Date: Wed, 23 Jun 2021 11:46:41 +0200
> +Subject: [PATCH 1/2] basic/unit-name: do not use strdupa() on a path
> +
> +The path may have unbounded length, for example through a fuse mount.
> +
> +CVE-2021-33910: attacked controlled alloca() leads to crash in systemd =
and
> +ultimately a kernel panic. Systemd parses the content of /proc/self/mou=
ntinfo
> +and each mountpoint is passed to mount_setup_unit(), which calls
> +unit_name_path_escape() underneath. A local attacker who is able to mou=
nt a
> +filesystem with a very long path can crash systemd and the whole system=
.
> +
> +https://bugzilla.redhat.com/show_bug.cgi?id=3D1970887
> +
> +The resulting string length is bounded by UNIT_NAME_MAX, which is 256. =
But we
> +can't easily check the length after simplification before doing the
> +simplification, which in turns uses a copy of the string we can write t=
o.
> +So we can't reject paths that are too long before doing the duplication=
.
> +Hence the most obvious solution is to switch back to strdup(), as befor=
e
> +7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
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
> ++                /* Truncate trailing slashes and skip leading slashes =
*/
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
> diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-c=
ore/systemd/systemd_244.5.bb
> index 8c95648ca0..7a7eddcd45 100644
> --- a/meta/recipes-core/systemd/systemd_244.5.bb
> +++ b/meta/recipes-core/systemd/systemd_244.5.bb
> @@ -20,6 +20,8 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://99-default.preset \
>             file://0001-binfmt-Don-t-install-dependency-links-at-install=
-tim.patch \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
> +           file://CVE-2021-33910.patch \
> +           file://CVE-2020-13529.patch \
>             "
>
>  # patches needed by musl
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
