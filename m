Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 955DB600A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 06:34:54 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id s6so5065713iol.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 22:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=1eb2RXCmyTB1S8buyh/wDuPzjOjoOwR3b2p2azWf8rs=;
	b=VUcqclUkf5oApTbSMbGTfUcLIlJLhrucVOgq//WegVNKQ60NL4+huMzvRtefPcVdYV
	QXe2A/4LoID5iOLOX21fH9KIAJEN5+vhaBYGjj6h2DcwcysS1K9p2oKek3Cw9Uf3Lxv2
	oPHtgDhx6Bjyhcg589Cmu5T1ikxg0S3v9S6ERAt+TB+SsxKw9Jkj5Ren/BBgkVWIdPdA
	X7oqsJDZ3fBCriFXPrImlvW5xGxBLTPjSreqN3BIbdP6JxWC8jzgxy6QUlzkJYBlBJtv
	NkGunayn+Mg/9xdXQBrVR5vmtzMG5roaIUDKXNBw4rZ//bXyU6O7g6fYFvChPDV0gzwh
	EVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=1eb2RXCmyTB1S8buyh/wDuPzjOjoOwR3b2p2azWf8rs=;
	b=bn7T86KJNNKHjO0HtYlgVDkee3P1uLlTRE5p4C9xcuhG9zo89YE7Tdkw5OmUadPqBo
	rGHDKjepNDTaRNPdRQoOtpqUin8DcYI9DKsPHoN98XR6sjL9VvQC2f4r4WW1+mhjl8LL
	vDltj6Jpjwq7jjq5zZRWfdjodxR+hZdij4wDEjcPgU+6J0x/DTji9qutUOj37Qz6O08m
	f4n5/YoagAmYGITXYBRX1Jt8z4tYrQ/TE+oqHFQ4VW8DXBwNOol9f2WKJBkOBzTZARq+
	+wPywL4Z7atC6vEiYrVi0IJyaAqSZWJNLTgA3XVVR6vKV2h4ihTDka/m9Zs1kx+2MJpm
	E38w==
X-Gm-Message-State: APjAAAUVvJZMhxotm07nzNlGTD4tc/t0qttBHQQO07/J81o2VOcR6Voy
	nXfNQtpih29lm0jw5mRGbQd8gOADbc2SB5ueITkJXVFJOnI=
X-Google-Smtp-Source: APXvYqxqyqjFDJAEgGurujDeH26RHpn/CwweVo6OY98Mv6SCwQR6jUskKdB9DDRK9pJmg0T8vjakFrpWgrtWnysZD74=
X-Received: by 2002:a02:6055:: with SMTP id d21mr33814202jaf.21.1580970895556; 
	Wed, 05 Feb 2020 22:34:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Wed, 5 Feb 2020 22:34:55 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Thu, 6 Feb 2020 17:34:55 +1100
Message-ID: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
To: Meta Freescale <meta-freescale@yoctoproject.org>, 
	Yocto discussion list <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Support UBI u-boot
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
X-List-Received-Date: Thu, 06 Feb 2020 06:34:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for cross-posting, I have been asking for helping solving the
issue many days ago, but could not get those work.

(1) UBI support

I added NAND and UBIFS support to my Yocto layer machine config file:

UBOOT_CONFIG = "nand"
UBOOT_CONFIG[nand] += "mx6ull_14x14_evk_config"
UBOOT_CONFIG[nand] += "mx6ull_14x14_evk_nand_config"
UBOOT_CONFIG[nand] += "ubi"
UBOOT_CONFIG[nand] += "ubifs"

But my u-boot.imx-nand still could not support ubi:

=> ubi part rootfs
Unknown command 'ubi' - try 'help'

What I could be missing here?


(2) Patch u-boot parameters

I am not clear how you do to change u-boot parameters, it seems to me
I have to create my own u-boot-imx_2017.03.bbappend and patch files to
 mx6ullevk.h, to change u-boot parameters of mtdparts, NAND_ROOT_UBI,
bootcmd, etc based on my configuration.

But Yocto won't allow the patch running unless that the patch is
committed to the git repository in
https://source.codeaurora.org/external/imx/uboot-imx.git.

Ideally, I thought all u-boot parameters can be changed in a bbappend
file, could you advise if it is possible to do that way or not? If so,
how to do it?

If not, what is the policy for making parches and commit to the git
repository https://source.codeaurora.org/external/imx/uboot-imx.git?

Thank you.

Kind regards,

- jh

