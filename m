Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A59D77CF4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:14:59 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u18so13034198wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YpsimxYKF9qd1s1pD6+qrAtaVbwunX90+Qx7U9jii+k=;
	b=lyXSKmvxSqgl7bEzABC7QRYiHKui+eC80g+mvHitUh4F4FD7YX5D0DO0kSf2ibDpBO
	n63Enf+guih4E7woHygvBu0khq3sH83jMxSQ5TeWT3vGwWW52uTIUr83QpfsISFcqKgn
	8+WJT/dVS6r1FCWe01I1HvZkU8cWt7wavHOz/CraQ1jFbNdHeizmFqFxqrYOIEDW9d7+
	H4B05Ci+0TFX8Px5+r+uL8Qc/hex9VNrA33+aPpUQ+tocAeVJ2b3F1Bvymrrr6MgwGcb
	MO3hso7qLG2MxziWcLsqeC7cN5dh7pDB48DXNJ80D6gzHGrlRP1tG/gRi3zqrbVrrdW8
	IrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YpsimxYKF9qd1s1pD6+qrAtaVbwunX90+Qx7U9jii+k=;
	b=sz2JkMz++kEbAfuSGKU1lnMjM/7A7CJY2Tfm1kM0DA08Ocq4fJritEEIOXwx7eMuva
	l5NGaRcuxhZA5Yaa6lI2mNARB3YEOnRU7/os17PlM48s7HhsehGIPGgwJG7vyW4n7H3q
	g3teKX/MDjmUMgqYyIAzfjuDgAyY6UnKPQk1pRWsnXudvDcdws17ASegP+gEXOv99zVf
	BIpmxAsQZrz3lzWiKGt+zjOHaPFZOX0Sm3GbuzacAn2cHq9jmw3YjEv/YTxaA5MmrUNc
	I8tesEjWZqNZMpcyB2IqmfZMgNqfmSN9YwRNW61qiU7uDI97SOpSa14sW7zBvriy4qHY
	4syw==
X-Gm-Message-State: AFeK/H1lD5f0otySLsOxfe7P/xNtT2zgCX7iXHq32Uky7UnDluHkypzX1Pz1dOPVS/mmLISnbWKCmZuJQgFAow==
X-Received: by 10.28.157.140 with SMTP id g134mr4154723wme.81.1490886899548;
	Thu, 30 Mar 2017 08:14:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 30 Mar 2017 08:14:58 -0700 (PDT)
In-Reply-To: <1490880850-30814-1-git-send-email-ross.burton@intel.com>
References: <1490880850-30814-1-git-send-email-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 Mar 2017 17:14:58 +0200
Message-ID: <CA+chaQfoQYjeoHhMD9zRFoEupixXHSbystQRn50cuKbtGMDJxQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: ensure HOSTTOOLS links point to executables
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
X-List-Received-Date: Thu, 30 Mar 2017 15:15:00 -0000
Content-Type: multipart/alternative; boundary=001a114b41e40c4c68054bf4280a

--001a114b41e40c4c68054bf4280a
Content-Type: text/plain; charset=UTF-8

Shouldn't this bump required bitbake version?

On Thu, Mar 30, 2017 at 3:34 PM, Ross Burton <ross.burton@intel.com> wrote:

> Use the new executable argument to bb.utils.which() to ensure that the
> symlinks
> point to executable files and not for example directories with the right
> name
> which happened to be on $PATH.
>
> [ YOCTO #11256 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/base.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index cf8748a..e29821f 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -128,9 +128,9 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>      for tool in tools:
>          desttool = os.path.join(dest, tool)
>          if not os.path.exists(desttool):
> -            srctool = bb.utils.which(path, tool)
> +            srctool = bb.utils.which(path, tool, executable=True)
>              if "ccache" in srctool:
> -                srctool = bb.utils.which(path, tool, direction=1)
> +                srctool = bb.utils.which(path, tool, executable=True,
> direction=1)
>              if srctool:
>                  os.symlink(srctool, desttool)
>              else:
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114b41e40c4c68054bf4280a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t this bump required bitbake version?</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar 30, 2017=
 at 3:34 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burto=
n@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Use the new executable argument to bb.uti=
ls.which() to ensure that the symlinks<br>
point to executable files and not for example directories with the right na=
me<br>
which happened to be on $PATH.<br>
<br>
[ YOCTO #11256 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/base.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index cf8748a..e29821f 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -128,9 +128,9 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTrue=
):<br>
=C2=A0 =C2=A0 =C2=A0for tool in tools:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desttool =3D os.path.join(dest, tool)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(desttool):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctool =3D bb.utils.which(path,=
 tool)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctool =3D bb.utils.which(path,=
 tool, executable=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;ccache&quot; in sr=
ctool:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctool =3D bb.uti=
ls.which(path, tool, direction=3D1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctool =3D bb.uti=
ls.which(path, tool, executable=3DTrue, direction=3D1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if srctool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(sr=
ctool, desttool)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
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

--001a114b41e40c4c68054bf4280a--
