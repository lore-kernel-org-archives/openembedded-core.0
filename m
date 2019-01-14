Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id A206E7C07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 16:05:52 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id b23so17977132ios.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DlpT3BSBM1SpahdWPx+GhUwi+vlKPARY9g2T76tdyVA=;
	b=dlK/za32oZ6GRhzkKIJ3tHxjFh97rw8b2o5oyQ76KR47THgtV8YBDNCwgJjYstKXsP
	2vmxDqdiRpeIqH7Aw458aGKRw5y2O+gqoFm8KJ/tzuo1lB7ipSw7m4pvUE2G2NbpVUgp
	OQPOafcII1Ogs9N2nmB4PR+fh86fRcpMNKcMtnQLFCO5LaG8SP4uBLPyfldBP+dSKNeT
	H9IFidgEtt974nhpcwO8MzVeq9Ni6jzYsPxsV7tBG0XXRT3J/cBawjvEgqoIq0Zklf8U
	kGcI6otliwc+tILBMsBbeCVxipOUWVVj9jswNUQ4WLeCBgXWHSXHwgEDLCgcvI4CYw7h
	Ev6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DlpT3BSBM1SpahdWPx+GhUwi+vlKPARY9g2T76tdyVA=;
	b=bsQ1OXhwjBagkFn+hY4g1jKJ74aWZy+JdxmetfU2jMOFPaf6+WmOomq1oeE5aU1J7o
	oOQe4YVHXXbqspv45gvtSKISI+nVJmiZvLTdpO46/5u63LfQ/H7I1ogx6D9dDTbAT8Lb
	JwSzQa05+Dd3Op0+mx/4p2QQDEZ2dw9P/QUhSdSAhBBVk5dTYuknNJ3Oq9kbdpTv+KNs
	65QeAUjI1GL4/2Vdgeo/jPcjZcdO9vXQ+K1wdScxOF3A9Xp7w/fSQ7VWbHu6o6UPdxTd
	U5yiskr4VGOE28JG5FoxXyeei8xZEKGsa7vT0fGxZIRo2WJnnZgahEgALxQmNMAi6x8c
	jOhw==
X-Gm-Message-State: AJcUukfqZk3xcH6SbrwSjQhcVGkUQ5jDuRVh1BoFOHuMbNt+Ukr2yLA8
	ASp2u5ycJNNnvolSp+LN/jHGXRuCNRwELXvNXLndLjbb
X-Google-Smtp-Source: ALg8bN4EgG5M6bUp4EehYbBwSU2ZAXYT14lifzvOFtTuj6HHOQmSAAupuHE0hZ6cS4VnvEL55k3wfEkl8mpyw0OzJt8=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr15707420ioe.20.1547481953765;
	Mon, 14 Jan 2019 08:05:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<99e575ab7a408574f429e990a4296fec36f34b6e.1547477793.git.alex.kanavin@gmail.com>
In-Reply-To: <99e575ab7a408574f429e990a4296fec36f34b6e.1547477793.git.alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 16:05:42 +0000
Message-ID: <CAJTo0Lbex1kRg1AOjizNB+n0dubLRyU1jB_2g1E2QxtjEfux8A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/23] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Mon, 14 Jan 2019 16:05:52 -0000
Content-Type: multipart/alternative; boundary="0000000000002692b5057f6d38ac"

--0000000000002692b5057f6d38ac
Content-Type: text/plain; charset="UTF-8"

Rationale please.

Ross

On Mon, 14 Jan 2019 at 15:06, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/atk/atk_2.30.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/atk/atk_2.30.0.bb
> b/meta/recipes-support/atk/atk_2.30.0.bb
> index 481f8e89a13..4e2dacbc4d8 100644
> --- a/meta/recipes-support/atk/atk_2.30.0.bb
> +++ b/meta/recipes-support/atk/atk_2.30.0.bb
> @@ -20,6 +20,8 @@ GTKDOC_DISABLE_FLAG = "-Ddocs=false"
>  GI_ENABLE_FLAG = "-Dintrospection=true"
>  GI_DISABLE_FLAG = "-Dintrospection=false"
>
> +EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
> +
>  EXTRA_OEMESON_append_class-target = "
> ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
>
>               '${GI_DISABLE_FLAG}', d)} "
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002692b5057f6d38ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rationale please.<div><br></div><div>Ross</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 14 Jan 2019 at 15:06, Al=
exander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">Signed-off-by: Alexand=
er Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">=
alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/atk/<a href=3D"http://atk_2.30.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">atk_2.30.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/atk/<a href=3D"http://atk_2.30.0.bb" rel=
=3D"noreferrer" target=3D"_blank">atk_2.30.0.bb</a> b/meta/recipes-support/=
atk/<a href=3D"http://atk_2.30.0.bb" rel=3D"noreferrer" target=3D"_blank">a=
tk_2.30.0.bb</a><br>
index 481f8e89a13..4e2dacbc4d8 100644<br>
--- a/meta/recipes-support/atk/<a href=3D"http://atk_2.30.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">atk_2.30.0.bb</a><br>
+++ b/meta/recipes-support/atk/<a href=3D"http://atk_2.30.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">atk_2.30.0.bb</a><br>
@@ -20,6 +20,8 @@ GTKDOC_DISABLE_FLAG =3D &quot;-Ddocs=3Dfalse&quot;<br>
=C2=A0GI_ENABLE_FLAG =3D &quot;-Dintrospection=3Dtrue&quot;<br>
=C2=A0GI_DISABLE_FLAG =3D &quot;-Dintrospection=3Dfalse&quot;<br>
<br>
+EXTRA_OEMESON_append_class-nativesdk =3D &quot; ${GI_DISABLE_FLAG}&quot;<b=
r>
+<br>
=C2=A0EXTRA_OEMESON_append_class-target =3D &quot; ${@bb.utils.contains(&#3=
9;GI_DATA_ENABLED&#39;, &#39;True&#39;, &#39;${GI_ENABLE_FLAG}&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;${GI_DISABLE_FLAG}&#39;, d)} &quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002692b5057f6d38ac--
