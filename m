Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id A96F76021E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 11:13:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h8so4457445iob.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mknGAI/tJBqq9ikKaXWsbXqTSiuGWL+rUosu+sHmt4c=;
	b=b0tNuG6SlpJ+TIEGXYGlMDtH8YVFMwnIY43U+xrifcpIWuPIf8XS4cEC3bAMLV1MUV
	/9JfozzVNCmtKr971Psst3KsQ3niiLq7kySOwqdeQj9Y8/AwWFV9hgjeKuPn22Gmegns
	H851eeNg5QkD/72A6hXZPFdJjpxXGXj7ATt0k89m7pM6QZBvdH8pKKRPx65DrcOWUqXP
	vRXXPLPt3kPQXKYGzPGFdNgSSP/t1BJ8Uddmng3Aq4F0Pg5dveJYWx3P0eRxwNT2G6xx
	DW77fcOMDaAN5PlP3PPc9u4OXjnZ7eZ0llsL3mAL9nM8jZz9iWmCXPG31D1ASQhzqApS
	TTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mknGAI/tJBqq9ikKaXWsbXqTSiuGWL+rUosu+sHmt4c=;
	b=jb3s9xBLPqmk1jQx5zKTSwbWf7TeemEhsfgV6jzmop0MfnIPRnW4cDJ65rI1OhT8H0
	OKfsM61tkKclyfeQj5ALmgFMq8LnWdmTtMroLvAJT/aVaaYGdWBMzbR9pem7EOZAHMqT
	UAOyy0AwWZdCnfN+xqnG4XdyrEDCR1TlL3QI7xs0eClz37ONWTqNVmBKRuprqtDetbyA
	GuxZ94ZS58OLWPxdFqVlPk9Hlt0fD6pLti3qIBuJNCrz9Q0RXISY7SN0daoIIV03WWSd
	l6sWAAM90QPLJnQq3UYEsddYF7OFPtgAdlkWQdyKjIw4HmeepFE7WPVqqg/tjuNj3n6/
	YmcQ==
X-Gm-Message-State: APjAAAV3Oe0Q642uYsJzi51EeQ0mC+FliBjl1JVnCgQItE6dxqyhHjTL
	02cfV8Xu5LC9srf+8MYHFwuq+UWALjtpyfWMwgw=
X-Google-Smtp-Source: APXvYqyCij737FZ1u7pRplAatgYzQnd/JRj8w8zLpLxyn2eKJYEPvtNtvUlOPA5pTu2my4uDgWR84F2brhMG0f8XGFE=
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr5675631ios.192.1581246794756; 
	Sun, 09 Feb 2020 03:13:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Sun, 9 Feb 2020 03:13:14 -0800 (PST)
In-Reply-To: <CAA=hcWSuVzWcGyMeOQY=tVPLiKMt4B83JhHwem1Jgp7bzkuPVg@mail.gmail.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
	<CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
	<CAAx3WaAhLo1wbfsUdwdoNrYyEkJ38AgyFO0H+ckLyyqSgc3bOA@mail.gmail.com>
	<CAA=hcWQL8se7RR9bfuBsS0xpof0Y7vwEyQ5Zg_hm+Vq0FwjTPg@mail.gmail.com>
	<CAAx3WaDkzFvh_g8t_WXgzc7PToXndRmnEKJr_1R+yMnfOnqPAw@mail.gmail.com>
	<CAA=hcWTbwkpTp5Cn9psNtsSJknEuTH=mUmz0M+rfOKuV2ELSNg@mail.gmail.com>
	<CAA=hcWSuVzWcGyMeOQY=tVPLiKMt4B83JhHwem1Jgp7bzkuPVg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 9 Feb 2020 22:13:14 +1100
Message-ID: <CAA=hcWRm31t=DS7pyCm9QduxfEzC4EbHGhQfsme8eX3c1h4LFw@mail.gmail.com>
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
X-List-Received-Date: Sun, 09 Feb 2020 11:13:13 -0000
Content-Type: text/plain; charset="UTF-8"

Anyway, hacked the Makefile and mtdpart.c, finally got it compiled to
support UBI. I think some latest branch might fix the problems I
haven't tested, if not, I am happy to make patches.

Thank you all.

Kind regards,

- jh

On 2/9/20, JH <jupiter.hce@gmail.com> wrote:
> Changed to https://source.codeaurora.org/external/imx/uboot-imx.git
> branch imx_v2018.03_4.14.98_2.0.0_ga, it can now support
> CONFIG_CMD_MTDPARTS ind defconfg, all MTDPARTS error gone, but then
> 2018.03-r0/git/cmd/ubi.c missed dependencies of del_mtd_partitions,
> add_mtd_partitions, mtd_get_device_size all in mtdpart.c which can
> only be enabled by CONFIG_MTD_PARTITIONS:
>
> obj-$(CONFIG_MTD_PARTITIONS) += mtdpart.o
>
> But that CONFIG_MTD_PARTITIONS is not supported in defconfig.
>
> Could anyone advise which branch works for UBI?
>
> Thank you.
>
> Kind regards,
>
> - jh
>

