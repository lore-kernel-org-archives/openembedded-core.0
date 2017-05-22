Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 839AC71975
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 22:41:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b84so19979501wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=pLqX6e6+Gyi5znebzNZPMI2DUN00D1BlgjHaOISYI1E=;
	b=DGNUc4arWTAulMoXLeue+2MUzSdFULxS0i1CLt9o8pEUlGTdTDrXDHERixrJ5pU5UD
	Ji1+30b1O3AdYrXefqAQuqCJNu+giKZ3GQVNgm1/33L0Z2Rq/Conq2CwJze6yQb8kXER
	TvvMCWF/MjiKOVp+0MJCASssEDwc/4EuYciezmUxxPMHD9A21B0fk4mOKiyf46lQPQ0r
	913L809umZID9HIA+bU4huGQ4TBbGoIHtcVhA7xNOuCsZKUjHCksbZD8ezyIKt9rhhEl
	vwr0CiPPcXRrvbVE3G2NBpCvSWzNdtVQY5NUSZa/zUTg7aV3oBdd1OVTDt3z+2jbn+Ad
	32zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=pLqX6e6+Gyi5znebzNZPMI2DUN00D1BlgjHaOISYI1E=;
	b=Z9Fct1JzqlLLz5w2cu5hLkta88eFDiMxcoloCmdU1ngNTzbfMxMDikaWyPbKl954yf
	FFwYgWgdvo1h3KE8SdXTY34D1B62YwBP/zUyrxmWE572wUSWqQ9NpXHZU4MAaW35IWIU
	nUpgtR25WuYG1jcy/XNCSf2liZz9FD7onPzTKKmLDnzHNw38MOag9zxYNhJLpDJ4eDu4
	aHOfSMMwp68ZvPAnPluX71ITMHj+1zlNWbNxyEzjAxuln1fJKfzNWVgUUSUvuBJXgrv1
	vGlDg9eEH1yGJP+SQOFYU7x10RTMknuumMz6Gf4tGwdowu8mZeFIMJHDNAR8tsJDeaB3
	jRjQ==
X-Gm-Message-State: AODbwcD2lr584zBI/JKJJrBcDcGep4H5hcRgmKkYDMDOD4iV2eAH56mq
	xIT20RIBxPlp8B5UMLF9a7rxViK9Cw==
X-Received: by 10.80.143.227 with SMTP id y90mr12031996edy.131.1495492892710; 
	Mon, 22 May 2017 15:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20170522222523.15978-1-alejandro.hernandez@linux.intel.com>
In-Reply-To: <20170522222523.15978-1-alejandro.hernandez@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2017 22:41:22 +0000
Message-ID: <CAMKF1soNk9DWEuiYSy_zQ=MrUSK186FAGQJOSDOu=_nfHGByqw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] intltool: Adds gettext as a DEPENDS
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
X-List-Received-Date: Mon, 22 May 2017 22:41:33 -0000
Content-Type: multipart/alternative; boundary="f403045c9202a2668505502492da"

--f403045c9202a2668505502492da
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 3:25 PM Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> When setting USE_NLS="no" and building systemd-boot
> (which DEPENDS on intltool), configure fails,
> complaining about missing gettext:
>
> configure: error: GNU gettext tools not found; required for intltool
>
> This is caused because USE_NLS="no" makes the gettext class
> add gettext-minimal-native to BASEDEPENDS instead of adding
> gettext-native.
>
> Since we still would like to set USE_NLS="no" and build systemd-boot,
> we add gettext-native as a dependency to intltool-native, which makes it
> available for the configure script of systemd-boot fixing the problem.
>
> [YOCTO #11562]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-devtools/intltool/intltool_0.51.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
> b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
> index 551bdf0619a..ecff2faf253 100644
> --- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
> +++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
> @@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI = "
> https://launchpad.net/intltool/trunk/"
>
>  DEPENDS = "libxml-parser-perl-native"
>  RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
> -DEPENDS_class-native = "libxml-parser-perl-native"
> +DEPENDS_class-native = "libxml-parser-perl-native gettext-native"


This will serialise the build I think it better to add the dep only when
NLS is down disabled

>
>
>  inherit autotools pkgconfig perlnative
>
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c9202a2668505502492da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Mon, May 22, 2017 at 3:25 PM Al=
ejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com=
">alejandro.hernandez@linux.intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">When setting USE_NLS=3D&quot;no&quot; and building system=
d-boot<br>
(which DEPENDS on intltool), configure fails,<br>
complaining about missing gettext:<br>
<br>
configure: error: GNU gettext tools not found; required for intltool<br>
<br>
This is caused because USE_NLS=3D&quot;no&quot; makes the gettext class<br>
add gettext-minimal-native to BASEDEPENDS instead of adding<br>
gettext-native.<br>
<br>
Since we still would like to set USE_NLS=3D&quot;no&quot; and build systemd=
-boot,<br>
we add gettext-native as a dependency to intltool-native, which makes it<br=
>
available for the configure script of systemd-boot fixing the problem.<br>
<br>
[YOCTO #11562]<br>
<br>
Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernande=
z@linux.intel.com" target=3D"_blank">alejandro.hernandez@linux.intel.com</a=
>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/intltool/<a href=3D"http://intltool_0.51.0.bb" =
rel=3D"noreferrer" target=3D"_blank">intltool_0.51.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/intltool/<a href=3D"http://intltool_0.51=
.0.bb" rel=3D"noreferrer" target=3D"_blank">intltool_0.51.0.bb</a> b/meta/r=
ecipes-devtools/intltool/<a href=3D"http://intltool_0.51.0.bb" rel=3D"noref=
errer" target=3D"_blank">intltool_0.51.0.bb</a><br>
index 551bdf0619a..ecff2faf253 100644<br>
--- a/meta/recipes-devtools/intltool/<a href=3D"http://intltool_0.51.0.bb" =
rel=3D"noreferrer" target=3D"_blank">intltool_0.51.0.bb</a><br>
+++ b/meta/recipes-devtools/intltool/<a href=3D"http://intltool_0.51.0.bb" =
rel=3D"noreferrer" target=3D"_blank">intltool_0.51.0.bb</a><br>
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://launchpad=
.net/intltool/trunk/" rel=3D"noreferrer" target=3D"_blank">https://launchpa=
d.net/intltool/trunk/</a>&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libxml-parser-perl-native&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;gettext-dev libxml-parser-perl&quot;<br>
-DEPENDS_class-native =3D &quot;libxml-parser-perl-native&quot;<br>
+DEPENDS_class-native =3D &quot;libxml-parser-perl-native gettext-native&qu=
ot;</blockquote><div><br></div><div>This will serialise the build I think i=
t better to add the dep only when NLS is down disabled=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><br>
<br>
=C2=A0inherit autotools pkgconfig perlnative<br>
<br>
--<br>
2.12.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c9202a2668505502492da--
