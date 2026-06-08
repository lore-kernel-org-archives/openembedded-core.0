Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46893CD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 13:13:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54232.1780924432823297650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 06:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SrSjUcOl;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso49019995e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780924431; x=1781529231; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNaRGwkgLNXCdgv4CxXkClQjutwR0KvFkQfyj1KvvoA=;
        b=SrSjUcOlUapcfEpKpwsGnOxtNv7WCvn9ePJlfCpcIIfEJVJZnHTgiJbodTaDEHhi8x
         pmkUgNCHhI2x1B4sLMSSnU22ruTfcONjA6AxRPDYgJieAp4BiqCCBcJthfHnOrEssTIQ
         NjCT04ozace3eT6+o+BsCf6NrQLziTsAz87Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924431; x=1781529231;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNaRGwkgLNXCdgv4CxXkClQjutwR0KvFkQfyj1KvvoA=;
        b=Ku5orARKqTm8Wz9RL8NuOWJy7KavlIxmP0eQnKrUhKMtF/iXJsYoMAC404/KNBjsML
         nsfNvqKCs/IBWwapRkt9LGsCw6rNi5nD++dkzwlGi9C1iSdc7IlxjLTh18v2rj0McsN+
         AutzMzxNS5L7C2ieH8TMetoQl0rOPfHIjbZXBspHKgs7H1Qd/tF8+QfW9Q2CAojjBZ0W
         hcPISnImhrUa7UAqBtvGgfQd4oqg/r5cYUZ+DQNJQ9TLHd7VKRnYb1smRs9SZXHaACYA
         EU3vrMNGz8za5y89SKIlK2hGajMi1g6d9HB9de/9lEexkxLXyl309huu1M/NrnNgYfyP
         w/cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ucDKmCuMnMpvfOZyg6dPlFeF9cTazMZIJctiyG2Hs9bt0kJyRTvYrB7nuBMua1Lev30GY3C6DawAQOQKaJ8aTgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywgq4tvmMUCRQZpS075+z6DmM/Z5gOt/Xsrq1AudNTiKmMZ0e0s
	GmuaGhI8L6jaUWpPnYIR5fQHgTkT7GcjNpV18RIWUwrQZ2XJT7fxrPleyXZVQq0vHUE=
X-Gm-Gg: Acq92OGemvsTD1wy1vSLE9H57BXOrThQJCenBO7CUYnauVyg4j3FiqGysHk2yxow7ms
	Gwfc5j0Uh93hr97UZzHKsx7uPZUK0ZenFIuIboxInPEbes9vKs0vvPY2bhagHQp75yFM77CnOLm
	wTlYjdbcorPMfy3A5yaU38g6J8r3iMUgG27PYZtknHc+uKjhbEDY8mV9PKtLVptkHrkBaWupB0l
	kKSXdBFJaNcG8ksO0TjE7hMez3tvdXtTlvewi6MKl/+IwJOmQnD41rGAg1NQTbH2kmXcT4lT8jI
	FLC7zyQBIYof2kHyt3hG9r2kseAzpZCTpssWCO3eUqjwrjrPyjudq9q088IQFZZFZwNm/K2l8YH
	/tQJkWljmt3LjTljs4us2yg26HbJrJHn7pIoRoY+hlngpvTMu0CeSFj+ZApqSa3A6bHhvyAOO/s
	6xguO6yFOB6A+FpWObT9076A6TmBHP3FwtqiwGCYT055BkZjrgkf0xWOOoveG7rxn4j9EWaetJ2
	yxka/N1JfLOKBrxpa5OTw==
X-Received: by 2002:a05:600c:314b:b0:490:548e:b854 with SMTP id 5b1f17b1804b1-490c25f5e25mr250685775e9.26.1780924430841;
        Mon, 08 Jun 2026 06:13:50 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm254025845e9.1.2026.06.08.06.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:13:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 15:13:49 +0200
Message-Id: <DJ3P0S49KBSY.KUJ05BQXTDHF@smile.fr>
Subject: Re: [OE-core][master][wrynose][PATCH] ppp: upgrade 2.5.2 -> 2.5.3
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peng.zhang1.cn@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260602070344.1163210-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20260602070344.1163210-1-peng.zhang1.cn@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 13:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238234

On Tue Jun 2, 2026 at 9:03 AM CEST, Peng (Paul) (CN) via lists.openembedded=
.org Zhang wrote:
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> ChangeLog:
> https://github.com/ppp-project/ppp/releases/tag/v2.5.3
>
> Drop backported patches:
> - 0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
> - 0001-pppdump-Fixed-building-with-GCC-15-548.patch
> - 0001-pppd-session-Fixed-building-with-GCC-15.patch
>
> Add ppp-dhcpv6relay package for newly added dhcpv6relay plugin.
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---

Hello,

This upgrade has some major change:
> Default route handling has changed; pppd no longer checks for an
> existing default route before adding its default route. The defaultroute
> and defaultroute6 options are now privileged, and if used, the default
> route will always be added. The metric of the default route can be
> controlled with new defaultroute-metric and defaultroute6-metric
> options, which are privileged. The replacedefaultroute and
> noreplacedefaultroute options are no longer functional, and just cause
> an error message to be printed.

And, thus, is not acceptable on a stable branch.
See: https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_P=
atch_Acceptance_Policies

Regards,

>  ....h-remove-erroneous-generated-header.patch | 98 -------------------
>  ...d-session-Fixed-building-with-GCC-15.patch | 33 -------
>  ...pdump-Fixed-building-with-GCC-15-548.patch | 75 --------------
>  .../ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb}        |  9 +-
>  4 files changed, 4 insertions(+), 211 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.=
h-remove-erroneous-generated-header.patch
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-F=
ixed-building-with-GCC-15.patch
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-=
building-with-GCC-15-548.patch
>  rename meta/recipes-connectivity/ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb} (9=
1%)
>
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remov=
e-erroneous-generated-header.patch b/meta/recipes-connectivity/ppp/ppp/0001=
-pppd-pppdconf.h-remove-erroneous-generated-header.patch
> deleted file mode 100644
> index a00706c184..0000000000
> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erron=
eous-generated-header.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -From a6eb65162db5bcc5ec26cff7361885c0a44cbbfa Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 17 Mar 2025 11:12:07 +0100
> -Subject: [PATCH] pppd/pppdconf.h: remove erroneous generated header
> -
> -Upstream-Status: Inappropriate [tarball generation issue tracked at http=
s://github.com/ppp-project/ppp/issues/541]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - pppd/pppdconf.h | 80 -------------------------------------------------
> - 1 file changed, 80 deletions(-)
> - delete mode 100644 pppd/pppdconf.h
> -
> -diff --git a/pppd/pppdconf.h b/pppd/pppdconf.h
> -deleted file mode 100644
> -index 51a8f02..0000000
> ---- a/pppd/pppdconf.h
> -+++ /dev/null
> -@@ -1,80 +0,0 @@
> --/* pppd/pppdconf.h.  Generated from pppdconf.h.in by configure.  */
> --/*=20
> -- * Copyright (c) 2022 Eivind N=C3=A6ss. All rights reserved.
> -- *
> -- * Redistribution and use in source and binary forms, with or without
> -- * modification, are permitted provided that the following conditions
> -- * are met:
> -- *
> -- * 1. Redistributions of source code must retain the above copyright
> -- *    notice, this list of conditions and the following disclaimer.
> -- *
> -- * 2. Redistributions in binary form must reproduce the above copyright
> -- *    notice, this list of conditions and the following disclaimer in
> -- *    the documentation and/or other materials provided with the
> -- *    distribution.
> -- *
> -- * 3. The name(s) of the authors of this software must not be used to
> -- *    endorse or promote products derived from this software without
> -- *    prior written permission.
> -- *
> -- * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
> -- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> -- * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
> -- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> -- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
> -- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
> -- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE=
.
> -- */
> --
> --/*
> -- * This file is generated by configure and sets the features enabled
> -- *   in pppd when configured.
> -- */
> --
> --#ifndef PPP_PPPDCONF_H
> --#define PPP_PPPDCONF_H
> --
> --/* Have Microsoft CHAP support */
> --#define PPP_WITH_CHAPMS 1
> --
> --/* Have Microsoft LAN Manager support */
> --/* #undef PPP_WITH_MSLANMAN */
> --
> --/* Have Microsoft MPPE support */
> --#define PPP_WITH_MPPE 1
> --
> --/* Have multilink support */
> --#define PPP_WITH_MULTILINK 1
> --
> --/* Have packet activity filter support */
> --#define PPP_WITH_FILTER 1
> --
> --/* Have support for loadable plugins */
> --#define PPP_WITH_PLUGINS 1
> --
> --/* Have Callback Protocol support */
> --/* #undef PPP_WITH_CBCP */
> --
> --/* Include TDB support */
> --#define PPP_WITH_TDB 1
> --
> --/* Have IPv6 Control Protocol */
> --#define PPP_WITH_IPV6CP 1
> --
> --/* Support for Pluggable Authentication Modules */
> --/* #undef PPP_WITH_PAM */
> --
> --/* Have EAP-SRP authentication support */
> --/* #undef PPP_WITH_SRP */
> --
> --/* Have EAP-TLS authentication support */
> --#define PPP_WITH_EAPTLS 1
> --
> --/* Have PEAP authentication support */
> --#define PPP_WITH_PEAP 1
> --
> --/* The pppd version */
> --#define PPPD_VERSION "2.5.2"
> --
> --#endif
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-bu=
ilding-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-sess=
ion-Fixed-building-with-GCC-15.patch
> deleted file mode 100644
> index d95c72e96b..0000000000
> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-=
with-GCC-15.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 17 Mar 2025 14:38:26 -0700
> -Subject: [PATCH] pppd/session: Fixed building with GCC 15
> -
> -Fixed building with GCC 15 which defaults to C23
> -and find conflicting declration of getspnam() here
> -with the one provided by shadow.h (extern struct spwd *getspnam (const c=
har *__name);)
> -
> -Fixes
> -../../ppp-2.5.2/pppd/session.c: In function 'session_start':
> -../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'get=
spnam'; have 'struct spwd *(void)'
> -  185 |     struct spwd *getspnam();
> -      |                  ^~~~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pppd/session.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/pppd/session.c b/pppd/session.c
> -index f08d8e1..9cc7538 100644
> ---- a/pppd/session.c
> -+++ b/pppd/session.c
> -@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, con=
st char *passwd, const char
> -     char *cbuf;
> - #ifdef HAVE_SHADOW_H
> -     struct spwd *spwd;
> --    struct spwd *getspnam();
> -     long now =3D 0;
> - #endif /* #ifdef HAVE_SHADOW_H */
> - #endif /* #ifdef PPP_WITH_PAM */
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-buildin=
g-with-GCC-15-548.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fi=
xed-building-with-GCC-15-548.patch
> deleted file mode 100644
> index 2a3b3cc84a..0000000000
> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-=
GCC-15-548.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 44a766a3d086f10cb584a0c423e5bed6af2e3615 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Jaroslav=3D20=3DC5=3DA0karvada?=3D <jskarvad@redhat.co=
m>
> -Date: Thu, 27 Feb 2025 23:00:16 +0100
> -Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -GCC 15 defaults to C23 which does not allow K&R declarations.
> -
> -Credit Yaakov Selkowitz in:
> -https://src.fedoraproject.org/rpms/ppp/pull-request/12
> -
> -Upstream-Status: Backport [https://github.com/ppp-project/ppp/pull/548]
> -
> -Signed-off-by: Jaroslav =C5=A0karvada <jskarvad@redhat.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pppdump/pppdump.c | 20 +++++++-------------
> - 1 file changed, 7 insertions(+), 13 deletions(-)
> -
> -diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
> -index c24208a..1534036 100644
> ---- a/pppdump/pppdump.c
> -+++ b/pppdump/pppdump.c
> -@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
> - extern int optind;
> - extern char *optarg;
> -=20
> --void dumplog();
> --void dumpppp();
> --void show_time();
> -+void dumplog(FILE *);
> -+void dumpppp(FILE *);
> -+void show_time(FILE *, int);
> -=20
> - int
> --main(ac, av)
> --    int ac;
> --    char **av;
> -+main(int ac, char **av)
> - {
> -     int i;
> -     char *p;
> -@@ -97,8 +95,7 @@ main(ac, av)
> - }
> -=20
> - void
> --dumplog(f)
> --    FILE *f;
> -+dumplog(FILE *f)
> - {
> -     int c, n, k, col;
> -     int nb, c2;
> -@@ -241,8 +238,7 @@ struct pkt {
> - unsigned char dbuf[8192];
> -=20
> - void
> --dumpppp(f)
> --    FILE *f;
> -+dumpppp(FILE *f)
> - {
> -     int c, n, k;
> -     int nb, nl, dn, proto, rv;
> -@@ -375,9 +371,7 @@ dumpppp(f)
> - }
> -=20
> - void
> --show_time(f, c)
> --    FILE *f;
> --    int c;
> -+show_time(FILE *f, int c)
> - {
> -     time_t t;
> -     int n;
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.5.3.bb
> similarity index 91%
> rename from meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> rename to meta/recipes-connectivity/ppp/ppp_2.5.3.bb
> index 607678db8b..435559a815 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
> @@ -23,12 +23,9 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${B=
P}.tar.gz \
>             file://ppp_on_boot \
>             file://provider \
>             file://ppp@.service \
> -           file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
> -           file://0001-pppd-pppdconf.h-remove-erroneous-generated-header=
.patch \
> -           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e=
8f701b8e55733cb2"
> +SRC_URI[sha256sum] =3D "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c55091=
58e99e148f572d4f"
> =20
>  inherit autotools pkgconfig systemd
> =20
> @@ -60,7 +57,7 @@ do_install:append () {
>  }
> =20
>  CONFFILES:${PN} =3D "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/cha=
p-secrets ${sysconfdir}/ppp/options"
> -PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-mincon=
n ${PN}-password ${PN}-l2tp ${PN}-tools"
> +PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-mincon=
n ${PN}-password ${PN}-l2tp ${PN}-tools ${PN}-dhcpv6relay"
>  FILES:${PN}        =3D "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindi=
r}/pppd ${systemd_system_unitdir}/ppp@.service"
>  FILES:${PN}-oa       =3D "${libdir}/pppd/${PV}/pppoatm.so"
>  FILES:${PN}-oe       =3D "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV=
}/*pppoe.so"
> @@ -70,6 +67,7 @@ FILES:${PN}-minconn  =3D "${libdir}/pppd/${PV}/minconn.=
so"
>  FILES:${PN}-password =3D "${libdir}/pppd/${PV}/pass*.so"
>  FILES:${PN}-l2tp     =3D "${libdir}/pppd/${PV}/*l2tp.so"
>  FILES:${PN}-tools    =3D "${sbindir}/pppstats ${sbindir}/pppdump"
> +FILES:${PN}-dhcpv6relay =3D "${libdir}/pppd/${PV}/dhcpv6relay.so"
>  SUMMARY:${PN}-oa       =3D "Plugin for PPP for PPP-over-ATM support"
>  SUMMARY:${PN}-oe       =3D "Plugin for PPP for PPP-over-Ethernet support=
"
>  SUMMARY:${PN}-radius   =3D "Plugin for PPP for RADIUS support"
> @@ -78,4 +76,5 @@ SUMMARY:${PN}-minconn  =3D "Plugin for PPP to set a del=
ay before the idle timeout
>  SUMMARY:${PN}-password =3D "Plugin for PPP to get passwords via a pipe"
>  SUMMARY:${PN}-l2tp     =3D "Plugin for PPP for l2tp support"
>  SUMMARY:${PN}-tools    =3D "Additional tools for the PPP package"
> +SUMMARY:${PN}-dhcpv6relay =3D "Plugin for PPP for DHCPv6 relay agent sup=
port"
> =20


--=20
Yoann Congal
Smile ECS


