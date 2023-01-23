Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D157C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 12:16:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.41000.1674476161099216660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 04:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FtX4I0+e;
 spf=pass (domain: mvista.com, ip: 209.85.167.51, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f51.google.com with SMTP id d30so17829411lfv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q3MYryi0yZTP3BpEuTnARqTYmm9kxGQonlhALTEyACU=;
        b=FtX4I0+eavMHXSgnidbwXHCd2X6JYiR0cFEbb6HaZnfxKYVbw21Uf+uobI8tc3yKmv
         QcvwKUuAHQ1R/SUKJ0Yo2MXIzlLF8d797JUnJlaggSBuZfHrrNFatH9GfOBKNqNUdG9y
         Zb38ijaogmzjNid9mZWg+qEH+CfyJ9htTLWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3MYryi0yZTP3BpEuTnARqTYmm9kxGQonlhALTEyACU=;
        b=VBbu+WHiOzXr5b6tS5H0ud5enEsCzKfQIRCJBSD0JuqdzPL1d13QEbdjU8DddKWF9V
         NrV0Rrb+ey3rq8kkkAJUk4NKkjwtGxMkEcE8Kr4mH4GKxZtY/mtYDjN1ZQQrZdX77gYk
         7x9OM/O/zxrvEHTc2sGRf5gThBfqwixWuYI5R1QCPfnm3A72zl4bHVM9wQ3fpVgL0Wlv
         GXiSD90HNhikRl6lV3D+v38SbCEzof7J3irM5qx3snTvI84ww/o4QCpYynjXCSqima4S
         KKw52XJH1O9EbgD/hv3wjiw2gFAeqw4TnVr4hQjj5qJZec3E7j0EEiRxAvQcH0uqk9J8
         33jQ==
X-Gm-Message-State: AFqh2kqK1HRFTuwJtLFC7H4a0tZsbmsakj6d99eYZog0zlQSe9KYV3Jx
	GBF9wa0ZregR9cY83MjxxA0ltXBV+F16jkkLXU/Pog==
X-Google-Smtp-Source: AMrXdXs1El8hblB9xrsevJrU1l2RxNGHUOdaMP1W6DVY7mqQkpacJygGZG6QRGZcoZlvfF8+/VrUcMKHXNMzYiL9XuA=
X-Received: by 2002:a05:6512:3a93:b0:4d5:a63d:154f with SMTP id
 q19-20020a0565123a9300b004d5a63d154fmr922368lfu.474.1674476158822; Mon, 23
 Jan 2023 04:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20230120025649.105430-1-vkumbhar@mvista.com> <2B944642-B407-4E7E-9CAB-9794F99D2638@arm.com>
In-Reply-To: <2B944642-B407-4E7E-9CAB-9794F99D2638@arm.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 23 Jan 2023 17:45:47 +0530
Message-ID: <CAPun1rGwr6j0efHKC+6t3=e+56epoYCq-z3CafGAka1ZaYDugA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: fix CVE-2022-3996 double
 locking leads to denial of service
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a1c89705f2ed5cbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 12:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176300

--000000000000a1c89705f2ed5cbb
Content-Type: text/plain; charset="UTF-8"

Okay, Sure.

Kind Regards,
Vivek

On Mon, Jan 23, 2023 at 5:37 PM Ross Burton <Ross.Burton@arm.com> wrote:

> Can you also send this for langdale and master?
>
> Ross
>
> > On 20 Jan 2023, at 02:56, vkumbhar via lists.openembedded.org <vkumbhar=
> mvista.com@lists.openembedded.org> wrote:
> >
> > From: Vivek Kumbhar <vkumbhar@mvista.com>
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> > .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++++++++
> > .../openssl/openssl_3.0.7.bb                  |  1 +
> > 2 files changed, 44 insertions(+)
> > create mode 100644
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
> > index 9ed5f11df0..5156586661 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> > @@ -12,6 +12,7 @@ SRC_URI = "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >
> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> >            file://afalg.patch \
> >            file://0001-Configure-do-not-tweak-mips-cflags.patch \
> > +           file://CVE-2022-3996.patch \
> >            "
> >
> > SRC_URI:append:class-nativesdk = " \
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176179):
> https://lists.openembedded.org/g/openembedded-core/message/176179
> > Mute This Topic: https://lists.openembedded.org/mt/96393043/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--000000000000a1c89705f2ed5cbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, Sure.<div><br></div><div>Kind Regards,</div><div>Viv=
ek</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, Jan 23, 2023 at 5:37 PM Ross Burton &lt;<a href=3D"mailto:R=
oss.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Can you also send this for langdale =
and master?<br>
<br>
Ross<br>
<br>
&gt; On 20 Jan 2023, at 02:56, vkumbhar via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;vkumbhar=3D<a href=3D"mailto:mvista.com@lists.openembedded.org" target=
=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=
=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt; .../openssl/openssl/CVE-2022-3996.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 43=
 +++++++++++++++++++<br>
&gt; .../openssl/<a href=3D"http://openssl_3.0.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">openssl_3.0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; 2 files changed, 44 insertions(+)<br>
&gt; create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-=
3996.patch<br>
&gt; <br>
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
&gt; + <br>
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
&gt; + <br>
&gt; +-- <br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://opens=
sl_3.0.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a> b/me=
ta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.7.bb" rel=3D"=
noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
&gt; index 9ed5f11df0..5156586661 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.=
7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.=
7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
&gt; @@ -12,6 +12,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/=
source/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//www.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-buildinfo-strip-s=
ysroot-and-debug-prefix-map-from-co.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://afalg.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Configure-do-not-=
tweak-mips-cflags.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-3996.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; <br>
&gt; SRC_URI:append:class-nativesdk =3D &quot; \<br>
&gt; -- <br>
&gt; 2.30.2<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#176179): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/176179" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/176179</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96393043=
/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/96393043/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000a1c89705f2ed5cbb--

