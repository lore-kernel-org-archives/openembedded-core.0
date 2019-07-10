Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6267CFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 13:32:05 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c73so1105507pfb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Bx41f+bHoJOkyeiGGa5+Qe5zxywbqCNPQecJVZxdFYA=;
	b=kiFYecSmxdZ2dJLjbYDBL1d2/oEJupJOv7+/GWyuDdpYxSNyAUmhdoJolwDSMPs+Bk
	lMA0QPoRGd0b6ARl9mMeIQEmYCuSKB+V1H+wwqNSBzntfiX16XepXDWrBL7O3VdwYwzL
	n+N60pp+Dzhba6JYU0R0Zccl2YaZstnXVER9SISJO5xIijeL7Caoz0BhSAtqppU2awfe
	O/fpIKc11eGHs3WqCMlEaTTDdu+mmqWIVptbS7uT1UNQ+CK/fa0ZvUAkOqfZIZFA/25R
	bun+xEdJFUxLvXpurNXp+IXRK7Bv1rCKgrxe2Y/PPYnGSNq0EROMbEW4509fse9fjqHj
	HQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Bx41f+bHoJOkyeiGGa5+Qe5zxywbqCNPQecJVZxdFYA=;
	b=UjzGLqxzt54th9lPzaH8X7Ff0YdPrwIKxB1tzk8m9ouD+G/geS6l2kVZEl22usjABn
	NCzYp4A1Uxi30nQizw7xKAaxDukanGthMOlF0CcmRBFfYY2k2xhrZMAcR/g2lg9lU28c
	DcB94xuBJnL86TQt3bl4i9VnAM9NkMEz4yG5Ekt415FbYEQLYHkAmZeZ0CI2pti/5AFy
	EmE96hQgp/B43zrRQC/pNJJi65QxEI4IgAkyxXjP+SE3PKtaRZ4jHt2Bu5xdu7tZf96U
	C2ly2Sxk7aJTG7W1qvHCxlVQdUmJ0tcsICenScQMfDdKziY1ILMqGDo6/ns2O6SFIytj
	4cQQ==
X-Gm-Message-State: APjAAAXHPumOmW+eHw551/Vyc2Xcm2TmnDbmofOmLaC7jH//EEQLa0WN
	L7SsoYEe0borb5YsiNjub5X1XqNpXcc=
X-Google-Smtp-Source: APXvYqxZEr/C9aDS7EbBvCmTkStlWyX2seRa3O2O6pic5ukuyjFyfcrOkh3oH+BJSW7/BIreQTCtuA==
X-Received: by 2002:a63:1918:: with SMTP id z24mr33599731pgl.94.1562765526000; 
	Wed, 10 Jul 2019 06:32:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d1c7:76cb:bd3:8c78?
	([2601:202:4180:c33:d1c7:76cb:bd3:8c78])
	by smtp.gmail.com with ESMTPSA id
	r27sm4120278pgn.25.2019.07.10.06.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jul 2019 06:32:05 -0700 (PDT)
To: Lukasz Majewski <lukma@denx.de>, Marek Vasut <marex@denx.de>,
	openembedded-core@lists.openembedded.org
References: <20190709142028.16845-1-lukma@denx.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <55b42a36-6210-fc70-231f-db5bf033b5be@gmail.com>
Date: Wed, 10 Jul 2019 06:32:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709142028.16845-1-lukma@denx.de>
Subject: Re: [PATCH] u-boot: Provide tasks to generate default U-Boot environment(s) images
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
X-List-Received-Date: Wed, 10 Jul 2019 13:32:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 7/9/19 7:20 AM, Lukasz Majewski wrote:
> This change provides tasks to generate default U-Boot environment image=
s
> from built U-Boot (via. get_default_envs.sh script).
>
> Those images then can be used to generate wic images (with e.g. eMMC la=
yout).
> With such approach the end user doesn't see the "CRC environment" error=

> after the first boot.
>
> Moreover, those are built per MACHINE (as u-boot itself is) so then cou=
ld
> be used in SWUpdate scenarios with single tar'ed archive with multiple
> MACHINE specific *.swu images.
I like this idea.


>
> It is also possible to adjust the *_ENVS_* variables in machine specifi=
c
> conf file.
Can you give an example on how that is done or what it would look like?


I have been using this class I created a while back to do just that

https://github.com/akuster/meta-odroid/blob/master/classes/uboot-boot-scr=
=2Ebbclass

- armin

> Test:
> Newest master-next for poky repo - SHA1: eb5b0a0b5e53a6e55a09e66489d3f2=
4d0c6232ee
> MACHINE =3D "beaglebone-yocto" in local.conf
> bitbake virtual/bootloader
>
>
> As a result following links are available in deploy directory:
> u-boot-env.img{_r}.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 41 ++++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-bo=
ot/u-boot.inc
> index 9a754fd09b..e0ccf1ce1f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -331,3 +331,44 @@ do_deploy () {
>  }
> =20
>  addtask deploy before do_build after do_compile
> +
> +# Extract default envs from build U-Boot
> +DEFAULT_UBOOT_ENVS_FILE ?=3D "u-boot-env"
> +DEFAULT_ENVS ?=3D "${DEFAULT_UBOOT_ENVS_FILE}.txt"
> +UBOOT_ENVS_DEFAULT ?=3D "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-$=
{PR}.img"
> +UBOOT_ENVS_SIZE ?=3D "65536"
> +
> +# Generate default environment
> +do_gen_default_envs[doc] =3D "Generate image with default U-Boot envir=
onment(s)"
> +do_gen_default_envs () {
> +    ${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS=
}
> +
> +    # Generate env image
> +    ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_D=
EFAULT} ${B}/${DEFAULT_ENVS}
> +
> +    # Generate redundant env image
> +    ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENV=
S_DEFAULT}_r ${B}/${DEFAULT_ENVS}
> +
> +    rm ${B}/${DEFAULT_ENVS}
> +}
> +
> +addtask gen_default_envs before do_deploy after do_compile
> +
> +# Deploy default environment
> +do_deploy_default_envs[doc] =3D "Copy images with default U-Boot envir=
onment to deployment directory"
> +do_deploy_default_envs () {
> +
> +     install -d ${DEPLOYDIR}
> +
> +     install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFA=
ULT}
> +     install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DE=
FAULT}_r
> +
> +     cd ${DEPLOYDIR}
> +     ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
> +     ln -sf ${UBOOT_ENVS_DEFAULT}_r ${DEFAULT_UBOOT_ENVS_FILE}.img_r
> +
> +     rm ${B}/${UBOOT_ENVS_DEFAULT}
> +     rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> +}
> +
> +addtask deploy_default_envs before do_deploy after do_gen_default_envs=




