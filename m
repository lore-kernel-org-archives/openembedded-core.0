Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPh1E-0002Uw-Hu
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 23:55:44 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so1673198vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2012 14:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Ds6Wc8pYBk43LTW2qZ3hgi+E5aMcv15/KAphebNm1+Y=;
	b=eOOASKcqnzcUDbaA0mKw58kx0Wu0MgqBO2u6g36MjhPfzN+YAFx1a9LwBXKEalwPMJ
	19lQ83eDaQpO+rKdAVJNLH6nu0GSyPuL890t5K+RX/pQfBAzRWBvUO+IN/qtsvpNfYCq
	aEKWZrhbxcmTC2Om3NGP/pcUf7oTIRa05jRTv757UcPykOuldCqJCBNmUU2lz+DzrVdK
	CkE601z8Aj3QqUzagfbJqnyjMjQ2LrPJyuHjT2WEGS+oHeh/m4s4QTUaxY9hT8nn9IMm
	Mh+0koz95woAwlpEB4GsU//pLWEEX8P8Sg8oiEZUVeFclC0fp7ZjYJ4kEpyHkj+DzBTB
	cNbQ==
Received: by 10.52.69.146 with SMTP id e18mr5984571vdu.67.1350769341568; Sat,
	20 Oct 2012 14:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.117.166 with HTTP; Sat, 20 Oct 2012 14:42:01 -0700 (PDT)
X-Originating-IP: [5.13.211.28]
In-Reply-To: <1350754612-28948-1-git-send-email-andrei@gherzan.ro>
References: <1350754612-28948-1-git-send-email-andrei@gherzan.ro>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 21 Oct 2012 00:42:01 +0300
Message-ID: <CAK18fxG_GvrDb=PKqvZaAH65bEtNY84_A6Nb7FBbhzEH1dPUvA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQk/SDWwWN1nBfcQkTJm63FB+4tzZU3YXvyoT2a2QS0AqkSSS3KBMCsGweMnQkpxRlekpy1s
Subject: Re: [PATCH] opkg-utils: Add needed python modules as RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Oct 2012 21:55:44 -0000
Content-Type: multipart/alternative; boundary=20cf3071cd0ec717c004cc847ec9

--20cf3071cd0ec717c004cc847ec9
Content-Type: text/plain; charset=ISO-8859-1

Please drop this patch. I included it in a pull request.

I'm sorry,
ag



On Sat, Oct 20, 2012 at 8:36 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bbb/meta/recipes-devtools/opkg-utils/
> opkg-utils_git.bb
> index 92e6624..825c927 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -4,11 +4,11 @@ HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
>  file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
> -RDEPENDS_${PN} = "python"
> +RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt
> python-logging python-fcntl python-subprocess python-pickle
> python-compression python-textutils python-stringold"
>  RDEPENDS_${PN}_virtclass-native = ""
>  SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
>  PV = "0.1.8+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>  SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
>             "
> --
> 1.7.9.5
>
>

--20cf3071cd0ec717c004cc847ec9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Please drop this patch. I included it in a pull request.<div><br></div><div=
>I&#39;m sorry,</div><div>ag<br><br>
<br><br><div class=3D"gmail_quote">On Sat, Oct 20, 2012 at 8:36 PM, Andrei =
Gherzan <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">

Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">andr=
ei@gherzan.ro</a>&gt;<br>
---<br>
=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb" ta=
rget=3D"_blank">opkg-utils_git.bb</a> | =A0 =A04 ++--<br>
=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_=
git.bb" target=3D"_blank">opkg-utils_git.bb</a> b/meta/recipes-devtools/opk=
g-utils/<a href=3D"http://opkg-utils_git.bb" target=3D"_blank">opkg-utils_g=
it.bb</a><br>


index 92e6624..825c927 100644<br>
--- a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -4,11 +4,11 @@ HOMEPAGE =3D &quot;<a href=3D"http://wiki.openmoko.org/wi=
ki/Opkg" target=3D"_blank">http://wiki.openmoko.org/wiki/Opkg</a>&quot;<br>
=A0LICENSE =3D &quot;GPLv2+&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df0=
79bae19f \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://opkg.py;beginline=3D1;end=
line=3D18;md5=3D15917491ad6bf7acc666ca5f7cc1e083&quot;<br>
-RDEPENDS_${PN} =3D &quot;python&quot;<br>
+RDEPENDS_${PN} =3D &quot;python python-shell python-io python-math python-=
crypt python-logging python-fcntl python-subprocess python-pickle python-co=
mpression python-textutils python-stringold&quot;<br>
=A0RDEPENDS_${PN}_virtclass-native =3D &quot;&quot;<br>
=A0SRCREV =3D &quot;49cc783d8e0415059d126ae22c892988717ffda7&quot;<br>
=A0PV =3D &quot;0.1.8+git${SRCPV}&quot;<br>
-PR =3D &quot;r0&quot;<br>
+PR =3D &quot;r1&quot;<br>
<br>
=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/opkg-util=
s;protocol=3Dgit" target=3D"_blank">git.yoctoproject.org/opkg-utils;protoco=
l=3Dgit</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div>

--20cf3071cd0ec717c004cc847ec9--
