Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFFC7945B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:42:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v17-v6so2146810wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9RNkPK+P/K/zey32HRxz7t1uHuMw4PsLY3gwTP1rrj8=;
	b=XodrsZeVFoWWAAyWvFlEA/9h38C0+JaCMEcv5Q6zjxUF0QEWDPkrKu0Lkzdv3HX12e
	pRSTaJIEXhQKSwaXA7EJctihUe15S13ZGbY4xz3U4Z0JgXLPDwRSunZUNc9hsMZbXh7N
	5vbadlyJwi5XBjZ3GD71eb7yiFTWU5/VdsdruleKVbz+r2B6dZxxvFAV0ZPQkC0VdHnQ
	6VNL9vCyfIPFbr63bTu8qWyk9BU39Fw2Hs17xuSXSijfPoMcVfFQWPJmuQqPBFVvToCs
	qMzLh3dWKiT/8TDipx41AaJPmHASvlK3q3EpUREI5SKthwXlmpVW+po98zI914Y7bEft
	b1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9RNkPK+P/K/zey32HRxz7t1uHuMw4PsLY3gwTP1rrj8=;
	b=Snm0SM9yPP3R7byMDaV845UVGqebt04ddNHQo5vUnFUn2Ahrji7qhQPqrQ3G+h2o7K
	n65PFWOp7FNNKaXzt0ZWgDiJrgo90MVbeeH/JvwylpGN5ReQHD30mbxTfU5WPKaF0Hy/
	bHXKck/OlH3wGav43CmZi2h//G46sFqCgdZQHGMPD5SR5Yb5HmF1jj6PJlPgR1lzTxhp
	84WOSmy9CRYPFK7ITn7pCd7Td0LwnSA+6tZJ+P9CoJCZHluoxrT3CN/acbfh4X1TWFKo
	uRBPNyQIS4bcsOGqza2gfUsxzlRHwiQJOSQYlU3UIyg4rLJ1cYJVUoFXkVuSpKQC0dMu
	/v9A==
X-Gm-Message-State: APzg51DZy9oUqB6Gm6tzrwMruCE4FbZ45cvMLUBTBVSFtNGgb7mA3HuG
	73dQuvPUYsgRY4f8TvokGSSOFIFCeLcERHnof68=
X-Google-Smtp-Source: ANB0VdZ2yn8EpacAB8IfTMU0WKqIw0CJLnaFrfoM6Jj1v+2OaOdiUPSydaVj6LBg5ybTc2L1f3RiFaExXT1pqav5SAI=
X-Received: by 2002:a5d:574b:: with SMTP id
	q11-v6mr491964wrw.272.1534956120947; 
	Wed, 22 Aug 2018 09:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
In-Reply-To: <1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Aug 2018 18:41:54 +0200
Message-ID: <CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
To: ryan.harkin@linaro.org
Cc: daiane.angolini@nxp.com, patches@linaro.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Wed, 22 Aug 2018 16:42:00 -0000
Content-Type: multipart/alternative; boundary="00000000000055c1c6057408d25b"

--00000000000055c1c6057408d25b
Content-Type: text/plain; charset="UTF-8"

The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
needed, just include the path in 2nd ln parameter.

On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:

> The Linux kernel currently expects a single NVRAM file for BCM43430
> named brcmfmac43430-sdio.txt.
>
> Allow the machine to specify an override to link its module specific
> NVRAM to the filename expected by the kernel.
>
> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
> ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 8c54f28..b647abc 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -226,6 +226,18 @@ do_install() {
>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
> ti-connectivity/* . )
>  }
>
> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
> +# softlink for the module specific NVRAM file to the filename expected
> +# by the Linux kernel
> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
> +do_install_append_bcm43430-nvram-mur1dx() {
> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
> +}
> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
> +do_install_append_bcm43430-nvram-ap6212() {
> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
> +}
> +
>
>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-mt7601u-license ${PN}-mt7601u \
> --
> 2.7.4
>
>

--00000000000055c1c6057408d25b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The &quot;cd ${D}${nonarch_base_libdir}/firmware/brcm/&quo=
t; doesn&#39;t seem to be needed, just include the path in 2nd ln parameter=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018=
 at 6:30 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org">ryan.=
harkin@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Th=
e Linux kernel currently expects a single NVRAM file for BCM43430<br>
named brcmfmac43430-sdio.txt.<br>
<br>
Allow the machine to specify an override to link its module specific<br>
NVRAM to the filename expected by the kernel.<br>
<br>
Signed-off-by: Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" ta=
rget=3D"_blank">ryan.harkin@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a> | 12 =
++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a=
> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_git=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
index 8c54f28..b647abc 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
@@ -226,6 +226,18 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/firmware ; ln -=
sf ti-connectivity/* . )<br>
=C2=A0}<br>
<br>
+# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a<br=
>
+# softlink for the module specific NVRAM file to the filename expected<br>
+# by the Linux kernel<br>
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx =3D &quot; ${nonar=
ch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>
+do_install_append_bcm43430-nvram-mur1dx() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/firmware/brcm/ =
; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =3D &quot;${nonarc=
h_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>
+do_install_append_bcm43430-nvram-ap6212() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/firmware/brcm/ =
; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ralink \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-mt7601u-license ${PN=
}-mt7601u \<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--00000000000055c1c6057408d25b--
