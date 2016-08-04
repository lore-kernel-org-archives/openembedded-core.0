Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5021877026;
	Thu,  4 Aug 2016 20:10:08 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l69so15861253lfg.1;
	Thu, 04 Aug 2016 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=98Pr4sP7dBb4aDHSNBKpi/PGPHSTepV4sbYDccbf5T8=;
	b=xaWjAzrt5+I88mn/8TrcMz4KmUG5nUsz/xxmDCkVUGkmR7rFG8+KBATPOte12JUTDX
	tBPmYH80SaqNDwnXW21tnAfn7uYRwm4yhCQcdmxkSjoQMz5GQ3egM8k/pIujHKSTSdAb
	2JDLGfpUYpITf8iGn+5A8d+rg1CdTUFwWyfLc0XkxIDATl/9Ucp9aD5QR3AhJuaP173n
	YAPxcxq9CsuqhhX7owijK3i0Xc/EiSxgDfslnn0YoN803VpQPr+kG1HgiplOz2c8vHEB
	2dRRextwvNwxRWjM7HuqTpdzIT7RaeGrQr/HO8xEL4TRNA4WPAZGWbd8Rm9dSqdjdI+T
	ZaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=98Pr4sP7dBb4aDHSNBKpi/PGPHSTepV4sbYDccbf5T8=;
	b=cc8sJf0YIdf12x+9jgujt5YoqGF0h9OhlJvcqFDOiJxxzUUtV6Z3WZc35q4UaxY0LZ
	tXXPJlhujiFOBoDcWTQJ3kMaeGjaNEe3TfgM/C4yC8L8Jo8piqakJGYMaoGYm0x69DgQ
	+Ja5Zzrl+TFLtXSLKRAUlBL5UDyJSHmYI+DoHJqzfyVNBP8qBcepNveCa8gjNlrhRsix
	+nMgM3n17fzJAIMvvrCyqukWc7B7SCEaBx3ZCl+cw6hC41dRDZ07HRk/1hvg65bwTQGb
	W9ka/p8Sq5EiZHNxLT464uDkVEpi1/mNzkaKCWyh/fzxAcIeFHlJvE/nARAjSoM/mugq
	sZ6w==
X-Gm-Message-State: AEkoouvYRd5AA4FihWeKhDjPDYxRoMwkpdPjUA3hfkfHucExffXFSdYMOw24ArPIuFPFO8gpGHXFTsDyEMzixQ==
X-Received: by 10.25.1.213 with SMTP id 204mr25103883lfb.114.1470341408436;
	Thu, 04 Aug 2016 13:10:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 4 Aug 2016 13:10:07 -0700 (PDT)
In-Reply-To: <20160804195648.2D3B95017B@opal.openembedded.org>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195648.2D3B95017B@opal.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Aug 2016 22:10:07 +0200
Message-ID: <CA+chaQfEmQ9jAMZB6CTDw3m_6tqQ_AyNCffRjtjz_qrtuz+8Gw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 10/10: packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Thu, 04 Aug 2016 20:10:09 -0000
Content-Type: multipart/alternative; boundary=001a113c990c5938aa053944891a

--001a113c990c5938aa053944891a
Content-Type: text/plain; charset=UTF-8

NAK pointercal-xinput is useless without xinput-calibrator.

Just remove pointercal and let x11-common pull xinput-calibrator with
pointercal-xinupt by RRECOMMENDS.

On Thu, Aug 4, 2016 at 9:56 PM, <git@git.openembedded.org> wrote:

> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit 7242599ff64e40d24383dd1852616a8f99416d0d
> Author: Maxin B. John <maxin.john@intel.com>
> AuthorDate: Tue Jul 12 17:07:41 2016 +0300
>
>     packagegroup-core-x11-base.bb: replace pointercal with
> pointercal-xinput
>
>     Replace pointercal with pointercal-xinput since we removed pointercal
> recipe.
>
>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-
> core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-
> core-x11-base.bb
> index db3dfe3..6e8e50d 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> @@ -10,7 +10,7 @@ RDEPENDS_${PN} = "\
>      packagegroup-core-x11-xserver \
>      packagegroup-core-x11-utils \
>      dbus \
> -    pointercal \
> +    pointercal-xinput \
>      matchbox-terminal \
>      matchbox-wm \
>      mini-x-session \
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--001a113c990c5938aa053944891a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NAK pointercal-xinput is useless without xinput-calibrator=
.<div><br></div><div>Just remove pointercal and let x11-common pull xinput-=
calibrator with pointercal-xinupt by RRECOMMENDS.</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 4, 2016 at 9:56 PM,=
  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=
=3D"_blank">git@git.openembedded.org</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit 7242599ff64e40d24383dd1852616a<wbr>8f99416d0d<br>
Author: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">maxin.joh=
n@intel.com</a>&gt;<br>
AuthorDate: Tue Jul 12 17:07:41 2016 +0300<br>
<br>
=C2=A0 =C2=A0 <a href=3D"http://packagegroup-core-x11-base.bb" rel=3D"noref=
errer" target=3D"_blank">packagegroup-core-x11-base.bb</a>: replace pointer=
cal with pointercal-xinput<br>
<br>
=C2=A0 =C2=A0 Replace pointercal with pointercal-xinput since we removed po=
intercal recipe.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john=
@intel.com">maxin.john@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://packagegro=
up-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr=
>core-x11-base.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://pac=
kagegroup-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegro=
up-<wbr>core-x11-base.bb</a> b/meta/recipes-graphics/<wbr>packagegroups/<a =
href=3D"http://packagegroup-core-x11-base.bb" rel=3D"noreferrer" target=3D"=
_blank">packagegroup-<wbr>core-x11-base.bb</a><br>
index db3dfe3..6e8e50d 100644<br>
--- a/meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://packagegro=
up-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr=
>core-x11-base.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://packagegro=
up-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr=
>core-x11-base.bb</a><br>
@@ -10,7 +10,7 @@ RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-core-x11-xserver \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-core-x11-utils \<br>
=C2=A0 =C2=A0 =C2=A0dbus \<br>
-=C2=A0 =C2=A0 pointercal \<br>
+=C2=A0 =C2=A0 pointercal-xinput \<br>
=C2=A0 =C2=A0 =C2=A0matchbox-terminal \<br>
=C2=A0 =C2=A0 =C2=A0matchbox-wm \<br>
=C2=A0 =C2=A0 =C2=A0mini-x-session \<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--001a113c990c5938aa053944891a--
