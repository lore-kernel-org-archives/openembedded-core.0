Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3AA77E92
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 22:06:07 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id i200so6308340ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 15:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cFrvuczcyiG8O+qKvfzDK+I5MXivAGIFIdHo+0ieQTQ=;
	b=2OPYNpg/OEkM1aooZVLf2pAv0t+mB4son1eh7FEie21wqGr9/Uth0Nyb3QRQ196p+a
	22nkYCuMWobxT6ATPsCZyW+IHDvvJ40wUCOvljhbcBNfmJsTZVpRL8VOYg/GmjPj9hqQ
	coAbB5Q+OJT/ku86wQ8iKUAIAQd/r6NH8tlvClfOg3AbyIEpQ83Iv0ikNnZqLzPJz/31
	WTBV/AEmNwiIdZd9z9btHw2+bEP/oVUj0hUwARyOpdFvCbYROAPH/DrGIQGHa0A1Yfpf
	z303ETPgk/L1bxQXb/Ubx/qzTYhbP99fKaVWchp2fyj+2Jz6iMbn+HCLAf5ajfnxc1N0
	rXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cFrvuczcyiG8O+qKvfzDK+I5MXivAGIFIdHo+0ieQTQ=;
	b=XDgtP45BuE02VnosKyH+eNE+c7kwn7zkHdHI6SiTSEcuXcam6MORDloq6ZlVKB8axd
	wshy6cog2eDNxvimbGo6AvXgEjwhZUE89pwasJqaX5OkkzA/G987pUoeQmEVk7d2LNqv
	aADXE25uQv+Cb3DwUlY54Zq+n7PW76tRl0g7pxTUK/9inrxoAhQcYmzD3l5rHVcGmtcz
	bcl+Khd3BG3BZ9n822zJk5txVWICrb68h6JELlYlOProVahVoLsciRZfPXOSjSaK2x2S
	Xu8j7wvecsiO72UkNk3vM2YsRm7V6WuzDYl9jkJKVQEG1e7RliN4oIB+1ZwaTgO0LulG
	qN6Q==
X-Gm-Message-State: AHPjjUiEtkAnp1s05ipK93eG6jrSjOHQ6PsO5QNIDiW/gQ7XFbE6Nnb7
	Ax3tDa5uYrLAGwVCM2Q4zv4L/r2QbFqp
X-Google-Smtp-Source: ADKCNb4Jro3galCS+qxOqq5ne1WNWD4I3QKnoqktolxEbYFplKZNQirrJvMgTxIMV9qMoYGaSWU7+BJgdWCyseS7Ut0=
X-Received: by 10.107.16.210 with SMTP id 79mr1936245ioq.196.1504562768555;
	Mon, 04 Sep 2017 15:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Mon, 4 Sep 2017 15:05:48 -0700 (PDT)
In-Reply-To: <20170821221130.2065-1-alejandro.hernandez@linux.intel.com>
References: <20170821221130.2065-1-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Sep 2017 23:05:48 +0100
Message-ID: <CAJTo0LZrE1BCEewKeu=fqHWDheTAU6bYnPZRw9s-88avvN2_UQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hwlatdetect: fix RDEPENDS to avoid QA failures
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
X-List-Received-Date: Mon, 04 Sep 2017 22:06:07 -0000
Content-Type: multipart/alternative; boundary="001a113edb525cc81d0558645132"

--001a113edb525cc81d0558645132
Content-Type: text/plain; charset="UTF-8"

This doesn't apply to master, do you have some local Python patches?

Ross

On 21 August 2017 at 23:11, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> When listing python3 as an RDEPENDS, the image will in fact
> contain python3-modules, but the QA check fails to get
> RPROVIDERS correctly (since the python3 package does not
> actually exist), /usr/bin/python3 is provided by the
> python3-core package, so by fixing the RDEPENDS and listing
> python3-creo instead of python3, the QA check works correctly
> and we avoid failures
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
> b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
> index 60b44a4d258..5f61c4ecddc 100644
> --- a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
> +++ b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
> @@ -22,5 +22,5 @@ do_install() {
>  }
>
>  FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/
> hwlatdetect.py"
> -RDEPENDS_${PN} = "python3 "
> +RDEPENDS_${PN} = "python3-core "
>  RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
> --
> 2.12.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113edb525cc81d0558645132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t apply to master, do you have some local P=
ython patches?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 21 August 2017 at 23:11, Alejandro Hern=
andez <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.int=
el.com" target=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">When listing python3 as an RDEPE=
NDS, the image will in fact<br>
contain python3-modules, but the QA check fails to get<br>
RPROVIDERS correctly (since the python3 package does not<br>
actually exist), /usr/bin/python3 is provided by the<br>
python3-core package, so by fixing the RDEPENDS and listing<br>
python3-creo instead of python3, the QA check works correctly<br>
and we avoid failures<br>
<br>
Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernande=
z@linux.intel.com">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.1.bb" rel=3D=
"noreferrer" target=3D"_blank">hwlat<wbr>detect_1.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">hwl<wbr>atdetect_1.1.bb</a> b/meta/re=
cipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.1.bb" rel=3D"noreferrer" =
target=3D"_blank">hwl<wbr>atdetect_1.1.bb</a><br>
index 60b44a4d258..5f61c4ecddc 100644<br>
--- a/meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.1.bb" rel=3D=
"noreferrer" target=3D"_blank">hwl<wbr>atdetect_1.1.bb</a><br>
+++ b/meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.1.bb" rel=3D=
"noreferrer" target=3D"_blank">hwl<wbr>atdetect_1.1.bb</a><br>
@@ -22,5 +22,5 @@ do_install() {<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/python${PYTHON_<wbr>BASEVERSION}/dis=
t-packages/<wbr>hwlatdetect.py&quot;<br>
-RDEPENDS_${PN} =3D &quot;python3 &quot;<br>
+RDEPENDS_${PN} =3D &quot;python3-core &quot;<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;kernel-module-hwlat-detector&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113edb525cc81d0558645132--
