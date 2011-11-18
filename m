Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RRPWp-0002bn-1x
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:34:56 +0100
Received: by vcbfo11 with SMTP id fo11so747727vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 06:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m6QzEjP6wIMGFwsLvJjcZse1qv0KFUStEdWUOnvvICc=;
	b=pn/1bNAluVxWBjbN68MM8uSYSy/GY4X9pWi4jqeviH88AtejR85nfl6FRp8QpX6brO
	NReRcgHY6pp04pySgRCWiyNNhkvgV3ngf78endzP1CfJw8jMMKi14J/MApluiZe/VExu
	KE1+t7nGoEoUMxpAqsSyzhQ79PBn0DU2pHZj8=
MIME-Version: 1.0
Received: by 10.220.148.68 with SMTP id o4mr91670vcv.123.1321626508250; Fri,
	18 Nov 2011 06:28:28 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Fri, 18 Nov 2011 06:28:28 -0800 (PST)
In-Reply-To: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
References: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 18 Nov 2011 15:28:28 +0100
Message-ID: <CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shared-mime-info: fix ordering of PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2011 14:34:56 -0000
Content-Type: multipart/alternative; boundary=bcaec54ee6c08ccca104b203268a

--bcaec54ee6c08ccca104b203268a
Content-Type: text/plain; charset=ISO-8859-1

2011/11/18 Koen Kooi <koen@dominion.thruhere.net>

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../shared-mime-info/shared-mime-info.inc          |    2 +-
>  .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> index 57e829c..d7fa67c 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> @@ -19,7 +19,7 @@ FILES_${PN}-dev +=
> "${datadir}/pkgconfig/shared-mime-info.pc"
>
>  # freedesktop.org.xml is only required when updating the mime database,
>  # package it separately
> -PACKAGES += "shared-mime-info-data"
> +PACKAGES =+ "shared-mime-info-data"
>  FILES_shared-mime-info-data =
> "${datadir}/mime/packages/freedesktop.org.xml"
>  RDEPENDS_shared-mime-info-data = "shared-mime-info"
>
> diff --git a/meta/recipes-support/shared-mime-info/
> shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/
> shared-mime-info_0.91.bb
> index bc4a8f7..7ae6e10 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> @@ -1,5 +1,5 @@
>  require shared-mime-info.inc
> -PR = "r2"
> +PR = "r3"
>
>  SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
>  SRC_URI[sha256sum] =
> "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
> --
> 1.7.2.5
>

For my education:
Is ordering of PACKAGES relevant? If so, please enlighten me why. If not
why this patch?

Frans

--bcaec54ee6c08ccca104b203268a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/11/18 Koen Kooi <span dir=3D"ltr">&=
lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net=
</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex;">
Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net">=
koen@dominion.thruhere.net</a>&gt;<br>
---<br>
=A0.../shared-mime-info/shared-mime-info.inc =A0 =A0 =A0 =A0 =A0| =A0 =A02 =
+-<br>
=A0.../shared-mime-info/<a href=3D"http://shared-mime-info_0.91.bb" target=
=3D"_blank">shared-mime-info_0.91.bb</a> =A0 =A0 =A0| =A0 =A02 +-<br>
=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/m=
eta/recipes-support/shared-mime-info/shared-mime-info.inc<br>
index 57e829c..d7fa67c 100644<br>
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc<br>
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc<br>
@@ -19,7 +19,7 @@ FILES_${PN}-dev +=3D &quot;${datadir}/pkgconfig/shared-mi=
me-info.pc&quot;<br>
<br>
=A0# freedesktop.org.xml is only required when updating the mime database,<=
br>
=A0# package it separately<br>
-PACKAGES +=3D &quot;shared-mime-info-data&quot;<br>
+PACKAGES =3D+ &quot;shared-mime-info-data&quot;<br>
=A0FILES_shared-mime-info-data =3D &quot;${datadir}/mime/packages/freedeskt=
op.org.xml&quot;<br>
=A0RDEPENDS_shared-mime-info-data =3D &quot;shared-mime-info&quot;<br>
<br>
diff --git a/meta/recipes-support/shared-mime-info/<a href=3D"http://shared=
-mime-info_0.91.bb" target=3D"_blank">shared-mime-info_0.91.bb</a> b/meta/r=
ecipes-support/shared-mime-info/<a href=3D"http://shared-mime-info_0.91.bb"=
 target=3D"_blank">shared-mime-info_0.91.bb</a><br>

index bc4a8f7..7ae6e10 100644<br>
--- a/meta/recipes-support/shared-mime-info/<a href=3D"http://shared-mime-i=
nfo_0.91.bb" target=3D"_blank">shared-mime-info_0.91.bb</a><br>
+++ b/meta/recipes-support/shared-mime-info/<a href=3D"http://shared-mime-i=
nfo_0.91.bb" target=3D"_blank">shared-mime-info_0.91.bb</a><br>
@@ -1,5 +1,5 @@<br>
=A0require shared-mime-info.inc<br>
-PR =3D &quot;r2&quot;<br>
+PR =3D &quot;r3&quot;<br>
<br>
=A0SRC_URI[md5sum] =3D &quot;982a211560ba4c47dc791ccff34e8fbc&quot;<br>
=A0SRC_URI[sha256sum] =3D &quot;98cfebe1d809afb24934e634373821e2a1dfa86fc64=
62cab230589a1c80988bd&quot;<br>
<font color=3D"#888888">--<br>
1.7.2.5</font><br></blockquote><div><br>For my education:<br>Is ordering of=
 PACKAGES relevant? If so, please enlighten me why. If not why this patch?<=
br><br>Frans <br></div></div>

--bcaec54ee6c08ccca104b203268a--
