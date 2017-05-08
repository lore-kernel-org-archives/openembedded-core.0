Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id E2DAC71A05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 10:55:48 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id 8so10449302ybw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9cBs4Mh4CxslNw4iKLTKVBjksV/jkC6vu5/5DKDKC2g=;
	b=wvPND0+s9pxrHMkUQj+kOuMLUZIwqjrdY6THMcDj+7/N10f7Qaty011GHNuSK5g+s5
	K98OrFoFFzDGgyPUNPVPwDpmYVxZc3ITfK/1uvPSa8CYQLzIqmA6m2zdKd5g4w3THraH
	pkFPRVJpQBSj+/dVQ9Su5tA6WX2QEwLSEGe1PNqg/o3BnuIJf6J8SIVWEOkYcILuorxT
	tI8Yr20gqcymOMaCG/3wiTSEnd1Cn1tt38Bb9u4Zkgn3Txbkgpy1hdpd2ESKum/H3tvp
	VBHiY94A1IliQXrgEEOmeHbJUGehkh30Z9Cude2MBX3I9tQA3AUB/Jj/1gDXV73oHGdZ
	MRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9cBs4Mh4CxslNw4iKLTKVBjksV/jkC6vu5/5DKDKC2g=;
	b=SvCLQ2+ff38T1RLlRhLrBinHpUI6727Dn3X8mzYH4HkwelMX7jqrqMAoGvXAk53z6Q
	xB//Lv+sAZ3dZ74rxS09+yven+Y9a+o3SWJihDpvTxT3nL0dlAuDsrrX3HXGn2lNfzFX
	PP+djq6oCjNHTNK8ba+ix52Kt0yquoaSfBijMwp8hz4lJ29tUz43GWsTvBEpokUn0SmU
	WRwOR4d8ZozrU+UF9oFWnusm4ffNUYQMeCE3+h26K2ygJCg5kCgSSohdVpH0o+gOw7BC
	gMF+/ubPAXEBBrirWRXAFQpiIZey7voIsxxIfPmLDOSD/n1YEmHiBSmPfS+TWM9bVXl0
	dSqQ==
X-Gm-Message-State: AODbwcDT9aDYdmQsBthRnFZl2uXar5RkYsfuKDAVx+UlDL2eK8Tn5am3
	4Pjgh0BC0Ehjh8CicoK6hvnE0w7bZ/rs
X-Received: by 10.37.170.66 with SMTP id s60mr9170811ybi.150.1494240949686;
	Mon, 08 May 2017 03:55:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Mon, 8 May 2017 03:55:19 -0700 (PDT)
In-Reply-To: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
References: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 8 May 2017 13:55:19 +0300
Message-ID: <CAHiDW_EKjU-5n3DgXmos36giMwbw-Xajk=s6M3iCoN30rOZvhA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] connman: upgrade to 1.34
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
X-List-Received-Date: Mon, 08 May 2017 10:55:57 -0000
Content-Type: multipart/alternative; boundary=94eb2c19e70003f521054f0115ee

--94eb2c19e70003f521054f0115ee
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 13:46, Maxin B. John <maxin.john@intel.com> wrote:

> 1.33 -> 1.34
>
> 1. Refreshed 0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
> 2. Removed upstreamed patch:
>      0003-stats-Fix-bad-file-descriptor-initialisation.patch
> 3. Provided a PACKAGECONFIG for nftables support
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc      |   1 +
>  ...x-compile-on-musl-with-kernel-4.9-headers.patch |  37 ++++++--
>  ...ll-nftables-fix-build-with-libnftnl-1.0.7.patch |  72 +++++++++++++++
>  ...ts-Fix-bad-file-descriptor-initialisation.patch | 102
> ---------------------
>  .../connman/{connman_1.33.bb => connman_1.34.bb}   |   6 +-
>  5 files changed, 103 insertions(+), 115 deletions(-)
>  create mode 100644 meta/recipes-connectivity/
> connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
>  delete mode 100644 meta/recipes-connectivity/connman/connman/0003-stats-
> Fix-bad-file-descriptor-initialisation.patch
>  rename meta/recipes-connectivity/connman/{connman_1.33.bb =>
> connman_1.34.bb} (70%)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc
> b/meta/recipes-connectivity/connman/connman.inc
> index 64a5418..7c7b5c7 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -50,6 +50,7 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp
> --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
>  PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--
> disable-pptp,,pptp-linux"
>  # WISPr support for logging into hotspots, requires TLS
>  PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
> +PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
>

The default is "--with-firewall=iptables", I think it would be reasonable
to make that explicit in the packageconfig line. Also, the iptables
dependency is probably only needed in the iptables case?

Jussi

--94eb2c19e70003f521054f0115ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2017 at 13:46, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mail=
to:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">1.33 -&gt; 1.34<br>
<br>
1. Refreshed 0001-Fix-compile-on-musl-with-<wbr>kernel-4.9-headers.patch<br=
>
2. Removed upstreamed patch:<br>
=C2=A0 =C2=A0 =C2=A00003-stats-Fix-bad-file-<wbr>descriptor-initialisation.=
<wbr>patch<br>
3. Provided a PACKAGECONFIG for nftables support<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/<wbr>connman/connman.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...x-compile-on-musl-with-<wbr>kernel-4.9-headers.patch |=C2=A0 37 ++=
++++--<br>
=C2=A0...ll-nftables-fix-build-with-<wbr>libnftnl-1.0.7.patch |=C2=A0 72 ++=
+++++++++++++<br>
=C2=A0...ts-Fix-bad-file-descriptor-<wbr>initialisation.patch | 102 -------=
--------------<br>
=C2=A0.../connman/{<a href=3D"http://connman_1.33.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">connman_1.33.bb</a> =3D&gt; <a href=3D"http://connman_1.34.=
bb" rel=3D"noreferrer" target=3D"_blank">connman_1.34.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
=C2=A05 files changed, 103 insertions(+), 115 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>connman/connman/000=
1-firewall-<wbr>nftables-fix-build-with-<wbr>libnftnl-1.0.7.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>connman/connman/000=
3-stats-<wbr>Fix-bad-file-descriptor-<wbr>initialisation.patch<br>
=C2=A0rename meta/recipes-connectivity/<wbr>connman/{<a href=3D"http://conn=
man_1.33.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.33.bb</a> =3D&g=
t; <a href=3D"http://connman_1.34.bb" rel=3D"noreferrer" target=3D"_blank">=
connman_1.34.bb</a>} (70%)<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>connman/connman.inc b/meta/reci=
pes-connectivity/<wbr>connman/connman.inc<br>
index 64a5418..7c7b5c7 100644<br>
--- a/meta/recipes-connectivity/<wbr>connman/connman.inc<br>
+++ b/meta/recipes-connectivity/<wbr>connman/connman.inc<br>
@@ -50,6 +50,7 @@ PACKAGECONFIG[l2tp] =3D &quot;--enable-l2tp --with-l2tp=
=3D${sbindir}/xl2tpd,<wbr>--disable-l2t<br>
=C2=A0PACKAGECONFIG[pptp] =3D &quot;--enable-pptp --with-pptp=3D${sbindir}/=
pptp,--<wbr>disable-pptp,,pptp-linux&quot;<br>
=C2=A0# WISPr support for logging into hotspots, requires TLS<br>
=C2=A0PACKAGECONFIG[wispr] =3D &quot;--enable-wispr,--disable-<wbr>wispr,gn=
utls,&quot;<br>
+PACKAGECONFIG[nftables] =3D &quot;--with-firewall=3Dnftables ,,nftables,nf=
tables&quot;<br></blockquote><div><br></div><div>The default is &quot;--wit=
h-firewall=3Diptables&quot;, I think it would be reasonable to make that ex=
plicit in the packageconfig line. Also, the iptables dependency is probably=
 only needed in the iptables case?</div><div>=C2=A0</div><div>Jussi</div></=
div></div></div>

--94eb2c19e70003f521054f0115ee--
