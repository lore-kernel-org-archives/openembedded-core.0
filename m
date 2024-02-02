Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D566EC48286
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:12:44 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.11701.1706832762277954940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewzE+Mau;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6e4a55a71so757453276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 16:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706832761; x=1707437561; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MxdjPc9/hqSUmfvxm8UhlNschD9j2rztfEXdoJcUIDo=;
        b=ewzE+MauCgY2njfe+NvC507+1//q8wif2Z/uIbaau/HYNPC2ETvgQ+qJ4p18AmEWar
         Wo8yK8z+WqVXRvg98mXP2/6A1smShBl1MN8XQwXV8zIlhS0461h+Tc8DCaIMA1s52pTa
         hAOdIlcFeQ5fjXbPgYe+xRVtYhHNhRp3uiRJiFxRlbRC6qGPV+jF9+KdEBaPZZy+SH3y
         0Yk0q0p6118GOQzghIzWjfe2vLXQX6qyhKMMIle8M6K16R3oL8ZKA4jgzak/ggFUqlDR
         T+rcNKlJ5XHWSHBDe9Be6QDHZ/R0By1n4aNsuIwrx3ypfenOcET2wou2qhIkIgfqwy55
         Rz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706832761; x=1707437561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxdjPc9/hqSUmfvxm8UhlNschD9j2rztfEXdoJcUIDo=;
        b=LlulioPuAhIsYxwZfF2JdKBuVKiWU9hhHgeqdSKrUNajcKdXVraYFI+uZMLOGHUeEJ
         bfsCPhmvdgYiLKdMfP2gso8kPDWJ3bsn9HkB+Ld878RDbta3CcPuiKg7B5ViQWxGpnOw
         CgjpkWOo3q85GGvcNWii7RYvPRbLlv5X7hyO4wHFAQt6tpL4YJEvckyFSDkrXkaKyu4a
         i2sODHfc0dj1oEBaRmKx3LTZzgFc9WVSodg3lNw5rjJKDKu+dMBkoNPCbyCv+GSrK7kq
         9QCkPyFcJMI2CGPi/Etn2MyyFPXaEK8Yg92jt66T9ZbcQ27Mz7ef4wG4QFEdEULJyxJo
         lmIw==
X-Gm-Message-State: AOJu0YzQcP0s6lO6IkJhRJeTTzvi/0IpQaIkLl3Eu/ToSbuSHl61xcFk
	WCUylVUWRmhvroRskXOWqDZCeVBQoxlqbFEsnzvxMzSxFMRUnm/SXIODftd4P8lK8qswY6MX4+F
	ul5Sgr7rVCeNZAzEszwX8VB1AhlHRItnX
X-Google-Smtp-Source: AGHT+IEDYK48IC/t51anF59OGPZ66ThM06nVKilpAMfJ6s43r7MskmwrdUSaIm732PMin1lqCI0AzBbOzZ0CjD9J8DM=
X-Received: by 2002:a25:e0d4:0:b0:dc6:2e29:4256 with SMTP id
 x203-20020a25e0d4000000b00dc62e294256mr3373407ybg.60.1706832760314; Thu, 01
 Feb 2024 16:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20240201185023.32642-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240201185023.32642-1-simone.p.weiss@posteo.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 1 Feb 2024 16:12:29 -0800
Message-ID: <CANx9H-AjruGrbAutiRytmtryKjsW1wQPB4HStPgL=2711k2ojw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005ea36306105af849"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194766

--0000000000005ea36306105af849
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are several CVEs closed with this upgrade, see my earlier patch:

https://lore.kernel.org/openembedded-core/20240105165554.1401517-1-tim.orli=
ng@konsulko.com/


On Thu, Feb 1, 2024 at 10:50=E2=80=AFAM Simone Wei=C3=9F <simone.p.weiss@po=
steo.com>
wrote:

> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> - Checked the pacth from AUH
> - Added upstream status for patches again
> - performed basic sanity test with ptest image
>
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  ...h-log-input-and-output-files-on-erro.patch |  8 +--
>  ...tional-support-for-systemd-sd_notify.patch | 18 +++---
>  .../add-test-support-for-busybox.patch        | 57 +++++++++++--------
>  ...igned-overflow-in-pointer-arithmatic.patch |  6 +-
>  .../{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}    |  2 +-
>  5 files changed, 47 insertions(+), 44 deletions(-)
>  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D>
> openssh_9.6p1.bb} (99%)
>
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> index 2c14014fed..b572eaccfb 100644
> ---
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> @@ -1,4 +1,4 @@
> -From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
> +From 8032d3093fbe1f815ebdd6e66f841469069a1d5d Mon Sep 17 00:00:00 2001
>  From: Mikko Rapeli <mikko.rapeli@linaro.org>
>  Date: Mon, 11 Sep 2023 09:55:21 +0100
>  Subject: [PATCH] regress/banner.sh: log input and output files on error
> @@ -35,6 +35,7 @@ return value: 1
>  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
>
>  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +
>  ---
>   regress/banner.sh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> @@ -42,7 +43,7 @@ Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>  Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
>
>  diff --git a/regress/banner.sh b/regress/banner.sh
> -index a84feb5a..de84957a 100644
> +index a84feb5..de84957 100644
>  --- a/regress/banner.sh
>  +++ b/regress/banner.sh
>  @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
> @@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644
>   done
>
>   trace "test suppress banner (-q)"
> ---
> -2.34.1
> -
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> index acda8f1ce9..7e318b83a3 100644
> ---
> a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> +++
> b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> @@ -1,4 +1,4 @@
> -From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
> +From 563e9b910984ec8ad5bddb88c02e24411d98e80e Mon Sep 17 00:00:00 2001
>  From: Matt Jolly <Matt.Jolly@footclan.ninja>
>  Date: Thu, 2 Feb 2023 21:05:40 +1100
>  Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
> @@ -9,16 +9,17 @@ patch based on Jakub Jelen's <jjelen@redhat.com>
> original patch
>  Upstream-Status: Submitted [
> https://github.com/openssh/openssh-portable/pull/375/commits/be187435911c=
de6cc3cef6982a508261074f1e56
> ]
>
>  Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +
>  ---
>   configure.ac | 24 ++++++++++++++++++++++++
>   sshd.c       | 13 +++++++++++++
>   2 files changed, 37 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 22fee70f..486c189f 100644
> +index 379cd74..a7d0e92 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
> +@@ -4842,6 +4842,29 @@ AC_SUBST([GSSLIBS])
>   AC_SUBST([K5LIBS])
>   AC_SUBST([CHANNELLIBS])
>
> @@ -48,7 +49,7 @@ index 22fee70f..486c189f 100644
>   # Looking for programs, paths and files
>
>   PRIVSEP_PATH=3D/var/empty
> -@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MS=
G"
> +@@ -5650,6 +5673,7 @@ echo "                   libldns support: $LDNS_MS=
G"
>   echo "  Solaris process contract support: $SPC_MSG"
>   echo "           Solaris project support: $SP_MSG"
>   echo "         Solaris privilege support: $SPP_MSG"
> @@ -57,7 +58,7 @@ index 22fee70f..486c189f 100644
>   echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
>   echo "                  BSD Auth support: $BSD_AUTH_MSG"
>  diff --git a/sshd.c b/sshd.c
> -index 6321936c..859d6a0b 100644
> +index 9cbe922..4b342c5 100644
>  --- a/sshd.c
>  +++ b/sshd.c
>  @@ -88,6 +88,10 @@
> @@ -71,7 +72,7 @@ index 6321936c..859d6a0b 100644
>   #include "xmalloc.h"
>   #include "ssh.h"
>   #include "ssh2.h"
> -@@ -310,6 +314,10 @@ static void
> +@@ -308,6 +312,10 @@ static void
>   sighup_restart(void)
>   {
>         logit("Received SIGHUP; restarting.");
> @@ -82,7 +83,7 @@ index 6321936c..859d6a0b 100644
>         if (options.pid_file !=3D NULL)
>                 unlink(options.pid_file);
>         platform_pre_restart();
> -@@ -2086,6 +2094,11 @@ main(int ac, char **av)
> +@@ -2093,6 +2101,11 @@ main(int ac, char **av)
>                         }
>                 }
>
> @@ -94,6 +95,3 @@ index 6321936c..859d6a0b 100644
>                 /* Accept a connection and return in a forked child */
>                 server_accept_loop(&sock_in, &sock_out,
>                     &newsock, config_s);
> ---
> -2.25.1
> -
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.=
patch
> b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.=
patch
> index b8402a4dee..61b98c3d72 100644
> ---
> a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.=
patch
> +++
> b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.=
patch
> @@ -1,4 +1,7 @@
> -Adjust test cases to work with busybox.
> +From 7979cbf4b422445c801726283b08abaed8c44b70 Mon Sep 17 00:00:00 2001
> +From: "Maxin B. John" <maxin.john@enea.com>
> +Date: Thu, 24 Apr 2014 18:00:22 +0200
> +Subject: [PATCH] Adjust test cases to work with busybox.
>
>  - Replace dd parameter "obs" with "bs".
>  - Replace "head -<num>" with "head -n <num>".
> @@ -6,11 +9,17 @@ Adjust test cases to work with busybox.
>  Signed-off-by: Maxin B. John <maxin.john@enea.com>
>  Upstream-Status: Pending
>
> -Index: openssh-7.6p1/regress/cipher-speed.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssh-7.6p1.orig/regress/cipher-speed.sh
> -+++ openssh-7.6p1/regress/cipher-speed.sh
> -@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for
> +---
> + regress/cipher-speed.sh | 2 +-
> + regress/key-options.sh  | 2 +-
> + regress/transfer.sh     | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/regress/cipher-speed.sh b/regress/cipher-speed.sh
> +index 1340bd1..8770757 100644
> +--- a/regress/cipher-speed.sh
> ++++ b/regress/cipher-speed.sh
> +@@ -27,7 +27,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for m in `${SSH=
}
> -Q mac`; do
>                 printf "%-60s" "$c/$m:"
>                 ( ${SSH} -o 'compression no' \
>                         -F $OBJ/ssh_proxy -m $m -c $c somehost \
> @@ -19,24 +28,11 @@ Index: openssh-7.6p1/regress/cipher-speed.sh
>                 < ${DATA} ) 2>&1 | getbytes
>
>                 if [ $? -ne 0 ]; then
> -Index: openssh-7.6p1/regress/transfer.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssh-7.6p1.orig/regress/transfer.sh
> -+++ openssh-7.6p1/regress/transfer.sh
> -@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}          || fail "corrupted
> - for s in 10 100 1k 32k 64k 128k 256k; do
> -       trace "dd-size ${s}"
> -       rm -f ${COPY}
> --      dd if=3D$DATA obs=3D${s} 2> /dev/null | \
> -+      dd if=3D$DATA bs=3D${s} 2> /dev/null | \
> -               ${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
> -       if [ $? -ne 0 ]; then
> -               fail "ssh cat $DATA failed"
> -Index: openssh-7.6p1/regress/key-options.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssh-7.6p1.orig/regress/key-options.sh
> -+++ openssh-7.6p1/regress/key-options.sh
> -@@ -47,7 +47,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
> +diff --git a/regress/key-options.sh b/regress/key-options.sh
> +index 2f3d66e..7f8166d 100644
> +--- a/regress/key-options.sh
> ++++ b/regress/key-options.sh
> +@@ -90,7 +90,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
>         fi
>
>         sed 's/.*/from=3D"'"$f"'" &/' $origkeys >$authkeys
> @@ -45,3 +41,16 @@ Index: openssh-7.6p1/regress/key-options.sh
>         verbose "key option $from"
>         r=3D`${SSH} -q -F $OBJ/ssh_proxy somehost 'echo true'`
>         if [ "$r" =3D "true" ]; then
> +diff --git a/regress/transfer.sh b/regress/transfer.sh
> +index cf174a0..41cfdc7 100644
> +--- a/regress/transfer.sh
> ++++ b/regress/transfer.sh
> +@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}          || fail "corrupted copy"
> + for s in 10 100 1k 32k 64k 128k 256k; do
> +       trace "dd-size ${s}"
> +       rm -f ${COPY}
> +-      dd if=3D$DATA obs=3D${s} 2> /dev/null | \
> ++      dd if=3D$DATA bs=3D${s} 2> /dev/null | \
> +               ${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
> +       if [ $? -ne 0 ]; then
> +               fail "ssh cat $DATA failed"
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow=
-in-pointer-arithmatic.patch
> b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow=
-in-pointer-arithmatic.patch
> index 20036da931..2e18bba758 100644
> ---
> a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow=
-in-pointer-arithmatic.patch
> +++
> b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow=
-in-pointer-arithmatic.patch
> @@ -1,4 +1,4 @@
> -From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
> +From 12242caa163b212ba18fded3b51aefede2856af9 Mon Sep 17 00:00:00 2001
>  From: Yuanjie Huang <yuanjie.huang@windriver.com>
>  Date: Wed, 24 Aug 2016 03:15:43 +0000
>  Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
> @@ -14,6 +14,7 @@ Signed-off-by: Yuanjie Huang <
> yuanjie.huang@windriver.com>
>
>  Complete the fix
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
>   openbsd-compat/strlcat.c | 10 +++++++---
>   openbsd-compat/strlcpy.c |  8 ++++++--
> @@ -106,6 +107,3 @@ index 7ad3573..7040f1f 100644
>  +      return (size_t)((uintptr_t)cp - (uintptr_t)str);
>   }
>   #endif
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> index 0312d5bd66..6366cefdf9 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -28,7 +28,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>
> file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
>
> file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
> +SRC_URI[sha256sum] =3D
> "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
>
>  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specif=
ic
> to OpenSSH with the pam opie which we don't build/use here."
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194733):
> https://lists.openembedded.org/g/openembedded-core/message/194733
> Mute This Topic: https://lists.openembedded.org/mt/104104097/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005ea36306105af849
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There are several CVEs closed with this upgrade, see my e=
arlier patch:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a hr=
ef=3D"https://lore.kernel.org/openembedded-core/20240105165554.1401517-1-ti=
m.orling@konsulko.com/">https://lore.kernel.org/openembedded-core/202401051=
65554.1401517-1-tim.orling@konsulko.com/</a></div><br></div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 1, 2=
024 at 10:50=E2=80=AFAM Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.wei=
ss@posteo.com">simone.p.weiss@posteo.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)">From: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo.c=
om" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
<br>
- Checked the pacth from AUH<br>
- Added upstream status for patches again<br>
- performed basic sanity test with ptest image<br>
<br>
Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo=
.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
---<br>
=C2=A0...h-log-input-and-output-files-on-erro.patch |=C2=A0 8 +--<br>
=C2=A0...tional-support-for-systemd-sd_notify.patch | 18 +++---<br>
=C2=A0.../add-test-support-for-busybox.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5=
7 +++++++++++--------<br>
=C2=A0...igned-overflow-in-pointer-arithmatic.patch |=C2=A0 6 +-<br>
=C2=A0.../{<a href=3D"http://openssh_9.5p1.bb" rel=3D"noreferrer" target=3D=
"_blank">openssh_9.5p1.bb</a> =3D&gt; <a href=3D"http://openssh_9.6p1.bb" r=
el=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A05 files changed, 47 insertions(+), 44 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/openssh/{<a href=3D"http://openssh_9=
.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a> =3D&gt; =
<a href=3D"http://openssh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssh_9.6p1.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.=
sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/ope=
nssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patc=
h<br>
index 2c14014fed..b572eaccfb 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch<br>
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch<br>
@@ -1,4 +1,4 @@<br>
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001<br>
+From 8032d3093fbe1f815ebdd6e66f841469069a1d5d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" tar=
get=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
=C2=A0Date: Mon, 11 Sep 2023 09:55:21 +0100<br>
=C2=A0Subject: [PATCH] regress/banner.sh: log input and output files on err=
or<br>
@@ -35,6 +35,7 @@ return value: 1<br>
=C2=A0See: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1=
5178" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D15178</a><br>
<br>
=C2=A0Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro=
.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 regress/banner.sh | 4 +++-<br>
=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
@@ -42,7 +43,7 @@ Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.r=
apeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
=C2=A0Upstream-Status: Denied [<a href=3D"https://github.com/openssh/openss=
h-portable/pull/437" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssh/openssh-portable/pull/437</a>]<br>
<br>
=C2=A0diff --git a/regress/banner.sh b/regress/banner.sh<br>
-index a84feb5a..de84957a 100644<br>
+index a84feb5..de84957 100644<br>
=C2=A0--- a/regress/banner.sh<br>
=C2=A0+++ b/regress/banner.sh<br>
=C2=A0@@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do<br>
@@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644<br>
=C2=A0 done<br>
<br>
=C2=A0 trace &quot;test suppress banner (-q)&quot;<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-opt=
ional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/opens=
sh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch<br=
>
index acda8f1ce9..7e318b83a3 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-s=
upport-for-systemd-sd_notify.patch<br>
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-s=
upport-for-systemd-sd_notify.patch<br>
@@ -1,4 +1,4 @@<br>
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001<br>
+From 563e9b910984ec8ad5bddb88c02e24411d98e80e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Matt Jolly &lt;Matt.Jolly@footclan.ninja&gt;<br>
=C2=A0Date: Thu, 2 Feb 2023 21:05:40 +1100<br>
=C2=A0Subject: [PATCH] systemd: Add optional support for systemd `sd_notify=
`<br>
@@ -9,16 +9,17 @@ patch based on Jakub Jelen&#39;s &lt;<a href=3D"mailto:jj=
elen@redhat.com" target=3D"_blank">jjelen@redhat.com</a>&gt; original patch=
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/openssh/ope=
nssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/openssh/openssh-porta=
ble/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56</a>]<br>
<br>
=C2=A0Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windri=
ver.com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 24 ++++++++++++++++++++++++<br>
=C2=A0 sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
=C2=A0 2 files changed, 37 insertions(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 22fee70f..486c189f 100644<br>
+index 379cd74..a7d0e92 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])<br>
+@@ -4842,6 +4842,29 @@ AC_SUBST([GSSLIBS])<br>
=C2=A0 AC_SUBST([K5LIBS])<br>
=C2=A0 AC_SUBST([CHANNELLIBS])<br>
<br>
@@ -48,7 +49,7 @@ index 22fee70f..486c189f 100644<br>
=C2=A0 # Looking for programs, paths and files<br>
<br>
=C2=A0 PRIVSEP_PATH=3D/var/empty<br>
-@@ -5634,6 +5657,7 @@ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0libldns support: $LDNS_MSG&quot;<br>
+@@ -5650,6 +5673,7 @@ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0libldns support: $LDNS_MSG&quot;<br>
=C2=A0 echo &quot;=C2=A0 Solaris process contract support: $SPC_MSG&quot;<b=
r>
=C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris project =
support: $SP_MSG&quot;<br>
=C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris privilege suppo=
rt: $SPP_MSG&quot;<br>
@@ -57,7 +58,7 @@ index 22fee70f..486c189f 100644<br>
=C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Translate v4 in =
v6 hack: $IPV4_IN6_HACK_MSG&quot;<br>
=C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BSD Auth support: $BSD_AUTH_MSG&quot;<br>
=C2=A0diff --git a/sshd.c b/sshd.c<br>
-index 6321936c..859d6a0b 100644<br>
+index 9cbe922..4b342c5 100644<br>
=C2=A0--- a/sshd.c<br>
=C2=A0+++ b/sshd.c<br>
=C2=A0@@ -88,6 +88,10 @@<br>
@@ -71,7 +72,7 @@ index 6321936c..859d6a0b 100644<br>
=C2=A0 #include &quot;xmalloc.h&quot;<br>
=C2=A0 #include &quot;ssh.h&quot;<br>
=C2=A0 #include &quot;ssh2.h&quot;<br>
-@@ -310,6 +314,10 @@ static void<br>
+@@ -308,6 +312,10 @@ static void<br>
=C2=A0 sighup_restart(void)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 logit(&quot;Received SIGHUP; restarting.&quot;)=
;<br>
@@ -82,7 +83,7 @@ index 6321936c..859d6a0b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (options.pid_file !=3D NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(options.pid_=
file);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_pre_restart();<br>
-@@ -2086,6 +2094,11 @@ main(int ac, char **av)<br>
+@@ -2093,6 +2101,11 @@ main(int ac, char **av)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -94,6 +95,3 @@ index 6321936c..859d6a0b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Accept a connect=
ion and return in a forked child */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_accept_loop(=
&amp;sock_in, &amp;sock_out,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;=
newsock, config_s);<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for=
-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support=
-for-busybox.patch<br>
index b8402a4dee..61b98c3d72 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybo=
x.patch<br>
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybo=
x.patch<br>
@@ -1,4 +1,7 @@<br>
-Adjust test cases to work with busybox.<br>
+From 7979cbf4b422445c801726283b08abaed8c44b70 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Maxin B. John&quot; &lt;<a href=3D"mailto:maxin.john@enea.com"=
 target=3D"_blank">maxin.john@enea.com</a>&gt;<br>
+Date: Thu, 24 Apr 2014 18:00:22 +0200<br>
+Subject: [PATCH] Adjust test cases to work with busybox.<br>
<br>
=C2=A0- Replace dd parameter &quot;obs&quot; with &quot;bs&quot;.<br>
=C2=A0- Replace &quot;head -&lt;num&gt;&quot; with &quot;head -n &lt;num&gt=
;&quot;.<br>
@@ -6,11 +9,17 @@ Adjust test cases to work with busybox.<br>
=C2=A0Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@enea.co=
m" target=3D"_blank">maxin.john@enea.com</a>&gt;<br>
=C2=A0Upstream-Status: Pending<br>
<br>
-Index: openssh-7.6p1/regress/cipher-speed.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssh-7.6p1.orig/regress/cipher-speed.sh<br>
-+++ openssh-7.6p1/regress/cipher-speed.sh<br>
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for<br>
+---<br>
+ regress/cipher-speed.sh | 2 +-<br>
+ regress/key-options.sh=C2=A0 | 2 +-<br>
+ regress/transfer.sh=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ 3 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/regress/cipher-speed.sh b/regress/cipher-speed.sh<br>
+index 1340bd1..8770757 100644<br>
+--- a/regress/cipher-speed.sh<br>
++++ b/regress/cipher-speed.sh<br>
+@@ -27,7 +27,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for m in `${SSH} =
-Q mac`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;%-60s&=
quot; &quot;$c/$m:&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( ${SSH} -o &#39;co=
mpression no&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -F $OBJ/ssh_proxy -m $m -c $c somehost \<br>
@@ -19,24 +28,11 @@ Index: openssh-7.6p1/regress/cipher-speed.sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; ${DATA} ) 2&gt=
;&amp;1 | getbytes<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; th=
en<br>
-Index: openssh-7.6p1/regress/transfer.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssh-7.6p1.orig/regress/transfer.sh<br>
-+++ openssh-7.6p1/regress/transfer.sh<br>
-@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||=
 fail &quot;corrupted<br>
- for s in 10 100 1k 32k 64k 128k 256k; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace &quot;dd-size ${s}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${COPY}<br>
--=C2=A0 =C2=A0 =C2=A0 dd if=3D$DATA obs=3D${s} 2&gt; /dev/null | \<br>
-+=C2=A0 =C2=A0 =C2=A0 dd if=3D$DATA bs=3D${s} 2&gt; /dev/null | \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${SSH} -q -F $OBJ/s=
sh_proxy somehost &quot;cat &gt; ${COPY}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail &quot;ssh cat =
$DATA failed&quot;<br>
-Index: openssh-7.6p1/regress/key-options.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssh-7.6p1.orig/regress/key-options.sh<br>
-+++ openssh-7.6p1/regress/key-options.sh<br>
-@@ -47,7 +47,7 @@ for f in 127.0.0.1 &#39;127.0.0.0\/8&#39;; do<br>
+diff --git a/regress/key-options.sh b/regress/key-options.sh<br>
+index 2f3d66e..7f8166d 100644<br>
+--- a/regress/key-options.sh<br>
++++ b/regress/key-options.sh<br>
+@@ -90,7 +90,7 @@ for f in 127.0.0.1 &#39;127.0.0.0\/8&#39;; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &#39;s/.*/from=3D&quot;&#39;&quot;$f&quot;&=
#39;&quot; &amp;/&#39; $origkeys &gt;$authkeys<br>
@@ -45,3 +41,16 @@ Index: openssh-7.6p1/regress/key-options.sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 verbose &quot;key option $from&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r=3D`${SSH} -q -F $OBJ/ssh_proxy somehost &#39;=
echo true&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$r&quot; =3D &quot;true&quot; ]; the=
n<br>
+diff --git a/regress/transfer.sh b/regress/transfer.sh<br>
+index cf174a0..41cfdc7 100644<br>
+--- a/regress/transfer.sh<br>
++++ b/regress/transfer.sh<br>
+@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||=
 fail &quot;corrupted copy&quot;<br>
+ for s in 10 100 1k 32k 64k 128k 256k; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0trace &quot;dd-size ${s}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${COPY}<br>
+-=C2=A0 =C2=A0 =C2=A0 dd if=3D$DATA obs=3D${s} 2&gt; /dev/null | \<br>
++=C2=A0 =C2=A0 =C2=A0 dd if=3D$DATA bs=3D${s} 2&gt; /dev/null | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${SSH} -q -F $OBJ/s=
sh_proxy somehost &quot;cat &gt; ${COPY}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail &quot;ssh cat =
$DATA failed&quot;<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed=
-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/o=
penssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch<br>
index 20036da931..2e18bba758 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overfl=
ow-in-pointer-arithmatic.patch<br>
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overfl=
ow-in-pointer-arithmatic.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001<br>
+From 12242caa163b212ba18fded3b51aefede2856af9 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.com=
" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 24 Aug 2016 03:15:43 +0000<br>
=C2=A0Subject: [PATCH] Fix potential signed overflow in pointer arithmatic<=
br>
@@ -14,6 +14,7 @@ Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanji=
e.huang@windriver.com" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt=
;<br>
<br>
=C2=A0Complete the fix<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 openbsd-compat/strlcat.c | 10 +++++++---<br>
=C2=A0 openbsd-compat/strlcpy.c |=C2=A0 8 ++++++--<br>
@@ -106,6 +107,3 @@ index 7ad3573..7040f1f 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 return (size_t)((uintptr_t)cp - (uintptr_t)str)=
;<br>
=C2=A0 }<br>
=C2=A0 #endif<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb" rel=3D"noref=
errer" target=3D"_blank">openssh_9.6p1.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.5=
p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a><br>
rename to meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1=
.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
index 0312d5bd66..6366cefdf9 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.5p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
@@ -28,7 +28,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/pub/O=
penBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" target=3D=
"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.=
tar</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-banner.sh-log=
-input-and-output-files-on-erro.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-systemd-Add-optional-=
support-for-systemd-sd_notify.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f026e7b79ba7fb540f75182af96dc8a8f1db395f922bb=
c9f6ca603672686086b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;910211c07255a8c5ad654391b40ee59800710dd8119dd=
5362de09385aa7a777c&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2007-2768] =3D &quot;not-applicable-config: This CVE i=
s specific to OpenSSH with the pam opie which we don&#39;t build/use here.&=
quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194733): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194733" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194733</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104104097/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104104097/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005ea36306105af849--

