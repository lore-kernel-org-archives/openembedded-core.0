Subject: Re: [meta-oe][PATCH] libva: Removed virtual/mesa dependency
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
X-Originating-Location: Spytkowice, Lesser Poland, PL (83.26.235.191)
X-Originating-Platform: Linux Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 25 Apr 2020 12:38:56 -0700
References: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
In-Reply-To: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
Message-ID: <28192.1587843536617759309@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="eju6FBWh8sYBnFQ6rUtj"

--eju6FBWh8sYBnFQ6rUtj
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2020 at 06:46 AM, Khem Raj wrote:

>
>=20
>=20
> On 4/24/20 8:01 AM, Bart=C5=82omiej Burdukiewicz wrote:
> > Mesa can be compiled with libva support, in order to avoid recursive
> > dependency between mesa and libva, virtual/mesa must be removed
> > from libva recipe.
> >=20
> > Signed-off-by: Bart=C5=82omiej Burdukiewicz <bartlomiej.burdukiewicz@g=
mail.com>
> > ---
> >  meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb
> b/meta/recipes-graphics/libva/libva_2.6.1.bb
> > index 92cea83bc1..c1a441a18b 100644
> > --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
> > +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
> > @@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D
> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940
> >
> >  UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
> >
> > -DEPENDS =3D "libdrm virtual/mesa"
> > +DEPENDS =3D "libdrm"
>=20
> I am not sure how it will work with non-mesa graphics stacks. Or is it
> non-issue ?

It looks like libva is designed to work without mesa (or other graphical s=
tacks), since it's using libdrm to dispatch kernel calls.
https://en.wikipedia.org/wiki/Direct_Rendering_Manager#/media/File:DRM_arc=
hitecture.svg

There is also ebuild in Gentoo for libva do not depend on mesa (https://da=
ta.gpo.zugaina.org/gentoo/x11-libs/libva/libva-2.6.1.ebuild) or other graph=
ical stacks (like nvidia-drivers or etc.).

I'll provide more information about actual problem that is happening in me=
ta-kodi and it's related to this patch.

There is append that I created for meta-kodi, that is extending mesa with =
libva and libvdpau capabilities:=20
https://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphics/mesa/mes=
a_%25.bbappend

And this is current workaround for libva to avoid recursive dependency:
https://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphics/libva/li=
bva_%25.bbappend

>=20
> >
> >  inherit meson pkgconfig features_check
> >
> >=20
> >=20
> >=20
> >=20
>=20
>

--eju6FBWh8sYBnFQ6rUtj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>On Sat, Apr 25, 2020 at 06:46 AM, Khem Raj wrote:</p>

<blockquote>
<p>On 4/24/20 8:01 AM, Bart=C5=82omiej Burdukiewicz wrote:
&gt; Mesa can be compiled with libva support, in order to avoid recursive
&gt; dependency between mesa and libva, virtual/mesa must be removed
&gt; from libva recipe.
&gt;
&gt; Signed-off-by: Bart=C5=82omiej Burdukiewicz <a href=3D"mailto:bartlom=
iej.burdukiewicz@gmail.com" target=3D"_blank">bartlomiej.burdukiewicz@gmail=
.com</a>
&gt; ---
&gt;  meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +-
&gt;  1 file changed, 1 insertion(+), 1 deletion(-)
&gt;
&gt; diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb
b/meta/recipes-graphics/libva/libva_2.6.1.bb
&gt; index 92cea83bc1..c1a441a18b 100644
&gt; --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
&gt; +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
&gt; @@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D
&quot;6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940
&gt;
&gt;  UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/intel/lib=
va/releases&quot;" target=3D"_blank">https://github.com/intel/libva/release=
s&quot;</a>
&gt;
&gt; -DEPENDS =3D &quot;libdrm virtual/mesa&quot;
&gt; +DEPENDS =3D &quot;libdrm&quot;</p>

<p>I am not sure how it will work with non-mesa graphics stacks. Or is it
non-issue ?</p>
</blockquote>

<p>It looks like libva is designed to work without mesa (or other graphica=
l stacks), since it's using libdrm to dispatch kernel calls.
<a href=3D"https://en.wikipedia.org/wiki/Direct_Rendering_Manager#/media/F=
ile:DRM_architecture.svg" target=3D"_blank">https://en.wikipedia.org/wiki/D=
irect_Rendering_Manager#/media/File:DRM_architecture.svg</a></p>

<p>There is also ebuild in Gentoo for libva do not depend on mesa (<a href=
=
=3D"https://data.gpo.zugaina.org/gentoo/x11-libs/libva/libva-2.6.1.ebuild"=
 target=3D"_blank">https://data.gpo.zugaina.org/gentoo/x11-libs/libva/libva=
-2.6.1.ebuild</a>) or other graphical stacks (like nvidia-drivers or etc.).=
</p>

<p>I'll provide more information about actual problem that is happening in=
 meta-kodi and it's related to this patch.</p>

<p>There is append that I created for meta-kodi, that is extending mesa wi=
th libva and libvdpau capabilities:
<a href=3D"https://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphi=
cs/mesa/mesa_%25.bbappend" target=3D"_blank">https://github.com/dev-0x7C6/m=
eta-kodi/blob/zeus/recipes-graphics/mesa/mesa_%25.bbappend</a></p>

<p>And this is current workaround for libva to avoid recursive dependency:
<a href=3D"https://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphi=
cs/libva/libva_%25.bbappend" target=3D"_blank">https://github.com/dev-0x7C6=
/meta-kodi/blob/zeus/recipes-graphics/libva/libva_%25.bbappend</a></p>

<blockquote>
<blockquote>
<p>inherit meson pkgconfig features_check</p>
</blockquote>
</blockquote>

--eju6FBWh8sYBnFQ6rUtj--
