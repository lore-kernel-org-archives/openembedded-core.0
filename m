Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web12.5180.1607034302675097868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 14:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=[192.168.82.87])
	by pbcl.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1kkx23-0006Py-NU; Thu, 03 Dec 2020 23:25:00 +0100
Date: Thu, 03 Dec 2020 22:02:53 +0000
User-Agent: K-9 Mail for Android
In-Reply-To: <20201203133526.2075-1-twoerner@gmail.com>
References: <20201203133526.2075-1-twoerner@gmail.com>
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] mesa.inc: add dispmanx support
To: openembedded-core@lists.openembedded.org,Trevor Woerner <twoerner@gmail.com>
From: "Phil Blundell" <pb@pbcl.net>
Message-ID: <036904F4-E7CE-4A5D-B940-DF360F2AAED9@pbcl.net>
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 postmaster@pbcl.net for details.
 
 Content preview:  If we're talking about OpenGLES applications, wouldn't you
    already have opengl in DISTRO_FEATURES? I'm not sure it makes a lot of sense
    to introduce a check for dispmanx to oe-core if nothing in oe-core ever defines
    that feature. 
 
 Content analysis details:   (-2.9 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
  0.0 HTML_MESSAGE           BODY: HTML included in message
Content-Type: multipart/alternative; boundary="----DPH0LBN2WOKBG78UBSVQQMKRQ01SNI"
Content-Transfer-Encoding: 7bit

------DPH0LBN2WOKBG78UBSVQQMKRQ01SNI
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

If we're talking about OpenGLES applications, wouldn't you already have ope=
ngl in DISTRO_FEATURES?

I'm not sure it makes a lot of sense to introduce a check for dispmanx to =
oe-core if nothing in oe-core ever defines that feature=2E=20

p=2E=20



On 3 December 2020 13:35:26 GMT, Trevor Woerner <twoerner@gmail=2Ecom> wro=
te:
>On the RaspberryPi it is possible to run gles2 applications on top of
>dispmanx
>without the need for x11/wayland/etc=2E
>
>Signed-off-by: Trevor Woerner <twoerner@gmail=2Ecom>
>---
> meta/recipes-graphics/mesa/mesa=2Einc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta/recipes-graphics/mesa/mesa=2Einc
>b/meta/recipes-graphics/mesa/mesa=2Einc
>index a6652b0ddb=2E=2E34cb3c35e2 100644
>--- a/meta/recipes-graphics/mesa/mesa=2Einc
>+++ b/meta/recipes-graphics/mesa/mesa=2Einc
>@@ -51,7 +51,7 @@ inherit meson pkgconfig python3native gettext
>features_check
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
>-ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan"
>+ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan dispmanx"
>=20
>PLATFORMS ??=3D "${@bb=2Eutils=2Efilter('PACKAGECONFIG', 'x11 wayland', d=
)} \
>          ${@bb=2Eutils=2Econtains('PACKAGECONFIG', 'gbm', 'drm', '', d)}=
 \
>--=20
>2=2E28=2E0=2E497=2Eg54e85e7af1

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

------DPH0LBN2WOKBG78UBSVQQMKRQ01SNI
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>If we're talking about OpenGLES applications, woul=
dn't you already have opengl in DISTRO_FEATURES?<br><br>I'm not sure it mak=
es a lot of sense to introduce a check for dispmanx to oe-core if nothing i=
n oe-core ever defines that feature=2E <br><br>p=2E <br><br><br><br><div cl=
ass=3D"gmail_quote">On 3 December 2020 13:35:26 GMT, Trevor Woerner &lt;two=
erner@gmail=2Ecom&gt; wrote:<blockquote class=3D"gmail_quote" style=3D"marg=
in: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">
<pre class=3D"k9mail">On the RaspberryPi it is possible to run gles2 appli=
cations on top of dispmanx<br>without the need for x11/wayland/etc=2E<br><b=
r>Signed-off-by: Trevor Woerner &lt;twoerner@gmail=2Ecom&gt;<hr> meta/recip=
es-graphics/mesa/mesa=2Einc | 2 +-<br> 1 file changed, 1 insertion(+), 1 de=
letion(-)<br><br>diff --git a/meta/recipes-graphics/mesa/mesa=2Einc b/meta/=
recipes-graphics/mesa/mesa=2Einc<br>index a6652b0ddb=2E=2E34cb3c35e2 100644=
<br>--- a/meta/recipes-graphics/mesa/mesa=2Einc<br>+++ b/meta/recipes-graph=
ics/mesa/mesa=2Einc<br>@@ -51,7 +51,7 @@ inherit meson pkgconfig python3nat=
ive gettext features_check<br> <br> BBCLASSEXTEND =3D "native nativesdk"<br=
> <br>-ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan"<br>+ANY_OF_D=
ISTRO_FEATURES_class-target =3D "opengl vulkan dispmanx"<br> <br> PLATFORMS=
 ??=3D "${@bb=2Eutils=2Efilter('PACKAGECONFIG', 'x11 wayland', d)} \<br>   =
             ${@bb=2Eutils=2Econtains('PACKAGECONFIG', 'gbm', 'drm', '', d)=
} \</pre></blockquote></div><br>-- <br>Sent from my Android device with K-9=
 Mail=2E Please excuse my brevity=2E</body></html>

------DPH0LBN2WOKBG78UBSVQQMKRQ01SNI--
