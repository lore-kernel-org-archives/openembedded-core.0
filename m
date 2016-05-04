Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0232960722
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:01:19 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id f89so56552984ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ras0T30dkY+CZlugZOTD3w7IebuekyTT6dbHtNiMP1I=;
	b=0b7X+UlOOFBpHoH948po/4HTr+DVsbB5AzouvCdUQGvA/wsQmxSAIP3ELQZO0DFnqF
	poRuaOELEue/oKZ+eaBfYRKlxvL91KoUBc70f1AMlh3dyuDtEC4YwkCrtsOXPt/2rcog
	WubFNPcq86QUpEWl8soYmwXMrX970c6LeQP/nT8+KJ5iPQNEWMzGD1dq8Uv1eJzN0FaB
	qk/XZikoJSz0N/Zav26qsE00hRJKcQMWwZrfV7RZPLN6dDEkFdZ1FtWnoomJBVw7xqPU
	LYwnUawY8M0+n6psz494HYhvNO6AKcVBSyIa4kUZV93Av7liqJafiSbHDa5aI+VN+HcD
	QNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ras0T30dkY+CZlugZOTD3w7IebuekyTT6dbHtNiMP1I=;
	b=Ewl8O07nmlLAYWJqxzkVAbWDSnDco02i3cH0U8tiS0ypr7WAed+jy22hmirT04C4pn
	cQRnEYmt32VzQXe+rAXr1gGmZaO5f+JquGXR4B3o/KOwAfhcjU1GoIoKnYqQme2rcUH9
	BLhF+WMFFvxAwX5LlbW+b9KXPAfSmjh8U5YPUBdnpduC3LQLTp+A8sKzFquUn05POQBF
	/2nr5Ommn82BnMBlTQ6fVPGtx8RXrjnZtaAi5KaGgtzXvEQN9NQamzJFUKkWRB84Xkif
	kleWkZX4TNxl3oANFnc1yGbH30WbvsCa9w9NSmbB/9+ixcSvh6hHtIuzKHYpMkoq1szx
	C+zw==
X-Gm-Message-State: AOPr4FUXbzgvOynrFH9eZrGR/+z1+H5K0QVFEoSYXXlb+eMrBm9TE19fR4PpPJs7vfwwQpRAug18t9aCrSh3vaUn
X-Received: by 10.107.179.136 with SMTP id c130mr10644400iof.99.1462374079903; 
	Wed, 04 May 2016 08:01:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 08:01:00 -0700 (PDT)
In-Reply-To: <1462191432-9516-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1462191432-9516-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 16:01:00 +0100
Message-ID: <CAJTo0LY3nQr2GOKx_3h+TmozU2kipSiPj0PRqQ-daLczwPft2w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: disable introspection for -native recipes
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
X-List-Received-Date: Wed, 04 May 2016 15:01:21 -0000
Content-Type: multipart/alternative; boundary=001a1148578c902a750532057f2d

--001a1148578c902a750532057f2d
Content-Type: text/plain; charset=UTF-8

On 2 May 2016 at 13:17, Alexander Kanavin <alexander.kanavin@linux.intel.com
> wrote:

> -EXTRA_OECONF_prepend = "${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> '--enable-introspection', '--disable-introspection', d)} "
> +EXTRA_OECONF_prepend_class-target =
> "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection',
> '--disable-introspection', d)} "
> +
> +# When building native recipes, disable introspection, as it is not
> necessary,
> +# pulls in additional dependencies, and makes build times longer
> +EXTRA_OECONF_prepend_class-native = "--disable-introspection "
>
>  UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection
> --disable-introspection"
>
>  # Generating introspection data depends on a combination of native and
> target
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS_append = " gobject-introspection gobject-introspection-native
> qemu-native"
> +DEPENDS_append_class-target = " gobject-introspection
> gobject-introspection-native qemu-native"
> +
> +# Even though introspection is disable on -native, gobject-introspection
> package is still
> +# needed for m4 macros.
> +DEPENDS_append_class-native = " gobject-introspection-native"
>

This leaves the nativesdk case undefined.  We probably want it enabled for
nativesdk?

Ross

--001a1148578c902a750532057f2d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 May 2016 at 13:17, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanav=
in@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":27l" class=3D"a3s aXjCH">-EXTRA_OECONF_prepend =3D &quot;${@bb.=
utils.contains(&#39;GI_DATA_ENABLED&#39;, &#39;True&#39;, &#39;--enable-int=
rospection&#39;, &#39;--disable-introspection&#39;, d)} &quot;<br>
+EXTRA_OECONF_prepend_class-target =3D &quot;${@bb.utils.contains(&#39;GI_D=
ATA_ENABLED&#39;, &#39;True&#39;, &#39;--enable-introspection&#39;, &#39;--=
disable-introspection&#39;, d)} &quot;<br>
+<br>
+# When building native recipes, disable introspection, as it is not necess=
ary,<br>
+# pulls in additional dependencies, and makes build times longer<br>
+EXTRA_OECONF_prepend_class-native =3D &quot;--disable-introspection &quot;=
<br>
<br>
=C2=A0UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; --enable-introspection =
--disable-introspection&quot;<br>
<br>
=C2=A0# Generating introspection data depends on a combination of native an=
d target<br>
=C2=A0# introspection tools, and qemu to run the target tools.<br>
-DEPENDS_append =3D &quot; gobject-introspection gobject-introspection-nati=
ve qemu-native&quot;<br>
+DEPENDS_append_class-target =3D &quot; gobject-introspection gobject-intro=
spection-native qemu-native&quot;<br>
+<br>
+# Even though introspection is disable on -native, gobject-introspection p=
ackage is still<br>
+# needed for m4 macros.<br>
+DEPENDS_append_class-native =3D &quot; gobject-introspection-native&quot;<=
/div></blockquote></div><br>This leaves the nativesdk case undefined.=C2=A0=
 We probably want it enabled for nativesdk?</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1148578c902a750532057f2d--
