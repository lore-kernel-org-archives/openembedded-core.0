Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
	[209.85.221.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8C94B7F365
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 08:12:29 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id q186so1495565vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7uPtm8huthV9vDsvTWSOY+2c/31u+I5dHXn1c2GnANA=;
	b=bVmzbDdcimfRbq8IMU4awbzsSPSOS83JaYF+X8f1zwOmA6NDdJim4v00QSV/bGs45S
	5uWrL9YBciE+0crwI0XI38jJu4XzYtcq9cMjMWVmEBHcqlMpQc0/4DPuELBjgVHgFg17
	BqoBQdLsXwFNEF73AkparfFW4+7nFJJzp4u6fFHRR8y0bGk+PYLiJr+qHHXWN1jp9/Go
	1RyjlAmEECbZWXXqe9RQWtreOY6xCGCInxvPyxKNA60SNazok1NZ69zHN3yIFo1flzMM
	lCQbPx3rr136OWvgYhHjmim10aniyvRLxXBzdaBLa++338AeHSJX3Cx84X4KR+Wj5Z2c
	8Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7uPtm8huthV9vDsvTWSOY+2c/31u+I5dHXn1c2GnANA=;
	b=QMjKCsH01Mi4Au3vzLNC3LpVKxwWSCa5tUqk7bYzp+YbFVdLq2rvs03KGO9nklz93G
	W8BZDPDJAw8T5oQEsuSmm+nmmkUBnk0Z3qxW9fZ60Zy8UCn/Hi1buS/DW3qm/APoIfMU
	D3ZmM+wU5poMn3mGBjtkW/Se8ZXNIjuvVxTl7T4B8uXy+lg4uLjPBtIhuUub7BmSu0Ce
	eRBd0uyQ46K0MIcyxbTnazJvPTmi6jE5/R5CEk00R30MOx6b6uxMuPzDplmpXlTVfSwh
	4+ifFrQ+E7Tca2a6FEm5l9E0c7RYhFVVvM0jUnW0OmUxkRSsdSiJaa/VLlZvw2XcTWV1
	Mnqw==
X-Gm-Message-State: APjAAAXRVJwcdNM2DVtACzThzxRAWddOtEvcKCl3YPBwQ6gX3vPtlp0x
	vdLZzOcIDHt0J+PSOir7YcLvuSvVQT4HUXEH9fw=
X-Google-Smtp-Source: APXvYqxHQc885VA0okmewsgWSYwfKaAhufELIXZKhZg5H4YySI2CybbgscAq57LwqwELdc1baIJVx7uPvFAuWPM3j3o=
X-Received: by 2002:a1f:6681:: with SMTP id a123mr6445210vkc.81.1567411950294; 
	Mon, 02 Sep 2019 01:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <1567386885-110297-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1567386885-110297-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2019 10:12:18 +0200
Message-ID: <CANNYZj93Trq7+ytueYA9QDa=o2HjtJJRCADcUW-dqJML3+u+DA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-environment: make rpm and dnf work in toolchain
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
X-List-Received-Date: Mon, 02 Sep 2019 08:12:29 -0000
Content-Type: multipart/alternative; boundary="000000000000839a0205918d8894"

--000000000000839a0205918d8894
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Sep 2019 at 03:16, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> We need to configure dnf and rpm to use and make it compatible with
> package architecture from yocto build system.
> +
> +    mkdir -p ${D}/${SDKTARGETSYSROOT}/etc/rpm
> +    echo "arch_compat: ${MACHINE_ARCH}: ${PACKAGE_ARCHS}" >
> ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
> +    sed -i 's/-nativesdk//g' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
> +    sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
> +    echo "${MACHINE_ARCH}-pc-linux" >
> ${D}/${SDKTARGETSYSROOT}/etc/rpm/platform
> +
> +    mkdir -p ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars
> +    echo "${DEFAULTTUNE}:${MACHINE_ARCH}:${TARGET_ARCH}" >
> ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch
> +    sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch
>

This does not seem like the right place to me to adjust the settings. I
think (not sure; never tried it) that the right technique is in the
nativesdk-meson recipe:

    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
    install -m 0755 ${WORKDIR}/meson-setup.py
${D}${SDKPATHNATIVE}/post-relocate-setup.d/

    # We need to wrap the real meson with a thin env setup wrapper.
    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson

Alex

--000000000000839a0205918d8894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 2 Sep 2019 at 03:16, Zheng Ruoqin=
 &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zheng=
rq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We need =
to configure dnf and rpm to use and make it compatible with package archite=
cture from yocto build system.<br>
+<br>
+=C2=A0 =C2=A0 mkdir -p ${D}/${SDKTARGETSYSROOT}/etc/rpm<br>
+=C2=A0 =C2=A0 echo &quot;arch_compat: ${MACHINE_ARCH}: ${PACKAGE_ARCHS}&qu=
ot; &gt; ${D}/${SDKTARGETSYSROOT}/etc/rpmrc<br>
+=C2=A0 =C2=A0 sed -i &#39;s/-nativesdk//g&#39; ${D}/${SDKTARGETSYSROOT}/et=
c/rpmrc<br>
+=C2=A0 =C2=A0 sed -i &#39;s/-/_/&#39; ${D}/${SDKTARGETSYSROOT}/etc/rpmrc<b=
r>
+=C2=A0 =C2=A0 echo &quot;${MACHINE_ARCH}-pc-linux&quot; &gt; ${D}/${SDKTAR=
GETSYSROOT}/etc/rpm/platform<br>
+<br>
+=C2=A0 =C2=A0 mkdir -p ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars<br>
+=C2=A0 =C2=A0 echo &quot;${DEFAULTTUNE}:${MACHINE_ARCH}:${TARGET_ARCH}&quo=
t; &gt; ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch<br>
+=C2=A0 =C2=A0 sed -i &#39;s/-/_/&#39; ${D}/${SDKTARGETSYSROOT}/etc/dnf/var=
s/arch<br></blockquote><br></div><div class=3D"gmail_quote">This does not s=
eem like the right place to me to adjust the settings. I think (not sure; n=
ever tried it) that the right technique is in the nativesdk-meson recipe:</=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=A0 =
=C2=A0 install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d<br>=C2=A0 =C2=
=A0 install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-rel=
ocate-setup.d/<br><br>=C2=A0 =C2=A0 # We need to wrap the real meson with a=
 thin env setup wrapper.<br>=C2=A0 =C2=A0 mv ${D}${bindir}/meson ${D}${bind=
ir}/meson.real<br>=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/meson-wrapper ${=
D}${bindir}/meson</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Alex<br> </div></div>
</div>

--000000000000839a0205918d8894--
