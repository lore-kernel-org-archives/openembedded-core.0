Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id D049261046
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 09:51:16 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48LfPx1Rn5z5tl9;
	Mon, 17 Feb 2020 10:51:17 +0100 (CET)
Date: Mon, 17 Feb 2020 10:51:15 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Message-ID: <20200217095115.uyhdpgk6x2homrxs@qschulz>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
	<CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
	<CAAx3WaAhLo1wbfsUdwdoNrYyEkJ38AgyFO0H+ckLyyqSgc3bOA@mail.gmail.com>
	<CAA=hcWQL8se7RR9bfuBsS0xpof0Y7vwEyQ5Zg_hm+Vq0FwjTPg@mail.gmail.com>
	<CAAx3WaDkzFvh_g8t_WXgzc7PToXndRmnEKJr_1R+yMnfOnqPAw@mail.gmail.com>
	<CAA=hcWTbwkpTp5Cn9psNtsSJknEuTH=mUmz0M+rfOKuV2ELSNg@mail.gmail.com>
	<CAA=hcWSuVzWcGyMeOQY=tVPLiKMt4B83JhHwem1Jgp7bzkuPVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA=hcWSuVzWcGyMeOQY=tVPLiKMt4B83JhHwem1Jgp7bzkuPVg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Gabriele Zampieri <gabbla.malist@gmail.com>
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
X-List-Received-Date: Mon, 17 Feb 2020 09:51:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JH,

On Sun, Feb 09, 2020 at 08:01:15PM +1100, JH wrote:
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

FYI, U-boot was still slowly migrating to Kconfig only back then (maybe
still is). There was for a long time a mix between Kconfig options and
options in what I call board header files (include/configs/<board>.h).

Most likely CONFIG_MTD_PARTITIONS had to be defined there.

Biased recommendation: https://www.youtube.com/watch?v=5E0sdYkvq-Q

BR,
Quentin

