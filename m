Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9B977026;
	Thu,  4 Aug 2016 20:07:07 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l69so15857625lfg.1;
	Thu, 04 Aug 2016 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vfSl9U9k7rC8X2jI1G5zAVWghNN446ISPeyjGGuzxSU=;
	b=TUf3JEqEvjOxBCOJCmCgebopQosCWuZB/WagYqMMg9HLPUeMKZ7rwNBjGhxa5cSD71
	lh6EzxFpoSSEM9RWscT3OIwduFkGqrQbQYZKPKqU6q8YylDrrbdff648gTvwc7kMbYFy
	nTk813FCagdZRqTVWWhNOT/gUkbmie23L+j8EDa1h854tQ1JYTSBQlDV360n/QGKoVJd
	Cwk/8PPI1gJMcHPnHBc863Qb5CCYRkHNrkxSKR7r8OQnLaPl9aJf/1KE+ZZ7/twZ29ZA
	LyjwZ1XdBBHwqaIhgRUQcvsfmQ45RMaWPGgmmtBaDPz3pgYd21TDtbmymoql2dFtzN+Z
	KQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vfSl9U9k7rC8X2jI1G5zAVWghNN446ISPeyjGGuzxSU=;
	b=X6vih2QmL2TfrpGzydP40+36RM/mIKxK5blCKCzV88OIRoIc4RHxJXS/wH3gF3igyY
	rCFphmHG+RCMUOlJEfSMDoGI7aIjcQcrMo28epygCI1yIm3xw+IWW7a+f0QgvcClvw23
	2Z9gI/UKrng0pOcPhYxNVbQTZ+kjlsRMsezYVjMBK73VpkRaEaXATbKE1J66hog/ZwKo
	an0BOw1/4pNZEaokyrPraUPt8eawPAl8UqWkHuBb5vlQmUJeM4TY/98J61bEi6F6lGQU
	yGruBOVlKYq3wTPk7y2m1ECld6npp13AnANtmyIwLrLN0UzxTYOrWSR6uaG207NF37Rx
	wWeA==
X-Gm-Message-State: AEkoouuIFeTc0mrxqhycPOcl6iHDwFLUeDQFWotgBNpmviw2FEsbKOWk4anGc6PeRIgeGwMdzC926yzq5UE9sQ==
X-Received: by 10.25.215.82 with SMTP id o79mr25509970lfg.132.1470341227898;
	Thu, 04 Aug 2016 13:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 4 Aug 2016 13:07:07 -0700 (PDT)
In-Reply-To: <20160804195647.196D05017B@opal.openembedded.org>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195647.196D05017B@opal.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Aug 2016 22:07:07 +0200
Message-ID: <CA+chaQd-NdfPr0zwcrEewwoEhxqbDk9df23m1+s4EmUvgDvhsA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 05/10: pointercal-xinput: set ALLOW_EMPTY
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
X-List-Received-Date: Thu, 04 Aug 2016 20:07:10 -0000
Content-Type: multipart/alternative; boundary=001a11412c36966c3e0539447e42

--001a11412c36966c3e0539447e42
Content-Type: text/plain; charset=UTF-8

NAK

On Thu, Aug 4, 2016 at 9:56 PM, <git@git.openembedded.org> wrote:

> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit 461a01e4f126d5e45ca720e0e8d0e35afb13672c
> Author: Ross Burton <ross.burton@intel.com>
> AuthorDate: Tue Aug 2 21:00:56 2016 +0100
>
>     pointercal-xinput: set ALLOW_EMPTY
>
>     Many BSPs don't have pointer calibration, so set ALLOW_EMPTY so the
> package
>     still exists (for dependencies) even if there isn't a calibration file
> to
>     package.
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-
> xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-
> xinput_0.0.bb
> index 65348c3..71756c3 100644
> --- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -17,4 +17,5 @@ do_install() {
>  }
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> +ALLOW_EMPTY_${PN} = "1"
>  CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
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

--001a11412c36966c3e0539447e42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NAK</div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Thu, Aug 4, 2016 at 9:56 PM,  <span dir=3D"ltr">&lt;<a href=3D"=
mailto:git@git.openembedded.org" target=3D"_blank">git@git.openembedded.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">rpurdie pushed a c=
ommit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit 461a01e4f126d5e45ca720e0e8d0e3<wbr>5afb13672c<br>
Author: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burto=
n@intel.com</a>&gt;<br>
AuthorDate: Tue Aug 2 21:00:56 2016 +0100<br>
<br>
=C2=A0 =C2=A0 pointercal-xinput: set ALLOW_EMPTY<br>
<br>
=C2=A0 =C2=A0 Many BSPs don&#39;t have pointer calibration, so set ALLOW_EM=
PTY so the package<br>
=C2=A0 =C2=A0 still exists (for dependencies) even if there isn&#39;t a cal=
ibration file to<br>
=C2=A0 =C2=A0 package.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xinput-<wbr>calibrator/<a href=3D"http://pointe=
rcal-xinput_0.0.bb" rel=3D"noreferrer" target=3D"_blank">pointercal-xinput_=
<wbr>0.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>xinput-calibrator/<a href=3D"http:/=
/pointercal-xinput_0.0.bb" rel=3D"noreferrer" target=3D"_blank">pointercal-=
<wbr>xinput_0.0.bb</a> b/meta/recipes-graphics/<wbr>xinput-calibrator/<a hr=
ef=3D"http://pointercal-xinput_0.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>pointercal-<wbr>xinput_0.0.bb</a><br>
index 65348c3..71756c3 100644<br>
--- a/meta/recipes-graphics/<wbr>xinput-calibrator/<a href=3D"http://pointe=
rcal-xinput_0.0.bb" rel=3D"noreferrer" target=3D"_blank">pointercal-<wbr>xi=
nput_0.0.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>xinput-calibrator/<a href=3D"http://pointe=
rcal-xinput_0.0.bb" rel=3D"noreferrer" target=3D"_blank">pointercal-<wbr>xi=
nput_0.0.bb</a><br>
@@ -17,4 +17,5 @@ do_install() {<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
=C2=A0CONFFILES_${PN} =3D &quot;${sysconfdir}/pointercal.<wbr>xinput&quot;<=
br>
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

--001a11412c36966c3e0539447e42--
