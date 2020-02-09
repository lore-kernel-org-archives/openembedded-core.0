Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id E144E60611
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 09:01:14 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id g12so3237126ild.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 01:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bFwp1uS3iaJaZOICJEmCZA/TeN5+HVhOAxEbDeva0c8=;
	b=mxmAaYsef6GUkPAYmgvb6t63A4JW1XjYHkr9yNA5Vzesnpkd/0GFvA1PRaUomoARNz
	4cCrRZyZ78hy0pXXt4t1VwIRXdzmS87W8qQ3idynrnmoFoVssx8qESDSNTQOz4q7JHd+
	lWM9+xeuU69cwCQFrxomcb66EaW8+YuFF1yQx8P9OxsT8DC0f6lzKjsapmH5fdz3Yf7J
	fuQ5wgw/mahN5Tw6ZvqnbWrjWhVOSkx77J3VyCI9tApE6N/knqglKz/HdbZpWNAVchd5
	2bkQTRFLHtwqgDAs44wVkZJ6y6/JDDjq/lz/ovj6vpP+AdnH3ddXSSzcei97EgjobRC2
	W/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bFwp1uS3iaJaZOICJEmCZA/TeN5+HVhOAxEbDeva0c8=;
	b=cnmeDo2Esi4h5VTrDpY2vxrnjvmPba7ZRdPbqp5Azn5Cysbj1/LOmyf6ZYO5nOj4HU
	5kzB2ghXBvFXb1uEeGXs0lgVL76pauPl4xkAyrsfsH0p3C92Lw4234xMiG0pU2v81UQ3
	lgvpRJRXAoWHtI8PJRmc4gq2YOAvbyaqy2clMGQUzZRVjGkEt4aMNsuQB3YdA5ovtVhr
	f/X4AddQK9qEcJtgY7zT34iEhfxuld7S1PwcGbh3h9pEXj9o2gAoF93tKmOu+VdnYA6c
	EdURYhdkyXOq3Qvu+Wj5/ouzycsmd6KUT5vREV9FoHmZ5R9EYhFel613SgbDIaJ/T66g
	RJHw==
X-Gm-Message-State: APjAAAXeKQ3nC4ONFptwPjf89UxnWQmH+ZvCI0mwAupw1p0KoYHqu9ZJ
	mzOMEZcE4VRNJIcaICQoE6BP1ih5M0H514icnvc=
X-Google-Smtp-Source: APXvYqy6Nm/lTgsewKDFPRp+FSpFJelLb+ett6ntndDFHB3KbDXQ7lSnTbaM939pD6QwBYYOGesRgiROOiuFjs80k5o=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr7248810ilq.306.1581238875944; 
	Sun, 09 Feb 2020 01:01:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Sun, 9 Feb 2020 01:01:15 -0800 (PST)
In-Reply-To: <CAA=hcWTbwkpTp5Cn9psNtsSJknEuTH=mUmz0M+rfOKuV2ELSNg@mail.gmail.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
	<CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
	<CAAx3WaAhLo1wbfsUdwdoNrYyEkJ38AgyFO0H+ckLyyqSgc3bOA@mail.gmail.com>
	<CAA=hcWQL8se7RR9bfuBsS0xpof0Y7vwEyQ5Zg_hm+Vq0FwjTPg@mail.gmail.com>
	<CAAx3WaDkzFvh_g8t_WXgzc7PToXndRmnEKJr_1R+yMnfOnqPAw@mail.gmail.com>
	<CAA=hcWTbwkpTp5Cn9psNtsSJknEuTH=mUmz0M+rfOKuV2ELSNg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 9 Feb 2020 20:01:15 +1100
Message-ID: <CAA=hcWSuVzWcGyMeOQY=tVPLiKMt4B83JhHwem1Jgp7bzkuPVg@mail.gmail.com>
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
X-List-Received-Date: Sun, 09 Feb 2020 09:01:15 -0000
Content-Type: text/plain; charset="UTF-8"

Changed to https://source.codeaurora.org/external/imx/uboot-imx.git
branch imx_v2018.03_4.14.98_2.0.0_ga, it can now support
CONFIG_CMD_MTDPARTS ind defconfg, all MTDPARTS error gone, but then
2018.03-r0/git/cmd/ubi.c missed dependencies of del_mtd_partitions,
add_mtd_partitions, mtd_get_device_size all in mtdpart.c which can
only be enabled by CONFIG_MTD_PARTITIONS:

obj-$(CONFIG_MTD_PARTITIONS) += mtdpart.o

But that CONFIG_MTD_PARTITIONS is not supported in defconfig.

Could anyone advise which branch works for UBI?

Thank you.

Kind regards,

- jh

