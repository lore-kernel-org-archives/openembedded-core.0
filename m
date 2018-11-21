Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBE56C4A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:20:27 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f18so4049064otl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=rD3hinkED/CFzk34PYojB2Z1d7TB0VPZL3b6TjyOToo=;
	b=bem+9gUUrXlnY7SPsX1kQtZJcLjU+CXl7vG/UyP180K2OKfCaEX+GvtSBabrV9Bbfe
	Ujn1tJ8bgrKavAUIkdakdSOZTlegMckJaqWdSn8jK0BjrMPYaoNXIFaWid+lIv8r5kxW
	DDqJ/bUf4VXPw+Eveoo8ItUt16ZwU1WxFxO9hVE+gphhV31t7n11bQlWDOb/qu1Rr6nv
	tYUQmMvafolVhGco+kgcd9ALu1mCp60+q79pCAxuEEtWWL03rBP/UgM5ZAavz116+Ybo
	2Cvgow/+fZbRWlyQnAO15bF+rNuIA+vPBwTjAIcotyQ3PyfilpWEBKX7o5sq/2VXIxmd
	BK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=rD3hinkED/CFzk34PYojB2Z1d7TB0VPZL3b6TjyOToo=;
	b=aKFIWBgaPGF4QS9O84R69X9JIc9IJU06lzCtFmZ889XY0+0HPnMRaD/7yr4vN6NNku
	N1KfjNxtjgjx6aO2H+2ZLt8ATA+sVR9JssuV2kXkaTEo2K9bJlqd9Kgyr+W2mrdH5xXO
	IGowuO9z6xwlTSXY+//b1dJYmdxQdx7Dn8qENCfmCwqvmQOMsub0gyS+I6/IuY5UmAHS
	5iOdqSxrSiM0vmUElmsPGDzmuZY0wmasT4CSLV8vvA17AB190L5U4cJWrJphntwA/tlE
	66unmmlWfxhYg+1KxUcSWxDwDALgLV7R9uRES1rpjyKdalromQKu5x/erbqDznsjzrJb
	loog==
X-Gm-Message-State: AA+aEWb0Qra7vyHlMJWWkzcLtfHqTARyTxJwNVM7LvzhaxhGjOZorpAV
	3jQqt/ZppGacsJJbHGopy7M7MIJT0uHtQw==
X-Google-Smtp-Source: AFSGD/UmO2c8vAs4wWUeY+GZbDs9zLFqAq1oLRaWdMImPOOhCO0F5Cn+jQlWi4xOmf17u1o2pcDUvw==
X-Received: by 2002:a9d:f44:: with SMTP id 62mr4519569ott.299.1542820827345;
	Wed, 21 Nov 2018 09:20:27 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
	[209.85.167.174]) by smtp.gmail.com with ESMTPSA id
	q66-v6sm19134972oig.18.2018.11.21.09.20.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 09:20:26 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f174.google.com with SMTP id h25so5185394oig.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:20:26 -0800 (PST)
X-Received: by 2002:aca:ad14:: with SMTP id w20mr3348686oie.3.1542820825647;
	Wed, 21 Nov 2018 09:20:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542781427.git.liezhi.yang@windriver.com>
	<bd77663c215d2ed20cb3765b95e62b9b14330896.1542781427.git.liezhi.yang@windriver.com>
In-Reply-To: <bd77663c215d2ed20cb3765b95e62b9b14330896.1542781427.git.liezhi.yang@windriver.com>
Date: Wed, 21 Nov 2018 15:20:12 -0200
X-Gmail-Original-Message-ID: <CAP9ODKquwOEHEcQc2EOZzty_+GgO1ONKAZU_U4h-L9PRxwFWBg@mail.gmail.com>
Message-ID: <CAP9ODKquwOEHEcQc2EOZzty_+GgO1ONKAZU_U4h-L9PRxwFWBg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: c.andersen@kostal.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] uboot-sign.bbclass: fix signature and deployment
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
X-List-Received-Date: Wed, 21 Nov 2018 17:20:27 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

On Wed, Nov 21, 2018 at 4:08 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Fixed:
> MACHINE = "beaglebone-yocto"
> KERNEL_CLASSES += "kernel-fitimage"
> KERNEL_IMAGETYPE_beaglebone-yocto = "fitImage"
> UBOOT_MACHINE_beaglebone-yocto = "am335x_boneblack_vboot_config"
> UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
> UBOOT_SIGN_KEYDIR = "${TOPDIR}/conf"
> UBOOT_SIGN_KEYNAME = "dev"
> UBOOT_SIGN_ENABLE = "1"
> IMAGE_INSTALL_remove = "kernel-image-zimage"
>
> $ cd conf
> $ openssl genrsa -F4 -out dev.key 2048
> $ openssl req -batch -new -x509 -key dev.key -out dev.crt
> $ cd ../
> $ bitbake u-boot linux-yocto
> $ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
> Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto-2018.07-r0.dtb matches
> Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto.dtb matches
> Binary file tmp/deploy/images/beaglebone-yocto/u-boot.dtb matches
>
> And there would be no signature info when rebuild from sstate:
> $ bitbake u-boot linux-yocto -cclean
> $ bitbake u-boot linux-yocto
> $ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
> No result
>
> This s because kernel directly edit ${DEPLOY_DIR_IMAGE}/u-boot.dtb, (Note, it
> is global ${DEPLOY_DIR_IMAGE}, not recipe's DEPLOYDIR), so that the modified
> info is not in sstate, and would be lost when rebuild from sstate.
>
> There are other problems in previouse code:
> - The u-boot.dtb is provided by u-boot, but edited by kernel during signing, so
>   it should be deployed by kernel rather than u-boot.
>
> - The u-boot.do_concat_dtb directly install files to global ${DEPLOY_DIR_IMAGE},
>   this is incorrect, the ${DEPLOY_DIR_IMAGE} should be installed by do_deploy.
>
> - It seems that it assumes do_deploy depends on do_install according the comments,
>   but they have no relationships:
>   # do_concat_dtb is scheduled _before_ do_install as it overwrite the
>   # u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
>
> - The do_concat_dtb should be run after do_compile, but it doesn't have this
>   dependency.
>
> Make u-boot install u-boot.dtb to ${datadir}, kernel copies u-boot.dtb from
> ${STAGING_DATADIR} to ${B} and deploy it can fix the problem.
>
> [YOCTO #12112]
>
> Reported-by: Christian Andersen <c.andersen@kostal.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

The change itself looks good, I noticed that the script part is not
using 4 spaces for indenting and as this is being changed, it might
make sense to address this as well.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

