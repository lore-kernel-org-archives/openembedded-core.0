Return-Path: <quentin.schulz@streamunlimited.com>
X-Greylist: delayed 2507 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Feb 2020 11:50:08 UTC
Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9212460281
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 11:50:08 +0000 (UTC)
Received: from bsmtp2.bon.at (unknown [192.168.181.107])
	by bsmtp3.bon.at (Postfix) with ESMTPS id 48B4nM5WhMz5v7R
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 12:08:23 +0100 (CET)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48B4nL0hXzz5tlG;
	Mon,  3 Feb 2020 12:08:22 +0100 (CET)
Date: Mon, 3 Feb 2020 12:08:20 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Message-ID: <20200203110820.kokz6qu4l74nyhlk@qschulz>
References: <CAA=hcWQSba31fHCkAEdaK4+FwR_Szzs9t0fTajq4+USqnbZb1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA=hcWQSba31fHCkAEdaK4+FwR_Szzs9t0fTajq4+USqnbZb1g@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Failed to add u-boot ubifs (not working)
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
X-List-Received-Date: Mon, 03 Feb 2020 11:50:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JH,

On Mon, Feb 03, 2020 at 09:56:49PM +1100, JH wrote:
> Hi,
> 
> I added my local machine to ubifs, is it correct?
> 
> UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"
> 

Also, you need to select UBOOT_CONFIG somewhere, with the above line,
you just say "if nand is selected as an UBOOT_CONFIG, do xyz". You still
need to select it (with I assume, UBOOT_CONFIG += "nand" in a bbappend
somewhere).

What's in your mx6ull_14x14_evk_nand_config?

I haven't used that option before but what's ,ubifs supposed to do? Are
you sure this nand option for UBOOT_CONFIG would actually create a .imx
and not a .ubifs for example or something along those lines.

TL;DR: Make sure UBOOT_CONFIG has nand in it, check that .imx is built
with your defconfig and check that you're actually enabling the UBI
command in your defconfig.

Also, it would be helpful if you could give links to the recipes you're
using. I seem to recall in some other mail it was
http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-bsp/u-boot/u-boot-imx_2017.03.bb?h=sumo
but it could be thud version as well.

BR,
Quentin

