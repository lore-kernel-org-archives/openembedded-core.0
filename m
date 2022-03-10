Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D29C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 06:27:09 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web12.6841.1646893628608259136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 22:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O4c6N+R3;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id x62so2470867vkg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 22:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q4ht6z50WZGmFiKNJPkbqySR/zRZ5AbPeJCQSzCB+7w=;
        b=O4c6N+R31cD/r2k0o3NCHRsWHJrt23sTtjyORadcnoigLBpaWjfuUim2HD0Q7vUpyp
         i0EO8BApCcc/Of0+7TfB65bzeBHHQCiiCN8QADEXEJx31HOG3O80sEDMWTsoNfrLbpDA
         YFANhoSZJnofDrI501Z9sVmqDyuY1RJ7xjSUe3dd7eTvPl6PND1hFGqnhG0V6Jk1/Rww
         e2EsJxBGDLOFoAvpUhcMta9csjTTqH44Z4tC7kKhwtGqDRTZ6sU1x/CuTdv+DyHroLPw
         B1qtLJi2vtVto1gew1rrGlKG8RBTMwKtSCwpwAcas2s+Dr71lg9Kt0NY9xBV9RO8A181
         TJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q4ht6z50WZGmFiKNJPkbqySR/zRZ5AbPeJCQSzCB+7w=;
        b=KXasPamEm+lJu5Yphel/YQB4AM2sJtaaYsvsUblWBn4L9Wcm3Wdwaywj2A9BCP21Zs
         P59dcsaSWY/1WBCvXj3ibQmMrNfXcRDgeJDzbpxofLBW3aoBQWEJqkPVDnkNCu6w5TPv
         tzimE0HNJl/LjWF2uL4/o51NYenGM8ingtxP17cx2j7wqBPGjQclpJavGJmonYNF0Cq9
         T+SZUq5+dpnHH32tu319DswnH4oCVJ44B43Jqi1+XcCkRfLLsjH6klE8puFrNnklqoTt
         Tbza+V19b1gjsu1glTtNu09H68+Sa2Ox4bC+lvMMp+FftCyeeHCELx7oo0MLFZzraLQs
         HsrA==
X-Gm-Message-State: AOAM533dqb8e/bLzryRrDm5WxfXu7iEouo4PPPOsIzKC56LVcc06ILlM
	asPjV4QMAqWXUJR4zo09pcg85+0sn/C2/XErKVY=
X-Google-Smtp-Source: 
 ABdhPJwczYAxVfSXYue8MV4gHVUVCNbqPdx6kjD8nBuiNGy1lOjO2AxnTMjviGIErdhIbm57YDK16mOG3kGBegiAgzo=
X-Received: by 2002:a05:6122:1829:b0:337:6748:246b with SMTP id
 ay41-20020a056122182900b003376748246bmr1744150vkb.21.1646893627648; Wed, 09
 Mar 2022 22:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20220310043116.476846-1-raj.khem@gmail.com>
In-Reply-To: <20220310043116.476846-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Mar 2022 07:26:56 +0100
Message-ID: 
 <CANNYZj9FP0yZnKHGQv6CTv4CqAFsh2GUqSP5ni=2hRzjWe3H8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] m4: Fix build on musl/ppc
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a8af5905d9d74d32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 06:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163001

--000000000000a8af5905d9d74d32
Content-Type: text/plain; charset="UTF-8"

Submit upstream first please :)


Ale

On Thu 10. Mar 2022 at 5.31, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/m4/m4-1.4.19.inc        |  1 +
>  .../0001-sigsegv-Fix-build-on-ppc-musl.patch  | 37 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644
> meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
>
> diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc
> b/meta/recipes-devtools/m4/m4-1.4.19.inc
> index 2785a3d22cd..2adf4de6f2f 100644
> --- a/meta/recipes-devtools/m4/m4-1.4.19.inc
> +++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
> @@ -8,6 +8,7 @@ inherit autotools texinfo ptest gettext
>
>  SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
>             file://ac_config_links.patch \
> +           file://0001-sigsegv-Fix-build-on-ppc-musl.patch \
>             "
>  SRC_URI:append:class-target = " file://run-ptest \
>                                  file://serial-tests-config.patch \
> diff --git
> a/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
> b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
> new file mode 100644
> index 00000000000..8f2ad81c0c5
> --- /dev/null
> +++ b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
> @@ -0,0 +1,37 @@
> +From 36d5e26f606e070553eb0fff1f738e61970be5d7 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Mar 2022 20:22:20 -0800
> +Subject: [PATCH] sigsegv: Fix build on ppc/musl
> +
> +mcontext is not a standard layout so glibc and musl differ sadly.
> +
> +Fixes
> +../../m4-1.4.19/lib/sigsegv.c: In function 'sigsegv_handler':
>
>
>  ../../m4-1.4.19/lib/sigsegv.c:223:75: error: 'mcontext_t' has no member
> named 'uc_regs'; did you mean 'gregs'?
>                                           223 | #    define
> SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *)
> ucp)->uc_mcontext.uc_regs->gregs[1]
>                                                        |
>                                                        ^~~~~~~
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/sigsegv.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/sigsegv.c b/lib/sigsegv.c
> +index 696a152..fa0c465 100644
> +--- a/lib/sigsegv.c
> ++++ b/lib/sigsegv.c
> +@@ -217,10 +217,10 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
> + #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *)
> ucp)->uc_mcontext.gp_regs[1]
> + #  else /* 32-bit */
> + /* both should be equivalent */
> +-#   if 0
> +-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *)
> ucp)->uc_mcontext.regs->gpr[1]
> ++#   if ! defined __GLIBC__
> ++#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *)
> ucp)->uc_regs->gregs[1]
> + #   else
> +-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *)
> ucp)->uc_mcontext.uc_regs->gregs[1]
> ++#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *)
> ucp)->uc_mcontext.uc_regs->gregs[1]
> + #   endif
> + #  endif
> +
> +--
> +2.35.1
> +
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163000):
> https://lists.openembedded.org/g/openembedded-core/message/163000
> Mute This Topic: https://lists.openembedded.org/mt/89680211/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a8af5905d9d74d32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Submit upstream first please :)</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=C2=A0</div><div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu =
10. Mar 2022 at 5.31, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">ra=
j.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">Signed-off-by: Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/m4/m4-1.4.19.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../0001-sigsegv-Fix-build-on-ppc-musl.patch=C2=A0 | 37 +++++++++++++=
++++++<br>
=C2=A02 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build=
-on-ppc-musl.patch<br>
<br>
diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools=
/m4/m4-1.4.19.inc<br>
index 2785a3d22cd..2adf4de6f2f 100644<br>
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc<br>
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc<br>
@@ -8,6 +8,7 @@ inherit autotools texinfo ptest gettext<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/m4/m4-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ac_config_links.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sigsegv-Fix-build-on-=
ppc-musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:class-target =3D &quot; file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://serial-tests-config.pat=
ch \<br>
diff --git a/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl=
.patch b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.pat=
ch<br>
new file mode 100644<br>
index 00000000000..8f2ad81c0c5<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch<=
br>
@@ -0,0 +1,37 @@<br>
+From 36d5e26f606e070553eb0fff1f738e61970be5d7 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Wed, 9 Mar 2022 20:22:20 -0800<br>
+Subject: [PATCH] sigsegv: Fix build on ppc/musl<br>
+<br>
+mcontext is not a standard layout so glibc and musl differ sadly.<br>
+<br>
+Fixes<br>
+../../m4-1.4.19/lib/sigsegv.c: In function &#39;sigsegv_handler&#39;:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0../../m4-1.4.19/lib/sigsegv.c:223:75: error: &#39;mcontext_t&#39; has no=
 member named &#39;uc_regs&#39;; did you mean &#39;gregs&#39;?=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 223 | #=C2=A0 =C2=A0 define S=
IGSEGV_FAULT_STACKPOINTER=C2=A0 ((ucontext_t *) ucp)-&gt;uc_mcontext.uc_reg=
s-&gt;gregs[1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ lib/sigsegv.c | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/lib/sigsegv.c b/lib/sigsegv.c<br>
+index 696a152..fa0c465 100644<br>
+--- a/lib/sigsegv.c<br>
++++ b/lib/sigsegv.c<br>
+@@ -217,10 +217,10 @@ int libsigsegv_version =3D LIBSIGSEGV_VERSION;<br>
+ #=C2=A0 =C2=A0define SIGSEGV_FAULT_STACKPOINTER=C2=A0 ((ucontext_t *) ucp=
)-&gt;uc_mcontext.gp_regs[1]<br>
+ #=C2=A0 else /* 32-bit */<br>
+ /* both should be equivalent */<br>
+-#=C2=A0 =C2=A0if 0<br>
+-#=C2=A0 =C2=A0 define SIGSEGV_FAULT_STACKPOINTER=C2=A0 ((ucontext_t *) uc=
p)-&gt;uc_mcontext.regs-&gt;gpr[1]<br>
++#=C2=A0 =C2=A0if ! defined __GLIBC__<br>
++#=C2=A0 =C2=A0 =C2=A0 define SIGSEGV_FAULT_STACKPOINTER=C2=A0 ((ucontext_=
t *) ucp)-&gt;uc_regs-&gt;gregs[1]<br>
+ #=C2=A0 =C2=A0else<br>
+-#=C2=A0 =C2=A0 define SIGSEGV_FAULT_STACKPOINTER=C2=A0 ((ucontext_t *) uc=
p)-&gt;uc_mcontext.uc_regs-&gt;gregs[1]<br>
++#=C2=A0 =C2=A0 =C2=A0 define SIGSEGV_FAULT_STACKPOINTER=C2=A0 ((ucontext_=
t *) ucp)-&gt;uc_mcontext.uc_regs-&gt;gregs[1]<br>
+ #=C2=A0 =C2=A0endif<br>
+ #=C2=A0 endif<br>
+ <br>
+-- <br>
+2.35.1<br>
+<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163000): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163000" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163000</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89680211/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89680211/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a8af5905d9d74d32--

