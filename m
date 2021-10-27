Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6FEC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 21:09:28 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.2511.1635368966718675795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PqNZEPW4;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id gh1so2694206qvb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HP1gcqKyvdX2W6Ja/5/4D6NFH8Wx77WWkfN8heFxaC8=;
        b=PqNZEPW4zobyGgBmfxLuvjgNksMRcM7nS/vtp6apRY7jwEHbdISXYblZAB71wIMZeu
         dwiKAsZ5DyeiIHvlahp60mmjMA92vixKtWJI1IEj9pUNQJhNNcwdBXMor79usoqmwsqv
         /9RW+VHP6JPxZRjCJihI5he8NHmI8ur7bBFSPb53qrBO1MZ6p7+CMeE9z5PuEdAjmPoX
         Gb2K47g5kiWiRBk6nTTPVkLF/Z7A8FKkt8/eKbkkyjWIaYdnsMM6qmTlSSPajtk3XceO
         C114zFsWdoeXGot8C27kLJEaAotYvgySKdrtnlScAF4o09lrHNZF9NGjszNYHVdk2kb0
         96qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HP1gcqKyvdX2W6Ja/5/4D6NFH8Wx77WWkfN8heFxaC8=;
        b=cGu41nx91PgBP41L6bZgkX+G59Ixlj3AXRo4+C1lb4DtTxNuhh3YqDMakbEze52rk7
         lgFQm+hcixAYeO/xtfVTER1fIUthw19dW7ByqzaKHwErU07xK8v/yIHHYWkLntS6U7Lt
         9EENdgRPI4G5/N2UuWLEyzhbUyN/4XgDZEoBC67JjclPPBpQly2ddCLdl5Ybg/6Fr3cZ
         DVeRM4AYtlP4QzPDcuMwe8lLAksytAM0mxP8s4irGgfRldD92rQMMMCMIc8mlWYIO/Z3
         ekNZecd83NIAUWRBy2AFP3Sg8bPFsafOiHtnmF+a5CeTwEgm1JzoCDLLEjlze8cRYZin
         xgJw==
X-Gm-Message-State: AOAM531zxC+6fryMBIIsUpZoWD6glMVWrVow69AC8HQiKASG4ccJcdFV
	quTQNwxPBS0/RVi5mOAArqL2MxQgP2pKY2lbWc0=
X-Google-Smtp-Source: 
 ABdhPJzUG24Bf8oU7ozf7lOHWVoFz4JZ19w/TejXbHcbgLdBgbJNfqJDSfCmQcTwWyE4Ndt0LfuhFv/8NeyUzQcGdRw=
X-Received: by 2002:a05:6214:242a:: with SMTP id
 gy10mr26526134qvb.62.1635368965670;
 Wed, 27 Oct 2021 14:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Oct 2021 14:09:15 -0700
Message-ID: 
 <CAMKF1spyTN8SHPdw+OyF5qoOKZfyMmg2zzPOzWBRt2tTJNbZUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcvt: add recipe
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000468a4205cf5c0263"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 21:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157570

--000000000000468a4205cf5c0263
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 2:03 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> This library is a dependancy of xserver-xorg 21.1.0.
>

I wonder if we need this to be in core layer though


> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
> b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
> new file mode 100644
> index 0000000000..628ccfb647
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Library providing a standalone version of the X server \
> +implementation of the VESA CVT standard timing modelines generator"
> +HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
> +BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
> +SECTION = "x11/libs"
> +
> +SRC_URI = "git://
> gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
> +SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson
> +
> +FILES:${PN} = " \
> +    ${libdir}/libxcvt.so.0* \
> +    ${bindir}/cvt \
> +"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157569):
> https://lists.openembedded.org/g/openembedded-core/message/157569
> Mute This Topic: https://lists.openembedded.org/mt/86638516/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000468a4205cf5c0263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 27, 2021 at 2:03 PM Oleksandr Kravchuk &lt;<a h=
ref=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksandr-kra=
vchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This lib=
rary is a dependancy of xserver-xorg 21.1.0.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if we n=
eed this to be in core layer though</div><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksan=
dr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&g=
t;<br>
---<br>
=C2=A0.../xorg-lib/<a href=3D"http://libxcvt_0.1.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libxcvt_0.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/<a href=3D"http://l=
ibxcvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a><=
br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcvt_0.1.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a> b/meta/recip=
es-graphics/xorg-lib/<a href=3D"http://libxcvt_0.1.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">libxcvt_0.1.1.bb</a><br>
new file mode 100644<br>
index 0000000000..628ccfb647<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcvt_0.1.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;Library providing a standalone version of the X server \=
<br>
+implementation of the VESA CVT standard timing modelines generator&quot;<b=
r>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/xorg/lib/libx=
cvt" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/xo=
rg/lib/libxcvt</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.org/xorg/lib/li=
bxcvt/-/issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/xorg/lib/libxcvt/-/issues</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D129947a06984d6faa6f9a9788f=
a2a03f&quot;<br>
+SECTION =3D &quot;x11/libs&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/xorg/lib/=
libxcvt.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.f=
reedesktop.org/xorg/lib/libxcvt.git;protocol=3Dhttps</a>&quot;<br>
+SRCREV =3D &quot;6fe840b9295cfdc41bd734586c5b8756f6af6f9b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit meson<br>
+<br>
+FILES:${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/libxcvt.so.0* \<br>
+=C2=A0 =C2=A0 ${bindir}/cvt \<br>
+&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157569): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157569" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157569</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86638516/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86638516/1997914</a><br>
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

--000000000000468a4205cf5c0263--

