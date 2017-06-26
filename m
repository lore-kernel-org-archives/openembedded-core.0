Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD6777E9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:52:50 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id n136so491920lfn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/+1E1pH42WLnMif1cywh4pYODvn3plvD9+aiZC85xL0=;
	b=PHD9buasdudRf6arkqfniPmpy+NUjqfKN93Lc9PTywQwFedYAtLYdk0DJJlr4zXVen
	44VFf+N+KhZupdxzrR4tmDCYymaOHZAAR7gXilnhfF1VWTjSHCa5VW1RWn9kgikPU/xh
	KLQEZlbmwtF3fR8LttXJRMHcI+x2oBQaYWR8y5NUQdgQoZQDu2Rqvdi2uptAzedwUwae
	qi59p2Q6r1mgw5IXEBNokTDH64ZEdRh+f6vCbswLD+MlJbHtLc6kpLXSSKtBW1vLoWlc
	VD3m/D0BtprVkYrm4gFjFsENrbgbm21MaCU+FFPt1ZTDlotW7CPxvbArTC/OY5D75rPI
	JGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/+1E1pH42WLnMif1cywh4pYODvn3plvD9+aiZC85xL0=;
	b=H8tgJ8WRplv0USRkvOwAcu7oGUGcG4leptYHF4sJWPd26yREYiag7tm1ucBD8vtIZk
	yfWZCOhUK+cAPmPZInyO/XJU8p1goXYoShcq6QjjyJpj9tQ/B1e5KzUgFKAbbol+qZpo
	p0ELHlrNIj9eY0bzS74leSzp+UfloErZeKawRiBvwG9tXsF4ABBeBcAXI8/sBFN9FUjk
	VkU4HTyjNjGYRyMkokuwBWFZFpqThUEuEPLjBELPDCTxenamBghwuCpJXdhqsXidph+n
	FQn3toAWnFA/UvP9zRihkpxCvDmBnl1hPpS8z0iSX2d2iB88GyLrTF6lwVKTrMcthm08
	J1DA==
X-Gm-Message-State: AKS2vOz9aFzobBe/AfVnKC8o8BRd8uupa+i61VxgEN3VKohlaNAoR338
	cXS6h0BDbEX/iuG1FxWdHst0b7jVDw==
X-Received: by 10.25.27.2 with SMTP id b2mr256851lfb.24.1498492371043; Mon, 26
	Jun 2017 08:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 26 Jun 2017 08:52:50 -0700 (PDT)
In-Reply-To: <20170621120003.6440-2-razvan.heghedus@ni.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<20170621120003.6440-2-razvan.heghedus@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Jun 2017 11:52:50 -0400
Message-ID: <CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com>
To: Heghedus Razvan <razvan.heghedus@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: user defined KERNEL_VERSION_PKG_NAME
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
X-List-Received-Date: Mon, 26 Jun 2017 15:52:50 -0000
Content-Type: multipart/alternative; boundary="001a1140244c798c540552def10e"

--001a1140244c798c540552def10e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <razvan.heghedus@ni.com>
wrote:

> Add possibility to set KERNEL_VERSION_PKG_NAME to a user
> defined value.
>
> Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
> ---
>  meta/classes/kernel.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 605c101e62..02728d5a86 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
>  # LINUX_VERSION which is a constant.
>  KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
>  KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
> -KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.
> getVar('KERNEL_VERSION'))}"
> -KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>
>  python __anonymous () {
>      import re
>
> +    if d.getVar('USER_KERNEL_VERSION_PKG') is None :
> +        d.setVar('KERNEL_VERSION_PKG_NAME',
> "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}")
> +        d.setVar('KERNEL_VERSION_PKG_NAME[vardepvalue]',
> "${LINUX_VERSION}")
> +    else:
> +        d.setVar('KERNEL_VERSION_PKG_NAME',
> "${@legitimize_package_name(d.getVar('USER_KERNEL_VERSION_PKG'))}")
>

This is introducing yet another variable that tweaks the already complex
setting of
the kernel version. Not to mention this code is already touchy with respect
to
parse time and rebuilding of the kernel.

My concern is that if this is set, we are completely disassociated with the
source
code of the kernel.

Where did you think this would be set ? local.conf ? distro config ?
somewhere else ?

If we had a way to simply override KERNEL_VERSION, we wouldn't need any
extra
variables.

Bruce


> +
>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
> KERNEL_IMAGETYPES
>      type = d.getVar('KERNEL_IMAGETYPE') or ""
>      alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> --
> 2.13.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1140244c798c540552def10e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <span dir=3D"ltr">&lt;=
<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add possibi=
lity to set KERNEL_VERSION_PKG_NAME to a user<br>
defined value.<br>
<br>
Signed-off-by: Heghedus Razvan &lt;<a href=3D"mailto:razvan.heghedus@ni.com=
" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 605c101e62..02728d5a86 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?=3D &quot;&quot;<br>
=C2=A0# LINUX_VERSION which is a constant.<br>
=C2=A0KERNEL_VERSION_NAME =3D &quot;${@d.getVar(&#39;KERNEL_VERSION&#39;) o=
r &quot;&quot;}&quot;<br>
=C2=A0KERNEL_VERSION_NAME[vardepval<wbr>ue] =3D &quot;${LINUX_VERSION}&quot=
;<br>
-KERNEL_VERSION_PKG_NAME =3D &quot;${@legitimize_package_name(d.<wbr>getVar=
(&#39;KERNEL_VERSION&#39;))}&quot;<br>
-KERNEL_VERSION_PKG_NAME[varde<wbr>pvalue] =3D &quot;${LINUX_VERSION}&quot;=
<br>
<br>
=C2=A0python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;USER_KERNEL_VERSION_<wbr>PKG&#39;) is None =
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_VERSION_PKG_N<wbr>AME&#39=
;, &quot;${@legitimize_package_name(d.<wbr>getVar(&#39;KERNEL_VERSION&#39;)=
)}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_VERSION_PKG_N<wbr>AME[var=
depvalue]&#39;, &quot;${LINUX_VERSION}&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_VERSION_PKG_N<wbr>AME&#39=
;, &quot;${@legitimize_package_name(d.<wbr>getVar(&#39;USER_KERNEL_VERSION_=
PK<wbr>G&#39;))}&quot;)<br></blockquote><div><br></div><div>This is introdu=
cing yet another variable that tweaks the already complex setting of</div><=
div>the kernel version. Not to mention this code is already touchy with res=
pect to</div><div>parse time and rebuilding of the kernel.</div><div><br></=
div><div>My concern is that if this is set, we are completely disassociated=
 with the source</div><div>code of the kernel.</div><div><br></div><div>Whe=
re did you think this would be set ? local.conf ? distro config ? somewhere=
 else ?</div><div><br></div><div>If we had a way to simply override KERNEL_=
VERSION, we wouldn&#39;t need any extra</div><div>variables.</div><div><br>=
</div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0# Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into =
KERNEL_IMAGETYPES<br>
=C2=A0 =C2=A0 =C2=A0type =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;) or &quot;=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0alttype =3D d.getVar(&#39;KERNEL_ALT_IMAGETYPE<wbr>&#39=
;) or &quot;&quot;<br>
<span class=3D"m_-3599068778944099545HOEnZb"><font color=3D"#888888">--<br>
2.13.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"m_-3599068778944099545gmail_signature" data-smartmail=3D"gm=
ail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and =
madness await thee at its end&quot;</div>
</div></div>

--001a1140244c798c540552def10e--
