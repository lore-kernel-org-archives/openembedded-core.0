Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.9609.1618920462257564505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 05:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e17ti1yf;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a12so8199545uak.6
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 05:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j5b/mi2sj8nzR/0dAeHnmK/zS4Fetm2rHFl/LTVkokQ=;
        b=e17ti1yfT0kc7Y73FXqJlH4IbU8wcEqkKi3Oe4GrGDLEDiO1r5QBVatw8uzF+lLp5t
         +w4u2MZ177DBGl7bsCqUUL5pXkxiaTDuig7me+oPx/VZkYWzhNkCj86INdfSRHu/69UF
         LgyK/chubrzKgUsn/Y5yYts06BpyYrhgUALT4jdVr1lUdUvcHRZY1gCJpfYjq+0GcGnL
         etJXy2bTz5aTC9xn9ACLsOgDOvIHoX68ENTtfzaOZwnIG2Seu2b6gItHs/Es9+5YNim5
         MCcQxkA6LdDW8u3yHBQrDYifslFZ0RoLTR26TiUpZIRicx9TZgFa8ywVZDO+wUcrkN8X
         93qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j5b/mi2sj8nzR/0dAeHnmK/zS4Fetm2rHFl/LTVkokQ=;
        b=Bga4lwcQ/FQKxakNLUsBIrZ5PsKCpLY2lz8uoyNOZ5CdkndKZaeS3m85JKnV8FM7Ja
         86JysQ67S/OaTuAECDEPazrXmwwCsdKLeecLf2pt40uw6QvZje5fgzrVR34FLUYxgMn+
         LLJY/Fy0wwpJi8By0tiZMHfAY0/oJVocT7BdsRQKJYAQapabodLaY+8yG/2BXC7tjtGg
         sRX2lA0QzJhDWrdtVV2Q5WfKeoMt79EPEtG4ATq546z3sseRNuu6sfVF4wMzO6o8rCGh
         qzXTb13nH0oq+urHUKaVshqcYh1XGhKeq267pBLRBKfje52YLewIu9g6ybmjkLfjv/r1
         KpYw==
X-Gm-Message-State: AOAM530Mi9t7CjddT34QqMVLayj8K55BXtEwti07Zc8XDbUQRacmZLa0
	fjHHwOMbad8ICufYEm4O8VQGjgY7uPhArbqemThsIT3FeS0=
X-Google-Smtp-Source: ABdhPJzfOgutcQFQxvSeM5MC+S8yVsD+lJvdWz0Wv9DDdu7ChuvblUnSx8VTIdQiiSrlxrY3nwOqSdKwAoInxyT6mfQ=
X-Received: by 2002:ab0:21d1:: with SMTP id u17mr5614750uan.22.1618920461451;
 Tue, 20 Apr 2021 05:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
 <20210419090044.582453-2-alex.kanavin@gmail.com> <42dd97b7-c7ed-6cf3-7604-2c84cbfb59cf@gmail.com>
In-Reply-To: <42dd97b7-c7ed-6cf3-7604-2c84cbfb59cf@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Apr 2021 14:07:30 +0200
Message-ID: <CANNYZj9M9ncTmY1XJ6gL0_bhs3naoyE+A7x52RU7KW__FyfqmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] libmicrohttpd: add a recipe from meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000644e605c0664b28"

--0000000000000644e605c0664b28
Content-Type: text/plain; charset="UTF-8"

Thanks, I sent a patch for it to oe-devel.

Alex

On Mon, 19 Apr 2021 at 17:45, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 4/19/21 2:00 AM, Alexander Kanavin wrote:
> > This is required to enable debuginfod in elfutils.
> >
>
> Don't forget to send a patch to remove  it from meta-openembedded once
> merged in core.
>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   .../libmicrohttpd/libmicrohttpd_0.9.72.bb     | 31 +++++++++++++++++++
> >   1 file changed, 31 insertions(+)
> >   create mode 100644 meta/recipes-support/libmicrohttpd/
> libmicrohttpd_0.9.72.bb
> >
> > diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
> b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
> > new file mode 100644
> > index 0000000000..66c48da3b7
> > --- /dev/null
> > +++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
> > @@ -0,0 +1,31 @@
> > +DESCRIPTION = "A small C library that is supposed to make it easy to
> run an HTTP server as part of another application"
> > +HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
> > +LICENSE = "LGPL-2.1+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
> > +SECTION = "net"
> > +
> > +DEPENDS = "file"
> > +
> > +SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
> > +SRC_URI[md5sum] = "2a286193af88ab2ae3149748d4b46187"
> > +SRC_URI[sha256sum] =
> "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c26552260264c2ff8"
> > +
> > +inherit autotools lib_package pkgconfig gettext
> > +
> > +CFLAGS += "-pthread -D_REENTRANT"
> > +
> > +EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
> > +
> > +PACKAGECONFIG ?= "curl https"
> > +PACKAGECONFIG_append_class-target = "\
> > +        ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
> > +"
> > +PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> > +PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
> > +PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt
> gnutls,"
> > +
> > +do_compile_append() {
> > +    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
> > +}
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> >
> >
> >
> > 
> >
>

--0000000000000644e605c0664b28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I sent a patch for it to oe-devel.</div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 19 Apr 2021 at 17:45, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 4/19/21 2:00 AM, Alexander Kanavin wrote:<br>
&gt; This is required to enable debuginfod in elfutils.<br>
&gt; <br>
<br>
Don&#39;t forget to send a patch to remove=C2=A0 it from meta-openembedded=
 once <br>
merged in core.<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../libmicrohttpd/<a href=3D"http://libmicrohttpd_0.9.72.=
bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.9.72.bb</a>=C2=A0 =
=
=C2=A0 =C2=A0| 31 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 31 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libmicrohttpd/<a =
href=3D"http://libmicrohttpd_0.9.72.bb" rel=3D"noreferrer" target=3D"_blank=
">libmicrohttpd_0.9.72.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/libmicrohttpd/<a href=3D"http://lib=
microhttpd_0.9.72.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.=
9.72.bb</a> b/meta/recipes-support/libmicrohttpd/<a href=3D"http://libmicro=
httpd_0.9.72.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.9.72.=
bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..66c48da3b7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libmicrohttpd/<a href=3D"http://libmicroht=
tpd_0.9.72.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.9.72.bb=
</a><br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +DESCRIPTION =3D &quot;A small C library that is supposed to make it =
easy to run an HTTP server as part of another application&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/libmicroht=
tpd/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/libm=
icrohttpd/</a>&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D57d09285feac8a64efa8=
78e692b14f36&quot;<br>
&gt; +SECTION =3D &quot;net&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;file&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz&qu=
ot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;2a286193af88ab2ae3149748d4b46187&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc=
50fe9d59c26552260264c2ff8&quot;<br>
&gt; +<br>
&gt; +inherit autotools lib_package pkgconfig gettext<br>
&gt; +<br>
&gt; +CFLAGS +=3D &quot;-pthread -D_REENTRANT&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF +=3D &quot;--disable-static --with-gnutls=3D${STAGING_L=
IBDIR}/../&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ?=3D &quot;curl https&quot;<br>
&gt; +PACKAGECONFIG_append_class-target =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&=
#39;, &#39;largefile&#39;, d)} \<br>
&gt; +&quot;<br>
&gt; +PACKAGECONFIG[largefile] =3D &quot;--enable-largefile,--disable-larg=
efile,,&quot;<br>
&gt; +PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl,&quo=
t;<br>
&gt; +PACKAGECONFIG[https] =3D &quot;--enable-https,--disable-https,libgcr=
ypt gnutls,&quot;<br>
&gt; +<br>
&gt; +do_compile_append() {<br>
&gt; +=C2=A0 =C2=A0 sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc<br>
&gt; +}<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--0000000000000644e605c0664b28--
