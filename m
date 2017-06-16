Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2307A7844E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:14:00 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id p198so1483206yba.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/DxGzMpCPU/y29DdzrrWHz8OyWL5S4iRZGyCIT0ZORg=;
	b=n47B1nGCM63cHwgjDqAlKHCL4fBQcsXC31VQzNLoL5inyHc8bGL8OcH/gGV1kJORS9
	rb54NEN8nVfDAfxbYas2VoOTlyTPagI/X4Zgg8QxhsQLnhYsKrTV1VUfzVI3hcO6G07x
	tR0HzKv1BImi4Uegq6qeApEX70H4J6znn2d6GiLncmzqWGej6Ejy3nHj6nqQ2lOWHc3c
	cHWhN3eYpBZhc64zCF3H3PbBgAhwklfSwhEWezh2CV9jpOoXB4hyQoWuUNw+G1TU8jnW
	8D3ZopIlenh7NyDcdZkALn5hS5NcnzcPCLBqQ2q8J8E00VonHf8j4nBkOBUux7YnPa+K
	ImMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/DxGzMpCPU/y29DdzrrWHz8OyWL5S4iRZGyCIT0ZORg=;
	b=cUVjPMIap4eIPcJKAnKIL3szNDeC11zjS6kLkLVzXgy7fmVhPaFOQv1QyCqAub+JHE
	UK50QDG25PEpYy9uim29m8Jcz9Pv1Kzh5ZolTc0Np6XqAwv1mpKjQRplnTTBiKr3Av8K
	aUVwtdoWEJtnOPcos7fWZqZyH5xxdZoUUDsC/reC8fTa3uNPdoeruW40tAhRWWE9Eymo
	tTLBiDXI6gJEERAKR3JKYh21YuRoqwMZKKBuW+2AhQvhgCJMyO2Siz4w2XtHhEFzZIp8
	LZamzCs9ZxFnLvuTSq2kRAjbhPDNRM4nfndgMsSt/Q7ky/W6hFqi9ZIBddkovDwX4lP0
	hs8w==
X-Gm-Message-State: AKS2vOzAez8c2XWZ/05KGdHndQQ7a14ktXldaA5RmlYMxPP+Qrtzy74D
	vtV76STwAXdHGGWENd/WJ5Mje+BVIQ==
X-Received: by 10.37.176.140 with SMTP id f12mr3156776ybj.231.1497600841666;
	Fri, 16 Jun 2017 01:14:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 16 Jun 2017 01:14:01 -0700 (PDT)
In-Reply-To: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Jun 2017 09:14:01 +0100
Message-ID: <CA+chaQdp2TtKZ2T8B-1dDiYZjc_Q7mOZow2sdhs2vAAT_7rr_w@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg-utils: bump PV to 0.3.5
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
X-List-Received-Date: Fri, 16 Jun 2017 08:14:01 -0000
Content-Type: multipart/alternative; boundary="f403045e54e62ed8cf05520f5ef1"

--f403045e54e62ed8cf05520f5ef1
Content-Type: text/plain; charset="UTF-8"

Shouldn't you bump SRCREV as well?

On Fri, Jun 16, 2017 at 12:17 AM, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index ed5980b..f72b7a4 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 94d55d512a9ba36caa9b7df079bae19f \
>  PROVIDES += "${@bb.utils.contains('PACKAGECONFIG',
> 'update-alternatives', 'virtual/update-alternatives', '', d)}"
>
>  SRCREV = "1a708fd73d10c2b7677dd4cc4e017746ebbb9166"
> -PV = "0.3.4+git${SRCPV}"
> +PV = "0.3.5+git${SRCPV}"
>
>  SRC_URI = "git://git.yoctoproject.org/opkg-utils \
>             file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045e54e62ed8cf05520f5ef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t you bump SRCREV as well?</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jun 16, 2017 at 12:17 A=
M, Alejandro del Castillo <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro=
.delcastillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alejandro d=
el Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.com">alejandro.d=
elcastillo@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-u=
tils_git.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a> b/m=
eta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_git.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a><br>
index ed5980b..f72b7a4 100644<br>
--- a/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>94d55d=
512a9ba36caa9b7df079bae1<wbr>9f \<br>
=C2=A0PROVIDES +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;=
, &#39;update-alternatives&#39;, &#39;virtual/update-alternatives&#39;, &#3=
9;&#39;, d)}&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;<wbr>1a708fd73d10c2b7677dd4cc4e0177<wbr>46ebbb9166&q=
uot;<br>
-PV =3D &quot;0.3.4+git${SRCPV}&quot;<br>
+PV =3D &quot;0.3.5+git${SRCPV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/opkg-u=
tils" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/<wbr>opkg-u=
tils</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Switch-all-<wbr>scrip=
ts-to-use-Python-3.x.<wbr>patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--f403045e54e62ed8cf05520f5ef1--
