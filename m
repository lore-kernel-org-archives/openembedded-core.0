Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id F2B5A719B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:23:35 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 49so2106440uac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MKAlxR5P+IkEW+lS0aYhT3ajdB2eboe9fTApVQnY/Pg=;
	b=GXbqMpHapw06dHdFUR1qdJgdY16NRInCk3pWbPJk3zzV71r7aIWHIlBIWXrAaFB15k
	4LaFNa7K7zCde3lYgyz5Pbpu59C3EPfGqh+sZXFDf1c2Bw8HlHzlvh1mACdnl1exlOo/
	WkyiDR8OpESH8rf4OO47R4S/GXukWnv3BylneX7A3lcMoR5pMvyUIXbyXWGUoOuyUghU
	qx2oTK71UqiqjTbeUf9Td11XTvWsCHMhlKk6tNK6kQ4N4jFkTjyFNoMGj0iYlAriIZm1
	FMqw4KsdWmSI6FU3sy0CkIQHmTHRiZIp4S2hIPH+SmI9TwjTy7LibtPZxg3v+JmRyAGV
	pFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MKAlxR5P+IkEW+lS0aYhT3ajdB2eboe9fTApVQnY/Pg=;
	b=DoXC7ar1Jfs8i1RQvL0LpQWN0FA4rOs/Ua/GGCQNnguCpltz2Q4/0kfZhnU+lR3oaR
	GiaUX7C1upwbPF6NCyuZQfWA+8g2LXcal5zUktCo5eae5kpwvMlOhCqm8KVZrFBAnnPw
	w3koPjTydJw3t/amibRA7IxGsAJdnQTNMqLXNUZPNrqUfL/OmZo7n4uv2P8NLh4EqQfC
	cRBxjOoQXSDvoue5mRkj8t4Rp/mCV7lK+kHUem0JT4hfxsXuS7Zv+KNTBtp85SJ9H1de
	wJCkYKpq/FqlXLOoSZjFkXOyq8BpfISg4W7yVRf1hHa+n7ZElZlOiIPrCzdQWOc3G9ck
	BMag==
X-Gm-Message-State: AA6/9RlckATvXeLnTYs7Vb0iQ7mY7Xtk3DJw/Qqo6hlDGPTaW1sRXVMNEofMCO2vY66t9AkFx87aE0GdTn69lA==
X-Received: by 10.159.49.9 with SMTP id m9mr13541948uab.29.1475511816293; Mon,
	03 Oct 2016 09:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 3 Oct 2016 09:23:34 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Mon, 3 Oct 2016 09:23:34 -0700 (PDT)
In-Reply-To: <1475504192-17738-3-git-send-email-ross.burton@intel.com>
References: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
	<1475504192-17738-3-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2016 09:23:34 -0700
Message-ID: <CAMKF1sr8_VKJGtv2W-c_gb15NdBVcndErveyHY0yBUfpDRmkLg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] binutils: fix typo in libtool patch
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
X-List-Received-Date: Mon, 03 Oct 2016 16:23:36 -0000
Content-Type: multipart/alternative; boundary=f403045e4184ac112b053df85d85

--f403045e4184ac112b053df85d85
Content-Type: text/plain; charset=UTF-8

Good catch

On Oct 3, 2016 7:17 AM, "Ross Burton" <ross.burton@intel.com> wrote:

> There was a clear typo in a function name, correct it.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch | 3
> +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> index f2411c4..f0fdf46 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> @@ -16352,7 +16352,7 @@ index 9503ec8..70e856e 100644
>               case "$perm_rpath " in
>               *" $libdir "*) ;;
>  -            *) perm_rpath="$perm_rpath $libdir" ;;
> -+            *) func_apped perm_rpath " $libdir" ;;
> ++            *) func_append perm_rpath " $libdir" ;;
>               esac
>             fi
>           done
> @@ -21175,4 +21175,3 @@ index bba9fd2..25a2dae 100755
>
>  --
>  2.9.0
> -
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045e4184ac112b053df85d85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Good catch</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 3, 2016 7:=
17 AM, &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross.burton@intel.com"=
>ross.burton@intel.com</a>&gt; wrote:<br type=3D"attribution"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">There was a clear typo in a function name, correct it.<br=
>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>libtool-2.=
4.patch | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>lib=
tool-2.4.patch b/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr=
>libtool-2.4.patch<br>
index f2411c4..f0fdf46 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>libtool-2.=
4.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>libtool-2.=
4.patch<br>
@@ -16352,7 +16352,7 @@ index 9503ec8..70e856e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$perm_rpath &qu=
ot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir &quot;*) ;=
;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) perm_rpath=3D&quot;$per=
m_rpath $libdir&quot; ;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) func_apped perm_rpath &quot;=
 $libdir&quot; ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) func_append perm_rpath &quot=
; $libdir&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
@@ -21175,4 +21175,3 @@ index bba9fd2..25a2dae 100755<br>
<br>
=C2=A0--<br>
=C2=A02.9.0<br>
-<br>
--<br>
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
</blockquote></div></div>

--f403045e4184ac112b053df85d85--
