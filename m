Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D9A9071997
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 08:01:14 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id 191so17083434ybv.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iyGUtTY7XNK9SdQaEXaSqbcbWPYcHZMfIBv0978X0tk=;
	b=FM8UufpkXCmCcuPcieIOzngZ+cScnbObr+ulIZycIb1SLoftaQINZEhsbjlcYOK9bd
	mrobg/2QN31LMuRoYEPK0ryk8e8VIV4owv7R3Oo560K3j3frkF8/fea5QGkIUnA6tE+w
	7iAkr2UXRhBY2noKByXG5tSCPxEdh1op5PUqY+OXRghtLq5tNPoebNXPU7dZ+nHbCX3j
	o5BExysc3QR9zzhBEdKfqS2accuB0zam9IZR2vUjKCT0tygXvEVQfks383/vqcVAWEET
	+K1Aad94Nr+0K5V9jj0Exj1BlZ4mkGYD24hcf7fFzLBKAp0ybeQhATexOvjENN4ljlBO
	arrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iyGUtTY7XNK9SdQaEXaSqbcbWPYcHZMfIBv0978X0tk=;
	b=R1hEEn4vjgkLtjIV0RHa3IdIEfI6EQQdXeUfSmTVy6Q/BHh68qzeWXFc08z+aqyclK
	0YubunJPAhJ5YdblB2+ebky1wlluHAgJyrRSC07QmYZwGWwpywRD+UnV7aLgrn3E77Vi
	Ng8sUKV3ggCpOPIowefbqCLkAPq2bz2iSDFFusCOhwmHtE6+P1hy6IBBHfbClh8noIbN
	cS3gT2n6gs+Y4x3lAXCfv4pQT9Qu0ymDhb4ofC/tHL62obya+a1WE2MQdXBeXB/RW9Sm
	cgMt+9L49atqapstll7v7+zAs3Q4ZoG+WNLejr606cN3JjthUPiRJMDzuEuxoqPfDTp9
	Z8ig==
X-Gm-Message-State: AA6/9RmUcO6emAxIC2WDntrq/nAUomG/BqcLLQaxYq/3ku/RC3EBrznOec+tRoRMMfy8C7OIm94J+KePWhrcvmI2
X-Received: by 10.37.37.79 with SMTP id l76mr7256321ybl.103.1476259275719;
	Wed, 12 Oct 2016 01:01:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.206.3 with HTTP; Wed, 12 Oct 2016 01:00:45 -0700 (PDT)
In-Reply-To: <239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
	<239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 12 Oct 2016 11:00:45 +0300
Message-ID: <CAHiDW_HLG6fa7Phu0TeM+f5LTuubA2RmZB-6795Ze5e4xAqGxA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] xcb-proto: create .pyc files for python2
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
X-List-Received-Date: Wed, 12 Oct 2016 08:01:15 -0000
Content-Type: multipart/alternative; boundary=001a113eb02cba257c053ea665d6

--001a113eb02cba257c053ea665d6
Content-Type: text/plain; charset=UTF-8

On 12 October 2016 at 09:31, Robert Yang <liezhi.yang@windriver.com> wrote:

> Its Makefile's do_install creates .pyc files for python3, now also
> create them for python2 so that they will be recorded by manifest, and
> can be cleaned correctly.


So this is about autotools byte-compiling for python3 at install time and
then something using those python modules with python2 during the build?

I wonder if this is something that should/can be solved in a more generic
way? Alternatively, is the xcbgen user something in oe-core and can we tell
it to not use python2?

- Jussi



>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> index 8bdca32..54988fc 100644
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> @@ -28,3 +28,11 @@ RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_install_append() {
> +    # Makefile's do_install creates .pyc files for python3, now also
> create
> +    # them for python2 so that they will be recorded by manifest, and can
> be
> +    # cleaned correctly.
> +    cd  ${D}${libdir}/xcb-proto/xcbgen
> +    python -m py_compile *.py
> +}
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113eb02cba257c053ea665d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 October 2016 at 09:31, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Its Makefile&#39;s do=
_install creates .pyc files for python3, now also<br>
create them for python2 so that they will be recorded by manifest, and<br>
can be cleaned correctly.</blockquote><div><br></div><div>So this is about =
autotools byte-compiling for python3 at install time and then something usi=
ng those python modules with python2 during the build?=C2=A0</div><div><br>=
</div><div>I wonder if this is something that should/can be solved in a mor=
e generic way? Alternatively, is the xcbgen user something in oe-core and c=
an we tell it to not use python2?</div><div><br></div><div>- Jussi</div><di=
v><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0<br></block=
quote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-pr<wbr>oto/<a href=3D"http://xcb-proto_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a> | 8 ++++++=
++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-p<wbr>roto/<a href=3D"http://xcb-pr=
oto_1.12.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a> b/m=
eta/recipes-graphics/xorg-p<wbr>roto/<a href=3D"http://xcb-proto_1.12.bb" r=
el=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a><br>
index 8bdca32..54988fc 100644<br>
--- a/meta/recipes-graphics/xorg-p<wbr>roto/<a href=3D"http://xcb-proto_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a><br>
+++ b/meta/recipes-graphics/xorg-p<wbr>roto/<a href=3D"http://xcb-proto_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a><br>
@@ -28,3 +28,11 @@ RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
=C2=A0RRECOMMENDS_${PN}-dbg =3D &quot;${PN}-dev (=3D ${EXTENDPKGV})&quot;<b=
r>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 # Makefile&#39;s do_install creates .pyc files for python3, =
now also create<br>
+=C2=A0 =C2=A0 # them for python2 so that they will be recorded by manifest=
, and can be<br>
+=C2=A0 =C2=A0 # cleaned correctly.<br>
+=C2=A0 =C2=A0 cd=C2=A0 ${D}${libdir}/xcb-proto/xcbgen<br>
+=C2=A0 =C2=A0 python -m py_compile *.py<br>
+}<br>
<span class=3D"m_708345975110919641m_3612041496741962596HOEnZb"><font color=
=3D"#888888">--<br>
2.9.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113eb02cba257c053ea665d6--
