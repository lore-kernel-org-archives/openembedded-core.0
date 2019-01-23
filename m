Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7036C0EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 14:43:15 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c21so1216997qkl.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 06:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HsqW08OX9jNRI/55LIvbM8tRBn3pC3iyMNzb5cGhI3U=;
	b=rFTOZBY6SfyCuiAD6gEJBhSc2GbfLErc0okemclyzQtpP89Y2dyOBwe5yYgWfo0wtN
	MIGaX1yu3jzA+77w9xubCZ1b+gYr6T7SGbgyuCWSEYEfm1AWrsQhbvdHs1DUWwV5lc8v
	bSkHdlpb1yRAbk7c29aZiSjlKMpEKjydPPDOCu9/gKIv0DNDwh2fgAypUrSutkNRNGRU
	QmROn3rfAZ+uEDyHeLj2/cT7SQ6xReBKzx2Hmbq3N1OmUvvtJ0rTlfxRGvlXChEr1wFl
	FRRSm7niDsFzzq1hYR768tQM6Je5ybHFI9jf/eKA4t53Cqcf/t0POBSQIfbF8Rgpn/mh
	X9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HsqW08OX9jNRI/55LIvbM8tRBn3pC3iyMNzb5cGhI3U=;
	b=XUjD8OUjKLdDyhAp0/p7U2ZQzLajY3buUnj4l0BJm6bGQLHM35qvtym+cxDeAyaxJf
	d8BknnGd8hsg62vDXPtQKHP594IrVeeVLrb6gv4vXIBg0731VZ45sHGmdeqp4hvNJVDh
	bDYiJDWXktAb22vOhXCVJWyNhm5JqsD5dBF0Uwm9vBlfGPycNDWiqPg+RoQQYGqogDZ3
	LMWiJoC/FMXArECO5UqXG2a/xyANuRiUOox4CRnWB/WgKqBwVKIo96sN1MB9+pGFzl5t
	GEKiBLoMs+E28aHHpBIbKJZx888I+CFWpdcAtekFl0bzHRRhYydJro9RnWb6rfBS49dd
	jpRw==
X-Gm-Message-State: AJcUukd5CMajavkIBEHPS/g4j8e8TlpJhn7Gx3rpNGmh0ju3UhhD4LI/
	1TGXaIF08hHHQDS49iNb2KjaAMdFyL9+DYmaWDE=
X-Google-Smtp-Source: ALg8bN6EpwBs8GJZaWNxpU2qGoR8Sh8+riDvoukUed/hGX7Xdw+vChR3x2IOoMwUYc/ssHnhpgojk19sMraLvNA9Lw8=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr1996796qka.206.1548254595887; 
	Wed, 23 Jan 2019 06:43:15 -0800 (PST)
MIME-Version: 1.0
References: <CABPh3UMd9LvewWZuiTSiJgW_J74E+kJ7Tfxmq7mXgzGjSekF9Q@mail.gmail.com>
	<CABPh3UOpcpnsyY_yvFM5SGeSsR6vt7_iELQMKx4CuWDJeJQhVA@mail.gmail.com>
	<CABPh3UMRwQz5s57oFLGHSBT-Guns5r2XRsFtU4ZLXmJspcjtcA@mail.gmail.com>
In-Reply-To: <CABPh3UMRwQz5s57oFLGHSBT-Guns5r2XRsFtU4ZLXmJspcjtcA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jan 2019 09:43:04 -0500
Message-ID: <CAMKF1sow9OjkD-LVrDJFZeg_RxRdTtBbOrO24+-LdsesTLaGTw@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image-buildinfo: make the build file shell compatible
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
X-List-Received-Date: Wed, 23 Jan 2019 14:43:15 -0000
Content-Type: multipart/alternative; boundary="00000000000035b9180580211dd2"

--00000000000035b9180580211dd2
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 23, 2019 at 7:22 AM nick83ola <nick83ola@gmail.com> wrote:

> sorry here is the correct file
>
>
> ############################################################
> # Build Configuration                                      #
> ############################################################
> DISTRO="esw-space-controller"
> DISTRO_VERSION="2.6"
> TARGET_SYS="arm-poky-linux-musleabi"
> MACHINE="bumblebee-cl-imx7"
>
> ############################################################
> # Layer Revisions                                          #
> ############################################################
> BBLAYERS_meta="HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modified"
> BBLAYERS_meta-poky="HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modified"
> BBLAYERS_meta-freescale="HEAD:15a354ee592866a61a893562760ef84bf8fe5e4d:"


Ending with a colon does seem like we are ending with a separator

>
> BBLAYERS_meta-ti="master:fb8bfa61d74e49d1a436612b07bdb69c1bdd350f:"
>
> BBLAYERS_meta-jci-bsp-bumblebee="HEAD:1e293e40a21840fb42abb6d188d23867afb5e9b2:"
> BBLAYERS_meta-oe="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
> BBLAYERS_meta-networking="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
> BBLAYERS_meta-python="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
> BBLAYERS_meta-webserver="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
> BBLAYERS_meta-swupd="HEAD:ed8911cc40b5164af0715f471ee204ea9a3d3491:"
> BBLAYERS_meta-tpm="HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:"
> BBLAYERS_meta-security="HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:"
> BBLAYERS_meta-perl="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
> BBLAYERS_meta-gplv2="HEAD:aabc30f3bd03f97326fb8596910b94639fea7575:"
>
> BBLAYERS_meta-jci-app-esw="contrib/nlunghi/SPACE-557:5a8aea37191e603b1bba74222ad236f7a3e5cc93:modified"
>
> BBLAYERS_meta-eclipse-smarthome="HEAD:e91f8808ea1a16f5f03359631c58a782067e7884:"
> BBLAYERS_meta-java="HEAD:99d16707d03898fe9fd5b4fee32f6417825a9e6a:"
>
> BBLAYERS_meta-jci-app-bumblebee="contrib/nlunghi/proxy-rest:57f09dd7147d1dae5caf681114b5087bf7957bbf:"
>
> BBLAYERS_meta-nick="master:3987b1f760a25941168f6c0277a0c49b46f5c723:modified"
> BBLAYERS_workspace="<unknown>:<unknown>:modified"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000035b9180580211dd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Jan 23, 2019 at 7:22 AM nick83ola &lt;<a href=3D"mailto:nick83ola@gmail.co=
m">nick83ola@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">sorry here is the correct file<br>
<br>
<br>
############################################################<br>
# Build Configuration=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 #<br>
############################################################<br>
DISTRO=3D&quot;esw-space-controller&quot;<br>
DISTRO_VERSION=3D&quot;2.6&quot;<br>
TARGET_SYS=3D&quot;arm-poky-linux-musleabi&quot;<br>
MACHINE=3D&quot;bumblebee-cl-imx7&quot;<br>
<br>
############################################################<br>
# Layer Revisions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 #<br>
############################################################<br>
BBLAYERS_meta=3D&quot;HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modifie=
d&quot;<br>
BBLAYERS_meta-poky=3D&quot;HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:mo=
dified&quot;<br>
BBLAYERS_meta-freescale=3D&quot;HEAD:15a354ee592866a61a893562760ef84bf8fe5e=
4d:&quot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ending =
with a colon does seem like we are ending with a separator=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
BBLAYERS_meta-ti=3D&quot;master:fb8bfa61d74e49d1a436612b07bdb69c1bdd350f:&q=
uot;<br>
BBLAYERS_meta-jci-bsp-bumblebee=3D&quot;HEAD:1e293e40a21840fb42abb6d188d238=
67afb5e9b2:&quot;<br>
BBLAYERS_meta-oe=3D&quot;HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:&quo=
t;<br>
BBLAYERS_meta-networking=3D&quot;HEAD:ff6bead1624a1e261408516b3d064a04aab5f=
592:&quot;<br>
BBLAYERS_meta-python=3D&quot;HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:=
&quot;<br>
BBLAYERS_meta-webserver=3D&quot;HEAD:ff6bead1624a1e261408516b3d064a04aab5f5=
92:&quot;<br>
BBLAYERS_meta-swupd=3D&quot;HEAD:ed8911cc40b5164af0715f471ee204ea9a3d3491:&=
quot;<br>
BBLAYERS_meta-tpm=3D&quot;HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:&qu=
ot;<br>
BBLAYERS_meta-security=3D&quot;HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3=
f:&quot;<br>
BBLAYERS_meta-perl=3D&quot;HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:&q=
uot;<br>
BBLAYERS_meta-gplv2=3D&quot;HEAD:aabc30f3bd03f97326fb8596910b94639fea7575:&=
quot;<br>
BBLAYERS_meta-jci-app-esw=3D&quot;contrib/nlunghi/SPACE-557:5a8aea37191e603=
b1bba74222ad236f7a3e5cc93:modified&quot;<br>
BBLAYERS_meta-eclipse-smarthome=3D&quot;HEAD:e91f8808ea1a16f5f03359631c58a7=
82067e7884:&quot;<br>
BBLAYERS_meta-java=3D&quot;HEAD:99d16707d03898fe9fd5b4fee32f6417825a9e6a:&q=
uot;<br>
BBLAYERS_meta-jci-app-bumblebee=3D&quot;contrib/nlunghi/proxy-rest:57f09dd7=
147d1dae5caf681114b5087bf7957bbf:&quot;<br>
BBLAYERS_meta-nick=3D&quot;master:3987b1f760a25941168f6c0277a0c49b46f5c723:=
modified&quot;<br>
BBLAYERS_workspace=3D&quot;&lt;unknown&gt;:&lt;unknown&gt;:modified&quot;<b=
r>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000035b9180580211dd2--
