Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B2FC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 20:17:47 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.2453.1638908262134520523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 12:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JoTlQOaT;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id i6so725229uae.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 12:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YXx4M3jq/Rmal6aDPPuuNCg28+fYa2SnE9CRIjwAA+I=;
        b=JoTlQOaTMezDMEgPPBvoBdppCVpI8q4pRjMCvKrpPKDAqEGhiIQlhwHBOytTIamfs3
         EhPXlK3AVRW43IKgaWnsHPhvEYTWCSzkBMotcdAgFFla3xz4xSyxIks6+BjNIM47EwWL
         9b7i+oOP0zMJhDIaJLtrODU586zLz+uXuofD3pdkQvpdlccDJaBn0EqkS3zj/UYU7dGm
         RuwJ3Rga+ZDFLZqDHXmPYonbdrxd5EBD+5C4SA4Sd7BYP7IFOohcqQ0BJAAA9Aq6/b7n
         dDKPt9glfxhgq+TPCeozfCmGTcH+D+lCm0NX9VGXS1pJdm7akVaJ+r+fpjeI5vRVloMY
         pnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YXx4M3jq/Rmal6aDPPuuNCg28+fYa2SnE9CRIjwAA+I=;
        b=B/g2ZDMFf1wipbDQnS50doz1iijY5qI8NDRy6OvDdSSW4E5y6VNdf6ZGYtmq/bhNle
         jiAJbDIWdytoSPHRev5a06cVnJFuNiE80aebXpaXq4olr4Kixm83Bv6GooqL6Ng76mHX
         uIfNky6gKA8VohF2B/TKL/ytWiZTqp1SSqPf9mrPklkTT978j/OE1TylV1DhYD+mBCOG
         U0PwpCmCHzu1AmU6tLi2xVOcx090+Zeq2nv6Kxpkb9ygJLKXUARTyN03SiQ063odlP1O
         vt6Rq1rdo9elzPW4781aNKY3j1TGuk1QhpmI81hbSmtO1tXlpobz+PBGiB3V9/cHVown
         k4tg==
X-Gm-Message-State: AOAM53314qPIOukweDEL7cN9EMjuR0i8Aw18venh4GMYdhHbdNQzgfCF
	rfr0RE20GSkBtLPddCvryfZOaz/efSqONHq4+FQ=
X-Google-Smtp-Source: 
 ABdhPJyk8R0RWw2r4yAA2e66cp1R/x3bSzap+Jmy9Ie+IflnyY541P6qQwc5T8S8uft1Rh3NhCmsMfvOQQ0VexLEV04=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr1899551uah.22.1638908261290;
 Tue, 07 Dec 2021 12:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20211207201423.1109106-1-raj.khem@gmail.com>
In-Reply-To: <20211207201423.1109106-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Dec 2021 21:17:29 +0100
Message-ID: 
 <CANNYZj8xGycw5RN4yW6g9LxQ9EJhQszYpDoLkbzg_3ZLr48wNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Fix broadcom vulkan driver build on
 32bit arches with 64bit time_t
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000bbd4c105d29410e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 20:17:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159335

--000000000000bbd4c105d29410e2
Content-Type: text/plain; charset="UTF-8"

Thanks :)

Alex

On Tue, 7 Dec 2021 at 21:14, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Update patch status
>
>  ...unt-for-64bit-time_t-on-32bit-arches.patch | 41 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
> b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
> new file mode 100644
> index 00000000000..e87d7d73114
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
> @@ -0,0 +1,41 @@
> +From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 7 Dec 2021 11:13:27 -0800
> +Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches
> +
> +This makes is a bit more portable, especially on 32bit architectures
> +with 64bit time_t defaults. Especially on musl its a must.
> +
> +Fixes
> +../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format
> specifies type 'long' but the argument has type 'time_t' (aka 'long long')
> [-Werror,-Wformat]
> +              time.tv_sec);
> +              ^~~~~~~~~~~
> +
> +Also reported here [1]
> +
> +[1] https://github.com/agherzan/meta-raspberrypi/issues/969
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14118]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/broadcom/vulkan/v3dv_bo.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo.c
> +index 71679ce..dc5e7f5 100644
> +--- a/src/broadcom/vulkan/v3dv_bo.c
> ++++ b/src/broadcom/vulkan/v3dv_bo.c
> +@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)
> +
> +       struct timespec time;
> +       clock_gettime(CLOCK_MONOTONIC, &time);
> +-      fprintf(stderr, "  now:               %ld\n",
> +-              time.tv_sec);
> ++      fprintf(stderr, "  now:               %lld\n",
> ++              (long long)time.tv_sec);
> +    }
> +
> +    if (cache->size_list_size) {
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 30b9e93f630..31ff38dfdca 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,6 +20,7 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch \
> +
>  file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159333):
> https://lists.openembedded.org/g/openembedded-core/message/159333
> Mute This Topic: https://lists.openembedded.org/mt/87573662/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000bbd4c105d29410e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks :)</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, 7 Dec 2021 at 21:14, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Update patch status<br>
<br>
=C2=A0...unt-for-64bit-time_t-on-32bit-arches.patch | 41 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 42 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-v3dv-account=
-for-64bit-time_t-on-32bit-arches.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-t=
ime_t-on-32bit-arches.patch b/meta/recipes-graphics/mesa/files/0001-v3dv-ac=
count-for-64bit-time_t-on-32bit-arches.patch<br>
new file mode 100644<br>
index 00000000000..e87d7d73114<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-o=
n-32bit-arches.patch<br>
@@ -0,0 +1,41 @@<br>
+From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 7 Dec 2021 11:13:27 -0800<br>
+Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches<br>
+<br>
+This makes is a bit more portable, especially on 32bit architectures<br>
+with 64bit time_t defaults. Especially on musl its a must.<br>
+<br>
+Fixes<br>
+../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format specifie=
s type &#39;long&#39; but the argument has type &#39;time_t&#39; (aka &#39;=
long long&#39;) [-Werror,-Wformat]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.tv_sec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
+<br>
+Also reported here [1]<br>
+<br>
+[1] <a href=3D"https://github.com/agherzan/meta-raspberrypi/issues/969" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/agherzan/meta-raspber=
rypi/issues/969</a><br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mesa=
/mesa/-/merge_requests/14118" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14118</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ src/broadcom/vulkan/v3dv_bo.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo.c=
<br>
+index 71679ce..dc5e7f5 100644<br>
+--- a/src/broadcom/vulkan/v3dv_bo.c<br>
++++ b/src/broadcom/vulkan/v3dv_bo.c<br>
+@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec time;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC, &amp;time);<br>
+-=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 now:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%ld\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.tv_sec);<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 now:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%lld\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)time.tv_sec);=
<br>
+=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 if (cache-&gt;size_list_size) {<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 30b9e93f630..31ff38dfdca 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_f=
utex-if-it-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-util-format-Check-for=
-NEON-before-using-it.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-v3dv-account-for-64bi=
t-time_t-on-32bit-arches.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a2753c09deef0ba14d35ae8a2ceff3fe5cd13698=
928c7bb62c2ec8736eb09ce1&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159333): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159333" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159333</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87573662/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87573662/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000bbd4c105d29410e2--

