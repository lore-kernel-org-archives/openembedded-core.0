Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4D078752
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 15:56:09 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id v194-v6so2700282itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RdEiA2i1u9iIyX9t8Dvrg9+QgrnYmJ3xJnYQS4s5k5k=;
	b=GB6Bls3W8+ykZzBgqACS2mVOWoyDXn32dQTAJmPKozeZO9P4KT0+F2ye2EgosHg18E
	u60rnjgLvKsErudvPuiXWvgcwxrkVqlejpE/1VvXEaQjHdNLWtAK2B4MOOhA3/+g8f4K
	D8FPY3+yzf2v99KMTDgk/tsm/bXk1yZvGXphoJX4i4JKtdRawOD86hnCSRIxclGc9i70
	ypk1sS788lFBH73DcXrbQGOy2u0+OzARtz226rLII4pyTf7zj5brM6p+bOXiINApoDwb
	SxhbeUNkEhuI+mDdi+CMK+j7nbHqX5IvPwlzFePLfH3IXKg8Ys0jvMWHnCKpkDJmv2u1
	TWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RdEiA2i1u9iIyX9t8Dvrg9+QgrnYmJ3xJnYQS4s5k5k=;
	b=rmzobRf+CbW3EAuCN8GtmC8v0t3qQBww+vvPxLQFLa6SHk3QbCtZgpLIMF97fqmAxw
	tTs8cbBIfT7w5xUAvH2RC8vEQOWjEvZlTKUsUBvI4UAvn9jHBEk27rXTaOw4f2sdqFFl
	45GTmW1zheG+V5uejfjJ7Xpi+PA0CwoaePBm1AgfgFMqb9Npp4IpxiEel/nZSAvxAhxX
	hVy+0Qc2tSS8C7UCToTwr39Tc6lC7Vza1dIH3fnBTW9Nb0X/AzK8AiQa5eDK3HNKHou5
	Xu38iBU+bz268QJRtDy0aHA0am4vvdmN0ND+bFnXrs876b0nlVIlhiG9VNaabYHye6B6
	9E6g==
X-Gm-Message-State: AElRT7H1CgmfblB8xkklbXYQ5u8IbI+3B5YdxO/Q1EhmdGheVQGW8S8y
	xET+GfhYbcRXYppot3nqH9q9cBMJ7A5qFISO9OK1KA==
X-Google-Smtp-Source: AG47ELuX3bKWPPJ5rczgWjZwbSJUIJjUxIqalS48gllWLEz+spamvhfAIXcwqSunzptAR1EBZJqqLZbqHB8Au+ClnEM=
X-Received: by 2002:a24:b918:: with SMTP id
	w24-v6mr2725938ite.127.1521215771165; 
	Fri, 16 Mar 2018 08:56:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 16 Mar 2018 08:55:50 -0700 (PDT)
In-Reply-To: <20180312091303.121887-6-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<20180312091303.121887-6-xiao.zhang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Mar 2018 15:55:50 +0000
Message-ID: <CAJTo0LbpnSnL0dCyFKrgmotsFvN7=74gdnQQ9xZz2=yd+qP6tA@mail.gmail.com>
To: Zhang Xiao <xiao.zhang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] xtrans: fix file conflict when multilib enabled
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
X-List-Received-Date: Fri, 16 Mar 2018 15:56:10 -0000
Content-Type: multipart/alternative; boundary="000000000000aae254056789a59d"

--000000000000aae254056789a59d
Content-Type: text/plain; charset="UTF-8"

Is this because they use libdir?  Surely a better solution would be to move
the .pc into $libdir/pkgconfig instead of $datadir/pkgconfig?

Ross

On 12 March 2018 at 09:13, Zhang Xiao <xiao.zhang@windriver.com> wrote:

> Script file xtrans.pc conflicts between 32 and 64 bit packages.
> Use update-alternatives to add base_libdir as suffix to avoid it.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
> b/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
> index d5b7f1a2c6..ef64f1fcfc 100644
> --- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
> +++ b/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
> @@ -16,7 +16,20 @@ PE = "1"
>
>  RDEPENDS_${PN}-dev = ""
>
> -inherit gettext
> +inherit gettext  update-alternatives
> +
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +FILES_${PN}-dev += "${datadir}/pkgconfig/xtrans.pc-${MULTILIB_SUFFIX}"
> +ALTERNATIVE_${PN}-dev = "xtrans.pc"
> +ALTERNATIVE_LINK_NAME[xtrans.pc] = "${datadir}/pkgconfig/xtrans.pc"
> +ALTERNATIVE_TARGET[xtrans.pc] = "${datadir}/pkgconfig/xtrans.
> pc-${MULTILIB_SUFFIX}"
> +
> +PACKAGE_PREPROCESS_FUNCS += "xtrans_alternative_rename"
> +
> +xtrans_alternative_rename() {
> +        mv ${PKGD}${datadir}/pkgconfig/xtrans.pc
> ${PKGD}${datadir}/pkgconfig/xtrans.pc-${MULTILIB_SUFFIX}
> +}
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000aae254056789a59d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this because they use libdir?=C2=A0 Surely a better sol=
ution would be to move the .pc into $libdir/pkgconfig instead of $datadir/p=
kgconfig?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 12 March 2018 at 09:13, Zhang Xiao <span dir=
=3D"ltr">&lt;<a href=3D"mailto:xiao.zhang@windriver.com" target=3D"_blank">=
xiao.zhang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Script file xtrans.pc conflicts between 32 and 64 bit packages.<br>
Use update-alternatives to add base_libdir as suffix to avoid it.<br>
<br>
Signed-off-by: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">x=
iao.zhang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xtrans_1.3.5.bb=
" rel=3D"noreferrer" target=3D"_blank">xtrans_1.3.5.bb</a> | 15 +++++++++++=
+++-<br>
=C2=A01 file changed, 14 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xtrans_1=
.3.5.bb" rel=3D"noreferrer" target=3D"_blank">xtrans_1.3.5.bb</a> b/meta/re=
cipes-graphics/xorg-<wbr>lib/<a href=3D"http://xtrans_1.3.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">xtrans_1.3.5.bb</a><br>
index d5b7f1a2c6..ef64f1fcfc 100644<br>
--- a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xtrans_1.3.5.bb=
" rel=3D"noreferrer" target=3D"_blank">xtrans_1.3.5.bb</a><br>
+++ b/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xtrans_1.3.5.bb=
" rel=3D"noreferrer" target=3D"_blank">xtrans_1.3.5.bb</a><br>
@@ -16,7 +16,20 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
<br>
-inherit gettext<br>
+inherit gettext=C2=A0 update-alternatives<br>
+<br>
+MULTILIB_SUFFIX =3D &quot;${@d.getVar(&#39;base_libdir&#39;,1).<wbr>split(=
&#39;/&#39;)[-1]}&quot;<br>
+<br>
+FILES_${PN}-dev +=3D &quot;${datadir}/pkgconfig/xtrans.<wbr>pc-${MULTILIB_=
SUFFIX}&quot;<br>
+ALTERNATIVE_${PN}-dev =3D &quot;xtrans.pc&quot;<br>
+ALTERNATIVE_LINK_NAME[xtrans.<wbr>pc] =3D &quot;${datadir}/pkgconfig/xtran=
s.<wbr>pc&quot;<br>
+ALTERNATIVE_TARGET[xtrans.pc] =3D &quot;${datadir}/pkgconfig/xtrans.<wbr>p=
c-${MULTILIB_SUFFIX}&quot;<br>
+<br>
+PACKAGE_PREPROCESS_FUNCS +=3D &quot;xtrans_alternative_rename&quot;<br>
+<br>
+xtrans_alternative_rename() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${PKGD}${datadir}/pkgconfig/<wbr>xtrans.pc =
${PKGD}${datadir}/pkgconfig/<wbr>xtrans.pc-${MULTILIB_SUFFIX}<br>
+}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
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

--000000000000aae254056789a59d--
