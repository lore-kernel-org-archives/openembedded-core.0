Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 16E907920B;
	Thu, 11 Oct 2018 06:25:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r63-v6so7715959wma.4;
	Wed, 10 Oct 2018 23:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/iNtSksqmdNlmT1f8NiUevGgze5gfDPcL0J055pCDEQ=;
	b=l2ttIOyTARMk4Qrp4SV2MDKbglkwJ5GXCzLfh2TIT0hcegq9eci4K5QRs1iyQawXOe
	yE2NlqRCjTjhzMDiPPhqcZirsX0rk76p/z4oYKQrIKf7VAITZIHg8sHiagnhXMOYIslA
	Ve37oxi9OJ73E7+qykPNdSC9CLP3fn0wvqVh6CMkbmjNQeqovag4G2DCbDgi9P23cwHA
	CNGX8uwpu//wu3y37+ztnxyJQ5jEUCKS+UB2PcEB7GZXoJqrqhue5zWxJJRN/mRMPAWK
	f4KF+rEg5dMUWWusnuIYYj2sRoPmykpLWa/0Z0/svFyxLZ2qw6ojlgytLzWyH8iKGFMI
	Pflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/iNtSksqmdNlmT1f8NiUevGgze5gfDPcL0J055pCDEQ=;
	b=DUQ0pFkE6uyGXxGBh82FA7Nl/37s/40sPhK9xJOkmbD40SRHMmV4eNZKUCsA81Btdd
	FstuYlPwlRjw3hiWDYFDJP/kqivGMY9iw/9LtwKeZ2x89QDhabIVA4E3tePnZS3DiiNn
	C8UYjLnppuJSjaDnIWYbeIaaCbnQF2IyBJw3lchAowYiJtxEfHTcKwB4thp4t1J72Wc9
	nRDN3cuUw9sxygSNd0G4IzkcvDGN4jkSXM1FEfMdTKWRTsd00RQf0GDxiyVKbRH4nHPH
	H1DN4WBO6J2MncJPpwNoiDC93ne6DCNg1+t79wGGYwsPRX0vqJ/kjBqQdZfu5Tq28KY7
	vDtw==
X-Gm-Message-State: ABuFfohBI6Qho8dfRg/T5vzzrdBoX3lNb2w8Vlp1OyTMsLKCpMkB2G0O
	5KyJXgRxrvpFAtZrGTBAttuvodzWUBqtVGMYBds=
X-Google-Smtp-Source: ACcGV61XJMAyMKEPjqgwTPWU06v6VOimfBx/Q2W/TIunI2fcpUXDgcKHtlxwqpyeLPuWyXu7pFZFRCJd65hr0hbKc8s=
X-Received: by 2002:a1c:bce:: with SMTP id 197-v6mr438903wml.15.1539239101590; 
	Wed, 10 Oct 2018 23:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
In-Reply-To: <20181010121845.987A72351DE@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Oct 2018 08:24:54 +0200
Message-ID: <CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 06:25:01 -0000
Content-Type: multipart/alternative; boundary="000000000000dff0eb0577ee0753"

--000000000000dff0eb0577ee0753
Content-Type: text/plain; charset="UTF-8"

This is causing a lot of QA errors like:

lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on
lib32-locale-base-ru-ru, but it isn't a build dependency? [build-deps]
lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on
lib32-locale-base-tr-tr, but it isn't a build dependency? [build-deps]

On Wed, Oct 10, 2018 at 2:18 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit f1c122fdc14624a659f8d4b07e1ff1f21e472e50
> Author: Ross Burton <ross.burton@intel.com>
> AuthorDate: Tue Oct 9 12:00:19 2018 +0100
>
>     glib-2.0: add missing locale dependencies to PN-ptest
>
>     The test suite skips several tests if the required locales are not
> found, so add
>     them as dependencies of glib-2.0-ptest.
>
>     (From OE-Core rev: b9317997bd4527b7873eb4f903cc4890b5b3580f)
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> index ad4f2ae..92dcf99 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -140,6 +140,8 @@ RDEPENDS_${PN}-ptest += "\
>              shared-mime-info \
>             "
>
> +# When https://gitlab.gnome.org/GNOME/glib/issues/1343 is
> +# fixed add locale-base-pl-pl
>  RDEPENDS_${PN}-ptest_append_libc-glibc = "\
>              glibc-gconv-utf-16 \
>              glibc-charmap-utf-8 \
> @@ -152,6 +154,18 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
>              glibc-gconv-iso8859-15 \
>              glibc-charmap-invariant \
>              glibc-localedata-translit-cjk-variants \
> +            locale-base-tr-tr \
> +            locale-base-lt-lt \
> +            locale-base-ja-jp.euc-jp \
> +            locale-base-fa-ir \
> +            locale-base-ru-ru \
> +            locale-base-de-de \
> +            locale-base-hr-hr \
> +            locale-base-el-gr \
> +            locale-base-fr-fr \
> +            locale-base-fr-fr \
> +            locale-base-es-es \
> +            locale-base-en-gb \
>             "
>
>  INSANE_SKIP_${PN}-ptest += "libdir"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--000000000000dff0eb0577ee0753
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This is causing a lot of QA errors like:<=
div><br></div><div><div>lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepend=
s on lib32-locale-base-ru-ru, but it isn&#39;t a build dependency? [build-d=
eps]</div><div>lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on lib3=
2-locale-base-tr-tr, but it isn&#39;t a build dependency? [build-deps]</div=
></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, =
Oct 10, 2018 at 2:18 PM &lt;<a href=3D"mailto:git@git.openembedded.org">git=
@git.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">This is an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit f1c122fdc14624a659f8d4b07e1ff1f21e472e50<br>
Author: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;<br>
AuthorDate: Tue Oct 9 12:00:19 2018 +0100<br>
<br>
=C2=A0 =C2=A0 glib-2.0: add missing locale dependencies to PN-ptest<br>
<br>
=C2=A0 =C2=A0 The test suite skips several tests if the required locales ar=
e not found, so add<br>
=C2=A0 =C2=A0 them as dependencies of glib-2.0-ptest.<br>
<br>
=C2=A0 =C2=A0 (From OE-Core rev: b9317997bd4527b7873eb4f903cc4890b5b3580f)<=
br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc<br>
index ad4f2ae..92dcf99 100644<br>
--- a/meta/recipes-core/glib-2.0/glib.inc<br>
+++ b/meta/recipes-core/glib-2.0/glib.inc<br>
@@ -140,6 +140,8 @@ RDEPENDS_${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared-mime-info \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
+# When <a href=3D"https://gitlab.gnome.org/GNOME/glib/issues/1343" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/issues/13=
43</a> is<br>
+# fixed add locale-base-pl-pl<br>
=C2=A0RDEPENDS_${PN}-ptest_append_libc-glibc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-utf-16 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap-utf-8 \<br>
@@ -152,6 +154,18 @@ RDEPENDS_${PN}-ptest_append_libc-glibc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-iso8859-15 \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap-invariant \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-localedata-translit-c=
jk-variants \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-tr-tr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-lt-lt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-ja-jp.euc-jp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-fa-ir \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-ru-ru \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-de-de \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-hr-hr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-el-gr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-fr-fr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-fr-fr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-es-es \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-en-gb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN}-ptest +=3D &quot;libdir&quot;<br>
<br>
-- <br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
-- <br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</blockquote></div>

--000000000000dff0eb0577ee0753--
