Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 371896D147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 21:42:53 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id f11so7905364qti.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ghz2CJUO1+Zi9CR759jOdWdmxf/Ew+rRr0VYPp0kZJI=;
	b=DHpnTX4Qu+I7LDX7F7+uU0z09r3Mge5nHORrh2jC5wxuVlk2dLjnG9xy6ATZBzTh9g
	WCOLCPFtI00Rog7UO49znVYGSxqEpTeKdGHFrB18r/zoCgsKPi59Bn85A95VnF9E/Jrp
	r9LhDrm535lFaA3ZjBEQ33bYgM5rSET/FL5EnGxs/o7v4xUglLk93mYWYBUjVGSuSrnF
	8xzlpZj8AdzDHmpDhovzChVg1zYjQ3SGy4HNOMaCsr5nqjMzCp8Yge2t//9aUcNQrcug
	D1Vj+MVPrS2DnL6iMnN3wvm+Lh4DasXR65O8NdJ0BatN2FtD/o/x75Y+d6RP/97wEw7n
	2QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ghz2CJUO1+Zi9CR759jOdWdmxf/Ew+rRr0VYPp0kZJI=;
	b=cuzxlNewrZRLPgFg70MewKeQ4h/BJqzB+3bS+lnKIgGKIBVSkUhLVu7Z9sUVDolCUd
	Bl6TlWP3uSf2OJzCMPgLdPU8HjaEVJKLW0M7ad17f1w48WQOzwbV27mZKu5r4i5h9/V9
	jB6/oReEatn9KWHRVjZKJzLzO9m9gb0ymuWy5nVhh6mY8ndp4j4ASX/Eb5qQqWcQNLOU
	tz2mMdlqhiQSHvRnvXazbn6Z2U2an3EFDapqd/TtWqxmiq2l6mHxz5nltFzUYrX1tCKj
	tm+2i+d+Vvzox4Ea+O9OKFLV/dwlGZsuhflCT+f79u7k1DpjlJXvBSEI0p+YvjwPBiWq
	t+oQ==
X-Gm-Message-State: APjAAAULD0hcFMa6qNPxJatEZphxfpGOo/A9vlJQhSws8SeuzVrQYEXU
	tMNCTZVcqHirBFShyiWDOCM/hNygmKPmWeXEWso=
X-Google-Smtp-Source: APXvYqyYf+8fCd8FIVaAL1bL+QvQAPlUpiEJQ7fzWEpe9ZS/d1t2OOKm+ThvS4oqj/sqQmPjTjtWqFOrotsg15o7fvs=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr215369qtn.253.1552599774710;
	Thu, 14 Mar 2019 14:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <1552592626-25569-1-git-send-email-rbilovol@cisco.com>
In-Reply-To: <1552592626-25569-1-git-send-email-rbilovol@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 14:42:43 -0700
Message-ID: <CAMKF1sp1JRLepD130zWkGgk1=Dx5q2+Fb=2HTwzH0RnEUMWZaQ@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-nisplus: Add recipe
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
X-List-Received-Date: Thu, 14 Mar 2019 21:42:54 -0000
Content-Type: multipart/alternative; boundary="0000000000000cd246058414ce9d"

--0000000000000cd246058414ce9d
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 14, 2019 at 12:43 PM Ruslan Bilovol <rbilovol@cisco.com> wrote:

> Same as with libnss-nis - this will substitute
> the glibc nisplus module which has been removed
>
> SRCREV points to 1.3 release plus patch on top which
> allows to build with recent glibc versions


This looks okay but not
An Oe core candidate to me

>
>
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>  .../libnss-nisplus/libnss-nisplus.bb               | 31
> ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
>
> diff --git a/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> new file mode 100644
> index 0000000..2dbeee7
> --- /dev/null
> +++ b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
> +
> +DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
> +This code was formerly part of glibc, but is now standalone to\
> +be able to link against TI-RPC for IPv6 support."
> +
> +HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +SECTION = "libs"
> +DEPENDS += "libtirpc libnsl2"
> +
> +PV = "1.3+git${SRCPV}"
> +
> +SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
> +
> +SRC_URI = "git://github.com/thkukuk/libnss_nisplus \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND += "native nativesdk"
> +#
> +# We will skip parsing this packagegeoup for non-glibc systems
> +#
> +COMPATIBLE_HOST_libc-musl = 'null'
> --
> 1.9.1
>
>

--0000000000000cd246058414ce9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 14, 2019 at 12:43 PM Ruslan Bilovol &lt;<a href=
=3D"mailto:rbilovol@cisco.com">rbilovol@cisco.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Same as with libnss-nis - this will substitut=
e<br>
the glibc nisplus module which has been removed<br>
<br>
SRCREV points to 1.3 release plus patch on top which<br>
allows to build with recent glibc versions</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">This looks okay but not</div><div dir=3D"auto">An=
 Oe core candidate to me=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Ruslan Bilovol &lt;<a href=3D"mailto:rbilovol@cisco.com" tar=
get=3D"_blank">rbilovol@cisco.com</a>&gt;<br>
---<br>
=C2=A0.../libnss-nisplus/<a href=3D"http://libnss-nisplus.bb" rel=3D"norefe=
rrer" target=3D"_blank">libnss-nisplus.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++++++++++++++++++++<br>
=C2=A01 file changed, 31 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/libnss-nisplus/<a href=3D"ht=
tp://libnss-nisplus.bb" rel=3D"noreferrer" target=3D"_blank">libnss-nisplus=
.bb</a><br>
<br>
diff --git a/meta/recipes-extended/libnss-nisplus/<a href=3D"http://libnss-=
nisplus.bb" rel=3D"noreferrer" target=3D"_blank">libnss-nisplus.bb</a> b/me=
ta/recipes-extended/libnss-nisplus/<a href=3D"http://libnss-nisplus.bb" rel=
=3D"noreferrer" target=3D"_blank">libnss-nisplus.bb</a><br>
new file mode 100644<br>
index 0000000..2dbeee7<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/libnss-nisplus/<a href=3D"http://libnss-nisplus=
.bb" rel=3D"noreferrer" target=3D"_blank">libnss-nisplus.bb</a><br>
@@ -0,0 +1,31 @@<br>
+# Copyright (C) 2019 Ruslan Bilovol &lt;<a href=3D"mailto:rbilovol@cisco.c=
om" target=3D"_blank">rbilovol@cisco.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+SUMMARY =3D &quot;NSS module for glibc, to provide NIS+ support for glibc&=
quot;<br>
+<br>
+DESCRIPTION =3D &quot;This package contains the NSS NIS+ plugin for glibc.=
\<br>
+This code was formerly part of glibc, but is now standalone to\<br>
+be able to link against TI-RPC for IPv6 support.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/thkukuk/libnss_nisplus" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/thkukuk/libnss_nispl=
us</a>&quot;<br>
+LICENSE =3D &quot;LGPL-2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+DEPENDS +=3D &quot;libtirpc libnsl2&quot;<br>
+<br>
+PV =3D &quot;1.3+git${SRCPV}&quot;<br>
+<br>
+SRCREV =3D &quot;c6934373c7bac91499ff7bbe7d2439599325ca63&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/thkukuk/libnss_nisplu=
s" rel=3D"noreferrer" target=3D"_blank">github.com/thkukuk/libnss_nisplus</=
a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
+<br>
+BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
+#<br>
+# We will skip parsing this packagegeoup for non-glibc systems<br>
+#<br>
+COMPATIBLE_HOST_libc-musl =3D &#39;null&#39;<br>
-- <br>
1.9.1<br>
<br>
</blockquote></div></div>

--0000000000000cd246058414ce9d--
