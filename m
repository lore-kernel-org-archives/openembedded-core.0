Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id DC38577CCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:58:43 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c17so10733448iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ePGhJ680zHuhqLRBvwVmr3/17CEUzWS2AM6pko7HICI=;
	b=mU47fvuGE9yb4FCyd/rvrxMSKs72zcQlZASB11OwI5oIyKqqJ0+18ZZvbzVA3tUP9D
	KA2q/ZCXGLfiUBwY+gLnIQbSbPpDHfgGh+qeFR6i0FpLZ/d6CLEXLMT29ScLmHylTJeD
	KUq3FEIsBsORET2hbMrPwqDJiT7TSd89QYuyK0u5pzAYg/A5CHR6Q8wN+g0L7GbZz05v
	cf5Fp9bVUHpp+orvh2s1E/ERqvn6q66ifQuyEOccgaoz4xfL+WUTUrGlEqYQCR/eItMZ
	tSOok+Y8JrJU0Cc5v+Lhq9/MxabV7mjhGHckRyJrjtLfYdTIZ1KWapDS8VZlFf1hnBB1
	5NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ePGhJ680zHuhqLRBvwVmr3/17CEUzWS2AM6pko7HICI=;
	b=DuGK4fMrdaP/DKWyKs0Cxt1/1zFOfI+/bX1mOORu+Ab7VXeM9Q7s1X+fMsCXNpN/Zo
	niKDXlvW0UZgXBIbvxYSwLW2ddvAkR3Q/gFayjj+7SiKCH5xemZR+ES3OYs5kTyf0zF+
	bPLi6irEpnP5ADWCcQ9RuBycfz3TrSeJFnZvgbOE+ez2dhXPLugGiNfHYJvVitXOxSrj
	uV/co3zeLnBQxVwULMhtLS673K7TOBxGor55H6YHAYFvh8qBqPeslG7SbYDhcodNFL5x
	tZkeNkRLmF2QUry6jxPokbrwAbBAu7fKQa2TFdZWHk586ZLcaXlCZ8lbEPvk5nLPg0tt
	kiyQ==
X-Gm-Message-State: AKwxytf+yiwoyWKTngKjkiS/LvDwhtUYlRqqL9QuuApk374Ud5gq6Ts+
	h6/fswccs1VzDZ/CKKD8i/eoAGN9a6W4DEjSzPqA0w==
X-Google-Smtp-Source: AH8x226Mas/z8db6Avp3EVcfooLx8zT7A7/KGSbyYY6nH/iBJqBo5Z2mWxxcuZZmvBfkjUXoEmMFCG+ZlzRirrEuxMc=
X-Received: by 10.107.175.8 with SMTP id y8mr31198ioe.37.1516651125018; Mon,
	22 Jan 2018 11:58:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 11:58:24 -0800 (PST)
In-Reply-To: <20180118084826.102791-1-dmitriyz@waymo.com>
References: <20180118084826.102791-1-dmitriyz@waymo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 19:58:24 +0000
Message-ID: <CAJTo0LZiiwa2nM2b9r1eF1hikLPcPq5Zzdh71nhxDkyG7NLyOA@mail.gmail.com>
To: Dima Zavin <dmitriyz@waymo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pigz: specify that we runtime-provide gzip
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
X-List-Received-Date: Mon, 22 Jan 2018 19:58:44 -0000
Content-Type: multipart/alternative; boundary="001a1144a2688e2582056362dba8"

--001a1144a2688e2582056362dba8
Content-Type: text/plain; charset="UTF-8"

Rejecting as pigz is not compatible with gzip, I'm ripping out this
provides right now.

Ross

On 18 January 2018 at 08:48, Dima Zavin <dmitriyz@waymo.com> wrote:

> Without this, nativesdk-texinfo fails to build with messages about
> nothing rproviding nativesdk-gzip. That gets pulled in
> when we add "compress_doc" to INHERIT in a distro.
>
> Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
> ---
>
> Not sure if this is the best way to fix the problem, or if I properly
> diagnosed it, but this seems to fix it.
>
>  meta/recipes-extended/pigz/pigz.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/pigz/pigz.inc
> b/meta/recipes-extended/pigz/pigz.inc
> index 978f905329..01b41dddff 100644
> --- a/meta/recipes-extended/pigz/pigz.inc
> +++ b/meta/recipes-extended/pigz/pigz.inc
> @@ -8,6 +8,7 @@ SECTION = "console/utils"
>  LICENSE = "Zlib & Apache-2.0"
>
>  PROVIDES_class-native += "gzip-native"
> +RPROVIDES_${PN} = "gzip"
>
>  DEPENDS = "zlib"
>
> --
> 2.16.0.rc1.238.g530d649a79-goog
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144a2688e2582056362dba8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rejecting as pigz is not compatible with gzip, I&#39;m rip=
ping out this provides right now.<div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 18 January 2018 at 0=
8:48, Dima Zavin <span dir=3D"ltr">&lt;<a href=3D"mailto:dmitriyz@waymo.com=
" target=3D"_blank">dmitriyz@waymo.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Without this, nativesdk-texinfo fails to build with mes=
sages about<br>
nothing rproviding nativesdk-gzip. That gets pulled in<br>
when we add &quot;compress_doc&quot; to INHERIT in a distro.<br>
<br>
Signed-off-by: Dima Zavin &lt;<a href=3D"mailto:dmitriyz@waymo.com">dmitriy=
z@waymo.com</a>&gt;<br>
---<br>
<br>
Not sure if this is the best way to fix the problem, or if I properly<br>
diagnosed it, but this seems to fix it.<br>
<br>
=C2=A0meta/recipes-extended/pigz/<wbr>pigz.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-extended/pigz/<wbr>pigz.inc b/meta/recipes-extend=
ed/pigz/<wbr>pigz.inc<br>
index 978f905329..01b41dddff 100644<br>
--- a/meta/recipes-extended/pigz/<wbr>pigz.inc<br>
+++ b/meta/recipes-extended/pigz/<wbr>pigz.inc<br>
@@ -8,6 +8,7 @@ SECTION =3D &quot;console/utils&quot;<br>
=C2=A0LICENSE =3D &quot;Zlib &amp; Apache-2.0&quot;<br>
<br>
=C2=A0PROVIDES_class-native +=3D &quot;gzip-native&quot;<br>
+RPROVIDES_${PN} =3D &quot;gzip&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;zlib&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.16.0.rc1.238.g530d649a79-<wbr>goog<br>
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

--001a1144a2688e2582056362dba8--
