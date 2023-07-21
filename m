Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C80C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 17:22:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.12847.1689960152203433793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 10:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ONhxtzc6;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-98de21518fbso343977066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689960150; x=1690564950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1fOWyUw1xZBP4/9OUOBtujmdK8uhT3sKr3cX4T06gvM=;
        b=ONhxtzc6erGgQIeCIjD+q1jZJG6tBU/ac7gDamp7kkt49OUmZ4hM5ARSdj75uryr9b
         6UtajWqMPXTsqUPMu9qW42PIMyqyRJ62HNT2WCyRPbgwk/iQFgdkBVKCRKFfm/HlzmRt
         JF5bNV9k1r0UdRanGtZdl/O5v4Dc7rXe2V1vu7U+Ke4CrU0RnbIOIIdmbqp34RPPXJnV
         wREuM66U8o7wq1dZ0724vFkGIXr/L3qBcsIRuhwRegUbwfEYJEpBWeHhB1XTvjgy2S0x
         9OaZpSO+4BAQmNW8e1sF/ByJy7MvVdy8jiRfd4IkRkfj8WoTY1j4dzpA6wuq/xsYju5L
         vRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689960150; x=1690564950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fOWyUw1xZBP4/9OUOBtujmdK8uhT3sKr3cX4T06gvM=;
        b=QoQpIv6nCffiIAOFqRoXaBUdwp04Twze49OLw5ETQR2Wtgk1rFjYyd7lT7z3E3MsQV
         2EXMBYMngRXCqx6gn5ju1tMiNsCXLsaaCYwmP2CixHGFJ1vF7LDcoApDRWL7gqO76zcz
         EwU0/ja6cX4mahCE7Epo8VECcHODhkg8xA7Qq+kgjc7YvZ6BxmkPGHCobcAUjOzIs6kc
         vP0PbVNoBg03/p7qr/i0WG5JrO9Q12T5QucUxrGha8RPt+1NGi9LGJyG20IwnUtaJyxh
         Uk+/8df4yMVkZBUZadsC3Lnpuu1Wv7siOqH6uShuodfV6EDp8JPJF9AIDHsmSEPI3x/W
         2R6Q==
X-Gm-Message-State: ABy/qLadFlAFrZqgJ//OBHvPWinkmmR6iEqGKxqj2ShuKL3n0SV7pRag
	TP17IMYepCwpMkHS06JonmZrKUDlcec4f405hC6Y/2SSqBAG+CwtywI=
X-Google-Smtp-Source: APBJJlFYEqaqlBXvQI1sxWPMmFQrZhTrzTNL8teog2XFPY17HRr9hfxhr3rL3+VxdFP+AZnfgwQ5IDXyD9eMCfGz3jI=
X-Received: by 2002:a17:906:24e:b0:982:ab8d:1e08 with SMTP id
 14-20020a170906024e00b00982ab8d1e08mr2203304ejl.59.1689960150236; Fri, 21 Jul
 2023 10:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230721065004.3400285-1-yogita.urade@windriver.com>
In-Reply-To: <20230721065004.3400285-1-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 21 Jul 2023 07:22:19 -1000
Message-ID: <CAOSpxdbhAz+9W-vhDvz=sY5QY3NtN+_QZhBwy0mAD7fVhEiyZw@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] bind: fix CVE-2023-2911
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070a80a06010282b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 17:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184708

--00000000000070a80a06010282b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is already a fix for this CVE in kirkstone:

https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3D0=
8810d3fe6988ea821805eca16105b4632335654

Steve

On Thu, Jul 20, 2023 at 8:50=E2=80=AFPM Urade, Yogita via lists.openembedde=
d.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:

> If the `recursive-clients` quota is reached on a BIND 9 resolver
> configured with both `stale-answer-enable yes;` and
> `stale-answer-client-timeout 0;`, a sequence of serve-stale-related
> lookups could cause `named` to loop and terminate unexpectedly due
> to a stack overflow.
> This issue affects BIND 9 versions 9.16.33 through 9.16.41, 9.18.7
> through 9.18.15, 9.16.33-S1 through 9.16.41-S1, and 9.18.11-S1
> through 9.18.15-S1.
>
> References:
> https://kb.isc.org/docs/cve-2023-2911
>
> https://downloads.isc.org/isc/bind9/9.18.16/doc/arm/html/notes.html#notes=
-for-bind-9-18-16
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../bind/bind-9.18.11/CVE-2023-2911.patch     | 109 ++++++++++++++++++
>  .../recipes-connectivity/bind/bind_9.18.11.bb |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
>
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
> b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
> new file mode 100644
> index 0000000000..729d13ee18
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
> @@ -0,0 +1,109 @@
> +From 2d6982985021ee354469a0fc380008d6c6fa8ae2 Mon Sep 17 00:00:00 2001
> +From: Michal Nowak <mnowak@isc.org>
> +Date: Thu, 20 Jul 2023 08:07:32 +0000
> +Subject: [PATCH] Merge branch
> '4089-confidential-stale-query-loop-bind-9.18'
> + into 'security-bind-9.18'
> +
> +[9.18][CVE-2023-2911] Fix stale-answer-client-timeout 0 crash
> +
> +See merge request isc-private/bind9!523
> +
> +CVE-2023-2911
> +
> +Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/-/commit/2d6982985021ee354469a0=
fc380008d6c6fa8ae2
> ]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + CHANGES        |  7 +++++++
> + lib/ns/query.c | 29 +++++++++++++++++++++--------
> + 2 files changed, 28 insertions(+), 8 deletions(-)
> +
> +diff --git a/CHANGES b/CHANGES
> +index ca2f3a3..0e18f27 100644
> +--- a/CHANGES
> ++++ b/CHANGES
> +@@ -1,3 +1,10 @@
> ++6192. [security]      A query that prioritizes stale data over lookup
> ++                      triggers a fetch to refresh the stale data in
> cache.
> ++                      If the fetch is aborted for exceeding the recursi=
on
> ++                      quota, it was possible for 'named' to enter an
> infinite
> ++                      callback loop and crash due to stack overflow.
> This has
> ++                      been fixed. (CVE-2023-2911) [GL #4089]
> ++
> +       --- 9.18.11 released ---
> +
> + 6067. [security]      Fix serve-stale crash when recursive clients soft
> quota
> +diff --git a/lib/ns/query.c b/lib/ns/query.c
> +index 0d2ba6b..7a812e6 100644
> +--- a/lib/ns/query.c
> ++++ b/lib/ns/query.c
> +@@ -5824,6 +5824,7 @@ query_refresh_rrset(query_ctx_t *orig_qctx) {
> +       qctx.client->query.dboptions &=3D ~(DNS_DBFIND_STALETIMEOUT |
> +                                         DNS_DBFIND_STALEOK |
> +                                         DNS_DBFIND_STALEENABLED);
> ++      qctx.client->nodetach =3D false;
> +
> +       /*
> +        * We'll need some resources...
> +@@ -6076,7 +6077,13 @@ query_lookup(query_ctx_t *qctx) {
> +                                       "%s stale answer used, an attempt
> to "
> +                                       "refresh the RRset will still be
> made",
> +                                       namebuf);
> ++
> +                               qctx->refresh_rrset =3D
> STALE(qctx->rdataset);
> ++                              /*
> ++                               * If we are refreshing the RRSet, we mus=
t
> not
> ++                               * detach from the client in query_send()=
.
> ++                               */
> ++                              qctx->client->nodetach =3D
> qctx->refresh_rrset;
> +                               ns_client_extendederror(
> +                                       qctx->client, ede,
> +                                       "stale data prioritized over
> lookup");
> +@@ -6503,7 +6510,7 @@ ns_query_recurse(ns_client_t *client,
> dns_rdatatype_t qtype, dns_name_t *qname,
> +       if (recparam_match(&client->query.recparam, qtype, qname,
> qdomain)) {
> +               ns_client_log(client, NS_LOGCATEGORY_CLIENT,
> NS_LOGMODULE_QUERY,
> +                             ISC_LOG_INFO, "recursion loop detected");
> +-              return (ISC_R_FAILURE);
> ++              return (ISC_R_ALREADYRUNNING);
> +       }
> +
> +       recparam_update(&client->query.recparam, qtype, qname, qdomain);
> +@@ -7620,10 +7627,21 @@ query_usestale(query_ctx_t *qctx, isc_result_t
> result) {
> +               return (false);
> +       }
> +
> +-      if (result =3D=3D DNS_R_DUPLICATE || result =3D=3D DNS_R_DROP) {
> ++      if (qctx->refresh_rrset) {
> ++              /*
> ++               * This is a refreshing query, we have already prioritize=
d
> ++               * stale data, so don't enable serve-stale again.
> ++               */
> ++              return (false);
> ++      }
> ++
> ++      if (result =3D=3D DNS_R_DUPLICATE || result =3D=3D DNS_R_DROP ||
> ++          result =3D=3D ISC_R_ALREADYRUNNING)
> ++      {
> +               /*
> +                * Don't enable serve-stale if the result signals a
> duplicate
> +-               * query or query that is being dropped.
> ++               * query or a query that is being dropped or can't procee=
d
> ++               * because of a recursion loop.
> +                */
> +               return (false);
> +       }
> +@@ -11927,12 +11945,7 @@ ns_query_done(query_ctx_t *qctx) {
> +       /*
> +        * Client may have been detached after query_send(), so
> +        * we test and store the flag state here, for safety.
> +-       * If we are refreshing the RRSet, we must not detach from the
> client
> +-       * in the query_send(), so we need to override the flag.
> +        */
> +-      if (qctx->refresh_rrset) {
> +-              qctx->client->nodetach =3D true;
> +-      }
> +       nodetach =3D qctx->client->nodetach;
> +       query_send(qctx->client);
> +
> +--
> +2.40.0
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb
> b/meta/recipes-connectivity/bind/bind_9.18.11.bb
> index 0618129318..4349b6441b 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "
> https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>
> file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
>
> file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>             file://0001-avoid-start-failure-with-bind-user.patch \
> +           file://CVE-2023-2911.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184671):
> https://lists.openembedded.org/g/openembedded-core/message/184671
> Mute This Topic: https://lists.openembedded.org/mt/100272152/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000070a80a06010282b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is already a fix for this CVE in kirkstone:<div><br>=
</div><div><a href=3D"https://git.openembedded.org/openembedded-core/commit=
/?h=3Dkirkstone&amp;id=3D08810d3fe6988ea821805eca16105b4632335654">https://=
git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&amp;id=3D08810=
d3fe6988ea821805eca16105b4632335654</a><br></div><div><br></div><div>Steve<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Jul 20, 2023 at 8:50=E2=80=AFPM Urade, Yogita via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;Yogita.Urade=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">If the `recursive-clients` quota is reached on a BIND 9=
 resolver<br>
configured with both `stale-answer-enable yes;` and<br>
`stale-answer-client-timeout 0;`, a sequence of serve-stale-related<br>
lookups could cause `named` to loop and terminate unexpectedly due<br>
to a stack overflow.<br>
This issue affects BIND 9 versions 9.16.33 through 9.16.41, 9.18.7<br>
through 9.18.15, 9.16.33-S1 through 9.16.41-S1, and 9.18.11-S1<br>
through 9.18.15-S1.<br>
<br>
References:<br>
<a href=3D"https://kb.isc.org/docs/cve-2023-2911" rel=3D"noreferrer" target=
=3D"_blank">https://kb.isc.org/docs/cve-2023-2911</a><br>
<a href=3D"https://downloads.isc.org/isc/bind9/9.18.16/doc/arm/html/notes.h=
tml#notes-for-bind-9-18-16" rel=3D"noreferrer" target=3D"_blank">https://do=
wnloads.isc.org/isc/bind9/9.18.16/doc/arm/html/notes.html#notes-for-bind-9-=
18-16</a><br>
<br>
Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.co=
m" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../bind/bind-9.18.11/CVE-2023-2911.patch=C2=A0 =C2=A0 =C2=A0| 109 ++=
++++++++++++++++<br>
=C2=A0.../recipes-connectivity/bind/<a href=3D"http://bind_9.18.11.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.18.11.bb</a> |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 110 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-20=
23-2911.patch<br>
<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patc=
h b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch<br>
new file mode 100644<br>
index 0000000000..729d13ee18<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch<br>
@@ -0,0 +1,109 @@<br>
+From 2d6982985021ee354469a0fc380008d6c6fa8ae2 Mon Sep 17 00:00:00 2001<br>
+From: Michal Nowak &lt;<a href=3D"mailto:mnowak@isc.org" target=3D"_blank"=
>mnowak@isc.org</a>&gt;<br>
+Date: Thu, 20 Jul 2023 08:07:32 +0000<br>
+Subject: [PATCH] Merge branch &#39;4089-confidential-stale-query-loop-bind=
-9.18&#39;<br>
+ into &#39;security-bind-9.18&#39;<br>
+<br>
+[9.18][CVE-2023-2911] Fix stale-answer-client-timeout 0 crash<br>
+<br>
+See merge request isc-private/bind9!523<br>
+<br>
+CVE-2023-2911<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-projects/=
bind9/-/commit/2d6982985021ee354469a0fc380008d6c6fa8ae2" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.isc.org/isc-projects/bind9/-/commit/2d698=
2985021ee354469a0fc380008d6c6fa8ae2</a>]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.c=
om" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
+---<br>
+ CHANGES=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
+ lib/ns/query.c | 29 +++++++++++++++++++++--------<br>
+ 2 files changed, 28 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/CHANGES b/CHANGES<br>
+index ca2f3a3..0e18f27 100644<br>
+--- a/CHANGES<br>
++++ b/CHANGES<br>
+@@ -1,3 +1,10 @@<br>
++6192. [security]=C2=A0 =C2=A0 =C2=A0 A query that prioritizes stale data =
over lookup<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 triggers a fetch to refresh the stale data in cache.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 If the fetch is aborted for exceeding the recursion<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 quota, it was possible for &#39;named&#39; to enter an infinite<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 callback loop and crash due to stack overflow. This has<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 been fixed. (CVE-2023-2911) [GL #4089]<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--- 9.18.11 released ---<br>
+<br>
+ 6067. [security]=C2=A0 =C2=A0 =C2=A0 Fix serve-stale crash when recursive=
 clients soft quota<br>
+diff --git a/lib/ns/query.c b/lib/ns/query.c<br>
+index 0d2ba6b..7a812e6 100644<br>
+--- a/lib/ns/query.c<br>
++++ b/lib/ns/query.c<br>
+@@ -5824,6 +5824,7 @@ query_refresh_rrset(query_ctx_t *orig_qctx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qctx.client-&gt;query.dboptions &amp;=3D ~(DNS_=
DBFIND_STALETIMEOUT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DN=
S_DBFIND_STALEOK |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DN=
S_DBFIND_STALEENABLED);<br>
++=C2=A0 =C2=A0 =C2=A0 qctx.client-&gt;nodetach =3D false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We&#39;ll need some resources...<br>
+@@ -6076,7 +6077,13 @@ query_lookup(query_ctx_t *qctx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s =
stale answer used, an attempt to &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ref=
resh the RRset will still be made&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0namebuf);=
<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qctx-&gt;refresh_rrset =3D STALE(qctx=
-&gt;rdataset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we are refreshing the RRSet, we =
must not<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* detach from the client in query_sen=
d().<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qctx-&gt;client-&gt;nodetach =3D qctx-&gt;r=
efresh_rrset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_client_extendederror(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qctx-&gt;=
client, ede,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sta=
le data prioritized over lookup&quot;);<br>
+@@ -6503,7 +6510,7 @@ ns_query_recurse(ns_client_t *client, dns_rdatatype_=
t qtype, dns_name_t *qname,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (recparam_match(&amp;client-&gt;query.recpar=
am, qtype, qname, qdomain)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_client_log(clien=
t, NS_LOGCATEGORY_CLIENT, NS_LOGMODULE_QUERY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ISC_LOG_INFO, &quot;recursion loop detected&=
quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (ISC_R_FAILURE);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (ISC_R_ALREADYRUN=
NING);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0recparam_update(&amp;client-&gt;query.recparam,=
 qtype, qname, qdomain);<br>
+@@ -7620,10 +7627,21 @@ query_usestale(query_ctx_t *qctx, isc_result_t res=
ult) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 if (result =3D=3D DNS_R_DUPLICATE || result =3D=3D D=
NS_R_DROP) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (qctx-&gt;refresh_rrset) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This is a refres=
hing query, we have already prioritized<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* stale data, so d=
on&#39;t enable serve-stale again.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (false);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (result =3D=3D DNS_R_DUPLICATE || result =3D=3D D=
NS_R_DROP ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D=3D ISC_R_ALREADYRUNNING)<br=
>
++=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Don&#39;t enable=
 serve-stale if the result signals a duplicate<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* query or query t=
hat is being dropped.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* query or a query=
 that is being dropped or can&#39;t proceed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because of a rec=
ursion loop.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -11927,12 +11945,7 @@ ns_query_done(query_ctx_t *qctx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Client may have been detached after query_se=
nd(), so<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * we test and store the flag state here, for s=
afety.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* If we are refreshing the RRSet, we must not =
detach from the client<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* in the query_send(), so we need to override =
the flag.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (qctx-&gt;refresh_rrset) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qctx-&gt;client-&gt;node=
tach =3D true;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nodetach =3D qctx-&gt;client-&gt;nodetach;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0query_send(qctx-&gt;client);<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.18.11.=
bb" rel=3D"noreferrer" target=3D"_blank">bind_9.18.11.bb</a> b/meta/recipes=
-connectivity/bind/<a href=3D"http://bind_9.18.11.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">bind_9.18.11.bb</a><br>
index 0618129318..4349b6441b 100644<br>
--- a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.18.11.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.18.11.bb</a><br>
+++ b/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.18.11.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.18.11.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bind=
9/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bind-ensure-searching-for-=
json-headers-searches-sysr.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avoid-start-failure-w=
ith-bind-user.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-2911.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8ff3352812230cbcbda42df87cad961f94163d3d=
a457c5e4bef8057fd5df2158&quot;<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184671): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184671" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184671</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100272152/362=
0601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100272152/3620601</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" target=
=3D"_blank">steve@sakoman.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000070a80a06010282b1--

