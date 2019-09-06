Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18C727F3B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:15:37 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 201so5697707qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ImzB9MYOSDCqz8Xk82L9Xx6Hhm4u/1MSECtAEzYemM=;
	b=lvhDVm2wu0rUdw/9BPU+cflGu/wYSOrtZusef0KAM1wjw4HQ785bSI6JrM+Uw0vXkX
	PPFNDxeXdf0CUBzU2AyLigJL7amnMW/hJnWPHT3VoyVkfaNsn/9r2bOi1ifUVcGDVYc7
	qh3H+UrQbwW/a2coEDMdTjZ/5dOA4H6DEJTSCxR4PDtoCAKok6+ivh+69q2ry2rz1AEM
	ORkola20Mk1wX02JMOFi6JGPh+MJni2Z/IVkzZzS/v8lWcajuWxJBOEUQ7qy++xvl62Y
	5M/mL6Ub+N2MI15BGIIqgtMGAtsuSXZ54zMUzVg8XsmYATrmlpgfT02Kwco9qkAgTRPr
	UcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ImzB9MYOSDCqz8Xk82L9Xx6Hhm4u/1MSECtAEzYemM=;
	b=DiI0rzeezrmjeTPBr34+K8B1eG0q7gIIHXJhPDkiv44xLjcnBAdjUc2fxaa95kAE5V
	BRZQC4/EMpiqiAFSeSTwTUOtZ0+0UJ8VQiWuef+tFyb3a6CPvvI+mJuBL5TCuVX1IYeC
	u8QYpBu6GkxV1BjUfMGCg06n54E7gRP03oBRvnqyoSKuPag3vc9nRGKtF8GIoccv00CT
	5lTHNTnQ8UhRatq8tbNpa0lJz+Ac99IRzOcZZt677jfzxG3eX2nINYqMnwZnyb28VeJ7
	6I5NST3WOz+q9IZRlzlOSLHTGW3GnCFc9lHnBmr0C8q213yjoZFDR1yzzUVuYB70s7K5
	mT3g==
X-Gm-Message-State: APjAAAUVFH++oHW873h3SKvTq7TS+6C4cgkK1KROHz3csfGCeo7/LTvL
	PkRSGGxsUHZ5p3cAaE7VNFYW8oDgf6p7rpkIhTY=
X-Google-Smtp-Source: APXvYqwlYa6rj1FNU3G+73C0FJ/GtGGm+yWqHMce6elSithXjrHytkBvJ4WICxWksO+FIvebJFkEjgyHOqB3xUq7G+A=
X-Received: by 2002:a37:4f97:: with SMTP id d145mr9144698qkb.474.1567779338777;
	Fri, 06 Sep 2019 07:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
	<20190906072347.31616-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190906072347.31616-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:15:27 -0700
Message-ID: <CAMKF1so5hDAtGESfwjCNNGJtnikskPqQg2rFsTKdxYh-g9QXAQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc-cross: Fix header file corruption problems
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
X-List-Received-Date: Fri, 06 Sep 2019 14:15:38 -0000
Content-Type: multipart/alternative; boundary="00000000000092f7ae0591e3121c"

--00000000000092f7ae0591e3121c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2019 at 12:24 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> gcc's makefile can move files, replacing with the contents "timestamp".
> This
> corrupts the headers and breaks things like the gcc testsuite.
>
> Add in a fix to ensure the headers are not corrupted through their
> hardlink copies.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-cross.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> b/meta/recipes-devtools/gcc/gcc-cross.inc
> index e417b898734..95af6d89a9d 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -212,6 +212,9 @@ do_gcc_stash_builddir[cleandirs] =3D "${BUILDDIRSTASH=
}"
>  do_gcc_stash_builddir () {
>         dest=3D${BUILDDIRSTASH}
>         hardlinkdir . $dest
> +       # Makefile does move-if-change which can end up with 'timestamp'
> as file contents so break links to those files
> +       rm $dest/gcc/include/*.h
> +       cp gcc/include/*.h $dest/gcc/include/
>  }


I think we moved them outside gcc dir isn=E2=80=99t it

>
>  addtask do_gcc_stash_builddir after do_compile before do_install
>  SSTATETASKS +=3D "do_gcc_stash_builddir"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000092f7ae0591e3121c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019 at 12:24 AM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">gcc&#39;s makefile can move files, replacing with the contents &quo=
t;timestamp&quot;. This<br>
corrupts the headers and breaks things like the gcc testsuite.<br>
<br>
Add in a fix to ensure the headers are not corrupted through their hardlink=
 copies.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-cross.inc | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtool=
s/gcc/gcc-cross.inc<br>
index e417b898734..95af6d89a9d 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
@@ -212,6 +212,9 @@ do_gcc_stash_builddir[cleandirs] =3D &quot;${BUILDDIRST=
ASH}&quot;<br>
=C2=A0do_gcc_stash_builddir () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest=3D${BUILDDIRSTASH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardlinkdir . $dest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Makefile does move-if-change which can end up=
 with &#39;timestamp&#39; as file contents so break links to those files<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm $dest/gcc/include/*.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp gcc/include/*.h $dest/gcc/include/<br>
=C2=A0}</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think w=
e moved them outside gcc dir isn=E2=80=99t it=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
=C2=A0addtask do_gcc_stash_builddir after do_compile before do_install<br>
=C2=A0SSTATETASKS +=3D &quot;do_gcc_stash_builddir&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000092f7ae0591e3121c--
