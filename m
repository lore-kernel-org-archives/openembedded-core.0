Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id EE76560132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 15:32:33 +0000 (UTC)
Received: by oies6 with SMTP id s6so31249156oie.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 07:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3haypWp5QAG0A7r5zNHiaZThNiJOcst3OJZ7vjA5wes=;
	b=w73vEkWmroIai1y8nlY2irYLOGcJXkkbhtt8QClXyHmRMOHnRXzRRROPsiR1RL9iei
	dQSHgrL6G+9kwYLWcEdTjhi6pnm4S6H74GFnVKaZMTLwn1yvFcyZLcg91Mb4rVBPjeqE
	aX3BoemsDRTGtZj4dCMSMeP4O7aVAiDDeGMl0gOhCdoNgAAXKWYvJZusTNBa6BhPPRzH
	kE5YwyZcR93JPh/cadkqNvZ4JkuHePZm6cpGy8AMafAk1N1KTIOtnWoA3UkkZWgIT+S+
	drpY9n3VJ7SButeQWen41DzAHnI50cEZ/wjEXLitBTCRxzTsvj6fX+Fb4cNRKJspSTZC
	sPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3haypWp5QAG0A7r5zNHiaZThNiJOcst3OJZ7vjA5wes=;
	b=Vvcro2d8XKiiiINJZA7OrkkE5HfXiorcTFDe4F/+0MZ9qbRJ5K5H+2BTiMRXo3H2ZJ
	uI9NbL2qi7rfh2+MNRc6Rp6Z4AVqajcbB8FcfQUKlLJ8gJIqJKfpE6EKCe0SoXRaEaH4
	qhrswUhSmRiQfxCd1S5Xp43yH6tZ9uhLVVrmSWhHTtNprPxq6VLXeDCWc6rOufFxAqm8
	pOl/zt5Ct2H13/DhB9XQ9IXx0cQjOoSZ0MHODp9VzRctLbmd8BeevUyRPPONqq4mEZkk
	Jpd7QfNMwcnljMPoKIuZMwAPhLSWLB7+4JEYfU0y8yYCprGzbiFe3AkZQuHhecWm0+yy
	9K6Q==
X-Gm-Message-State: ALoCoQkEzuBtas/Bj0vc9tHni17KFbInOdrEL+XVBUjgBgkNCHG8dw4dit9DpwyXMlVrEDbyM8u2
X-Received: by 10.202.228.137 with SMTP id b131mr24417337oih.100.1448465553925;
	Wed, 25 Nov 2015 07:32:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Wed, 25 Nov 2015 07:32:04 -0800 (PST)
In-Reply-To: <20151125150207.GP17303@jama>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
	<21d1633f21cba7e686512da7bc843de7e3ccf3d7.1448455166.git.jussi.kukkonen@intel.com>
	<20151125150207.GP17303@jama>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 25 Nov 2015 17:32:04 +0200
Message-ID: <CAHiDW_FKd-qixnGQ-4jmy3nCxcRvi+utC3mpmbRDjN7e_8MW8w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gstreamer1.0-plugins-good: Fix gudev dependency
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
X-List-Received-Date: Wed, 25 Nov 2015 15:32:37 -0000
Content-Type: multipart/alternative; boundary=001a114037b6cfc4e505255f2a15

--001a114037b6cfc4e505255f2a15
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Nov 25, 2015 at 03:05:37PM +0200, Jussi Kukkonen wrote:
> > libgudev is now it's own library (also provided by udev).
>
> Duplicates http://patchwork.openembedded.org/patch/107479/

This is true, sorry. Assuming the gudev commit goes in, the best
gstreamer-plugins patches seem to be your v2-patches (instead of v3 that
removed gudev from default packageconfigs): v2 seems to be what is still in
your branch so that should work fine.

I'll remove these two gstreamer1.0-plugins.* commits from my branch.

Jussi

>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> index 1119e10..c2ada4d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> @@ -20,7 +20,7 @@ PACKAGECONFIG[pulseaudio] =
"--enable-pulse,--disable-pulse,pulseaudio"
>  PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
>  PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>  PACKAGECONFIG[gdk-pixbuf] =
"--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> -PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
> +PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>  PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
>  PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--001a114037b6cfc4e505255f2a15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 25 November 2015 at 17:02, Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>&gt=
;<br>&gt; On Wed, Nov 25, 2015 at 03:05:37PM +0200, Jussi Kukkonen wrote:<b=
r>&gt; &gt; libgudev is now it&#39;s own library (also provided by udev).<b=
r>&gt;<br>&gt; Duplicates <a href=3D"http://patchwork.openembedded.org/patc=
h/107479/">http://patchwork.openembedded.org/patch/107479/</a><br><br>This =
is true, sorry. Assuming the gudev commit goes in, the best gstreamer-plugi=
ns=C2=A0patches=C2=A0seem to be your v2-patches (instead of v3 that removed=
 gudev from=C2=A0default packageconfigs): v2 seems to be what is still in y=
our branch so that should work fine.<div><br></div><div>I&#39;ll remove the=
se two gstreamer1.0-plugins.* commits from my branch.=C2=A0</div><div><br><=
/div><div>Jussi<br><div>=C2=A0<br></div><div>&gt;<br>&gt; Signed-off-by: Ju=
ssi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen=
@intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-good.inc | 2 +-<br>&gt; =C2=A01 file changed, 1 in=
sertion(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-multime=
dia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-good.inc<br>&gt; index 1119e10..c2ada4d 100644<br=
>&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc=
<br>&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.=
inc<br>&gt; @@ -20,7 +20,7 @@ PACKAGECONFIG[pulseaudio] =3D &quot;--enable-=
pulse,--disable-pulse,pulseaudio&quot;<br>&gt; =C2=A0PACKAGECONFIG[cairo] =
=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-cairo,--disable-cairo,cairo&quot;<br=
>&gt; =C2=A0PACKAGECONFIG[flac] =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-fla=
c,--disable-flac,flac&quot;<br>&gt; =C2=A0PACKAGECONFIG[gdk-pixbuf] =3D &qu=
ot;--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf&quot;<br>&gt; -PACKA=
GECONFIG[gudev] =C2=A0 =C2=A0 =C2=A0=3D &quot;--with-gudev,--without-gudev,=
udev&quot;<br>&gt; +PACKAGECONFIG[gudev] =C2=A0 =C2=A0 =C2=A0=3D &quot;--wi=
th-gudev,--without-gudev,libgudev&quot;<br>&gt; =C2=A0PACKAGECONFIG[jack] =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-jack,--disable-jack,jack&quot;<br>&=
gt; =C2=A0PACKAGECONFIG[jpeg] =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-jpeg,=
--disable-jpeg,jpeg&quot;<br>&gt; =C2=A0PACKAGECONFIG[libpng] =C2=A0 =C2=A0=
 =3D &quot;--enable-libpng,--disable-libpng,libpng&quot;<br>&gt; --<br>&gt;=
 2.1.4<br>&gt;<br>&gt; --<br>&gt; _________________________________________=
______<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Ope=
nembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded=
.org</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/=
openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembed=
ded-core</a><br><br>--<br>Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber:=
 <a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a></div>=
</div></div>

--001a114037b6cfc4e505255f2a15--
