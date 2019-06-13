Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id D3D6B7E7AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 18:17:35 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d4so9173780edr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8uqOqCNDsKgWh8eWH0PKPZ+HPTfOlLP4tjTN3AIwz2Y=;
	b=d732cEVz59AVsnF5hC+Z8ha9N+QzQTACIsCgox3RnHIgSM2+1US9Xx8p24MPhtKupl
	dgfhehs8n8rmLloyxKLf6VtQ3MgpHC34A3ovIJ59lwxuok0vHrVpfypxY0/U9PPClTA0
	OluNep7f8Ly3X43Ds03+Z6IzwYoSWE2VGDexDqzmagdl3/GFZbUkRFU3NFZ6Zx4TCtre
	Fk65CYuiG/+7YZLbKDO5Xr0ADDWawUhLAlJfq71VDFjAnC3TepbMoHS+wTPaCZ1NQ4ob
	qX7/SPBRlrHbDmYjq/+B6psONM+e1gAnTcLbLBBt8ZJt4H3bp/VZrCxh57RJSqM+7/89
	Wq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8uqOqCNDsKgWh8eWH0PKPZ+HPTfOlLP4tjTN3AIwz2Y=;
	b=aPUwatS92rD+BxVCS2Ghcc0m2vm0DASyN241e8IGiyvcE0LEi/5qe2nghjYcTnMn9Z
	qyShpVW0hsF/3AWrNwbBzCj0F3y/97OJhTJDnMz3D65RgEcdofYHUvaG67ddEA8CJB6Y
	snd0TytfGiY9xtQYXRFWH9p6zIwLEac2UOiwLGdlRI8c3TlWRv5EAfFPPEVQvHazVK6X
	QNQj02rvWzkPogVVYZ0BGAMGr0QnBsgoedAIy5IhCgWK36c3GK4dYpFm3noDSTMEqA1s
	zx5Td4EUFWfLD/EoX9n7o0+moIasgYh/N6HG50jI3RdVmqVaOn1+YlaJNwtdRA1KkL8S
	ce7w==
X-Gm-Message-State: APjAAAU4o3SRgVVzfSjqIJWaQDunrzMYMKGIpq1DuDR6dL5rP4jphPho
	HPoWiBmcRQwGqM3kfKUqojjaPd7gYmIEX2gvRKc=
X-Google-Smtp-Source: APXvYqzNLGFfybubvhfkidrjxs+sN5IhNwnJoF1JjiJcm6HO4DXK9qJA2wG7M0/v18WUDFtgYsqJhI8tjrHrXpZKPD8=
X-Received: by 2002:aa7:df93:: with SMTP id b19mr18451684edy.153.1560449855607;
	Thu, 13 Jun 2019 11:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
In-Reply-To: <20190613175442.26121-1-m.felsch@pengutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Jun 2019 20:17:24 +0200
Message-ID: <CA+chaQcYku6dt_owA-OD2KAm5ZYqyhtFjnZ6EUAR8cRUJLY5Mw@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Thu, 13 Jun 2019 18:17:36 -0000
Content-Type: multipart/alternative; boundary="00000000000055568f058b388b8a"

--00000000000055568f058b388b8a
Content-Type: text/plain; charset="UTF-8"

Looks like nice cleanup, but is someone still using llvm 3.2 or older?

With PACKAGECONFIG for almost each gallium driver it might be easier to get
rid
of GALLIUMDRIVERS_LLVM33, GALLIUMDRIVERS_LLVM33_ENABLED, GALLIUMDRIVERS_LLVM
variables and use just GALLIUMDRIVERS.

In worst case scenario people using llvm 3.2 or older will need to redefine
some of these PACKAGECONFIGs but that shouldn't be big issue considering
that they probably have different mesa recipe already.

People can then select right list of drivers with or without
using gallium-llvm as well.


On Thu, Jun 13, 2019 at 7:54 PM Marco Felsch <m.felsch@pengutronix.de>
wrote:

> Most of the time we are compiling for embedded targets which have
> dedicated hardware combinations. Enabling swrast by default isn't a good
> solution for such devices because if the hardware render node has an
> issue or doesn't support a special format/request Mesa will fallback to
> the software renderer. This will make it harder to debug performance
> issues.
>
> A better way is to let the user decide if a software renderer is
> needed e.g. if the system has no hardware renderer or to have such a
> fallback device. This way the user knows that the software renderer is
> enabled.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v3
> - rebased on current master-next branch
>
>  meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 3ecfb8506c..a6d36cf21c 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -90,23 +90,27 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
>
>  PACKAGECONFIG[etnaviv] = ""
>  PACKAGECONFIG[kmsro] = ""
> +PACKAGECONFIG[swrast] = ""
>
> -GALLIUMDRIVERS = "swrast"
> -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> ',etnaviv', '', d)}"
> -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro',
> ',kmsro', '', d)}"
> +GALLIUMDRIVERS = ""
> +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'swrast',
> 'swrast', '', d)}"
> +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> 'etnaviv', '', d)}"
> +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', 'kmsro',
> '', d)}"
>
>  # radeonsi requires LLVM
> -GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> ',radeonsi', '', d)}"
> +GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> 'radeonsi', '', d)}"
>  GALLIUMDRIVERS_LLVM33_ENABLED =
> "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False,
> len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
> -GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if
> ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> +GALLIUMDRIVERS_LLVM = "r300 svga nouveau ${@'${GALLIUMDRIVERS_LLVM33}' if
> ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>
>  PACKAGECONFIG[r600] = ""
>
> -GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> -GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> ',r600', '', d)}"
> -GALLIUMDRIVERS_append = ",virgl"
> +GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm',
> '${GALLIUMDRIVERS_LLVM}', '', d)}"
> +GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600',
> '', d)}"
> +GALLIUMDRIVERS += "virgl"
> +GALLIUMDRIVERS_MESON = "${@",".join("${GALLIUMDRIVERS}".split())}"
> +
> +PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS_MESON},
> -Dgallium-drivers=''"
>
> -PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS},
> -Dgallium-drivers=''"
>  MESA_LLVM_RELEASE ?= "8.0.0"
>  PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true,
> -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
>                                 ${@'elfutils' if
> ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000055568f058b388b8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like nice cleanup, but is someone still using llvm 3=
.2 or older?<div><br></div><div>With PACKAGECONFIG for almost each gallium =
driver it might be easier to get rid of=C2=A0GALLIUMDRIVERS_LLVM33,=C2=A0GA=
LLIUMDRIVERS_LLVM33_ENABLED,=C2=A0GALLIUMDRIVERS_LLVM variables and use jus=
t=C2=A0GALLIUMDRIVERS.</div><div><br></div><div>In worst case scenario peop=
le using llvm 3.2 or older will need to redefine some of these PACKAGECONFI=
Gs but that shouldn&#39;t be big issue considering that they probably have =
different mesa recipe already.</div><div><br></div><div>People can then sel=
ect right list of drivers with or without using=C2=A0gallium-llvm as well.<=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Jun 13, 2019 at 7:54 PM Marco Felsch &lt;<a hre=
f=3D"mailto:m.felsch@pengutronix.de">m.felsch@pengutronix.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Most of the tim=
e we are compiling for embedded targets which have<br>
dedicated hardware combinations. Enabling swrast by default isn&#39;t a goo=
d<br>
solution for such devices because if the hardware render node has an<br>
issue or doesn&#39;t support a special format/request Mesa will fallback to=
<br>
the software renderer. This will make it harder to debug performance<br>
issues.<br>
<br>
A better way is to let the user decide if a software renderer is<br>
needed e.g. if the system has no hardware renderer or to have such a<br>
fallback device. This way the user knows that the software renderer is<br>
enabled.<br>
<br>
Signed-off-by: Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de" =
target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br>
---<br>
v3<br>
- rebased on current master-next branch<br>
<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++---------<br>
=C2=A01 file changed, 13 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 3ecfb8506c..a6d36cf21c 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -90,23 +90,27 @@ PACKAGECONFIG[egl] =3D &quot;-Degl=3Dtrue, -Degl=3Dfals=
e&quot;<br>
<br>
=C2=A0PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[kmsro] =3D &quot;&quot;<br>
+PACKAGECONFIG[swrast] =3D &quot;&quot;<br>
<br>
-GALLIUMDRIVERS =3D &quot;swrast&quot;<br>
-GALLIUMDRIVERS_append =3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;etnaviv&#39;, &#39;,etnaviv&#39;, &#39;&#39;, d)}&quot;<br>
-GALLIUMDRIVERS_append =3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;kmsro&#39;, &#39;,kmsro&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS =3D &quot;&quot;<br>
+GALLIUMDRIVERS +=3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;swrast&#39;, &#39;swrast&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS +=3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;etnaviv&#39;, &#39;etnaviv&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS +=3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;kmsro&#39;, &#39;kmsro&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# radeonsi requires LLVM<br>
-GALLIUMDRIVERS_LLVM33 =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;r600&#39;, &#39;,radeonsi&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS_LLVM33 =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;r600&#39;, &#39;radeonsi&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0GALLIUMDRIVERS_LLVM33_ENABLED =3D &quot;${@oe.utils.version_less_or_e=
qual(&#39;MESA_LLVM_RELEASE&#39;, &#39;3.2&#39;, False, len(&#39;${GALLIUMD=
RIVERS_LLVM33}&#39;) &gt; 0, d)}&quot;<br>
-GALLIUMDRIVERS_LLVM =3D &quot;r300,svga,nouveau${@&#39;,${GALLIUMDRIVERS_L=
LVM33}&#39; if ${GALLIUMDRIVERS_LLVM33_ENABLED} else &#39;&#39;}&quot;<br>
+GALLIUMDRIVERS_LLVM =3D &quot;r300 svga nouveau ${@&#39;${GALLIUMDRIVERS_L=
LVM33}&#39; if ${GALLIUMDRIVERS_LLVM33_ENABLED} else &#39;&#39;}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[r600] =3D &quot;&quot;<br>
<br>
-GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;gallium-llvm&#39;, &#39;,${GALLIUMDRIVERS_LLVM}&#39;, &#39;&#39;, =
d)}&quot;<br>
-GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;r600&#39;, &#39;,r600&#39;, &#39;&#39;, d)}&quot;<br>
-GALLIUMDRIVERS_append =3D &quot;,virgl&quot;<br>
+GALLIUMDRIVERS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#=
39;gallium-llvm&#39;, &#39;${GALLIUMDRIVERS_LLVM}&#39;, &#39;&#39;, d)}&quo=
t;<br>
+GALLIUMDRIVERS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#=
39;r600&#39;, &#39;r600&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS +=3D &quot;virgl&quot;<br>
+GALLIUMDRIVERS_MESON =3D &quot;${@&quot;,&quot;.join(&quot;${GALLIUMDRIVER=
S}&quot;.split())}&quot;<br>
+<br>
+PACKAGECONFIG[gallium] =3D &quot;-Dgallium-drivers=3D${GALLIUMDRIVERS_MESO=
N}, -Dgallium-drivers=3D&#39;&#39;&quot;<br>
<br>
-PACKAGECONFIG[gallium] =3D &quot;-Dgallium-drivers=3D${GALLIUMDRIVERS}, -D=
gallium-drivers=3D&#39;&#39;&quot;<br>
=C2=A0MESA_LLVM_RELEASE ?=3D &quot;8.0.0&quot;<br>
=C2=A0PACKAGECONFIG[gallium-llvm] =3D &quot;-Dllvm=3Dtrue -Dshared-llvm=3Dt=
rue, -Dllvm=3Dfalse, llvm${MESA_LLVM_RELEASE} llvm-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@&#39;elfutils&#39; if ${GALLIUMDR=
IVERS_LLVM33_ENABLED} else &#39;&#39;}&quot;<br>
-- <br>
2.20.1<br>
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

--00000000000055568f058b388b8a--
