Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxySD-0006lu-KH
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 11:20:45 +0100
Received: by vbbff1 with SMTP id ff1so1550577vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=4Rgpl3VOOPoLN4ks4tF2CIYHH0domfoGcGyz1ps6wtY=;
	b=dZ2CL/ifwCtrBdkRI50Bng1fAJK+dnGHSG5q7PtVHEIeKtgUZXJbmQcfd4Crk0U39b
	e2/LkTVe4Oft3voDanmEkCp7EaFDUA8soXNCo7WvXe+ZO5HrxaM1fFsoHPRfZScUMTix
	9KN83hOExAXjtTeR0OeFUFQEe3Fiw84N9o1pg=
MIME-Version: 1.0
Received: by 10.52.173.79 with SMTP id bi15mr767008vdc.31.1329387151329; Thu,
	16 Feb 2012 02:12:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:12:31 -0800 (PST)
In-Reply-To: <1329358121-1366-1-git-send-email-obi@opendreambox.org>
References: <1329358121-1366-1-git-send-email-obi@opendreambox.org>
Date: Thu, 16 Feb 2012 08:12:31 -0200
X-Google-Sender-Auth: ol8lqLiZ_rnScgAgjX-dCvgukYU
Message-ID: <CAP9ODKqaEHQjAf+M28dTA48t4R5MVkK_BovLn33pX+-KbbzGvQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: don't create /etc/default
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
X-List-Received-Date: Thu, 16 Feb 2012 10:20:45 -0000
Content-Type: multipart/alternative; boundary=bcaec51b9ce3ec89a804b9121023

--bcaec51b9ce3ec89a804b9121023
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:08, Andreas Oberritter <obi@opendreambox.org>wrote:

> * It's not used by the recipe and its creation
>  currently depends on CONFIG_HWCLOCK=y.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-core/busybox/busybox.inc       |    1 -
>  meta/recipes-core/busybox/busybox_1.19.3.bb |    2 +-
>  2 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> index 5fb436e..fc69d65 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -179,7 +179,6 @@ do_install () {
>                install -m 0755 ${WORKDIR}/busybox-udhcpd
> ${D}${sysconfdir}/init.d/
>        fi
>        if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> -               install -d ${D}${sysconfdir}/default
>                install -m 0755 ${WORKDIR}/hwclock.sh
> ${D}${sysconfdir}/init.d/
>        fi
>        if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bbb/meta/recipes-core/busybox/
> busybox_1.19.3.bb
> index a075407..45e284f 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.3.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
> @@ -1,5 +1,5 @@
>  require busybox.inc
> -PR = "r3"
> +PR = "r4"
>
>  SRC_URI = "
> http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>            file://udhcpscript.patch \
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec51b9ce3ec89a804b9121023
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span style=3D"font-size:13px;color:rgb(34,34,34);font-family:arial,sans-se=
rif;background-color:rgb(245,245,245)">Acked-by: Otavio Salvador &lt;<a hre=
f=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;</span>=
<br>
<br><div class=3D"gmail_quote">On Thu, Feb 16, 2012 at 00:08, Andreas Oberr=
itter <span dir=3D"ltr">&lt;<a href=3D"mailto:obi@opendreambox.org">obi@ope=
ndreambox.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
* It&#39;s not used by the recipe and its creation<br>
 =A0currently depends on CONFIG_HWCLOCK=3Dy.<br>
<br>
Signed-off-by: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.or=
g">obi@opendreambox.org</a>&gt;<br>
---<br>
=A0meta/recipes-core/busybox/busybox.inc =A0 =A0 =A0 | =A0 =A01 -<br>
=A0meta/recipes-core/busybox/<a href=3D"http://busybox_1.19.3.bb" target=3D=
"_blank">busybox_1.19.3.bb</a> | =A0 =A02 +-<br>
=A02 files changed, 1 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc<br>
index 5fb436e..fc69d65 100644<br>
--- a/meta/recipes-core/busybox/busybox.inc<br>
+++ b/meta/recipes-core/busybox/busybox.inc<br>
@@ -179,7 +179,6 @@ do_install () {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/busybox-udhcpd $=
{D}${sysconfdir}/init.d/<br>
 =A0 =A0 =A0 =A0fi<br>
 =A0 =A0 =A0 =A0if grep &quot;CONFIG_HWCLOCK=3Dy&quot; ${WORKDIR}/defconfig=
; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/default<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/hwclock.sh ${D}$=
{sysconfdir}/init.d/<br>
 =A0 =A0 =A0 =A0fi<br>
 =A0 =A0 =A0 =A0if grep &quot;CONFIG_UDHCPC=3Dy&quot; ${WORKDIR}/defconfig;=
 then<br>
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.19.3.bb"=
 target=3D"_blank">busybox_1.19.3.bb</a> b/meta/recipes-core/busybox/<a hre=
f=3D"http://busybox_1.19.3.bb" target=3D"_blank">busybox_1.19.3.bb</a><br>
index a075407..45e284f 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.19.3.bb" target=
=3D"_blank">busybox_1.19.3.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.19.3.bb" target=
=3D"_blank">busybox_1.19.3.bb</a><br>
@@ -1,5 +1,5 @@<br>
=A0require busybox.inc<br>
-PR =3D &quot;r3&quot;<br>
+PR =3D &quot;r4&quot;<br>
<br>
=A0SRC_URI =3D &quot;<a href=3D"http://www.busybox.net/downloads/busybox-${=
PV}.tar.bz2;name=3Dtarball" target=3D"_blank">http://www.busybox.net/downlo=
ads/busybox-${PV}.tar.bz2;name=3Dtarball</a> \<br>
 =A0 =A0 =A0 =A0 =A0 =A0file://udhcpscript.patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.5.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--bcaec51b9ce3ec89a804b9121023--
