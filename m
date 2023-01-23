Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DE9C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 16:57:30 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.47611.1674493041624137864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 08:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WUN2Q5nD;
 spf=pass (domain: mvista.com, ip: 209.85.208.174, mailfrom: vkumbhar@mvista.com)
Received: by mail-lj1-f174.google.com with SMTP id k38so9036675lje.5
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 08:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=03ZtwfDQXg1zYSMjTJiYYqn3l17DEAGM8iF5CEMe9bM=;
        b=WUN2Q5nDrY36FW5PWwEONuA0llhLRTyzzv9KpYdIhRlC0CitJegabrAPjTtnrfIMq+
         9D1i4LZuFNnsoL2cY8B3dhNQHsoUPp75jXA45G7/288ZLdstzrCvwU4zqQS20fWRBDmA
         93QuL5xBSa+bVu0HrCS8N85dcoggjxMC0vG5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03ZtwfDQXg1zYSMjTJiYYqn3l17DEAGM8iF5CEMe9bM=;
        b=jMXxgh0wZFIhToGvbY0vsipBi2GVq85iwAhvQ6/dveH7hR+TdU7sgcq292S3mtznZH
         lUkdfcyUIC9nzZ9eojsiSXbqCxJa+oUILpsxGrI3DnQNpavJWSygdFRIa2df89bPTAPF
         6xjwN9v7QHpug6XD39013mlWoAUQwiP6VyA/SFnXVzUWA5+GWE1ncEk9Utd6VuT0++Cx
         /44bPmjseTJtgzMjlsf7JHuUo8cyW+ZerPvQUS41WH2486hsR6PY9pcbGMgmA1I5NeHG
         AHDh4SjkJF6XR3KeKRcJgomCFPSnJctfheH7q/5EU0qciDvltecEuoPvAuRU3yLMGlqN
         6f/g==
X-Gm-Message-State: AFqh2kpV9dJq+4HtVWS27/31+qAxLibCJgiq9cd240hh+Y9ue3ALM0eX
	zgZgioO+546rbuQoX8tOFUeLM7vjb6wKe+1TYMGrYQ==
X-Google-Smtp-Source: AMrXdXsek4SYBS9l6G7p3tA6rLC82fIMjcShXqxcLbfyDUTHWLtlfuSvfy4L32y+WBdNaURW7DQLvejtR567wJdBd2g=
X-Received: by 2002:a2e:7a0a:0:b0:28b:6c95:318 with SMTP id
 v10-20020a2e7a0a000000b0028b6c950318mr1757104ljc.76.1674493039669; Mon, 23
 Jan 2023 08:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20230123163404.2725145-1-vkumbhar@mvista.com> <CAOSpxdYhGbYzOwnL7BX7aMHYvpE9gPN9fg5Hyk8jo9MqM7vz2Q@mail.gmail.com>
In-Reply-To: <CAOSpxdYhGbYzOwnL7BX7aMHYvpE9gPN9fg5Hyk8jo9MqM7vz2Q@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 23 Jan 2023 22:27:08 +0530
Message-ID: <CAPun1rGEuxboc4YFV33iWR8DqMejnKWVPqL8=G29H6zsEcztVg@mail.gmail.com>
Subject: Re: [OE-core][langdale][PATCH] openssl: fix CVE-2022-3996 double
 locking leads to denial of service
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cf07c805f2f14a9a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 16:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176313

--000000000000cf07c805f2f14a9a
Content-Type: text/plain; charset="UTF-8"

Yes, It was intended for the master.

Kind regards,
Vivek

On Mon, 23 Jan 2023 at 10:19 PM, Steve Sakoman <steve@sakoman.com> wrote:

> Hi Vivek,
>
> You sent two seemingly identical patches for langdale.  Was one
> perhaps intended for master?
>
> Steve
>
> On Mon, Jan 23, 2023 at 6:34 AM vkumbhar <vkumbhar@mvista.com> wrote:
> >
> > From: Vivek Kumbhar <vkumbhar@mvista.com>
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++++++++
> >  .../openssl/openssl_3.0.7.bb                  |  1 +
> >  2 files changed, 44 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> >
> > diff --git
> a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> > new file mode 100644
> > index 0000000000..6d70b323d1
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> > @@ -0,0 +1,43 @@
> > +From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
> > +From: Pauli <pauli@openssl.org>
> > +Date: Fri, 11 Nov 2022 09:40:19 +1100
> > +Subject: [PATCH] x509: fix double locking problem
> > +
> > +This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and
> removed the
> > +redundant flag setting.
> > +
> > +Fixes #19643
> > +
> > +Fixes LOW CVE-2022-3996
> > +
> > +Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
> > +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> > +(Merged from https://github.com/openssl/openssl/pull/19652)
> > +
> > +(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
> > +
> > +Upstream-Status: Backport [
> https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7
> ]
> > +CVE: CVE-2022-3996
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + crypto/x509/pcy_map.c | 4 ----
> > + 1 file changed, 4 deletions(-)
> > +
> > +diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
> > +index 05406c6493..60dfd1e320 100644
> > +--- a/crypto/x509/pcy_map.c
> > ++++ b/crypto/x509/pcy_map.c
> > +@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x,
> POLICY_MAPPINGS *maps)
> > +
> > +     ret = 1;
> > +  bad_mapping:
> > +-    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
> > +-        x->ex_flags |= EXFLAG_INVALID_POLICY;
> > +-        CRYPTO_THREAD_unlock(x->lock);
> > +-    }
> > +     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
> > +     return ret;
> > +
> > +--
> > +2.30.2
> > +
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> > index 45fd1de2fd..1842148592 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> > @@ -12,6 +12,7 @@ SRC_URI = "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >
>  file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> >             file://afalg.patch \
> >             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> > +           file://CVE-2022-3996.patch \
> >             "
> >
> >  SRC_URI:append:class-nativesdk = " \
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176311):
> https://lists.openembedded.org/g/openembedded-core/message/176311
> > Mute This Topic: https://lists.openembedded.org/mt/96477598/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000cf07c805f2f14a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"border-color:rgb(255,255,255)!important"><div dir=3D"auto" st=
yle=3D"border-color:rgb(255,255,255)">Yes, It was intended for the master.<=
/div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"><br></div><d=
iv dir=3D"auto" style=3D"border-color:rgb(255,255,255)">Kind regards,</div>=
<div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">Vivek</div><div d=
ir=3D"auto" style=3D"border-color:rgb(255,255,255)"><br></div><div dir=3D"a=
uto" style=3D"border-color:rgb(255,255,255)!important">On Mon, 23 Jan 2023 =
at 10:19 PM, Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=
=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div></div><div><div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)">Hi Vivek,<br>
<br>
You sent two seemingly identical patches for langdale.=C2=A0 Was one<br>
perhaps intended for master?<br>
<br>
Steve<br>
<br>
On Mon, Jan 23, 2023 at 6:34 AM vkumbhar &lt;<a href=3D"mailto:vkumbhar@mvi=
sta.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=
=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../openssl/openssl/CVE-2022-3996.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 43 +++++++++++++++++++<br>
&gt;=C2=A0 .../openssl/<a href=3D"http://openssl_3.0.7.bb" rel=3D"noreferre=
r" target=3D"_blank">openssl_3.0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 44 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE=
-2022-3996.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.p=
atch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6d70b323d1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch<br=
>
&gt; @@ -0,0 +1,43 @@<br>
&gt; +From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Pauli &lt;<a href=3D"mailto:pauli@openssl.org" target=3D"_blank=
">pauli@openssl.org</a>&gt;<br>
&gt; +Date: Fri, 11 Nov 2022 09:40:19 +1100<br>
&gt; +Subject: [PATCH] x509: fix double locking problem<br>
&gt; +<br>
&gt; +This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and remo=
ved the<br>
&gt; +redundant flag setting.<br>
&gt; +<br>
&gt; +Fixes #19643<br>
&gt; +<br>
&gt; +Fixes LOW CVE-2022-3996<br>
&gt; +<br>
&gt; +Reviewed-by: Dmitry Belyavskiy &lt;<a href=3D"mailto:beldmit@gmail.co=
m" target=3D"_blank">beldmit@gmail.com</a>&gt;<br>
&gt; +Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@openssl.org" targ=
et=3D"_blank">tomas@openssl.org</a>&gt;<br>
&gt; +(Merged from <a href=3D"https://github.com/openssl/openssl/pull/19652=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/p=
ull/19652</a>)<br>
&gt; +<br>
&gt; +(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)<=
br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssl/open=
ssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146=
b6552b44e0d226be7638e7</a>]<br>
&gt; +CVE: CVE-2022-3996<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + crypto/x509/pcy_map.c | 4 ----<br>
&gt; + 1 file changed, 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c<br>
&gt; +index 05406c6493..60dfd1e320 100644<br>
&gt; +--- a/crypto/x509/pcy_map.c<br>
&gt; ++++ b/crypto/x509/pcy_map.c<br>
&gt; +@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_=
MAPPINGS *maps)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D 1;<br>
&gt; +=C2=A0 bad_mapping:<br>
&gt; +-=C2=A0 =C2=A0 if (ret =3D=3D -1 &amp;&amp; CRYPTO_THREAD_write_lock(=
x-&gt;lock)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-&gt;ex_flags |=3D EXFLAG_INVALID_POLIC=
Y;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CRYPTO_THREAD_unlock(x-&gt;lock);<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_f=
ree);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://opens=
sl_3.0.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a> b/me=
ta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.7.bb" rel=3D"=
noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
&gt; index 45fd1de2fd..1842148592 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.=
7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.=
7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
&gt; @@ -12,6 +12,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/=
source/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//www.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-buildinfo-s=
trip-sysroot-and-debug-prefix-map-from-co.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://afalg.patch \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Configure-d=
o-not-tweak-mips-cflags.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-3996.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI:append:class-nativesdk =3D &quot; \<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#176311): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/176311" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/176311</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96477598=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/96477598/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>
</div>

--000000000000cf07c805f2f14a9a--

