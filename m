Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6296148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 10:01:53 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so268909vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 03:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=IUoTIH0lOcsX/oIv618RIg5CXIGGEOttMoymOKIgqr8=;
	b=UCHFcTi9Tvr475dJUxTp0OlD3Vyhiee4Z+ahXuuw+eNfRnK5SS6SpqKLSnVFSP26vj
	Yw50tr/5KMC/YPfGsJr+8SS1j0HW+pY6Ss5lSZnFyX9TFqQDhmi3a4uw8MwWLiiuhPCP
	tfEJc0bllelo/WHzxvkW2LVT9TI1zLgm7yqawB/XVf9SdyQN+KFli2rgXoyOVBjxjJpf
	e9Hu/YnyHE93vsBg3WarpYERASO/6cHnGawDDT5WG/tni/qVvwGeH+Y7zWBDqB61m1Lc
	M+0IGpYYyb6XTF1PgZdgb0v2xXddO4RtcyfWvVNndSeMYZWnr+fELI6bEmpe3/HFHGK8
	pA9A==
MIME-Version: 1.0
X-Received: by 10.220.176.71 with SMTP id bd7mr593942vcb.12.1369130513859;
	Tue, 21 May 2013 03:01:53 -0700 (PDT)
Received: by 10.220.98.7 with HTTP; Tue, 21 May 2013 03:01:53 -0700 (PDT)
In-Reply-To: <1369062325-30335-4-git-send-email-tf+lists.yocto@r-finger.com>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369062325-30335-4-git-send-email-tf+lists.yocto@r-finger.com>
Date: Tue, 21 May 2013 11:01:53 +0100
Message-ID: <CAJTo0LZn_xvXnyCUJ6UR+Dg2uge1_m6R85RMDi-+0Zsf54vW+w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQkApckO0+ubRNzDOl8nOnxpH6eFCMuZ9tPy5/d3emPFAGL5glz2h+oakZZJLpry3Y9uVM65
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/8] New cogl recipe (1.14.0)
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
X-List-Received-Date: Tue, 21 May 2013 10:01:54 -0000
Content-Type: multipart/alternative; boundary=001a11c1c278ee194504dd378930

--001a11c1c278ee194504dd378930
Content-Type: text/plain; charset=UTF-8

On Monday, 20 May 2013, Tomas Frydrych wrote:

> GL flavour:   'gl' for big GL or 'gles2' for GLES2
>               (GLES1 is availabe in cogl, but not supporeted here at
> present.)
>

Does this support enabling both GL and GLES2 in the same build? (at which
point the choice of backend becomes someone else's problem, but that's fine)


> +DEPENDS = "gtk-doc-native pango glib-2.0 gdk-pixbuf"
>

The inherit gtk-doc in clutter.bbclass already adds a dependency on gtk-doc.


> +EXTRA_OECONF += "--disable-introspection       \
> +                --disable-gtk-doc              \
>

gtk-doc.bbclass does this for you.


> +                ${@get_fpu_setting(bb, d)}     \
>

Unused, you can drop this.

+                --enable-examples-install      \
> +                --enable-debug                 \
> +                --disable-gl                   \
> +                --disable-gles1                \
> +                --disable-gles2                \
> +                --disable-glx                  \
>

Why are these not "disabled flags" in each of the relevant PACKAGECONFIG
definitions?

+       # Disable DOLT
> +       sed -i -e 's/^DOLT//' ${S}/configure.ac


This was removed from clutter/cogl in 2010, so drop this.

Ross

--001a11c1c278ee194504dd378930
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Monday, 20 May 2013, Tomas Frydrych  wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">GL flavour: =C2=A0 &#39;gl&#39; for big GL or &#39;gles2&#39; for GLE=
S2<br>

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (GLES1 is availabe in cogl=
, but not supporeted here at present.)<br></blockquote><div><br></div><div>=
Does this support enabling both GL and GLES2 in the same build? (at which p=
oint the choice of backend becomes someone else&#39;s problem, but that&#39=
;s fine)</div>
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">+DEPENDS =3D &quot;gtk-doc-=
native pango glib-2.0 gdk-pixbuf&quot;<br></blockquote><div><br></div><div>=
The inherit gtk-doc in clutter.bbclass already adds a dependency on gtk-doc=
.</div>
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">+EXTRA_OECONF +=3D &quot;--=
disable-introspection =C2=A0 =C2=A0 =C2=A0 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gtk-doc =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br></blockquote><div><br>=
</div><div>gtk-doc.bbclass does this for you.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">

+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@get_fpu_setting=
(bb, d)} =C2=A0 =C2=A0 \<br></blockquote><div><br></div><div>Unused, you ca=
n drop this.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-examples-=
install =C2=A0 =C2=A0 =C2=A0\<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-debug =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gl =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gles1 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gles2 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-glx =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br></blockquot=
e><div><br></div><div>Why are these not &quot;disabled flags&quot; in each =
of the relevant PACKAGECONFIG definitions?</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
+ =C2=A0 =C2=A0 =C2=A0 # Disable DOLT<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^DOLT//&#39; ${S}/<a href=3D"http:/=
/configure.ac" target=3D"_blank">configure.ac</a></blockquote><div><br></di=
v><div>This was removed from clutter/cogl in 2010, so drop this.</div><div>=
<br></div><div>
Ross</div>

--001a11c1c278ee194504dd378930--
