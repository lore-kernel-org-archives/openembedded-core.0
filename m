Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAA161326
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 20:44:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so6129395wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KLKVv9sn1J2H0b0Bar75VKXk/DD0pLH57QQhCLFnIsA=;
	b=JKipdBDTGFQJjCS3fSUYBRk9dj7DWIte0Psn13DoULyIG8TbWI5QeA5WAvYy1/wWX7
	L3Px0UrMHirC6hvJML1KZRIGI2TGpymKBcVSZrjL3GmQn03d+KpNPZqHplKGaXy5wrtG
	JuZuyhtCyxEbzHMLMpa4yVRve9h6CUgVNh72/BHQx3qegH9LUS7c2nepwbSA80WGhLkO
	Q0FmeHfBwDJfgDZfJcd/3ACeZSkMtFhrlQ3pt8/LAn4T+qCu10a/nreFr1Ilf85ZJmXn
	qkbgY+3N5thwCoRyFhyY1kkgcy/+RDA/UD5H/FILYR5oCmfWFqeDBnpZR537p9wJk+8k
	2icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KLKVv9sn1J2H0b0Bar75VKXk/DD0pLH57QQhCLFnIsA=;
	b=fCI+RNpefsZbZvMaaIN2ozigA9AJkp8VW63e6q0Fy5IoF8sNS1egyI02pOdPKGw3qv
	R3/IrRtPgaOFA+i7OeWyLSG97jxEPCmnqxBQ6nF97jNUvioiicpTPgCGoSCgklT+egPu
	vepYGHUStMfRYuIt9VWFlv8EUishg5uLRrm0h6IjFm+XN5LgJwvYCKojEbipRknor6Q6
	GufU20EIDv4CkpXzb8zs+8ZmpCvMsK8j0MXDSxoYLdQVZpzf1Vq+iJ7cyD86RbcrxxgX
	NOvCAKEj1Vl18awktLE/PDtV811wBDFb+RFvvT4RbUi+VWq3KyvJBbb5kNChEI+XQlac
	7Amg==
X-Gm-Message-State: APjAAAW2jt0g+MqaHo3DwtXwfCXSMXl6MnB3YeSyuDIt/MhLuOhHncIF
	XohVCLoB3bVcV3q/Vy/4Zf0nNavxewtbBCHhiaA=
X-Google-Smtp-Source: APXvYqzk84pcawCEossJjxCVGWvKgq0XE1saYAnlMOHK05Up4T/FjlJADlGQjfvRRu0TAZyfPWcNZABswHB6D4RPnc4=
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr44545051wrt.241.1582231461890; 
	Thu, 20 Feb 2020 12:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20200220185150.23422-1-JPEWhacker@gmail.com>
	<e81900d2-4692-ca05-841d-d2fbceac70c2@gmail.com>
In-Reply-To: <e81900d2-4692-ca05-841d-d2fbceac70c2@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Feb 2020 14:44:08 -0600
Message-ID: <CAJdd5GYXyaT+YnRTs4nvRucini2QEYMbBNRoBcrVu9SSpTr9Eg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/meson.bbclass: Explicitly mark functions as missing in MinGW
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
X-List-Received-Date: Thu, 20 Feb 2020 20:44:21 -0000
Content-Type: multipart/alternative; boundary="0000000000003d0eca059f07f84c"

--0000000000003d0eca059f07f84c
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 20, 2020, 1:30 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 2/20/20 10:51 AM, Joshua Watt wrote:
> > meson (with some help from GCC) misdetects certain builtin functions as
> > being present on MinGW, when in fact they are not. Fix it by explicitly
> > marking the functions as missing. This requires rearranging the
> > meson.cross file to put the [properties] section at the end so the
> > append works properly (meson can't handle duplicate sections).
> >
>
> patch is fine workaround, but I think meson should look for strndup in
> string.h
>

Agreed. I think the upstream fix would be better, and I will look at that
also.


> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   meta/classes/meson.bbclass | 25 +++++++++++++++++--------
> >   1 file changed, 17 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index 06034e8b47..5c74658d01 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -96,14 +96,6 @@ readelf = ${@meson_array('READELF', d)}
> >   pkgconfig = 'pkg-config'
> >   llvm-config = 'llvm-config${LLVMVERSION}'
> >
> > -[properties]
> > -needs_exe_wrapper = true
> > -c_args = ${@meson_array('CFLAGS', d)}
> > -c_link_args = ${@meson_array('LDFLAGS', d)}
> > -cpp_args = ${@meson_array('CXXFLAGS', d)}
> > -cpp_link_args = ${@meson_array('LDFLAGS', d)}
> > -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> > -
> >   [host_machine]
> >   system = '${@meson_operating_system('HOST_OS', d)}'
> >   cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
> > @@ -115,6 +107,23 @@ system = '${@meson_operating_system('TARGET_OS',
> d)}'
> >   cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
> >   cpu = '${TARGET_ARCH}'
> >   endian = '${@meson_endian('TARGET', d)}'
> > +
> > +[properties]
> > +needs_exe_wrapper = true
> > +c_args = ${@meson_array('CFLAGS', d)}
> > +c_link_args = ${@meson_array('LDFLAGS', d)}
> > +cpp_args = ${@meson_array('CXXFLAGS', d)}
> > +cpp_link_args = ${@meson_array('LDFLAGS', d)}
> > +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> > +EOF
> > +}
> > +
> > +do_write_config_append_mingw32() {
> > +    # meson mis-detects the presence of several builtin functions in
> MinGW
> > +    # (see https://github.com/mesonbuild/meson/issues/3672).
> > +    # Explicitly mark these functions as missing in the cross file
> > +    cat >>${WORKDIR}/meson.cross <<EOF
> > +has_function_strndup = false
> >   EOF
> >   }
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003d0eca059f07f84c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 20, 2020, 1:30 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
On 2/20/20 10:51 AM, Joshua Watt wrote:<br>
&gt; meson (with some help from GCC) misdetects certain builtin functions a=
s<br>
&gt; being present on MinGW, when in fact they are not. Fix it by explicitl=
y<br>
&gt; marking the functions as missing. This requires rearranging the<br>
&gt; meson.cross file to put the [properties] section at the end so the<br>
&gt; append works properly (meson can&#39;t handle duplicate sections).<br>
&gt; <br>
<br>
patch is fine workaround, but I think meson should look for strndup in <br>
string.h<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Agreed. I think the upstream fix would be better, and I will look=
 at that also.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/meson.bbclass | 25 +++++++++++++++++--------<=
br>
&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<b=
r>
&gt; index 06034e8b47..5c74658d01 100644<br>
&gt; --- a/meta/classes/meson.bbclass<br>
&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; @@ -96,14 +96,6 @@ readelf =3D ${@meson_array(&#39;READELF&#39;, d)}<b=
r>
&gt;=C2=A0 =C2=A0pkgconfig =3D &#39;pkg-config&#39;<br>
&gt;=C2=A0 =C2=A0llvm-config =3D &#39;llvm-config${LLVMVERSION}&#39;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -[properties]<br>
&gt; -needs_exe_wrapper =3D true<br>
&gt; -c_args =3D ${@meson_array(&#39;CFLAGS&#39;, d)}<br>
&gt; -c_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, d)}<br>
&gt; -cpp_args =3D ${@meson_array(&#39;CXXFLAGS&#39;, d)}<br>
&gt; -cpp_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, d)}<br>
&gt; -gtkdoc_exe_wrapper =3D &#39;${B}/gtkdoc-qemuwrapper&#39;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0[host_machine]<br>
&gt;=C2=A0 =C2=A0system =3D &#39;${@meson_operating_system(&#39;HOST_OS&#39=
;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0cpu_family =3D &#39;${@meson_cpu_family(&#39;HOST_ARCH&#39=
;, d)}&#39;<br>
&gt; @@ -115,6 +107,23 @@ system =3D &#39;${@meson_operating_system(&#39;TA=
RGET_OS&#39;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0cpu_family =3D &#39;${@meson_cpu_family(&#39;TARGET_ARCH&#=
39;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0cpu =3D &#39;${TARGET_ARCH}&#39;<br>
&gt;=C2=A0 =C2=A0endian =3D &#39;${@meson_endian(&#39;TARGET&#39;, d)}&#39;=
<br>
&gt; +<br>
&gt; +[properties]<br>
&gt; +needs_exe_wrapper =3D true<br>
&gt; +c_args =3D ${@meson_array(&#39;CFLAGS&#39;, d)}<br>
&gt; +c_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, d)}<br>
&gt; +cpp_args =3D ${@meson_array(&#39;CXXFLAGS&#39;, d)}<br>
&gt; +cpp_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, d)}<br>
&gt; +gtkdoc_exe_wrapper =3D &#39;${B}/gtkdoc-qemuwrapper&#39;<br>
&gt; +EOF<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_write_config_append_mingw32() {<br>
&gt; +=C2=A0 =C2=A0 # meson mis-detects the presence of several builtin fun=
ctions in MinGW<br>
&gt; +=C2=A0 =C2=A0 # (see <a href=3D"https://github.com/mesonbuild/meson/i=
ssues/3672" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.=
com/mesonbuild/meson/issues/3672</a>).<br>
&gt; +=C2=A0 =C2=A0 # Explicitly mark these functions as missing in the cro=
ss file<br>
&gt; +=C2=A0 =C2=A0 cat &gt;&gt;${WORKDIR}/meson.cross &lt;&lt;EOF<br>
&gt; +has_function_strndup =3D false<br>
&gt;=C2=A0 =C2=A0EOF<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000003d0eca059f07f84c--
