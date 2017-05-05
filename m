Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5A2700F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 21:33:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b10so3704759wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=DtVXgrdmZr2oxrriSSH/9VeDc4oG5SoHNwTzJFE54HI=;
	b=OUl+SnOHh6ht8qwVQ2H94NYx7yuC6VYgBKi3BiqKAvImpQkFNUBl3e02HxrkvJg7CM
	REqYPGqjZ14FgJDqOHEejFbgz9qFJp6KxeRdT5uvU2Fnwd1RKZzblxcpzi2ewEr8hfP7
	V/IkgbT7+fy5o16O/UwZWMEyCfhSHJdA1v4MVCfgu9PAk9N48OoX8k+Zomp3M9wkL+71
	snwZASsOQWJALumdZsMqHSRVlKowob2J+sXBIH/JVSNrKK/dhOLa5BQpsuIhpwTSlMXp
	7clejxGoUlOZk1+rBYE2LIXeHBLkAhlzDpl9uMBTfnTP9ICzh8ItLYCNTorwyQ4Y3FRq
	+Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=DtVXgrdmZr2oxrriSSH/9VeDc4oG5SoHNwTzJFE54HI=;
	b=N5oBxFal5BlTFeJocGdyU2t1e0a2QpjKmmrfUYRuW46xSw+VKb/ymT9YKnrepHXN4P
	zPcdWtaOOnse5dNzdHLKlirof6u39aqHV7RKvFkdJH+J3PwDh0+xN8soAhOMNr/ti2ng
	oKDB5GJSepJ+IJg6RvU78Saq/FXarr4sOgcwKJRwAhLqRcA92rYpxuCRvuhBBGpFBWry
	oMIkGP3KDxP/GhqkpEf7CU3+UuBqFhtaImebH6Fz9rtwgwgdNJFTogI4YzcsEld75SB7
	SARJ5eXBUthN4oE9uoFrUtydwbcFUaM6yF9NQlB5S0WuFkEdoIB3SH82FZdkxCkCPYNM
	i8sA==
X-Gm-Message-State: AN3rC/7RyXm3/CqGhm/bqOFDvwnEy40sjbdUhuAuzA8S6L1NzO3QFOEV
	c3wRkG5IE4BwPkcPR2s4e49aN/FrKg==
X-Received: by 10.80.153.194 with SMTP id n2mr35344214edb.42.1494020038811;
	Fri, 05 May 2017 14:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <1494014554-8069-1-git-send-email-rsalveti@rsalveti.net>
In-Reply-To: <1494014554-8069-1-git-send-email-rsalveti@rsalveti.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 05 May 2017 21:33:47 +0000
Message-ID: <CAMKF1srckZcTgRBDxw8mZ9Sxo=-w26fBbS_BVi0MhpGpAeAOdQ@mail.gmail.com>
To: Ricardo Salveti <rsalveti@rsalveti.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: package Qualcomm QCA firmware
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
X-List-Received-Date: Fri, 05 May 2017 21:33:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c0ef492b36540054ecda579

--94eb2c0ef492b36540054ecda579
Content-Type: text/plain; charset=UTF-8

On Fri, May 5, 2017 at 4:03 PM Ricardo Salveti <rsalveti@rsalveti.net>
wrote:

> Firmware files for the QCA61x4 ROME BT family chips. Firmware shares the
> same license as used by ath10k.
>
> Signed-off-by: Ricardo Salveti <rsalveti@rsalveti.net>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index be5bdbd..143e8dd 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -231,7 +231,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330
> ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
>               ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
>               ${PN}-gplv2-license ${PN}-carl9170 \
> -             ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license
> ${PN}-ath10k  \
> +             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license
> ${PN}-ath10k ${PN}-qca \
>               \
>               ${PN}-iwlwifi-license ${PN}-iwlwifi \
>               ${PN}-iwlwifi-135-6 \
> @@ -292,6 +292,7 @@ LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
>  LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
>  LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
>  LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
> +LICENSE_${PN}-qca = "Firmware-qualcommAthos_ath10k"
>

It seems you are not using this so may be it can be removed ?

>
>  FILES_${PN}-ar3k-license =
> "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
>  FILES_${PN}-ar3k = " \
> @@ -303,8 +304,13 @@ FILES_${PN}-ath10k = " \
>    ${nonarch_base_libdir}/firmware/ath10k \
>  "
>
> +FILES_${PN}-qca = " \
> +  ${nonarch_base_libdir}/firmware/qca \
> +"
> +
>  RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
>  RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
> +RDEPENDS_${PN}-qca += "${PN}-ath10k-license"
>
>  # For ralink
>  LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0ef492b36540054ecda579
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Fri, May 5, 2017 at 4:03 PM Ric=
ardo Salveti &lt;<a href=3D"mailto:rsalveti@rsalveti.net">rsalveti@rsalveti=
.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Firmware files =
for the QCA61x4 ROME BT family chips. Firmware shares the<br>
same license as used by ath10k.<br>
<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:rsalveti@rsalveti.net"=
 target=3D"_blank">rsalveti@rsalveti.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a> | 8 +=
++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a=
> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_git=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
index be5bdbd..143e8dd 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
@@ -231,7 +231,7 @@ PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ralink \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-broadcom-license ${P=
N}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-b=
cm43430 ${PN}-bcm4354 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-atheros-license ${PN=
}-ar9170 ${PN}-ath6k ${PN}-ath9k \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-gplv2-license ${PN}-=
carl9170 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-ar3k-license=C2=A0 $=
{PN}-ar3k=C2=A0 ${PN}-ath10k-license=C2=A0 ${PN}-ath10k=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-ar3k-license ${PN}-a=
r3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-iwlwifi-license ${PN=
}-iwlwifi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-iwlwifi-135-6 \<br>
@@ -292,6 +292,7 @@ LICENSE_${PN}-ar3k =3D &quot;Firmware-qualcommAthos_ar3=
k&quot;<br>
=C2=A0LICENSE_${PN}-ar3k-license =3D &quot;Firmware-qualcommAthos_ar3k&quot=
;<br>
=C2=A0LICENSE_${PN}-ath10k =3D &quot;Firmware-qualcommAthos_ath10k&quot;<br=
>
=C2=A0LICENSE_${PN}-ath10k-license =3D &quot;Firmware-qualcommAthos_ath10k&=
quot;<br>
+LICENSE_${PN}-qca =3D &quot;Firmware-qualcommAthos_ath10k&quot;<br>
</blockquote><div><br></div><div>It seems you are not using this so may be =
it can be removed ?</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0FILES_${PN}-ar3k-license =3D &quot;${nonarch_base_libdir}/firmware/LI=
CENSE.QualcommAtheros_ar3k&quot;<br>
=C2=A0FILES_${PN}-ar3k =3D &quot; \<br>
@@ -303,8 +304,13 @@ FILES_${PN}-ath10k =3D &quot; \<br>
=C2=A0 =C2=A0${nonarch_base_libdir}/firmware/ath10k \<br>
=C2=A0&quot;<br>
<br>
+FILES_${PN}-qca =3D &quot; \<br>
+=C2=A0 ${nonarch_base_libdir}/firmware/qca \<br>
+&quot;<br>
+<br>
=C2=A0RDEPENDS_${PN}-ar3k +=3D &quot;${PN}-ar3k-license&quot;<br>
=C2=A0RDEPENDS_${PN}-ath10k +=3D &quot;${PN}-ath10k-license&quot;<br>
+RDEPENDS_${PN}-qca +=3D &quot;${PN}-ath10k-license&quot;<br>
<br>
=C2=A0# For ralink<br>
=C2=A0LICENSE_${PN}-ralink =3D &quot;Firmware-ralink-firmware&quot;<br>
--<br>
2.7.4<br>
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

--94eb2c0ef492b36540054ecda579--
