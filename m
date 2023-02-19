Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D35C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 12:36:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.31523.1676810197214698738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 04:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jmAWnZYz;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id s7-20020a05600c45c700b003dc52fed235so382154wmo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 04:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HhhlbqAPBZaYYMDXrUbBAEbNIk83y0UeVpI/9PGm2H0=;
        b=jmAWnZYzdvUrJNpOlKoAfVvziI6q5du+xcPtdlyd4DskXhw9hmwGrSnFPIq9MpOLqA
         UGiPMJR+IO/7ZnwWvRTO2x6eAOs2gzueZAR4vW4rMW2Bra1C/MsnGQg22nKu/BOWGE4y
         jPYwhNM3MxW3rz8Y2VGd91bCiliFg+9lBKSxKvEWppSiNtwq26aTOyWu/EFbdKkh3AxD
         GUHObZ/Gi5QeN1Y1pEMVvUvRw2K8KkGr4t+weXNBWyUCr/zQj9/yTlYj/sgZzNWq3Eyo
         PZwDS44e8DaipvR/7N6luIpp6G824/vWhCxuqLL14MY+eG+PuDTun6lQ0Z/vxfpmcUPC
         LWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhhlbqAPBZaYYMDXrUbBAEbNIk83y0UeVpI/9PGm2H0=;
        b=SCZOA1adwu6aOn7mEP8e7OS5fAHSiDT9kbwiSgPz1iJO4RfPVg8l66th+aSn8zrj5G
         Hhg6mogY0QmNb6IWhczk9zsInpt29wfnho8aUBCKIizmlUe+U0LH9YiH5bSIfChLrEKm
         Z2ebmhuL7YjTMiCmU4AkoqPjyXK/lveSVdHWJ12g/IbNBkKBEQmQc2diZ9LRZ39qG8TO
         2WOw/ewu8WotqiChEpVdRT7KOCfk9LSPQLv4SAbpYlyeUBch9CJDQAnEFR8OC9GKTM9c
         G8tDmTxuPJQRegu3wWxC2rk4txBdMVjG8zyXoBOsnVYgeOfW//JFl0+SzCkPZjrsYY1K
         PijQ==
X-Gm-Message-State: AO0yUKVEFaNaX5t0sFplXqf9LthNrlbfK70C1oHQ/RXpgH0pXyxZESUA
	alq2CHAXtbSjk/EvpbjAJw9Xm+nDe/kEnjz8OuI=
X-Google-Smtp-Source: AK7set8JMhlUUHjNhu9xyexZdWjqUWgW4envjYTmrMU912BBvVzcG/V2/kZ5/luaX4EQhFdDwl4lBP0HWaTYQ274xIo=
X-Received: by 2002:a05:600c:4f81:b0:3df:e60d:c374 with SMTP id
 n1-20020a05600c4f8100b003dfe60dc374mr920104wmq.52.1676810195274; Sun, 19 Feb
 2023 04:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20230209080022.147333-1-sdoshi@mvista.com>
In-Reply-To: <20230209080022.147333-1-sdoshi@mvista.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2023 13:36:24 +0100
Message-ID: <CA+chaQfPjoRQfsYrnqDwMq6OiE5JtR0mFMXQsrHOOuA-0CSgyA@mail.gmail.com>
Subject: Re: [OE-core] [[kirkstone][PATCH] openssl : Upgrade OpenSSL 3.0.7 ->
 3.0.8] openssl: Upgrade 3.0.7 -> 3.0.8
To: mv <sdoshi@mvista.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000b8e2605f50cccf4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 12:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177327

--0000000000000b8e2605f50cccf4
Content-Type: text/plain; charset="UTF-8"

Hello Steve, Siddharth,

are you waiting for PATCHv3 with commit summary update requested in
corresponding langdale review:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230209143708.20705-1-sdoshi@mvista.com/
?

or is something else blocking this upgrade?

I'm a bit surprised that this high security issue wasn't yet merged even in
oe-core/master-next and I don't see it in
oe-core-contrib/stable/kirkstone-nut nor
oe-core-contrib/stable/langdale-nut.

Siddharth are you going to send v3 of all 3 (or should I send them)?
https://patchwork.yoctoproject.org/project/oe-core/list/?series=&submitter=&state=&q=3.0.8&archive=&delegate=
if that's all what is needed to get this merged?

Regards,

On Thu, Feb 9, 2023 at 9:00 AM mv <sdoshi@mvista.com> wrote:

> From: Siddharth Doshi <sdoshi@mvista.com>
>
> OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE
> level security vulnerability [1].
>
> Upgrade the recipe to point to 3.0.8.
>
> CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
> well.
>
> [1] https://www.openssl.org/news/vulnerabilities.html
>
> CVEs Fixed:
> https://www.openssl.org/news/secadv/20230207.txt
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../openssl/openssl/CVE-2022-3996.patch       | 43 -------------------
>  .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  2 +-
>  2 files changed, 1 insertion(+), 44 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb =>
> openssl_3.0.8.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> deleted file mode 100644
> index 6d70b323d1..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
> -From: Pauli <pauli@openssl.org>
> -Date: Fri, 11 Nov 2022 09:40:19 +1100
> -Subject: [PATCH] x509: fix double locking problem
> -
> -This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed
> the
> -redundant flag setting.
> -
> -Fixes #19643
> -
> -Fixes LOW CVE-2022-3996
> -
> -Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/19652)
> -
> -(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
> -
> -Upstream-Status: Backport [
> https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7
> ]
> -CVE: CVE-2022-3996
> -Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ----
> - crypto/x509/pcy_map.c | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
> -index 05406c6493..60dfd1e320 100644
> ---- a/crypto/x509/pcy_map.c
> -+++ b/crypto/x509/pcy_map.c
> -@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x,
> POLICY_MAPPINGS *maps)
> -
> -     ret = 1;
> -  bad_mapping:
> --    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
> --        x->ex_flags |= EXFLAG_INVALID_POLICY;
> --        CRYPTO_THREAD_unlock(x->lock);
> --    }
> -     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
> -     return ret;
> -
> ---
> -2.30.2
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> index 1842148592..c80df7b2ae 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =
> "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
> +SRC_URI[sha256sum] =
> "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176918):
> https://lists.openembedded.org/g/openembedded-core/message/176918
> Mute This Topic: https://lists.openembedded.org/mt/96849077/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000b8e2605f50cccf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Steve, Siddharth,<div><br></div><div>are you waiting=
 for PATCHv3 with commit summary update requested in corresponding langdale=
 review:</div><div><a href=3D"https://patchwork.yoctoproject.org/project/oe=
-core/patch/20230209143708.20705-1-sdoshi@mvista.com/">https://patchwork.yo=
ctoproject.org/project/oe-core/patch/20230209143708.20705-1-sdoshi@mvista.c=
om/</a>?<br></div><div><br></div><div>or is something else blocking this up=
grade?</div><div><br></div><div>I&#39;m a bit surprised that this high secu=
rity issue wasn&#39;t yet merged even in oe-core/master-next and I don&#39;=
t see it in oe-core-contrib/stable/kirkstone-nut nor oe-core-contrib/stable=
/langdale-nut.</div><div><br></div><div>Siddharth are you going to send v3 =
of all 3 (or should I send them)?<br></div><div><a href=3D"https://patchwor=
k.yoctoproject.org/project/oe-core/list/?series=3D&amp;submitter=3D&amp;sta=
te=3D&amp;q=3D3.0.8&amp;archive=3D&amp;delegate=3D">https://patchwork.yocto=
project.org/project/oe-core/list/?series=3D&amp;submitter=3D&amp;state=3D&a=
mp;q=3D3.0.8&amp;archive=3D&amp;delegate=3D</a><br></div><div>if that&#39;s=
 all what is needed to get this merged?</div><div><br></div><div>Regards,</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Feb 9, 2023 at 9:00 AM mv &lt;<a href=3D"mailto:sdoshi@mvista.c=
om">sdoshi@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">From: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvi=
sta.com" target=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
<br>
OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE leve=
l security vulnerability [1].<br>
<br>
Upgrade the recipe to point to 3.0.8.<br>
<br>
CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as<br>
well.<br>
<br>
[1] <a href=3D"https://www.openssl.org/news/vulnerabilities.html" rel=3D"no=
referrer" target=3D"_blank">https://www.openssl.org/news/vulnerabilities.ht=
ml</a><br>
<br>
CVEs Fixed:<br>
<a href=3D"https://www.openssl.org/news/secadv/20230207.txt" rel=3D"norefer=
rer" target=3D"_blank">https://www.openssl.org/news/secadv/20230207.txt</a>=
<br>
<br>
Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/CVE-2022-3996.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
3 -------------------<br>
=C2=A0.../{<a href=3D"http://openssl_3.0.7.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.0.7.bb</a> =3D&gt; <a href=3D"http://openssl_3.0.8.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_3.0.8.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A02 files changed, 1 insertion(+), 44 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022=
-3996.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.0.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a> =3D&gt; =
<a href=3D"http://openssl_3.0.8.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_3.0.8.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch =
b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch<br>
deleted file mode 100644<br>
index 6d70b323d1..0000000000<br>
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001<br>
-From: Pauli &lt;<a href=3D"mailto:pauli@openssl.org" target=3D"_blank">pau=
li@openssl.org</a>&gt;<br>
-Date: Fri, 11 Nov 2022 09:40:19 +1100<br>
-Subject: [PATCH] x509: fix double locking problem<br>
-<br>
-This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed t=
he<br>
-redundant flag setting.<br>
-<br>
-Fixes #19643<br>
-<br>
-Fixes LOW CVE-2022-3996<br>
-<br>
-Reviewed-by: Dmitry Belyavskiy &lt;<a href=3D"mailto:beldmit@gmail.com" ta=
rget=3D"_blank">beldmit@gmail.com</a>&gt;<br>
-Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@openssl.org" target=3D=
"_blank">tomas@openssl.org</a>&gt;<br>
-(Merged from <a href=3D"https://github.com/openssl/openssl/pull/19652" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/pull/1=
9652</a>)<br>
-<br>
-(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/openssl/openssl/c=
ommit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b65=
52b44e0d226be7638e7</a>]<br>
-CVE: CVE-2022-3996<br>
-Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" ta=
rget=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
----<br>
- crypto/x509/pcy_map.c | 4 ----<br>
- 1 file changed, 4 deletions(-)<br>
-<br>
-diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c<br>
-index 05406c6493..60dfd1e320 100644<br>
---- a/crypto/x509/pcy_map.c<br>
-+++ b/crypto/x509/pcy_map.c<br>
-@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPI=
NGS *maps)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0ret =3D 1;<br>
-=C2=A0 bad_mapping:<br>
--=C2=A0 =C2=A0 if (ret =3D=3D -1 &amp;&amp; CRYPTO_THREAD_write_lock(x-&gt=
;lock)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-&gt;ex_flags |=3D EXFLAG_INVALID_POLICY;<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 CRYPTO_THREAD_unlock(x-&gt;lock);<br>
--=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);=
<br>
-=C2=A0 =C2=A0 =C2=A0return ret;<br>
- <br>
--- <br>
-2.30.2<br>
-<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
0.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.0.8.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.0.8.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0=
.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.8=
.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.8.bb</a><br>
index 1842148592..c80df7b2ae 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.0.8.bb</a><br>
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://environm=
ent.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-openss=
l.sh</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;83049d042a260e696f62406ac5c08bf706fd84383f945=
cf21bd61e9ed95c396e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1=
f69d0df4a41253e4b3e&quot;<br>
<br>
=C2=A0inherit lib_package multilib_header multilib_script ptest perlnative<=
br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176918): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176918" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176918</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96849077/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96849077/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000b8e2605f50cccf4--

