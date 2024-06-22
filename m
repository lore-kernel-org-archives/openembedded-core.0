Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A69BC27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 14:33:38 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.98539.1719066814245039465
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 07:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OjmAapDp;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-24542b8607fso1478237fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719066813; x=1719671613; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWJiKlXaN3Q0SQ1UCAYpss5mJk/v9ea/+sgcklz5iIU=;
        b=OjmAapDpJaKcuRCiHm/nedNu7U79bnv9lzik79jBOr1ViNQhpNu8S0+zIBBYK+Y4/7
         DQ1DT67rkbWBoFHYebi6e1/ECaIqhxUzW0izypHFzB/+yaQxHqn4zt71K0Ty3+UAYWuF
         +IngkVT+v4GwNuizxPcOCp3MlGMdUXB8WyaR1KOywUHy+HD8wpbp0vIrbI7y4jhgdBZP
         HJO8fKl2ZvWrgKcW9HOhpZUkYuqNnZlkWX5FMAd54Zv0dGhQ2MlrpBI2UmasDOryk8ue
         Qu3pvFGjBpF2a7pXYSyDAbzJBnskE7fVOALuRhiJb4qDzsZZtrxCUd2ViXz1/IesjsuR
         hlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719066813; x=1719671613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWJiKlXaN3Q0SQ1UCAYpss5mJk/v9ea/+sgcklz5iIU=;
        b=X/G99GeKUIbqJiGvRse+MyzHa0VzYHFtzFSgM7awaEfhLCIqkPg/Ew6kJI9XfEz+jl
         2pTV6quAFDNYUTPrZbQubwlRifJ+gQwdTW0F/4/1yQX62RMbQmPlMPi0pg4aNl5DYwNY
         OxpwA41XTDhie6oB8Xdda0N6tTaidbqkgk4u8sFBIydPeV6ps48SfbIEsyvOwn+Jdgeb
         MF6Hiq+0X9STRzh8o0hCbAcNhTsJmayBXv/CQJMAGPTWJyeryGDBciQdQj5Hq1Er+9k+
         VmHaBKmsWLGRdggLfsAip1uOCaFlxpmV4NM8yUQnDbjIqkDGN2SWSZGFZNx9Ur4+xY9H
         dskw==
X-Gm-Message-State: AOJu0Yw/xgoqdCbMwTDqWE689jD2zOmGychUMov72DYxrb5E7v1cOc/n
	k7RXER+XGwv6K1ddvx4yTBY1vHi/oIu+obiabEG8mFTm6zwWAgzyvy0hhk41+X01gLQv9dF9nH+
	wxIdLPHn7XHhVW2ptG0rNCk2sZYg=
X-Google-Smtp-Source: AGHT+IGbyqIxkBm5M3cUFPiH9E5OhoxWUEiO/pG50jwf+23Dd+RKfnhRkZj5WXijo0T2G1L1dn/eKOxrSDNwoPDIdyw=
X-Received: by 2002:a05:6870:955c:b0:254:ae17:c30b with SMTP id
 586e51a60fabf-25d06e366cbmr109947fac.36.1719066813078; Sat, 22 Jun 2024
 07:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085957.2787700-1-alex.kanavin@gmail.com> <20240619085957.2787700-11-alex.kanavin@gmail.com>
In-Reply-To: <20240619085957.2787700-11-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jun 2024 07:33:06 -0700
Message-ID: <CAMKF1spAE1aDRspPZcLbCy_Po7USfwHR4U=zdRaRoR+T9CrYiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/15] tcp-wrappers: mark all patches as inactive-upstream
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 14:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201049

This caught my eye, I think we should plan on removing this recipe,
several other distros have moved to alternatives like firewalld etc.
Looking into its uses in OE-core and meta-openembedded, most of places
it is mentioned via packageconfig which means we can easily turn it
off, one place where its being used as direct runtime dependency is
rshd in inetutils and rshd is disabled in build, I think if there are
other uses of libwrap we should look to disable them.

On Wed, Jun 19, 2024 at 2:00=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../tcp-wrappers-7.6/0001-Fix-build-with-clang.patch            | 2 +-
>  .../0001-Fix-implicit-function-declaration-warnings.patch       | 2 +-
>  .../tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff           | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch      | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch    | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch    | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch           | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch       | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch            | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch      | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch        | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch         | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch        | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch      | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch            | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch           | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch           | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/ldflags.patch                 | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch   | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch            | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch              | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch        | 2 +-
>  meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch             | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch                 | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch              | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch               | 2 +-
>  .../tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch      | 2 +-
>  30 files changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix=
-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7=
.6/0001-Fix-build-with-clang.patch
> index 9d1e05d7f4e..9ca227d68d1 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-=
with-clang.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-=
with-clang.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] Fix build with clang
>  Fix "error: non-void function 'fix_options' should return a value".
>  Add function prototype to tcpd.c and miscd.c.
>
> -Upstream-Status: Pending
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>  ---
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix=
-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-w=
rappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.pa=
tch
> index 474703885d9..85031779261 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implic=
it-function-declaration-warnings.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implic=
it-function-declaration-warnings.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] Fix implicit-function-declaration warnin=
gs
>
>  These are seen with clang-15+
>
> -Upstream-Status: Inappropriate [upstream is dead]
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   hosts_access.c | 3 +++
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Rem=
ove-fgets-extern-declaration.patch b/meta/recipes-extended/tcp-wrappers/tcp=
-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
> index 88c8d9cae7f..f485fe3fb6d 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fge=
ts-extern-declaration.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fge=
ts-extern-declaration.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] Remove fgets() extern declaration
>  These sources already include <stdio.h> which should bring the correct
>  declaration
>
> -Upstream-Status: Pending
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   hosts_access.c | 1 -
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_q=
uoting.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_qu=
oting.diff
> index 16d6719cbc1..c5ba3af3067 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.=
diff
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.=
diff
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_ac=
cess.5
>  --- tcp_wrappers_7.6.orig/hosts_access.5       1995-01-30 19:51:47.00000=
0000 +0100
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_p=
ortability.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_m=
an_portability.patch
> index 9a735bff6d1..fea8ab9d7af 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portabil=
ity.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portabil=
ity.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruNp tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_a=
ccess.3
>  --- tcp_wrappers_7.6.orig/hosts_access.3       2005-03-09 18:30:25.00000=
0000 +0100
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildc=
ard_matching.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05=
_wildcard_matching.patch
> index 9e188027fc0..525cd3531ba 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_mat=
ching.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_mat=
ching.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  See https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D17847
>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_g=
ethostbyname.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06=
_fix_gethostbyname.patch
> index 725f4b59578..1f3f9e24acd 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostb=
yname.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostb=
yname.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  * Mon Feb  5 2001 Preston Brown <pbrown@redhat.com>
>  - fix gethostbyname to work better with dot "." notation (#16949)
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi=
-ipv6.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-=
ipv6.patch
> index 96d47c39f40..ea45777734d 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.p=
atch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.p=
atch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_optio=
ns.c
>  --- tcp_wrappers_7.6.orig/fix_options.c        1997-04-08 02:29:19.00000=
0000 +0200
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_=
blacklist.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tc=
pd_blacklist.patch
> index 226106f4ff8..77d5b423421 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blackli=
st.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blackli=
st.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  Path: news.porcupine.org!news.porcupine.org!not-for-mail
>  From: Wietse Venema <wietse@((no)(spam)(please))wzv.win.tue.nl>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi=
_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_f=
ix.patch
> index 260e8d31387..09a1e0527e3 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.pa=
tch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.pa=
tch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -uN tcp_wrappers_7.6/hosts_access.c tcp_wrappers_7.6.new/hosts_acce=
ss.c
>  --- tcp_wrappers_7.6/hosts_access.c    Mon May 20 14:00:56 2002
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makef=
ile_config.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_m=
akefile_config.patch
> index d473fb63429..895a72e6b4b 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_con=
fig.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_con=
fig.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  Index: tcp_wrappers_7.6/Makefile
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib=
_weaksym.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shl=
ib_weaksym.patch
> index bd1396bc795..9503fb3c881 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksy=
m.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksy=
m.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
>  --- tcp_wrappers_7.6.orig/Makefile     2004-05-02 15:37:59.000000000 +02=
00
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_=
support.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr=
_support.patch
> index eb5685c5761..b6681df8ce4 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support=
.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support=
.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_ac=
cess.5
>  --- tcp_wrappers_7.6.orig/hosts_access.5       2003-08-21 03:15:36.00000=
0000 +0200
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match=
_clarify.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_mat=
ch_clarify.patch
> index 3ca6874119e..0c8594cac3a 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarif=
y.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarif=
y.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_ac=
cess.5
>  --- tcp_wrappers_7.6.orig/hosts_access.5       2004-04-25 12:17:59.00000=
0000 +0200
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_r=
emote_port.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expa=
nd_remote_port.patch
> index 30873779760..0c54ba6d35b 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_p=
ort.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_p=
ort.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/eval.c tcp_wrappers_7.6/eval.c
>  --- tcp_wrappers_7.6.orig/eval.c       1995-01-30 19:51:46.000000000 +01=
00
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warn=
ings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnin=
gs.patch
> index 965544cc0bd..0fd2ca7b2b5 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.pa=
tch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.pa=
tch
> @@ -1,7 +1,7 @@
>  Compile warning fixes from Debian
>
>  Signed-off-by: Adrian Bunk <bunk@stusta.de>
> -Upstream-Status: Inappropriate [upstream is dead]
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  --- a/options.c
>  +++ b/options.c
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warn=
ings2.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warni=
ngs2.patch
> index 27157a2e6dc..d9a6909db70 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.p=
atch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.p=
atch
> @@ -1,7 +1,7 @@
>  Compile warning fixes from Debian
>
>  Signed-off-by: Adrian Bunk <bunk@stusta.de>
> -Upstream-Status: Inappropriate [upstream is dead]
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  --- a/clean_exit.c
>  +++ b/clean_exit.c
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_str=
error.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_stre=
rror.patch
> index 4cc554fc380..9b1a3c0fa1a 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.p=
atch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.p=
atch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/percent_m.c tcp_wrappers_7.6/percent_m.c
>  --- tcp_wrappers_7.6.orig/percent_m.c  1994-12-28 17:42:37.000000000 +01=
00
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.=
patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
> index 3ba214d241b..79b677f456c 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  Index: tcp_wrappers_7.6.orig/Makefile
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile=
-fix-parallel.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/m=
akefile-fix-parallel.patch
> index 797352579b6..23762449ac4 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-pa=
rallel.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-pa=
rallel.patch
> @@ -12,7 +12,7 @@ problem.
>  Also fixed:
>  Fatal error: can't create shared/hosts_access.o: No such file or directo=
ry
>
> -Upstream-Status: Pending
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_from=
host.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromho=
st.patch
> index 19bd7d3c0fa..30e74a1de11 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.pa=
tch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.pa=
tch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_ac=
cess.3
>  --- tcp_wrappers_7.6.orig/hosts_access.3       2004-04-25 00:10:48.00000=
0000 +0200
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-dec=
ls.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.p=
atch
> index eee640e8a82..b998675aa0b 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patc=
h
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patc=
h
> @@ -1,7 +1,7 @@
>  __BEGIN_DECLS/__END_DECLS are BSD specific and not defined in musl
>  glibc and uclibc had sys/cdefs.h doing it.
>
> -Upstream-Status: Pending
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  Index: tcp_wrappers_7.6/tcpd.h
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_s=
trings_variable.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6=
/rename_strings_variable.patch
> index 7650600ab53..f42b9d2799a 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_=
variable.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_=
variable.patch
> @@ -1,6 +1,6 @@
>  STRINGS name conflicts with variable for strings tools (e.g. i586-oe-lin=
ux-strings)
>
> -Upstream-Status: Pending
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_=
sigalarm.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restor=
e_sigalarm.patch
> index 5875b81b2fc..a864e381298 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalar=
m.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalar=
m.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
>  --- tcp_wrappers_7.6.orig/rfc931.c     2004-08-29 18:40:08.000000000 +02=
00
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.d=
iff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
> index 723f4f136a8..2d0f548f89f 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruNp tcp_wrappers_7.6.orig/scaffold.c tcp_wrappers_7.6/scaffold.c
>  --- tcp_wrappers_7.6.orig/scaffold.c   2005-03-09 18:22:04.000000000 +01=
00
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_fin=
ger.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger=
.patch
> index fc2afeef15d..b6543fc92e5 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.pat=
ch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.pat=
ch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  --- tcp-wrappers-7.6-ipv6.1.orig/safe_finger.c
>  +++ tcp-wrappers-7.6-ipv6.1/safe_finger.c
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.=
patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
> index 9d7ea042b26..843063fd7cf 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  * Mon Feb 10 2003 Harald Hoyer <harald@redhat.de> 7.6-29
>  - added security patch tcp_wrappers-7.6-sig.patch
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongj=
mp.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.p=
atch
> index 76dd6340b21..d4a1146594c 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patc=
h
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patc=
h
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruNp tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
>  --- tcp_wrappers_7.6.orig/rfc931.c     2004-08-29 18:42:25.000000000 +02=
00
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_=
t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.pat=
ch
> index cf4f993c1aa..fb64f93f1d1 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
> @@ -7,7 +7,7 @@ Date:   Tue Feb 12 09:53:50 2013 -0500
>      Added support for socklen_t type to len argument passed to socket re=
lated
>      calls. This fixes a bug that causes tcp wrappers to fail when using =
sshd.
>
> -Upstream-Status: Pending
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>  Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
>
>  diff --git a/fix_options.c b/fix_options.c
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_=
libwrapped.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpd=
chk_libwrapped.patch
> index be29bdcfaa8..2e3b1719fd3 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrap=
ped.patch
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrap=
ped.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Backport
> +Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs=
 anywhere]
>
>  diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
>  --- tcp_wrappers_7.6.orig/tcpdchk.c    2003-08-21 02:50:37.000000000 +02=
00
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200897): https://lists.openembedded.org/g/openembedde=
d-core/message/200897
> Mute This Topic: https://lists.openembedded.org/mt/106757096/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

