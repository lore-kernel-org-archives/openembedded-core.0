Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UJWBJ-0007aW-JG
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 22:40:53 +0100
Received: by mail-ie0-f181.google.com with SMTP id 17so6087219iea.26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 14:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=6nsjfXaWyUkYERAgvbeUU0EvyXJu2ncC5Fn8yxSNy88=;
	b=QMcRX3onZ0xUrBjS4Hh/35HBcBwMsOvdHytF5uVinfvU5DKU1DwSAUrfYhtzMw07eu
	KvKkix4gJj/P7cUfhuRf5dGSxS/bgOqMRwSVw0C+ptNSSi3Ke94kKvgs5Fi3J5sUNntM
	zfe/wpCRpFS/C6IMsP3Pi2JAQEYOzoFTwm6rHmppOk/Iz2KhbZ7wwjYZ/1DbanU8oBJU
	nQL/rMI5r9gKlSEZyEmK8+g7x2OsueKtHaiXuSS2ivYrvkLfclz01AfCtTVFB44frnZc
	uxGAoqs39cwBdwcYo7ZaKDYW2Jq7xTUlgoSv0hf4FPm6TVzRhlxCJYIN0F/MvHU/hNiS
	6mDg==
MIME-Version: 1.0
X-Received: by 10.50.89.200 with SMTP id bq8mr4309412igb.58.1364073837462;
	Sat, 23 Mar 2013 14:23:57 -0700 (PDT)
Received: by 10.50.185.134 with HTTP; Sat, 23 Mar 2013 14:23:57 -0700 (PDT)
In-Reply-To: <1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
Date: Sat, 23 Mar 2013 14:23:57 -0700
Message-ID: <CAMKF1spFFareQ_KOAgvmfi8qKf9Gp2kiBUuZE67siyz2u2RVyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
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
X-List-Received-Date: Sat, 23 Mar 2013 21:40:54 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba32d878e5c04d89e308e

--e89a8f3ba32d878e5c04d89e308e
Content-Type: text/plain; charset=UTF-8

Should they be packaged elsewhere

On Saturday, March 23, 2013, Otavio Salvador <otavio@ossystems.com.br>
wrote:
> We don't ship license files with packages and firmware packages are no
> different; drop them.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bbb/meta/recipes-kernel/linux-firmware/
linux-firmware_git.bb
> index 6842738..99c226c 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -42,9 +42,6 @@ do_install() {
>         ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
>         ln -sf libertas/sd8686_v9_helper.bin
${D}/lib/firmware/sd8686_helper.bin
>
> -       # Realtek rtl8192*
> -       install -m 0644 LICENCE.rtlwifi_firmware.txt
${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
> -
>         # fixup wl12xx location, after 2.6.37 the kernel searches a
different location for it
>         ( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
>  }
> @@ -56,20 +53,17 @@ PACKAGES =+ "${PN}-ralink ${PN}-sd8686
${PN}-rtl8192cu \
>  LICENSE_${PN}-ralink = "Firmware-ralink"
>  FILES_${PN}-ralink = " \
>    /lib/firmware/rt*.bin \
> -  /lib/firmware/LICENSE.ralink_firmware.txt \
>  "
>
>  LICENSE_${PN}-sd8686 = "Firmware-libertas"
>  FILES_${PN}-sd8686 = " \
>    /lib/firmware/libertas/sd8686_v9* \
>    /lib/firmware/sd8686* \
> -  /lib/firmware/LICENCE.libertas \
>  "
>
>  LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
>  FILES_${PN}-rtl8192cu = " \
>    /lib/firmware/rtlwifi/rtl8192cufw.bin \
> -  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
>  "
>
>  LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
> @@ -97,7 +91,6 @@ ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] =
"/lib/firmware/brcm/brcmfmac-sdio.bin
>  LICENSE_${PN}-bcm4329 = "Firmware-bcm4329"
>  FILES_${PN}-bcm4329 = " \
>    /lib/firmware/brcm/brcmfmac4329.bin \
> -  /lib/firmware/LICENCE.broadcom_bcm43xx \
>  "
>  ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
>  ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] =
"/lib/firmware/brcm/brcmfmac4329.bin"
> @@ -105,7 +98,6 @@
ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] =
"/lib/firmware/br
>  LICENSE_${PN}-bcm4330 = "Firmware-bcm4330"
>  FILES_${PN}-bcm4330 = " \
>    /lib/firmware/brcm/brcmfmac4330.bin \
> -  /lib/firmware/LICENCE.broadcom_bcm43xx \
>  "
>
>  ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
> @@ -114,7 +106,6 @@
ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] =
"/lib/firmware/br
>  LICENSE_${PN}-bcm4334 = "Firmware-bcm4334"
>  FILES_${PN}-bcm4334 = " \
>    /lib/firmware/brcm/brcmfmac4334.bin \
> -  /lib/firmware/LICENCE.broadcom_bcm43xx \
>  "
>
>  ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
> --
> 1.8.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f3ba32d878e5c04d89e308e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Should they be packaged elsewhere<br><br>On Saturday, March 23, 2013, Otavi=
o Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.=
com.br</a>&gt; wrote:<br>&gt; We don&#39;t ship license files with packages=
 and firmware packages are no<br>
&gt; different; drop them.<br>&gt;<br>&gt; Signed-off-by: Otavio Salvador &=
lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&g=
t;<br>&gt; ---<br>&gt; =C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"=
http://linux-firmware_git.bb">linux-firmware_git.bb</a> | 9 ---------<br>
&gt; =C2=A01 file changed, 9 deletions(-)<br>&gt;<br>&gt; diff --git a/meta=
/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_git.bb">lin=
ux-firmware_git.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http=
://linux-firmware_git.bb">linux-firmware_git.bb</a><br>
&gt; index 6842738..99c226c 100644<br>&gt; --- a/meta/recipes-kernel/linux-=
firmware/<a href=3D"http://linux-firmware_git.bb">linux-firmware_git.bb</a>=
<br>&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-f=
irmware_git.bb">linux-firmware_git.bb</a><br>
&gt; @@ -42,9 +42,6 @@ do_install() {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
n -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware=
/sd8686_helper.bin<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 # Realtek rtl8192=
*<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 install -m 0644 LICENCE.rtlwifi_firmware.txt ${=
D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt<br>&gt; -<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # fixup wl12xx location, after 2.6.37 the kernel s=
earches a different location for it<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${D}/lib/firmware ; ln -sf ti-connect=
ivity/* . )<br>&gt; =C2=A0}<br>&gt; @@ -56,20 +53,17 @@ PACKAGES =3D+ &quot=
;${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu \<br>&gt; =C2=A0LICENSE_${PN}-ra=
link =3D &quot;Firmware-ralink&quot;<br>
&gt; =C2=A0FILES_${PN}-ralink =3D &quot; \<br>&gt; =C2=A0 =C2=A0/lib/firmwa=
re/rt*.bin \<br>&gt; - =C2=A0/lib/firmware/LICENSE.ralink_firmware.txt \<br=
>&gt; =C2=A0&quot;<br>&gt;<br>&gt; =C2=A0LICENSE_${PN}-sd8686 =3D &quot;Fir=
mware-libertas&quot;<br>&gt; =C2=A0FILES_${PN}-sd8686 =3D &quot; \<br>
&gt; =C2=A0 =C2=A0/lib/firmware/libertas/sd8686_v9* \<br>&gt; =C2=A0 =C2=A0=
/lib/firmware/sd8686* \<br>&gt; - =C2=A0/lib/firmware/LICENCE.libertas \<br=
>&gt; =C2=A0&quot;<br>&gt;<br>&gt; =C2=A0LICENSE_${PN}-rtl8192cu =3D &quot;=
Firmware-rtlwifi&quot;<br>&gt; =C2=A0FILES_${PN}-rtl8192cu =3D &quot; \<br>
&gt; =C2=A0 =C2=A0/lib/firmware/rtlwifi/rtl8192cufw.bin \<br>&gt; - =C2=A0/=
lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \<br>&gt; =C2=A0&quot;<br=
>&gt;<br>&gt; =C2=A0LICENSE_${PN}-rtl8192ce =3D &quot;Firmware-rtlwifi&quot=
;<br>&gt; @@ -97,7 +91,6 @@ ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] =3D &q=
uot;/lib/firmware/brcm/brcmfmac-sdio.bin<br>
&gt; =C2=A0LICENSE_${PN}-bcm4329 =3D &quot;Firmware-bcm4329&quot;<br>&gt; =
=C2=A0FILES_${PN}-bcm4329 =3D &quot; \<br>&gt; =C2=A0 =C2=A0/lib/firmware/b=
rcm/brcmfmac4329.bin \<br>&gt; - =C2=A0/lib/firmware/LICENCE.broadcom_bcm43=
xx \<br>&gt; =C2=A0&quot;<br>&gt; =C2=A0ALTERNATIVE_linux-firmware-bcm4329 =
=3D &quot;brcmfmac-sdio.bin&quot;<br>
&gt; =C2=A0ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] =3D=
 &quot;/lib/firmware/brcm/brcmfmac4329.bin&quot;<br>&gt; @@ -105,7 +98,6 @@=
 ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] =3D &quot;/li=
b/firmware/br<br>
&gt; =C2=A0LICENSE_${PN}-bcm4330 =3D &quot;Firmware-bcm4330&quot;<br>&gt; =
=C2=A0FILES_${PN}-bcm4330 =3D &quot; \<br>&gt; =C2=A0 =C2=A0/lib/firmware/b=
rcm/brcmfmac4330.bin \<br>&gt; - =C2=A0/lib/firmware/LICENCE.broadcom_bcm43=
xx \<br>&gt; =C2=A0&quot;<br>&gt;<br>
&gt; =C2=A0ALTERNATIVE_linux-firmware-bcm4330 =3D &quot;brcmfmac-sdio.bin&q=
uot;<br>&gt; @@ -114,7 +106,6 @@ ALTERNATIVE_TARGET_linux-firmware-bcm4330[=
brcmfmac-sdio.bin] =3D &quot;/lib/firmware/br<br>&gt; =C2=A0LICENSE_${PN}-b=
cm4334 =3D &quot;Firmware-bcm4334&quot;<br>
&gt; =C2=A0FILES_${PN}-bcm4334 =3D &quot; \<br>&gt; =C2=A0 =C2=A0/lib/firmw=
are/brcm/brcmfmac4334.bin \<br>&gt; - =C2=A0/lib/firmware/LICENCE.broadcom_=
bcm43xx \<br>&gt; =C2=A0&quot;<br>&gt;<br>&gt; =C2=A0ALTERNATIVE_linux-firm=
ware-bcm4334 =3D &quot;brcmfmac-sdio.bin&quot;<br>
&gt; --<br>&gt; 1.8.1<br>&gt;<br>&gt;<br>&gt; _____________________________=
__________________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=
=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@list=
s.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--e89a8f3ba32d878e5c04d89e308e--
