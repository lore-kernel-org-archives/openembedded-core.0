Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0819178766
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:34:35 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id l12so8981033ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D8nvdcCLaej3mS3mJbaEqV/Tq2KribnNFDhCuzLDF1o=;
	b=1/AOVqhNBJ+izjRG0kDs7G9Topts31Bdlca6LT0WSKYhyADCs2Pk4VcdrTvf3/2d9+
	0QzATdEwnPt5KJwgEdtMA/5v5uYFG5hxV0WcKnABeWLhkv5JSXC2o27m5t4B3gJcmRqi
	v/CizHQMDpJjmdgpnVAT1q9FHwS1Y3p8It7JuNXQg/pAEaryx57DYIul+0vJqV8Abbgw
	8Nsy3N4XNF/tP3kFQkJDxrklk6QULnaRZldgKAtGMmm1F6WAPuzNia8ClwusXJlBtB/N
	kD54nxuPwOq9QxcZIXEkJTzDa1FO/g8H6wyfS7+bxy6ngIJipOgIxkAVYFdxjkOlqtVR
	TQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D8nvdcCLaej3mS3mJbaEqV/Tq2KribnNFDhCuzLDF1o=;
	b=JaYGMFRnw2yYy+2iCAyxSv33Iuv7pWwfIp+LVpYKj0povt+k6g1XwaBvOfDV1X5//9
	MN6icHHyhwBpq3fGxjfmm09Q2J5HmdJFURo95hUk8OrkatGF53/cAsEIULeASqVfvc36
	9pLmgwNF28rLyr/y95CcD/scvHFGyzqPh2iUU+GUQ5an4ab8wmcuXq7hmOUfedM+tOQ4
	P4mqIlDADh9fGaabpTNTHyFMNW2TW+2W5kDf885M4mxtY+SimQO0CuUJTK5kiKao3AID
	EUi8bH+fME6hpfIOt1k3HnIur1Rt0IPsXhxcOUyyjHD4QlpMJw9jkEU0Dxvz9dmJuAWP
	Fq2g==
X-Gm-Message-State: AElRT7HueoHL4bccDgrylE7S53IxD54xqGd45BFZCRrX7k7b7+bRUNEN
	lD6jmdJ8SCC4IXXZdnYG52NLoq6Saarn10uhMzzEqg==
X-Google-Smtp-Source: AG47ELsl6XJQNVZO5p/rf+K3Sy4xFgfuDW/I6zJ4gtWA6sCjsjvx94VrpxkWIn3KgAsx7NDcufC4bMoXKPTkUmTQVmc=
X-Received: by 10.107.183.76 with SMTP id h73mr4229344iof.201.1519947277309;
	Thu, 01 Mar 2018 15:34:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 15:34:16 -0800 (PST)
In-Reply-To: <20180301140052.1388-7-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
	<20180301140052.1388-7-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 23:34:16 +0000
Message-ID: <CAJTo0Lb+JQLsZh+ZKC0BPyg+uo=u0rROS44=Er6ezHr0f1QOsQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/15] gtk-doc.bbclass: inherit python3native
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
X-List-Received-Date: Thu, 01 Mar 2018 23:34:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b9e3a8ab4f10566624dd0"

--94eb2c0b9e3a8ab4f10566624dd0
Content-Type: text/plain; charset="UTF-8"

Can the inherit of python3native be avoided if gtk-doc isn't enabled?  (I
just removed the dependency on py3native in glib)

Ross

On 1 March 2018 at 14:00, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Previously the use of native python3 was non-deterministic based on what
> specific recipes pulled in,
> and could cause a failure if host python3 did not have python3-six
> installed.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/gtk-doc.bbclass | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
> index 5201c7151c6..9bc8fa2b21d 100644
> --- a/meta/classes/gtk-doc.bbclass
> +++ b/meta/classes/gtk-doc.bbclass
> @@ -33,7 +33,7 @@ do_configure_prepend () {
>         ( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
>  }
>
> -inherit qemu
> +inherit qemu pkgconfig python3native
>
>  export STAGING_DIR_HOST
>
> @@ -65,6 +65,3 @@ fi
>  EOF
>          chmod +x ${B}/gtkdoc-qemuwrapper
>  }
> -
> -
> -inherit pkgconfig
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b9e3a8ab4f10566624dd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can the inherit of python3native be avoided if gtk-doc isn=
&#39;t enabled? =C2=A0(I just removed the dependency on py3native in glib)<=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 1 March 2018 at 14:00, Alexander Kanavin <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_bl=
ank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Previously the use of native python3 was non-determinis=
tic based on what specific recipes pulled in,<br>
and could cause a failure if host python3 did not have python3-six installe=
d.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/gtk-doc.bbclass | 5 +----<br>
=C2=A01 file changed, 1 insertion(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass<br=
>
index 5201c7151c6..9bc8fa2b21d 100644<br>
--- a/meta/classes/gtk-doc.bbclass<br>
+++ b/meta/classes/gtk-doc.bbclass<br>
@@ -33,7 +33,7 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} =
|| true )<br>
=C2=A0}<br>
<br>
-inherit qemu<br>
+inherit qemu pkgconfig python3native<br>
<br>
=C2=A0export STAGING_DIR_HOST<br>
<br>
@@ -65,6 +65,3 @@ fi<br>
=C2=A0EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ${B}/gtkdoc-qemuwrapper<br>
=C2=A0}<br>
-<br>
-<br>
-inherit pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
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

--94eb2c0b9e3a8ab4f10566624dd0--
