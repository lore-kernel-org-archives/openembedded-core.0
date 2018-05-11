Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id D71147827B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:11:13 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id 77-v6so7416394otd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8dYX79FsHawWlyaAmzK2zeEAa8tiq5Ks5FtFyC6z5zY=;
	b=iA+HuuX3quTkOYQgexjyoP7r36Hl+Wkg2ZTfXnTy80W+h+qV3eNMzfDGTvuj7qrKN6
	ydR1J4pGVgTwJW94bb4UY+/00RETuwuUeAeBg7cSlEN+aQLdc92LpljU3Ei7MnJA2cJq
	3oUGMsdZV4rNuU3t3BVv8Cxh8o7YjtmDMpyCBk3G5yna+xyLMGd3V7dCJDZ5+WTmRvEd
	W3AjuLBMI3LoSfiDsuWDkvJ6Ki09F0X0FrpiVcy5xpINvBN7WbTDXn9727tR2kORo04x
	kQmqsxFISHbczAg6mHvGJeQxr/2Mr7sy/olGBJ3tuWugxYeJYPL4vrDbMden0IV/p8Th
	QAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8dYX79FsHawWlyaAmzK2zeEAa8tiq5Ks5FtFyC6z5zY=;
	b=uT3TV0dXFKSlMvu3TohCnWpbA+eWB38DTytFDtqdrOSBTPD2d8B6RHlReaEHrYyXl5
	MJxlEI5u0GpGhzhUT9hQML4Fzt688sU3nIWvwdh7V3UPxzcwwOV69eNTDxx5ZYCoIAek
	10LHYTHgLqPd9lPDtjz30xig07em8e1rtMVE/n8Svr1emInLL0Lmdf4yosTI8YNNGjGC
	pI2jwy2rJCBBCpr5JpFpdTpRKJk9n1c3QgFzXRNh9aJyGrrLKoMxq/FWUrpOGoSYK5mH
	SiKFfojjttLEamRxjcaDeQ3bd3vOLAPe4bl/4pvhm4R6iv7Mtwg4GavDcSBJIhBkQIDx
	8BHA==
X-Gm-Message-State: ALKqPweWTDj03+eBF44jpwnNsk+ghAD6DPjPmV/lnTp/mXwCEjQs22LB
	8t845sT1lqvjz52Dl2j75TDKCg3OPrQMudbsBAo=
X-Google-Smtp-Source: AB8JxZqqxW+vuG0w9LRF6Uz2hGjCyHfxLvoFUZDn4+V85uewVYeGJtcNRUQxMCaIkLS/GcRTKjjfQMm2lJcI39p9k3I=
X-Received: by 2002:a9d:4442:: with SMTP id
	f2-v6mr4897367otj.319.1526065874407; 
	Fri, 11 May 2018 12:11:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.91.17 with HTTP; Fri, 11 May 2018 12:10:53 -0700 (PDT)
In-Reply-To: <1526056553-31049-1-git-send-email-cjp256@gmail.com>
References: <1526056553-31049-1-git-send-email-cjp256@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 11 May 2018 12:10:53 -0700
Message-ID: <CABcZANm1CMZkm+fkR+o_9DejzS=3bzj4XvM1zVd_zsVTY1YZAw@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add gettext to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 19:11:14 -0000
Content-Type: multipart/alternative; boundary="0000000000005915bd056bf2e601"

--0000000000005915bd056bf2e601
Content-Type: text/plain; charset="UTF-8"

This is not a correct fix. We have a gettext bbclass for a reason.

On Fri, May 11, 2018 at 9:35 AM, Chris Patterson <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
> Otherwise QEMU build may fail with missing `msgfmt` command.
>
> | make -C po install
> |   GEN     bg.mo
> |   GEN     tr.mo
> |   GEN     de_DE.mo
> | /bin/sh: msgfmt: command not found
> | /bin/sh: msgfmt: command not found
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index dc73df8..ba1b9b2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "Fast open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
> -DEPENDS = "glib-2.0 zlib pixman"
> +DEPENDS = "glib-2.0 zlib pixman gettext"
>  RDEPENDS_${PN}_class-target += "bash"
>
>  require qemu-targets.inc
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000005915bd056bf2e601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is not a correct fix. We have a gettext bbclass for a=
 reason.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Fri, May 11, 2018 at 9:35 AM, Chris Patterson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: Chris Patterson &lt;<a h=
ref=3D"mailto:pattersonc@ainfosec.com">pattersonc@ainfosec.com</a>&gt;<br>
<br>
Otherwise QEMU build may fail with missing `msgfmt` command.<br>
<br>
| make -C po install<br>
|=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0bg.mo<br>
|=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0tr.mo<br>
|=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0de_DE.mo<br>
| /bin/sh: msgfmt: command not found<br>
| /bin/sh: msgfmt: command not found<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.co=
m">pattersonc@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/<wbr>qemu.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu.inc b/meta/recipes-devtoo=
ls/qemu/<wbr>qemu.inc<br>
index dc73df8..ba1b9b2 100644<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Fast open source processor emulator&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://qemu.org" rel=3D"noreferrer" tar=
get=3D"_blank">http://qemu.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
-DEPENDS =3D &quot;glib-2.0 zlib pixman&quot;<br>
+DEPENDS =3D &quot;glib-2.0 zlib pixman gettext&quot;<br>
=C2=A0RDEPENDS_${PN}_class-target +=3D &quot;bash&quot;<br>
<br>
=C2=A0require qemu-targets.inc<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.1.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</div>

--0000000000005915bd056bf2e601--
