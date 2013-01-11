Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TtlCz-0007DQ-Hf
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 21:28:11 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so1332795vbi.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 12:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Uxulln22zjf7jyIFWY9Pc9DxoMbo1NddRI/sEfSWoxs=;
	b=AJ8yYlUzxVxre9vAuWwItk9F91+3WP7hyKkqZAakxXPkb/1Y7AV4mleEN+WfZirZc3
	d1b4/PD15h5Bs7t/r+VH/GmSo4wLrATAHza27GTacmuid2EyMF9nBNREPEP9NuAL97q0
	C7Gz4hUNqRj5j0aPgecdyVqBmpGyD9GWnx6CWEvAq6crwlG1//zxiWVCCz9fgd5xiOkT
	5AF+PfBlUR5fnN5KZ4eYcUbYIeIIpl2WMq4ueSsFCs5ZIqER8I65FB2zvFXvNhHJlAvl
	83PLC6UkktZIkqv7qfokdKh5APV4aJPmgr8cJWAHQgPlNQJJ7ztkI4vmbQwoj1nSdOHd
	Mf4Q==
Received: by 10.52.88.19 with SMTP id bc19mr52597390vdb.67.1357935173769; Fri,
	11 Jan 2013 12:12:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Fri, 11 Jan 2013 12:12:33 -0800 (PST)
X-Originating-IP: [5.13.223.33]
In-Reply-To: <1357801270-3793-1-git-send-email-florin.sarbu@windriver.com>
References: <1357801270-3793-1-git-send-email-florin.sarbu@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 11 Jan 2013 22:12:33 +0200
Message-ID: <CAK18fxFt1ZiqOc1X0nb2XTfuG6QHUG_dTLC938mhGV-8_SBobQ@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
X-Gm-Message-State: ALoCoQkV1NttI/abzTokyIFjXlzVOSgilcvAtqq8ThQhFifu8Tj3lNP+rUZTD4A8R/1m7I33QLjz
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: add bash as a dependency of the alsa-utils-alsaconf rpm.
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
X-List-Received-Date: Fri, 11 Jan 2013 20:28:11 -0000
Content-Type: multipart/alternative; boundary=20cf3071ca14a919fa04d308eb9e

--20cf3071ca14a919fa04d308eb9e
Content-Type: text/plain; charset=ISO-8859-1

ack



*Andrei Gherzan*
mobile +40.744.478.414  fax +40.31.816.28.12
Email: andrei@gherzan.ro
Email: andrei.gherzan@windriver.com
Romania


On Thu, Jan 10, 2013 at 9:01 AM, Florin Sarbu <florin.sarbu@windriver.com>wrote:

> alsa-utils-alsaconf rpm contains the bash script alsaconf. In order
> to have the do_rootfs not error when bash is not brought along in
> the rootfs as an explicit dependency, we add it as a dependency
> of alsa-utils.
>
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bbb/meta/recipes-multimedia/alsa/
> alsa-utils_1.0.25.bb
> index 4990eb0..a76985c 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> @@ -47,6 +47,7 @@ ALSA_UTILS_PKGS = "\
>
>  PACKAGES += "${ALSA_UTILS_PKGS}"
>  RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
> +RDEPENDS_alsa-utils-alsaconf += "bash"
>
>  # We omit alsaconf, because
>  # a) this is a bash script
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--20cf3071ca14a919fa04d308eb9e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ack</div><div class=3D"gmail_extra"><br clear=3D"all"><div=
><div style=3D"text-align:center"></div><div style=3D"text-align:center"><d=
iv align=3D"left" style=3D"font-family:&#39;Times New Roman&#39;;font-size:=
medium"><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

<br><strong>Andrei Gherzan</strong></font><br><font face=3D"Arial" color=3D=
"#333333" size=3D"-1">mobile +40.744.478.414=A0=A0fax +40.31.816.28.12</fon=
t><br><font face=3D"Arial" color=3D"#333333" size=3D"-1">Email: <a href=3D"=
mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a></font><br=
>

<font face=3D"Arial" color=3D"#333333" size=3D"-1">Email: <a href=3D"mailto=
:andrei.gherzan@windriver.com" target=3D"_blank">andrei.gherzan@windriver.c=
om</a></font><br><font face=3D"Arial" color=3D"#333333" size=3D"-1">Romania=
</font></div>

</div></div>
<br><br><div class=3D"gmail_quote">On Thu, Jan 10, 2013 at 9:01 AM, Florin =
Sarbu <span dir=3D"ltr">&lt;<a href=3D"mailto:florin.sarbu@windriver.com" t=
arget=3D"_blank">florin.sarbu@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">

alsa-utils-alsaconf rpm contains the bash script alsaconf. In order<br>
to have the do_rootfs not error when bash is not brought along in<br>
the rootfs as an explicit dependency, we add it as a dependency<br>
of alsa-utils.<br>
<br>
Signed-off-by: Florin Sarbu &lt;<a href=3D"mailto:florin.sarbu@windriver.co=
m">florin.sarbu@windriver.com</a>&gt;<br>
---<br>
=A0meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.0.25.bb" tar=
get=3D"_blank">alsa-utils_1.0.25.bb</a> | =A0 =A01 +<br>
=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.0.=
25.bb" target=3D"_blank">alsa-utils_1.0.25.bb</a> b/meta/recipes-multimedia=
/alsa/<a href=3D"http://alsa-utils_1.0.25.bb" target=3D"_blank">alsa-utils_=
1.0.25.bb</a><br>


index 4990eb0..a76985c 100644<br>
--- a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.0.25.bb" =
target=3D"_blank">alsa-utils_1.0.25.bb</a><br>
+++ b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.0.25.bb" =
target=3D"_blank">alsa-utils_1.0.25.bb</a><br>
@@ -47,6 +47,7 @@ ALSA_UTILS_PKGS =3D &quot;\<br>
<br>
=A0PACKAGES +=3D &quot;${ALSA_UTILS_PKGS}&quot;<br>
=A0RDEPENDS_${PN} +=3D &quot;${ALSA_UTILS_PKGS}&quot;<br>
+RDEPENDS_alsa-utils-alsaconf +=3D &quot;bash&quot;<br>
<br>
=A0# We omit alsaconf, because<br>
=A0# a) this is a bash script<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--20cf3071ca14a919fa04d308eb9e--
