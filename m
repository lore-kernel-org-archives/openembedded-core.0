Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DE4C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 10:35:56 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.5577.1639132554941760945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 02:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jh7EU4LD;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 70so5685490vkx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPTRin1fp1Vhi+T1FKJBraA6asAMtBGrDI8ZaEpAGAM=;
        b=Jh7EU4LDq9OnIYXG2s/veXiFnb5x5wKPkN4DBv15h2YsDYNArOJQUws3a/Vk1yq6yq
         H9LHcJYFpOLKSrx0Opvwbhmu+s2UVGN7zlTyrnzCsxwkBhrlbxpNKN43rw6INUtEZ61o
         0zH9rF19hYIejttWUvYldU99wzqLkmJPIb1BB9S0ePF4dVK1NEov1HUV6c5BNzZMhmlD
         5vsQbwMbaJ5Q2tkxszPnaOLpWWFIZ9dD8k1VsCUPAKr5qmcuAHnVOWutGRWbFtBpGWQT
         lVXitPJr7/A2xSbqBNzM2thc3Vmag40AKm4YLmQ87pP43PNOOz+lXwxzK+7U3Fg6bktP
         haLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPTRin1fp1Vhi+T1FKJBraA6asAMtBGrDI8ZaEpAGAM=;
        b=Ek/apN62HEt8g2lP+3ApRNHm5tg/oy2yckSO0CfPG1W6A2pnGKcbfcNzrCTI9s7SRG
         51zW/HhXp8tmux48265tOUVuxhTBE3C8wIostKESrj7PPIcMGtrbuUCy5evKOwXP9WQW
         rVKYHvfJwxP/PfalnEiX9sTQ+/C4eCXNIraPacBIp+9bfCzo7lEgrybDKhCct3V9nuH5
         rrg35H/PeM4FytHKjDkiuWjj2xXjb4Nvbgj46yjGA4pITyp2ntBc9eziQO+1LfDz2E1L
         Z8+1wldR6+sdpZKhJrjPi96iLrTgrsJqoo9p9QvIh7ty8DUYPU6mjf2lpqzvIqXDM5tA
         xXxA==
X-Gm-Message-State: AOAM533vKwoTfMaXSRy0Ge8sTrhGykP2ICdKIt57+/UeoE9Gk0LXu0tW
	NrYZIELg9FplJRIxYw8kBdHCz6dgJ3kxMPHc3ks=
X-Google-Smtp-Source: 
 ABdhPJwFtCGEgKbKiYeg7S1VF9Xy/TlVBRxzDCm4pl1GAO9GSW565HYbi9/4JMZRB1dfL9AZbwMRVxDjmacKeIp1id0=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr17806443vkd.4.1639132554012;
 Fri, 10 Dec 2021 02:35:54 -0800 (PST)
MIME-Version: 1.0
References: <1639100843-17956-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1639100843-17956-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Dec 2021 11:35:42 +0100
Message-ID: 
 <CANNYZj9987TAJR9+V_7-B776=pEWCEuVDiztfGuVg6y=Y9LO0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pango: upgrade 1.48.10 -> 1.50.0
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009f2cde05d2c849bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 10:35:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159492

--0000000000009f2cde05d2c849bf
Content-Type: text/plain; charset="UTF-8"

+-#ifdef __x86_64__

I think the above simply needs to be adjusted to say 'if x86_64 and not
x32'?

Also, this does not resolve the newly occurring ptest failures.

Alex

On Fri, 10 Dec 2021 at 02:47, wangmy <wangmy@fujitsu.com> wrote:

> Add patch 0001-Fix-bug-for-x86_64_x32.patch
> to fix compile bug when building 32bit on x86_64 environment.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../pango/0001-Fix-bug-for-x86_64_x32.patch   | 55 +++++++++++++++++++
>  .../{pango_1.48.10.bb => pango_1.50.0.bb}     |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
>  rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.0.bb}
> (91%)
>
> diff --git
> a/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
> b/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
> new file mode 100644
> index 0000000000..9ab55879a4
> --- /dev/null
> +++ b/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
> @@ -0,0 +1,55 @@
> +From 8e97429dfb9a2931c79658869da25b44014f8eba Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Thu, 9 Dec 2021 00:13:20 +0900
> +Subject: [PATCH] Fix bug for x86_64_x32
> +
> +When built 32-bit Pango on x86_64 environment, the following problems
> occured:
> +
> +error: size of array '_GStaticAssertCompileTimeAssertion_4' is negative
> +|   826 | #define G_STATIC_ASSERT(expr) typedef char G_PASTE
> (_GStaticAssertCompileTimeAssertion_, __COUNTER__)[(expr) ? 1 : -1]
> G_GNUC_UNUSED
> +
> +This problem can be solved by removing the judgement of arch.
> +
> +Upstream-Status: Inappropriate [
> https://gitlab.gnome.org/GNOME/pango/-/issues/637]
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + pango/pango-item-private.h | 15 ---------------
> + 1 file changed, 15 deletions(-)
> +
> +diff --git a/pango/pango-item-private.h b/pango/pango-item-private.h
> +index d37fc3f..d49f2a6 100644
> +--- a/pango/pango-item-private.h
> ++++ b/pango/pango-item-private.h
> +@@ -40,19 +40,6 @@ G_BEGIN_DECLS
> +
> + typedef struct _PangoItemPrivate PangoItemPrivate;
> +
> +-#ifdef __x86_64__
> +-
> +-struct _PangoItemPrivate
> +-{
> +-  int offset;
> +-  int length;
> +-  int num_chars;
> +-  int char_offset;
> +-  PangoAnalysis analysis;
> +-};
> +-
> +-#else
> +-
> + struct _PangoItemPrivate
> + {
> +   int offset;
> +@@ -62,8 +49,6 @@ struct _PangoItemPrivate
> +   int char_offset;
> + };
> +
> +-#endif
> +-
> + G_STATIC_ASSERT (offsetof (PangoItem, offset) == offsetof
> (PangoItemPrivate, offset));
> + G_STATIC_ASSERT (offsetof (PangoItem, length) == offsetof
> (PangoItemPrivate, length));
> + G_STATIC_ASSERT (offsetof (PangoItem, num_chars) == offsetof
> (PangoItemPrivate, num_chars));
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb
> b/meta/recipes-graphics/pango/pango_1.50.0.bb
> similarity index 91%
> rename from meta/recipes-graphics/pango/pango_1.48.10.bb
> rename to meta/recipes-graphics/pango/pango_1.50.0.bb
> index 40df7042e6..974e053b8f 100644
> --- a/meta/recipes-graphics/pango/pango_1.48.10.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
> @@ -20,7 +20,9 @@ GIR_MESON_DISABLE_FLAG = "disabled"
>
>  SRC_URI += "file://run-ptest"
>
> -SRC_URI[archive.sha256sum] =
> "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
> +SRC_URI:append:x86-x32 = " file://0001-Fix-bug-for-x86_64_x32.patch"
> +
> +SRC_URI[archive.sha256sum] =
> "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
>
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv
> cairo harfbuzz fribidi"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159488):
> https://lists.openembedded.org/g/openembedded-core/message/159488
> Mute This Topic: https://lists.openembedded.org/mt/87627577/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009f2cde05d2c849bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>+-#ifdef __x86_64__</div><div><br></div><div>I think =
the above simply needs to be adjusted to say &#39;if x86_64 and not x32&#39=
;?</div><div><br></div><div>Also, this does not resolve the newly occurring=
 ptest failures.<br></div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Dec =
2021 at 02:47, wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fuji=
tsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Add patch 0001-Fix-bug-for-x86_64_x32.patch<br>
to fix compile bug when building 32bit on x86_64 environment.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../pango/0001-Fix-bug-for-x86_64_x32.patch=C2=A0 =C2=A0| 55 ++++++++=
+++++++++++<br>
=C2=A0.../{<a href=3D"http://pango_1.48.10.bb" rel=3D"noreferrer" target=3D=
"_blank">pango_1.48.10.bb</a> =3D&gt; <a href=3D"http://pango_1.50.0.bb" re=
l=3D"noreferrer" target=3D"_blank">pango_1.50.0.bb</a>}=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 4 +-<br>
=C2=A02 files changed, 58 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/pango/pango/0001-Fix-bug-for=
-x86_64_x32.patch<br>
=C2=A0rename meta/recipes-graphics/pango/{<a href=3D"http://pango_1.48.10.b=
b" rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a> =3D&gt; <a hre=
f=3D"http://pango_1.50.0.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.5=
0.0.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.=
patch b/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch=
<br>
new file mode 100644<br>
index 0000000000..9ab55879a4<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch<b=
r>
@@ -0,0 +1,55 @@<br>
+From 8e97429dfb9a2931c79658869da25b44014f8eba Mon Sep 17 00:00:00 2001<br>
+From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_bla=
nk">wangmy@fujitsu.com</a>&gt;<br>
+Date: Thu, 9 Dec 2021 00:13:20 +0900<br>
+Subject: [PATCH] Fix bug for x86_64_x32<br>
+<br>
+When built 32-bit Pango on x86_64 environment, the following problems occu=
red:<br>
+<br>
+error: size of array &#39;_GStaticAssertCompileTimeAssertion_4&#39; is neg=
ative<br>
+|=C2=A0 =C2=A0826 | #define G_STATIC_ASSERT(expr) typedef char G_PASTE (_G=
StaticAssertCompileTimeAssertion_, __COUNTER__)[(expr) ? 1 : -1] G_GNUC_UNU=
SED<br>
+<br>
+This problem can be solved by removing the judgement of arch.<br>
+<br>
+Upstream-Status: Inappropriate [<a href=3D"https://gitlab.gnome.org/GNOME/=
pango/-/issues/637" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gno=
me.org/GNOME/pango/-/issues/637</a>]<br>
+<br>
+Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
+---<br>
+ pango/pango-item-private.h | 15 ---------------<br>
+ 1 file changed, 15 deletions(-)<br>
+<br>
+diff --git a/pango/pango-item-private.h b/pango/pango-item-private.h<br>
+index d37fc3f..d49f2a6 100644<br>
+--- a/pango/pango-item-private.h<br>
++++ b/pango/pango-item-private.h<br>
+@@ -40,19 +40,6 @@ G_BEGIN_DECLS<br>
+ <br>
+ typedef struct _PangoItemPrivate PangoItemPrivate;<br>
+ <br>
+-#ifdef __x86_64__<br>
+-<br>
+-struct _PangoItemPrivate<br>
+-{<br>
+-=C2=A0 int offset;<br>
+-=C2=A0 int length;<br>
+-=C2=A0 int num_chars;<br>
+-=C2=A0 int char_offset;<br>
+-=C2=A0 PangoAnalysis analysis;<br>
+-};<br>
+-<br>
+-#else<br>
+-<br>
+ struct _PangoItemPrivate<br>
+ {<br>
+=C2=A0 =C2=A0int offset;<br>
+@@ -62,8 +49,6 @@ struct _PangoItemPrivate<br>
+=C2=A0 =C2=A0int char_offset;<br>
+ };<br>
+ <br>
+-#endif<br>
+-<br>
+ G_STATIC_ASSERT (offsetof (PangoItem, offset) =3D=3D offsetof (PangoItemP=
rivate, offset));<br>
+ G_STATIC_ASSERT (offsetof (PangoItem, length) =3D=3D offsetof (PangoItemP=
rivate, length));<br>
+ G_STATIC_ASSERT (offsetof (PangoItem, num_chars) =3D=3D offsetof (PangoIt=
emPrivate, num_chars));<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.48.10.bb=
" rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a> b/meta/recipes-=
graphics/pango/<a href=3D"http://pango_1.50.0.bb" rel=3D"noreferrer" target=
=3D"_blank">pango_1.50.0.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-graphics/pango/<a href=3D"http://pango_1.48.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a><br>
rename to meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.0.bb" re=
l=3D"noreferrer" target=3D"_blank">pango_1.50.0.bb</a><br>
index 40df7042e6..974e053b8f 100644<br>
--- a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.48.10.bb" rel=
=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a><br>
+++ b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pango_1.50.0.bb</a><br>
@@ -20,7 +20,9 @@ GIR_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
<br>
-SRC_URI[archive.sha256sum] =3D &quot;21e1f5798bcdfda75eabc4280514b0896ab56=
f656d4e7e66030b9a2535ecdc98&quot;<br>
+SRC_URI:append:x86-x32 =3D &quot; file://0001-Fix-bug-for-x86_64_x32.patch=
&quot;<br>
+<br>
+SRC_URI[archive.sha256sum] =3D &quot;dba8b62ddf86e10f73f93c3d2256b73238b2b=
caf87037ca229b40bdc040eb3f3&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 glib-2.0-native fontconfig freetype virtua=
l/libiconv cairo harfbuzz fribidi&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159488): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159488" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159488</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87627577/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87627577/1686489</a><br>
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

--0000000000009f2cde05d2c849bf--

