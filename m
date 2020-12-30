Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web08.6930.1609338425095025163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 06:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0Xb03gh;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id d6so3640445vkb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W1XHabW2yQ7J0Poauk4oZ2JC/RvYLOBybQKCIc6fpfQ=;
        b=b0Xb03ghXX+fiYrNxKuyHsBYs/5KQ1swO2Mz1ebuAYNtxdz0e3y4EFmqzSw+z1uEzk
         m8MT4i8BUkZpDWLwTCe+PkdzlGvYPxAAX2e5bM0HhapeamsUGe+iFayHK8gkK9G9Ec/0
         +7R5xOqn3eVFutT821PXB3rr3BZCRF1I2IYIniDbxyq/aCSrtkrE+SBQaweYc+/G8NKu
         AW0aHF4QrFtzVzYha9d7VjdfHT2GbOhdwd+Wj0zFUPiGIHrgDBw26Gx8Q69vNe+iPkzn
         rgC1/WrhFwt/5SmXIgmdA0p1IrypmxornDGb5VwJ7DYWQxY2s9Ykn4RvoAsM9bQJb2c2
         /jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1XHabW2yQ7J0Poauk4oZ2JC/RvYLOBybQKCIc6fpfQ=;
        b=qQyBIN00GEXuQAaLylsVVpARd9S5OBCDDdjzJVtLeaifyhaxk99xmIcsfu46MI4aIm
         m0LS1n/f3f7hoIzajm/kShnVW75Fz96RKBHPoNCwzNSYG+lXoMg7utPgG6GOMoccYaF7
         noBAon0I35L+xDgQG7gw4xZsUcFTftcfKBJRuvvomgxzKl1sgexgIdJAaec4QU+9cITq
         0cIbD2ylkXgappU3jBpXUY8PfcIVkPDt3hHrzk6ttFraFKWVRdY+hCXSDgNevDKRnQjx
         Oy3TkbzeE7mwR+Z4u+MnMIq60KOXQkrFOKOvHEGUHZyHOCf2w8ldZM3o3scfuflK14e4
         JSDA==
X-Gm-Message-State: AOAM530jXazB8i2wARO/f33CfvOYhNwrv3FYrzNL5UJ9mvD36ezgaMQB
	8u/NLeynBSxjIL1j8fi1fhsqMLfXW0sMpQT2odM=
X-Google-Smtp-Source: ABdhPJxxbVUdml1gOuwxvJTPgJy5Tg3gxtoLQgDccWZf2YSOxkxHdfBNsLI1UeZ8cjo2ZaiR90wQKMxvOyhf/m2I3bM=
X-Received: by 2002:a1f:27cf:: with SMTP id n198mr33545071vkn.16.1609338424204;
 Wed, 30 Dec 2020 06:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20201230090140.85279-1-chee.yang.lee@intel.com>
In-Reply-To: <20201230090140.85279-1-chee.yang.lee@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 30 Dec 2020 15:26:53 +0100
Message-ID: <CANNYZj94Fs1BAq=Fd2YMfCukPYjZRAHi_wMNV7PLPEb1ZGqJfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] p11-kit: upgrade 0.23.21 -> 0.23.22
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019225805b7af4d03"

--00000000000019225805b7af4d03
Content-Type: text/plain; charset="UTF-8"

I believe this update breaks DISTRO_FEATURES += "api-documention" builds,
that's why I took it out from my batch. If you can fix that, would be
appreciated.

Please remember to 'git commit --amend -s --reset-author' so the patches
come from you, and not AUH.

Alex

On Wed, 30 Dec 2020 at 10:01, Lee Chee Yang <chee.yang.lee@intel.com> wrote:

> From: Upgrade Helper <auh@auh.yoctoproject.org>
>
> https://github.com/p11-glue/p11-kit/releases/tag/0.23.22
>
> Release notes:
> Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361,
> CVE-2020-29362, and CVE-2020-29363), discovered and fixed by David Cook
> anchor: Prefer persistent format when storing anchor [#329]
> common: Fix infloop in p11_path_build [#326, #327]
> proxy: C_CloseAllSessions: Make sure that calloc args are non-zero [#325]
> common: Check for a NULL locale before freeing it [#321]
> Build and test fixes [#313, #315, #317, #318, #319, #323, #330, #333,
> #334, #335, #338, #339]
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb =>
> p11-kit_0.23.22.bb} (87%)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
> b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
> similarity index 87%
> rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
> rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
> index b1fd2334b2..050ef2f3ed 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
> @@ -8,8 +8,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
>
>  DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True'
> else ''}"
>
> -SRC_URI = "git://github.com/p11-glue/p11-kit"
> -SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
> +SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
> +SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
>  S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= ""
> --
> 2.17.1
>
>
> 
>
>

--00000000000019225805b7af4d03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I believe this update breaks DISTRO_FEATURES +=3D &qu=
ot;api-documention&quot; builds, that&#39;s why I took it out from my batch=
. If you can fix that, would be appreciated.</div><div><br></div><div>Pleas=
e remember to &#39;git commit --amend -s --reset-author&#39; so the patches=
 come from you, and not AUH.</div><div><br></div><div>Alex<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 30 Dec 2020 at 10:01, Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@in=
tel.com">chee.yang.lee@intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Upgrade Helper &lt;<a href=3D"mailt=
o:auh@auh.yoctoproject.org" target=3D"_blank">auh@auh.yoctoproject.org</a>&=
gt;<br>
<br>
<a href=3D"https://github.com/p11-glue/p11-kit/releases/tag/0.23.22" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/p11-glue/p11-kit/rele=
ases/tag/0.23.22</a><br>
<br>
Release notes:<br>
Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361, CVE=
-2020-29362, and CVE-2020-29363), discovered and fixed by David Cook<br>
anchor: Prefer persistent format when storing anchor [#329]<br>
common: Fix infloop in p11_path_build [#326, #327]<br>
proxy: C_CloseAllSessions: Make sure that calloc args are non-zero [#325]<=
br>
common: Check for a NULL locale before freeing it [#321]<br>
Build and test fixes [#313, #315, #317, #318, #319, #323, #330, #333, #334=
, #335, #338, #339]<br>
<br>
Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com=
" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
---<br>
=C2=A0.../p11-kit/{<a href=3D"http://p11-kit_0.23.21.bb" rel=3D"noreferrer=
" target=3D"_blank">p11-kit_0.23.21.bb</a> =3D&gt; <a href=3D"http://p11-ki=
t_0.23.22.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.23.22.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/p11-kit/{<a href=3D"http://p11-kit_0.23.=
21.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.23.21.bb</a> =3D&gt; =
<a href=3D"http://p11-kit_0.23.22.bb" rel=3D"noreferrer" target=3D"_blank">=
p11-kit_0.23.22.bb</a>} (87%)<br>
<br>
diff --git a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.23.2=
1.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.23.21.bb</a> b/meta/re=
cipes-support/p11-kit/<a href=3D"http://p11-kit_0.23.22.bb" rel=3D"noreferr=
er" target=3D"_blank">p11-kit_0.23.22.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.23.21=
.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.23.21.bb</a><br>
rename to meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.23.22.b=
b" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.23.22.bb</a><br>
index b1fd2334b2..050ef2f3ed 100644<br>
--- a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.23.21.bb" r=
el=3D"noreferrer" target=3D"_blank">p11-kit_0.23.21.bb</a><br>
+++ b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.23.22.bb" r=
el=3D"noreferrer" target=3D"_blank">p11-kit_0.23.22.bb</a><br>
@@ -8,8 +8,8 @@ DEPENDS =3D &quot;libtasn1 libtasn1-native libffi&quot;<br=
>
<br>
=C2=A0DEPENDS_append =3D &quot;${@&#39; glib-2.0&#39; if d.getVar(&#39;GTK=
DOC_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/p11-glue/p11-kit" re=
l=3D"noreferrer" target=3D"_blank">github.com/p11-glue/p11-kit</a>&quot;<br=
>
-SRCREV =3D &quot;fd8b56f3ee971f94dc6fc95411fc01e1c12153ab&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/p11-glue/p11-kit;bra=
nch=3D0.23" rel=3D"noreferrer" target=3D"_blank">github.com/p11-glue/p11-ki=
t;branch=3D0.23</a>&quot;<br>
+SRCREV =3D &quot;bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000019225805b7af4d03--
