Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D4DC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:37:39 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web12.6229.1661305056931628551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D6jrrwd2;
 spf=pass (domain: gmail.com, ip: 209.85.128.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-324ec5a9e97so424131957b3.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9cN+T9wlUHuSmh5PNTYN5qJY+qSCK1yXgjjpsOfqGeE=;
        b=D6jrrwd2IpktT/hl6IiwESd7zknCpC1/sxTAAhQ6YgANtQJOkK0UxPWTmIE5pAqjy/
         kaZ0Cb4t66QLt6uNHd2+t5phEoEiPprrVxwux/MfjUzqOQkNfhbi3qLtkyHSSuljVzaH
         OT2FbPk6mH5g7pTe7W1+TkdtXs8LyJfMtGKl+IgrKjR0DmBLZqsJKAHWZpo0LsuI4VA8
         K3CB6U6Th2akBOVkNCAJPLSayhFJN3m/y/5d2md70VAmD6Xeb4VN8K4bzG9nFol/0qPj
         ewSwQw43Gsz1ygMWd4+RcmS3xePnauTpTd3kokQvzLrn2A5nllqbCtDf3oaeglPQ5YHj
         yyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9cN+T9wlUHuSmh5PNTYN5qJY+qSCK1yXgjjpsOfqGeE=;
        b=hJcBFe0k9Nr1bXKcszqgAngXRA6sPat+SgPHk5G/S32SyPgKyTpxB4oi7ZMZVqAzDy
         06xaL5qS3yvJiQUL6VTkSa9Vqshhs8NFmrVf4r2PO61Lu9xxqYgL3BYGdlnSx8F7aqbD
         p/sSU93xpKFo2qAZh138uPv4dybAl7szY0sTYA5O7zjdyZEuwCrBRnmPxfA/drG2eLZx
         rABnyLsZyW7oUq6ZiJjCcx6c3Z5T9d4DZoC4XF6C7A6WSCsQPccJrcyrstwvrMHLLOq/
         I+2RKKpY07lbiw7A7L3pEN/7fMdZHFXLTvyawTaKMLmGcp/pnE4SpZVWrBqDud4HxNTw
         9P1w==
X-Gm-Message-State: ACgBeo2N851iNnOKzJUZf/G/cEjiuH3+1JMFeNlOXR9p4ZDdeXBf2cLV
	8HU3hbazKhXwdxmbC6bDD0WYhLsePUX72fmQpvE=
X-Google-Smtp-Source: 
 AA6agR57xnofK+nYDXdarWjUhWwj1yXIKOsDYtjDjCxgVB+wYc3glPUpkfqvuJFnQevkL6WV0ii+v89GgE+W1WMtNaY=
X-Received: by 2002:a81:1605:0:b0:336:eddd:97ec with SMTP id
 5-20020a811605000000b00336eddd97ecmr27500031yww.162.1661305055968; Tue, 23
 Aug 2022 18:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220823141610.2934060-1-richard.purdie@linuxfoundation.org>
 <20220823141610.2934060-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220823141610.2934060-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Aug 2022 18:37:24 -0700
Message-ID: 
 <CAMKF1sphbWaEA2S0ST0HpaFjPsj-PEiTOSA-PBEAD4qtwZjfjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] meson: Avoid encoding llvm-native ldflags
 in mesa
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b9820505e6f2b9e5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 01:37:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169768

--000000000000b9820505e6f2b9e5
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 7:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Add a patch to meson to avoid encoding llvm-native paths into target
> binaries
> which cause reproducibility failures.
>

I think this should be solved if we turn llvm-config into a wrapper script
which uses TARGET_* flags to report back like what we do in meta-clang
Combining this with your prior patch would be a good solution

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../meson/meson/llvm-ldflags.patch            | 28 +++++++++++++++++++
>  meta/recipes-devtools/meson/meson_0.63.1.bb   |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/meson/meson/llvm-ldflags.patch
>
> diff --git a/meta/recipes-devtools/meson/meson/llvm-ldflags.patch
> b/meta/recipes-devtools/meson/meson/llvm-ldflags.patch
> new file mode 100644
> index 00000000000..7de01f4d6e1
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/llvm-ldflags.patch
> @@ -0,0 +1,28 @@
> +When building mesa with llvm enabled, e.g.:
> +
> +PACKAGECONFIG:append:x86-64:pn-mesa = ' gallium-llvm gallium r600'
> +
> +then llvm-native ldflags make it onto the compile commandline for the
> target, which
> +is rather bad. These then get encoded into the binary causing
> reproducibility issues.
> +
> +This happens since llvm-config encodes the ldflags used at compile time.
> It will
> +relocate many items at runtime based on it's location but not the flags.
> +
> +Since we always provide our ldflags, we don't need meson adding the
> +llvm-native ones from llvm-config so just drop this code for now to avoid
> the problems.
> +
> +Upstream-Status: Inappropriate [OE specific workaround for cross compile
> issues]
> +
> +Index: meson-0.63.0/mesonbuild/dependencies/dev.py
> +===================================================================
> +--- meson-0.63.0.orig/mesonbuild/dependencies/dev.py
> ++++ meson-0.63.0/mesonbuild/dependencies/dev.py
> +@@ -338,7 +338,7 @@ class LLVMDependencyConfigTool(ConfigToo
> +
> +         link_args = ['--link-static', '--system-libs'] if self.static
> else ['--link-shared']
> +         self.link_args = self.get_config_value(
> +-            ['--libs', '--ldflags'] + link_args +
> list(self.required_modules),
> ++            ['--libs'] + link_args + list(self.required_modules),
> +             'link_args')
> +
> +     def _set_old_link_args(self) -> None:
> diff --git a/meta/recipes-devtools/meson/meson_0.63.1.bb
> b/meta/recipes-devtools/meson/meson_0.63.1.bb
> index 7f77a7de34a..53b0fde8233 100644
> --- a/meta/recipes-devtools/meson/meson_0.63.1.bb
> +++ b/meta/recipes-devtools/meson/meson_0.63.1.bb
> @@ -16,6 +16,7 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0002-Support-building-allarch-recipes-again.patch \
>             file://0001-is_debianlike-always-return-False.patch \
>             file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
> +           file://llvm-ldflags.patch \
>             "
>  SRC_URI[sha256sum] =
> "06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169708):
> https://lists.openembedded.org/g/openembedded-core/message/169708
> Mute This Topic: https://lists.openembedded.org/mt/93204791/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b9820505e6f2b9e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 23, 2022 at 7:16 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add a patch t=
o meson to avoid encoding llvm-native paths into target binaries<br>
which cause reproducibility failures.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think this sho=
uld be solved if we turn llvm-config into a wrapper script which uses TARGE=
T_* flags to report back like what we do in meta-clang=C2=A0</div><div dir=
=3D"auto">Combining this with your prior patch would be a good solution=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../meson/meson/llvm-ldflags.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 28 +++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/meson/<a href=3D"http://meson_0.63.1.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.63.1.bb</a>=C2=A0 =C2=A0|=C2=A0 1 +<=
br>
=C2=A02 files changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/meson/meson/llvm-ldflags.pat=
ch<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson/llvm-ldflags.patch b/meta/re=
cipes-devtools/meson/meson/llvm-ldflags.patch<br>
new file mode 100644<br>
index 00000000000..7de01f4d6e1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/meson/meson/llvm-ldflags.patch<br>
@@ -0,0 +1,28 @@<br>
+When building mesa with llvm enabled, e.g.:<br>
+<br>
+PACKAGECONFIG:append:x86-64:pn-mesa =3D &#39; gallium-llvm gallium r600&#3=
9;<br>
+<br>
+then llvm-native ldflags make it onto the compile commandline for the targ=
et, which<br>
+is rather bad. These then get encoded into the binary causing reproducibil=
ity issues.<br>
+<br>
+This happens since llvm-config encodes the ldflags used at compile time. I=
t will<br>
+relocate many items at runtime based on it&#39;s location but not the flag=
s.<br>
+<br>
+Since we always provide our ldflags, we don&#39;t need meson adding the <b=
r>
+llvm-native ones from llvm-config so just drop this code for now to avoid =
the problems.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific workaround for cross compile i=
ssues]<br>
+<br>
+Index: meson-0.63.0/mesonbuild/dependencies/dev.py<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- meson-0.63.0.orig/mesonbuild/dependencies/dev.py<br>
++++ meson-0.63.0/mesonbuild/dependencies/dev.py<br>
+@@ -338,7 +338,7 @@ class LLVMDependencyConfigTool(ConfigToo<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args =3D [&#39;--link-static&#39;, =
&#39;--system-libs&#39;] if self.static else [&#39;--link-shared&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args =3D self.get_config_value=
(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;--libs&#39;, &#39;--ldfla=
gs&#39;] + link_args + list(self.required_modules),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;--libs&#39;] + link_args =
+ list(self.required_modules),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;link_args&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def _set_old_link_args(self) -&gt; None:<br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.63.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">meson_0.63.1.bb</a> b/meta/recipes-de=
vtools/meson/<a href=3D"http://meson_0.63.1.bb" rel=3D"noreferrer" target=
=3D"_blank">meson_0.63.1.bb</a><br>
index 7f77a7de34a..53b0fde8233 100644<br>
--- a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.63.1.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.63.1.bb</a><br>
+++ b/meta/recipes-devtools/meson/<a href=3D"http://meson_0.63.1.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.63.1.bb</a><br>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/mesonbuil=
d/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV}/mes=
on-${P</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Support-building-alla=
rch-recipes-again.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-is_debianlike-always-=
return-False.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Check-for-clang-befor=
e-guessing-gcc-or-lcc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://llvm-ldflags.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;06fe13297213d6ff0121c5d5aab25a56ef938ffe=
c57414ed6086fda272cb65e9&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169708): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169708" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169708</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93204791/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93204791/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b9820505e6f2b9e5--

