Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F21460191
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:48:56 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id c45so125299660qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EiBQ4u1MBeOwvbfG1Z69L7W6gnnZya6WC3eQV1jBzDI=;
	b=2TisBd3R7RSn4ZM4oKdCR6LQaYmCBZqR4FuTeS5Lem8SuP6AJd95EzQ9OrbPRtHz4l
	P7Qptnk4bC9UZBhkJxOtrHRwAz8MU0xOu2bRjUwsUINCHDuVOwEFzU1W7AftTxzRytO/
	u/jziC8wuGWnieTw4LubXPwr8z4mwOCsRVQs9hc6urV1VlOGL5PK7N2pMI8jUVSE+ISn
	FlC7/XUBPI/zUPhf8dc8AZfW2pUGXAU2dna2pHC/iFVOuQntzMJNX93/6vEVSy9MuiF0
	kSXdSI7RHY/CTscwUwJeV1pu37PWuOUdefTLk3X6k/ADv/iEsRkRYzBbA0Md2s/fZR3q
	SOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EiBQ4u1MBeOwvbfG1Z69L7W6gnnZya6WC3eQV1jBzDI=;
	b=GIMU++inqOTVevoBxBB+6pFNeuqJfIrWuNbEmanb13eSJUhAyHn3YhQ1Z3ijgJsE9r
	GKMLujac0/V32wJzaSkgk5vDQCeBIQrlskjb4QKUZYBfwenaaMcR+UZhxdJWkJCKclqC
	7AiyX9ttqY8+M3hbQDA4qUEs/k+4wY0vxMu80lVRt1Cc/E6URac0ClQUvKEu5/9qhVrv
	hUNYqaLRvR6bWD0kvKMMP6uxnVg7a8pLPgXDoWRXihuxx2m5kIAtRSg17iku2DtdXM+H
	O935Ra+8QSpq50Z1lyrYZoKhB6Hng7cgvTAA19A+kCtKiNgOMbm94E1K0Yiir/yyvUtE
	vUZw==
X-Gm-Message-State: AN3rC/4NoW69JfKHHWAwIAvOll45Y9Fp0GoQXRJQGEc0TKUsk/RwAraw
	LdrQWOYP7A2jSR84IxOwJ+laQrKTjTyO
X-Received: by 10.200.3.105 with SMTP id w41mr13297681qtg.188.1492523337364;
	Tue, 18 Apr 2017 06:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 06:48:36 -0700 (PDT)
In-Reply-To: <20170418133318.10870-1-jobol@nonadev.net>
References: <20170418133318.10870-1-jobol@nonadev.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 14:48:36 +0100
Message-ID: <CAJTo0LbkaWcx6JMOrC4MdHR_bCxmXrSkx4PLW2XGr1MJh2X+Ug@mail.gmail.com>
To: jobol@nonadev.net
Cc: =?UTF-8?Q?Jos=C3=A9_Bollo?= <jose.bollo@iot.bzh>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmicrohttpd: update to version 0.9.53
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
X-List-Received-Date: Tue, 18 Apr 2017 13:48:57 -0000
Content-Type: multipart/alternative; boundary=f4030435cf5857d037054d712b98

--f4030435cf5857d037054d712b98
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Patches for meta-oe should go to openembedded-devel@, not core@.

Ross

On 18 April 2017 at 14:33, <jobol@nonadev.net> wrote:

> From: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>
> Change-Id: Idc7ef7c532a326eb094b4e557f1a80d4254411d2
> Signed-off-by: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
> ---
>  .../{libmicrohttpd_0.9.52.bb =3D> libmicrohttpd_0.9.53.bb}              =
|
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.52.bb =
=3D>
> libmicrohttpd_0.9.53.bb} (85%)
>
> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.b=
b
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
> similarity index 85%
> rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
> rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
> index b22cc73..a7f032a 100644
> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
> @@ -6,8 +6,8 @@ SECTION =3D "net"
>  DEPENDS =3D "libgcrypt gnutls file"
>
>  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "767111e817e2497ff92f943c5653497a"
> -SRC_URI[sha256sum] =3D "54797f6e763d417627f89f60e4ae0a
> 431dab0523f92f83def23ea02d0defafea"
> +SRC_URI[md5sum] =3D "5a425e993a0f5295aecb5d6607a1c242"
> +SRC_URI[sha256sum] =3D "9b15ec2d381f44936323adfd4f989f
> a35add517cccbbfa581896b02a393c2cc4"
>
>  inherit autotools lib_package pkgconfig gettext
>
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f4030435cf5857d037054d712b98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patches for meta-oe should go to openembedded-devel@, not =
core@.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 18 April 2017 at 14:33,  <span dir=3D"ltr">&lt;=
<a href=3D"mailto:jobol@nonadev.net" target=3D"_blank">jobol@nonadev.net</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Jos=C3=A9 Bollo=
 &lt;jose.bollo@iot.bzh&gt;<br>
<br>
Change-Id: Idc7ef7c532a326eb094b4e557f1a8<wbr>0d4254411d2<br>
Signed-off-by: Jos=C3=A9 Bollo &lt;jose.bollo@iot.bzh&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://libmicrohttpd_0.9.52.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libmicrohttpd_0.9.52.bb</a> =3D&gt; <a href=3D"http://libmi=
crohttpd_0.9.53.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.9.=
53.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/<wbr>libmicrohttpd/{<a href=3D"http://=
libmicrohttpd_0.9.52.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd=
_<wbr>0.9.52.bb</a> =3D&gt; <a href=3D"http://libmicrohttpd_0.9.53.bb" rel=
=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.9.53.bb</a>} (85%)<br>
<br>
diff --git a/meta-oe/recipes-support/<wbr>libmicrohttpd/<a href=3D"http://l=
ibmicrohttpd_0.9.52.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_=
0.<wbr>9.52.bb</a> b/meta-oe/recipes-support/<wbr>libmicrohttpd/<a href=3D"=
http://libmicrohttpd_0.9.53.bb" rel=3D"noreferrer" target=3D"_blank">libmic=
rohttpd_0.<wbr>9.53.bb</a><br>
similarity index 85%<br>
rename from meta-oe/recipes-support/<wbr>libmicrohttpd/<a href=3D"http://li=
bmicrohttpd_0.9.52.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0=
.<wbr>9.52.bb</a><br>
rename to meta-oe/recipes-support/<wbr>libmicrohttpd/<a href=3D"http://libm=
icrohttpd_0.9.53.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.<=
wbr>9.53.bb</a><br>
index b22cc73..a7f032a 100644<br>
--- a/meta-oe/recipes-support/<wbr>libmicrohttpd/<a href=3D"http://libmicro=
httpd_0.9.52.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.<wbr>=
9.52.bb</a><br>
+++ b/meta-oe/recipes-support/<wbr>libmicrohttpd/<a href=3D"http://libmicro=
httpd_0.9.53.bb" rel=3D"noreferrer" target=3D"_blank">libmicrohttpd_0.<wbr>=
9.53.bb</a><br>
@@ -6,8 +6,8 @@ SECTION =3D &quot;net&quot;<br>
=C2=A0DEPENDS =3D &quot;libgcrypt gnutls file&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://ftp.gnu.org/gnu/libmicrohttpd/${B=
PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnu.org/g=
nu/<wbr>libmicrohttpd/${BPN}-${PV}.<wbr>tar.gz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>767111e817e2497ff92f943c565349<wbr>7a&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>54797f6e763d417627f89f60e4ae0a<wbr>431da=
b0523f92f83def23ea02d0def<wbr>afea&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>5a425e993a0f5295aecb5d6607a1c2<wbr>42&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>9b15ec2d381f44936323adfd4f989f<wbr>a35ad=
d517cccbbfa581896b02a393c<wbr>2cc4&quot;<br>
<br>
=C2=A0inherit autotools lib_package pkgconfig gettext<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.9.3<br>
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

--f4030435cf5857d037054d712b98--
