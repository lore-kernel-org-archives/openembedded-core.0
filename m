Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2078F60B3A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 06:23:34 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id i7so3070084ilr.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 22:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0+J7Rd8xjqQ6eXMxVpEsgMr/94130gzGc7ySrOnn0iM=;
	b=VQc3e+izM4OoF+9HXQQ3XorCniQLNoa9vclgGACPKrwDe7qjUpPPiFgB3KqyXaDguP
	GwWq6P13mNcAvQGb1Cg6fLdfGWvGf1sTbMarF1Iw8mx4LEdO9ta9VjtIY3JPeyyw5cFK
	o9J7O8eRWREYh6jTw7/kWloUQEGhFwRRvZzR4tqV+PDbT+gOPzkpY7ytb8JYg3jfjhbh
	tZOYr0c9vew+R7rYCT2rXwsCc/i7B4Otka8MbCy1dEweJas4L8khYMOtkohqqKcOfeOg
	Bwh3szR47R6dFd5IekKL6WWARaVNiiAyMgm6Ks9v62XZPNw1ZaGIdzV/Pb3ArrldJ4yH
	bwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0+J7Rd8xjqQ6eXMxVpEsgMr/94130gzGc7ySrOnn0iM=;
	b=ioo0hw1pwMwlP1hG6JpCcE4L/nshUE4dHPAZS8FvrxyxIBCxhctZPBvBHw+RnfU6x2
	79lZ5lWnOS1U96h8XM6LPGWSeImmwmTYgJ/DJI/ChLoCq+FA4BrXvcXQp+8fItugY/8Q
	jwjc9fh0rRkiLWboXWp3SG1j0SF3K6C6zQMx+F6l3sfwvt5bhvelYqSGaOd1Ky7N4ptW
	ni6TAPpoVt4+U6yuA1oo12hnLPSOxQYvPNF7t53ZqhT5ou4Jr8mU6EC62Ym4IpUljEIj
	fg1xfHOLppqIHLUq4ST8G3aWFhyUq4c/ek8Zs4NsszYmPyDuYZbo7IEgIyE2/MZ6H7s6
	627g==
X-Gm-Message-State: APjAAAX11MoJWWoWnFaNAbtemiWqqxn26kS1oiHm4Y0i1QMSWRA0Gx5C
	UbMkMBaKZtDDlZjZ/uvnuyse+csSXNoTVORd78A=
X-Google-Smtp-Source: APXvYqw9ZfQlR0uVCc3dGffwCvG4cv3Y6g1deb277OSh7vlCJchrntV31oKZagDW4FJan+k1Eu4n3P6En/BLY+MbMrI=
X-Received: by 2002:a92:5855:: with SMTP id m82mr6923184ilb.302.1581229415113; 
	Sat, 08 Feb 2020 22:23:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Sat, 8 Feb 2020 22:23:34 -0800 (PST)
In-Reply-To: <CAAx3WaDkzFvh_g8t_WXgzc7PToXndRmnEKJr_1R+yMnfOnqPAw@mail.gmail.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
	<CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
	<CAAx3WaAhLo1wbfsUdwdoNrYyEkJ38AgyFO0H+ckLyyqSgc3bOA@mail.gmail.com>
	<CAA=hcWQL8se7RR9bfuBsS0xpof0Y7vwEyQ5Zg_hm+Vq0FwjTPg@mail.gmail.com>
	<CAAx3WaDkzFvh_g8t_WXgzc7PToXndRmnEKJr_1R+yMnfOnqPAw@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 9 Feb 2020 17:23:34 +1100
Message-ID: <CAA=hcWTbwkpTp5Cn9psNtsSJknEuTH=mUmz0M+rfOKuV2ELSNg@mail.gmail.com>
To: Gabriele Zampieri <gabbla.malist@gmail.com>
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Support UBI u-boot
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
X-List-Received-Date: Sun, 09 Feb 2020 06:23:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Gabriele,

Thanks for the help.

On 2/8/20, Gabriele Zampieri <gabbla.malist@gmail.com> wrote:
> If you just want to run the menuconfig run
> make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
> and
> make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- savedefconfig
> In any environment.

It does not seem the OE / Yocto build issue, rather than the u-boot
build issue.

I can build OE / Yocto to load my mx6ull_14x14_evk_nand_defconfig to
replace the original source
git/configs/mx6ull_14x14_evk_nand_defconfig.

The git/scripts/kconfig was able to run defconfig mode that
git/scripts/kconfig/conf.c and git/scripts/kconfig/confdata.c was able
to enable CONFIG_CMD_UBI and to write to the .config based on my
mx6ull_14x14_evk_nand_defconfig, but git/scripts/kconfig/conf.c and
git/scripts/kconfig/confdata.c were not able to generate
CONFIG_CMD_MTDPARTS (I could not find CONFIG_CMD_MTDPARTS when I made
menuconig from menu config either).

The git/cmd/Makefile requires CONFIG_CMD_MTDPARTS set up to run
mtdparts.c, without CONFIG_CMD_MTDPARTS, mtdparts.c was not compiled,
and other cmd source files were not compiled, thus missing all
dependencies for ubi (undefined reference).

Is it buggy in u-boot source downloaded from
https://source.codeaurora.org/external/imx/uboot-imx.git (commit
"8be98e9322040c655b9e5c9fb2c494e002e3fad9"), or is just my silly
stupidity to miss things?

Could anyone in u-boot source development help to comment our if
https://source.codeaurora.org/external/imx/uboot-imx.git (commit
"8be98e9322040c655b9e5c9fb2c494e002e3fad9") works for ubi or not? Or
what I could be missing?

Apologize to cc source contributors.

Thank you.

Kind regards,

- jh

