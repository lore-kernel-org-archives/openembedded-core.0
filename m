Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC3F78A57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:11:32 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e30so22388130ioc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=P3ToDqas2OmxL/NWjSa9QBd/jY8Cb4qHuKqi65h4NEM=;
	b=pR//TRtJZeL/KjjV4bhYzJAF/OYTTqSTcV1ApQuSY4vLe/z1EzHrF/rTglU/rEUhfS
	VQ/Poa796pVnkRd/lsONYKKysB9Xg0MhTrSakgLsHLHe8xJdW57WIBKaX+IM8YkdsW/4
	weCNLWwQfRwYlek4rroQV7xgzpw46r/nHuTggwBwlwkVZufIHZ4WEJdcVKky5NAoULWc
	rwHzHZZAg8enzOwM5z+RjRMcgIIbeAey3PKW8Q+n+WE6Yv4Xuk6tgao7FHTvsU/dOZ25
	+TZjF0G1z9GgcztRWxccvRbVDpQn25SnTF1QSXF4s8KN4S9poKR43OmvxXWtvSOyqbN+
	OxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=P3ToDqas2OmxL/NWjSa9QBd/jY8Cb4qHuKqi65h4NEM=;
	b=omSq9PvwdhlBbeK4K7Kruy2PsesvbrQaHPDFLIATQAfz6QBZSa4hxf+oTqcsCIzDew
	mj77qs4iZS640ESTjxOOnJN2Jr1vFier0NICcBYxy5ZVICWvyfdzQJJa5TiCStVUn6CO
	LOH1PO3/CWSZWCJ4LjFHoirfofSyYpoLZA605iv61gF47Fi3unI7Zkdg1Ft/w82JYo+3
	flFv+cG1OSAmoFCD59W/L7SNBVgr8WuTJ1gyk2LvgP5oVLxZ9Fvl/fU93Z5cbfMIfsbg
	QQcecQu6uO/jSv0YNc0dwmbOpciRosdlNYjHo/BBMxm6c1CkU23WVYuZDy4xIYOlAA4d
	/Yjw==
X-Gm-Message-State: AElRT7GYihPlirMgqs2iYibplnQfbyQ5edmJBlsFpxxUj25rfuiN71Bp
	SvE+uC+9SZQz6qt4lhwgdnjpkTdmSGT8tVnmhg5yyg==
X-Google-Smtp-Source: AG47ELtlDkvHrrOcINiEeMiqgw3MvuUfW//XMR4IZfaIWQDi6gtao+4BH0mRoT0B/C1oyPxlBQ6otoVB2k9MUMHdl/M=
X-Received: by 10.107.37.212 with SMTP id l203mr21570089iol.20.1520349093970; 
	Tue, 06 Mar 2018 07:11:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 6 Mar 2018 07:11:13 -0800 (PST)
In-Reply-To: <20180306151006.26952-1-ross.burton@intel.com>
References: <20180306151006.26952-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Mar 2018 15:11:13 +0000
Message-ID: <CAJTo0La-2MTBBugeuF=P00i3zz=MjXSAcZaMcHBc5zJM0sOiKQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus-glib: refresh patches
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
X-List-Received-Date: Tue, 06 Mar 2018 15:11:33 -0000
Content-Type: multipart/alternative; boundary="001a11405f16ae68b20566bfdbf3"

--001a11405f16ae68b20566bfdbf3
Content-Type: text/plain; charset="UTF-8"

I don't want to spam the list again, so this is the new commit message on
my patch rebase series.  The rest are in poky-contrib:ross/mut2 and are
identical.  Any further comments?

Ross

On 6 March 2018 at 15:10, Ross Burton <ross.burton@intel.com> wrote:

> The patch tool will apply patches by default with "fuzz", which is where
> if the
> hunk context isn't present but what is there is close enough, it will
> force the
> patch in.
>
> Whilst this is useful when there's just whitespace changes, when applied to
> source it is possible for a patch applied with fuzz to produce broken code
> which
> still compiles (see #10450).  This is obviously bad.
>
> We'd like to eventually have do_patch() rejecting any fuzz on these
> grounds. For
> that to be realistic the existing patches with fuzz need to be rebased and
> reviewed.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/dbus/dbus-glib/no-examples.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> index fbb49678282..32e76117188 100644
> --- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> +++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> @@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]
>  Signed-off-by: Kevin Tian <kevin.tian@intel.com>
>  Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>
> ---- dbus-glib-0.70/dbus/Makefile.am.orig       2006-07-23
> 16:04:43.000000000 +0200
> -+++ dbus-glib-0.70/dbus/Makefile.am    2006-07-23 16:04:52.000000000
> +0200
> +Index: dbus-glib-0.108/dbus/Makefile.am
> +===================================================================
> +--- dbus-glib-0.108.orig/dbus/Makefile.am
> ++++ dbus-glib-0.108/dbus/Makefile.am
>  @@ -1,4 +1,4 @@
>  -SUBDIRS = . examples
>  +SUBDIRS = .
>
> - INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS)
> $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@
> DATADIRNAME@/locale\"
> -
> + AM_CPPFLAGS = \
> +       -I$(top_srcdir)                                         \
> --
> 2.11.0
>
>

--001a11405f16ae68b20566bfdbf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t want to spam the list again, so this is the ne=
w commit message on my patch rebase series.=C2=A0 The rest are in poky-cont=
rib:ross/mut2 and are identical.=C2=A0 Any further comments?<div><br></div>=
<div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 6 March 2018 at 15:10, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">The patch tool will appl=
y patches by default with &quot;fuzz&quot;, which is where if the<br>
hunk context isn&#39;t present but what is there is close enough, it will f=
orce the<br>
patch in.<br>
<br>
Whilst this is useful when there&#39;s just whitespace changes, when applie=
d to<br>
source it is possible for a patch applied with fuzz to produce broken code =
which<br>
still compiles (see #10450).=C2=A0 This is obviously bad.<br>
<br>
We&#39;d like to eventually have do_patch() rejecting any fuzz on these gro=
unds. For<br>
that to be realistic the existing patches with fuzz need to be rebased and<=
br>
reviewed.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch | 10 ++++++--=
--<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch b/meta=
/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
index fbb49678282..32e76117188 100644<br>
--- a/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
+++ b/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
@@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]<br>
=C2=A0Signed-off-by: Kevin Tian &lt;<a href=3D"mailto:kevin.tian@intel.com"=
>kevin.tian@intel.com</a>&gt;<br>
=C2=A0Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@inte=
l.com">scott.a.garman@intel.com</a>&gt;<br>
<br>
---- dbus-glib-0.70/dbus/Makefile.<wbr>am.orig=C2=A0 =C2=A0 =C2=A0 =C2=A020=
06-07-23 16:04:43.000000000 +0200<br>
-+++ dbus-glib-0.70/dbus/Makefile.<wbr>am=C2=A0 =C2=A0 2006-07-23 16:04:52.=
000000000 +0200<br>
+Index: dbus-glib-0.108/dbus/Makefile.<wbr>am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- dbus-glib-0.108.orig/dbus/<wbr>Makefile.am<br>
++++ dbus-glib-0.108/dbus/Makefile.<wbr>am<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-SUBDIRS =3D . examples<br>
=C2=A0+SUBDIRS =3D .<br>
<br>
- INCLUDES=3D-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) $(DBUS_GLIB=
_TOOL_CFLAGS) -DDBUS_COMPILATION=3D1 -DDBUS_LOCALEDIR=3D\&quot;$(prefix)/@<=
wbr>DATADIRNAME@/locale\&quot;<br>
-<br>
+ AM_CPPFLAGS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>

--001a11405f16ae68b20566bfdbf3--
