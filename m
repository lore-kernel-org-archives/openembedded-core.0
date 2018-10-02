Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4A47016E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 23:43:41 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 19so1405889uas.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 16:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7QemSgpSdzLyXctkujVskpgf3/+0L5nzxAuBO52jziY=;
	b=PkKCN3wZbeRcbKznUGcpbi9kD2lv7hWd5ogk4/ELI0BdlpXrIltnTHn7840dJg91Wz
	fXXzc+Y9hlaoCtbfxy+w+vKE7Fu+gEP5hffjhsSpLOpvXXdPXSs/8qtSXRz6C+wvxnvO
	pHTMskmejOsjWq8HxgQ89t8FeixEmTA+C1bUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7QemSgpSdzLyXctkujVskpgf3/+0L5nzxAuBO52jziY=;
	b=ErFyfHiuK9Rtt1IL+pX9n5ogB3xJhGOwOL92JwkbF0ibwZTRr+1dV/U1qZvApzs0nO
	8kZMpXsAePpRG/E1cOWm5oMW9qxFFGV5RXXO9N7dMtPeFoimYwUe1/uy6Dx5lffcQwsG
	cuQLn7GYkz3QjNj0cWkwEjJJnxd85cC8Ip+jP7yamBRYtl3agyJOfYxfh3kaLqxmDKjp
	4l/mpPsIFp6EepVTQqE0jTAAjwgvyGHYKeIDN/9gepqZApDokxRdxgBG/IskQ6MoTChC
	+xMimY2zCqYN8iG+IklgKtFWTbtdkQTSzJG/pzsDrzRp8+0abbOlB22eUQr8kaaaYJ2a
	ZmqA==
X-Gm-Message-State: ABuFfogQHeRhWkodPYpUo2J59pRGH1LBEEUYDExCjA/VaVR7f39SacKl
	M444Ztsm4FpJG6Cv/dJ4j1pXcxfwKltxRBIBgiVXp2eG
X-Google-Smtp-Source: ACcGV63Fy8j0qvZofHhTFglgq5EWP4xxS9emT7oCxT9VfmvJsvE2PEKfyn1CqL2AZs0jTDX8HA/iRUCagXPor7YhsiQ=
X-Received: by 2002:ab0:7055:: with SMTP id v21-v6mr486685ual.44.1538523822260;
	Tue, 02 Oct 2018 16:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181002214323.14564-1-anibal.limon@linaro.org>
In-Reply-To: <20181002214323.14564-1-anibal.limon@linaro.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Tue, 2 Oct 2018 18:43:31 -0500
Message-ID: <CA+_AqiuUV-z5YSJ4LFS4jhyCSCgVuiamdHRQeryT2E4QdgU2YA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/yocto-check-layer: Don't abort when layer fails to get signatures
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
X-List-Received-Date: Tue, 02 Oct 2018 23:43:41 -0000
Content-Type: multipart/alternative; boundary="000000000000e799cb0577477dd8"

--000000000000e799cb0577477dd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Targeting sumo too.

Anibal

On Tue, 2 Oct 2018 at 16:43, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.or=
g> wrote:

> When execute in multiple layers like meta-openembedded the execution is
> aborted when some sublayer fails to get world signatures, so mark it as
> an error and continue the execution in the remaining sublayers.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  scripts/yocto-check-layer | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
> index 5a4fd752ca..9b7e53679b 100755
> --- a/scripts/yocto-check-layer
> +++ b/scripts/yocto-check-layer
> @@ -169,7 +169,14 @@ def main():
>          td['bbvars'] =3D get_bb_vars()
>          logger.info('Getting initial signatures ...')
>          td['builddir'] =3D builddir
> -        td['sigs'], td['tunetasks'] =3D get_signatures(td['builddir'])
> +        try:
> +            td['sigs'], td['tunetasks'] =3D get_signatures(td['builddir'=
])
> +        except RuntimeError as e:
> +            logger.info(str(e))
> +            results[layer['name']] =3D None
> +            results_status[layer['name']] =3D 'FAIL (Generating world
> signatures)'
> +            layers_tested =3D layers_tested + 1
> +            continue
>          td['machines'] =3D args.machines
>
>          if not add_layer(bblayersconf, layer, dep_layers, logger):
> --
> 2.19.0
>
>

--000000000000e799cb0577477dd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Targeting sumo too.<div><br></div><div>Anibal</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 2 Oct 2018 at 16:43,=
 An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anib=
al.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
When execute in multiple layers like meta-openembedded the execution is<br>
aborted when some sublayer fails to get world signatures, so mark it as<br>
an error and continue the execution in the remaining sublayers.<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0scripts/yocto-check-layer | 9 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer<br>
index 5a4fd752ca..9b7e53679b 100755<br>
--- a/scripts/yocto-check-layer<br>
+++ b/scripts/yocto-check-layer<br>
@@ -169,7 +169,14 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td[&#39;bbvars&#39;] =3D get_bb_vars()<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" rel=3D"nor=
eferrer" target=3D"_blank">logger.info</a>(&#39;Getting initial signatures =
...&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td[&#39;builddir&#39;] =3D builddir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 td[&#39;sigs&#39;], td[&#39;tunetasks&#39;] =
=3D get_signatures(td[&#39;builddir&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 td[&#39;sigs&#39;], td[&#39;tune=
tasks&#39;] =3D get_signatures(td[&#39;builddir&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except RuntimeError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(str(e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results[layer[&#39;name&#39;]] =
=3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results_status[layer[&#39;name&#=
39;]] =3D &#39;FAIL (Generating world signatures)&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 layers_tested =3D layers_tested =
+ 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td[&#39;machines&#39;] =3D args.machines<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not add_layer(bblayersconf, layer, dep=
_layers, logger):<br>
-- <br>
2.19.0<br>
<br>
</blockquote></div>

--000000000000e799cb0577477dd8--
