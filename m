Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0A85360AE3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 04:32:58 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id f5so604018ilq.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 20:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CVFNM2T8EOrhg8m1g3h9jAd0Z4JF6n38tH/XAbj1Tm4=;
	b=lnL57Jz/TPx9kviAsgWrLjuo2xWYPCOy9UZJDjpyxsEGzGBTFXhE1P4z0jBOJZRmnF
	tlBCZK4AX5KzJAdFVmnmnYFtd4WSSI8HDp62Tid5ACm8aGGpYZ7G3tP5mH/ZPZrjRSAR
	5UCo0NDtleJ3PVHLAlfMSdGwaLVCcPHsyoY9HR3qTUNT1IrtKSPTBIsYj8jejHu+Ywoe
	8yKXEpgoMj84jZOjkaYX43l1TU5YymEetwhZkkLVbIUteH2Ifm9Rweth+szIMiwxtYs6
	lnbPS5VWghDBovKDBVaJsizuiJJiDxZ9VDS1DG/VZr3AHFtLygzylnnUs+ZraOnwOF5N
	eU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CVFNM2T8EOrhg8m1g3h9jAd0Z4JF6n38tH/XAbj1Tm4=;
	b=DNU6Cv8pf0JreTpY3/C/BoqEV4BLOTPP3J3P+BNxxHtSpxPeoJX/3pbR+TPdSCFDW2
	VL8EsdI2Bkp4Uf850TNpbY36mpi08S0xl/wbdXVjseu/ub8kLNmGj+zt8AwT2ydG7DsX
	OZOmsP/tKU7sVlzO22651vII3MALBlcEIgR+na4Mr65USAOVI14NIHZq34Vz/DfCUA/2
	KN/Gs9vO9UUzEgUnypBDb0Aj3JkHOkfluE+rixJmB7wEJ6NjZAJPMwA+CJPJgweCJLxi
	8dHegNWZdE9GjVlRnj7Iutj7z5sc4Y+LavhD4h40Wa0vZJ3xrWHuELrqrH1owdmnxm9W
	mtqA==
X-Gm-Message-State: APjAAAUgCmChlOxbwUGwFfM25sm8kXxkhsqywFXNbnGeUz3rI34RzFXQ
	OyFY2b97pI4z9pYfk6xloQHkiDj3su6SEMLnpE4=
X-Google-Smtp-Source: APXvYqyUVE5gawB7gYhjEz7LbX24FAQm4xZ+1nTSGwHPGIOLYUprsbJXK/Q6O3PuQD3yQPB4li1E/KEdxsdiXLnbFuE=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr7903281ilq.192.1581049979827; 
	Thu, 06 Feb 2020 20:32:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Thu, 6 Feb 2020 20:32:59 -0800 (PST)
In-Reply-To: <em86bbcd60-f004-4acb-b508-4471dac5c7c1@andys-imac.leeshillfarm.local>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<em86bbcd60-f004-4acb-b508-4471dac5c7c1@andys-imac.leeshillfarm.local>
From: JH <jupiter.hce@gmail.com>
Date: Fri, 7 Feb 2020 15:32:59 +1100
Message-ID: <CAA=hcWQsP1N58iqrxEggZBdSksgHk+gfuG7yz0+C3G7o0=DzOw@mail.gmail.com>
To: Andy Pont <andy.pont@sdcsystems.com>
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Support UBI u-boot
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
X-List-Received-Date: Fri, 07 Feb 2020 04:32:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On 2/6/20, Andy Pont <andy.pont@sdcsystems.com> wrote:
> JH wrote...
>
>
>>I added NAND and UBIFS support to my Yocto layer machine config file:
>>
>>UBOOT_CONFIG =3D "nand"
>>UBOOT_CONFIG[nand] +=3D "mx6ull_14x14_evk_config"
>>UBOOT_CONFIG[nand] +=3D "mx6ull_14x14_evk_nand_config"
>>UBOOT_CONFIG[nand] +=3D "ubi"
>>UBOOT_CONFIG[nand] +=3D "ubifs"
>>
>>But my u-boot.imx-nand still could not support ubi:
>>
>>=3D> ubi part rootfs
>>Unknown command 'ubi' - try =E2=80=98help=E2=80=99
> You need to start to read through the various sources to figure out for
> yourself what is going on!
>
> Starting from the bottom, in U-Boot 2017.03 all of the command sources
> are in the =E2=80=9Ccmd=E2=80=9D directory. The =E2=80=9Cubi =E2=80=A6=E2=
=80=9D command are all in ubi.c.
> Reading cmd/Makefile shows that file gets added into the build if
> CONFIG_CMD_UBI is enabled.

You are right, that CONFIG_CMD_UBI is not enabled, but I could not
find any conf or bb files I could change or enable CONFIG_CMD_UBI in
meta-freescale layer.

Desperately, I hacked to run "make menuconfig" at U-Boot 2017.03 build
directory, selected and enabled CONFIG_CMD_UBI and saved to .config
file in that build directory, but then to run bitbake to build u-boot
again, the .config was removed and replaced by an old one disabled
CONFIG_CMD_UBI again.

Other people recommended to build u-boot in a standalone environment
out of OE / Yocto build system. Since I have set up everything in OE /
Yocto environment, I thought it could be easier if I could modify one
line of u-boot config file in a recipe.

Any idea where is the recipe in meta-freescale to allow me to change /
enable CONFIG_CMD_UBI?

Am I the only one unable to change u-boot config file in OE / Yoctu
build? That makes me very sad :-(.


> The next place to look is whether or not that is set in your defconfig
> for U-Boot or overwritten somewhere in a recipe in your Yocto build
> environment.

Yeah, I'll been searched all day, could not find a recipe Yocto build
environment, I was told OE / Yocto does not have that stack and
mechanism to set and change u-boot config, is it true?

Thank you very much.

Kind regards,

- jh

