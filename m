Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id F119B77C9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:58:11 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id i124so41749865ybc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kb5l1LxOKAlsi6JqRBif6wgE6lczq4uRaMDJ+7Eh6ok=;
	b=b8dUaRfDUB094GsFdcsPEazlZVyLeomDDs2ucdun1hcIWObn5UH6uU3dJBnagshdad
	n5X+qZWuP0eOUHi6WdEdXVxtLt8Hb6Zrjvxt2dQccZWyBe0vQGzrBUK3+03qHTuyDgDS
	AcEPnlU4+ORv2h/TrHpFxCB2WNgjQkcHWaAIVUEM80jEW9WOZYV5aCebvxLRECkzT1QK
	LFfic2oCtdKT19MeHbI01yJrxo6GrQt1KGp1eYrpDC+Dx55OkDBLDmRK4dw11DpfGZY6
	rt3ZszIq7Bt0Xk10FzVPhSvBNMoi8RxtNh59CFRC8jnwjo5I5OAcGER4sDaW0sR/b+We
	7aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kb5l1LxOKAlsi6JqRBif6wgE6lczq4uRaMDJ+7Eh6ok=;
	b=KLkt2Lmws8h0nFpQCLO1fZ5JbHdmJcK+0vzVk3kiJfY+IYvM4zphCZEP9Cx/7NtuZx
	76vly8kODdBfx2wWtM9hxhS5/s0nUVaNUvJJ+hpUqBLseOoxpID6bZrFtQLHa+wVb82Z
	5VxEa3GF4++dcUh2iVtuSmNpUKlLLIXX4dvFjSbGVt40Awa7v+xyl8Hv1bhVk/Tta0Ed
	ov4f0GsxUJz5nc/m74gdsgxJ0T93pLM9AlV3CrIF5dqy7W8B6vMUOaJ9oR/ByhfOb9BB
	vt94g2sguCCiZ3OUMX5BrI4Xz73NpQgP5Vn5H6NABSxB7KbuJeB39dK8In+gQLe3vi9u
	1ILA==
X-Gm-Message-State: AN3rC/7j+tgGnPBiRBFC88a/JazGTHJS8K/MzvKAOwpa+1JpyrpBjoCSOt6RXdlZUWulnSngPq89gHhGTlR8uq1c
X-Received: by 10.37.177.162 with SMTP id h34mr3401496ybj.68.1491897492911;
	Tue, 11 Apr 2017 00:58:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Tue, 11 Apr 2017 00:57:42 -0700 (PDT)
In-Reply-To: <1491894357-128763-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1491894357-128763-1-git-send-email-rebecca.swee.fun.chang@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Apr 2017 10:57:42 +0300
Message-ID: <CAHiDW_F8U+ho73BV8k7cXbJ0tqufEGR9LVqNDBveTZhLDZsq=w@mail.gmail.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ed: update to 1.14.2
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
X-List-Received-Date: Tue, 11 Apr 2017 07:58:12 -0000
Content-Type: multipart/alternative; boundary=f403045eb1201b4db3054cdf7424

--f403045eb1201b4db3054cdf7424
Content-Type: text/plain; charset=UTF-8

On 11 April 2017 at 10:05, <rebecca.swee.fun.chang@intel.com> wrote:

> From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
>
> The previous version of ed-1.14.1 no longer exist in upstream source
> archive at https://ftp.gnu.org/gnu/ed/. Upstream version was being
> replaced by a brand new version.
>

Feature freeze is in effect: version upgrades should either wait until
after release or come with a very good reason.

Maxin sent a patch earlier to use the yocto mirror as SRC_URI: not ideal
but probably the best we can do if upstream really wants to delete old
releases...

Cheers,
  Jussi


> Updated version to build and tarball checksums.
>
> [YOCTO #11322]
>
> Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} (84%)
>
> diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb
> b/meta/recipes-extended/ed/ed_1.14.2.bb
> similarity index 84%
> rename from meta/recipes-extended/ed/ed_1.14.1.bb
> rename to meta/recipes-extended/ed/ed_1.14.2.bb
> index 5d89a87..8cd9392 100644
> --- a/meta/recipes-extended/ed/ed_1.14.1.bb
> +++ b/meta/recipes-extended/ed/ed_1.14.2.bb
> @@ -13,8 +13,8 @@ bindir = "${base_bindir}"
>
>  SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
>
> -SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
> -SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adc
> e953aa1b8958e04c5b7bf11d556f32552a"
> +SRC_URI[md5sum] = "273d04778b2a51f7c3cbfcd2001876bf"
> +SRC_URI[sha256sum] = "f57962ba930d70d02fc71d6be5c5f2
> 346b16992a455ab9c43be7061dec9810db"
>
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045eb1201b4db3054cdf7424
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 April 2017 at 10:05,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rebecca.swe=
e.fun.chang@intel.com" target=3D"_blank">rebecca.swee.fun.chang@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: &quot;Chang, R=
ebecca Swee Fun&quot; &lt;<a href=3D"mailto:rebecca.swee.fun.chang@intel.co=
m">rebecca.swee.fun.chang@intel.<wbr>com</a>&gt;<br>
<br>
The previous version of ed-1.14.1 no longer exist in upstream source<br>
archive at <a href=3D"https://ftp.gnu.org/gnu/ed/" rel=3D"noreferrer" targe=
t=3D"_blank">https://ftp.gnu.org/gnu/ed/</a>. Upstream version was being<br=
>
replaced by a brand new version.<br></blockquote><div><br></div><div>Featur=
e freeze is in effect: version upgrades should either wait until after rele=
ase or come with a very good reason.</div><div><br></div><div>Maxin sent a =
patch earlier to use the yocto mirror as SRC_URI: not ideal but probably th=
e best we can do if upstream really wants to delete old releases...</div><d=
iv><br></div><div>Cheers,</div><div>=C2=A0 Jussi</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
Updated version to build and tarball checksums.<br>
<br>
[YOCTO #11322]<br>
<br>
Signed-off-by: Chang, Rebecca Swee Fun &lt;<a href=3D"mailto:rebecca.swee.f=
un.chang@intel.com">rebecca.swee.fun.chang@intel.<wbr>com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/ed/{<a href=3D"http://ed_1.14.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">ed_<wbr>1.14.1.bb</a> =3D&gt; <a href=3D"http://e=
d_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">ed_1.14.2.bb</a>} | 4 ++-=
-<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/ed/{<a href=3D"http://ed_1.14.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ed_<wbr>1.14.1.bb</a> =3D&gt; <a href=3D"=
http://ed_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">ed_1.14.2.bb</a>}=
 (84%)<br>
<br>
diff --git a/meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ed_<wbr>1.14.1.bb</a> b/meta/recipes-exte=
nded/ed/<a href=3D"http://ed_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank=
">ed_<wbr>1.14.2.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=3D=
"noreferrer" target=3D"_blank">ed_1.<wbr>14.1.bb</a><br>
rename to meta/recipes-extended/ed/<a href=3D"http://ed_1.14.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">ed_1.<wbr>14.2.bb</a><br>
index 5d89a87..8cd9392 100644<br>
--- a/meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=3D"noref=
errer" target=3D"_blank">ed_<wbr>1.14.1.bb</a><br>
+++ b/meta/recipes-extended/ed/<a href=3D"http://ed_1.14.2.bb" rel=3D"noref=
errer" target=3D"_blank">ed_<wbr>1.14.2.bb</a><br>
@@ -13,8 +13,8 @@ bindir =3D &quot;${base_bindir}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/ed/ed-${PV}.<wbr>tar.lz&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>7f4a54fa7f366479f03654b8af645f<wbr>d0&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>ffb97eb8f2a2b5a71a9b97e3872adc<wbr>e953a=
a1b8958e04c5b7bf11d556f32<wbr>552a&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>273d04778b2a51f7c3cbfcd2001876<wbr>bf&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>f57962ba930d70d02fc71d6be5c5f2<wbr>346b1=
6992a455ab9c43be7061dec98<wbr>10db&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
</font></span></blockquote></div><br></div></div>

--f403045eb1201b4db3054cdf7424--
