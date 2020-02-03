Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F60860B1C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 23:00:27 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id b15so14180730iln.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 15:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T+X/+Elx0aEl6HKJVJx909w/G/x0/1i0TAWRO2sOHvk=;
	b=eDvPHqoqGbf16XMMT48Q3ym/DJizW10JUlIir9GgvXVNUooDhb2H3PQDqrjZiLtwIw
	0T095htGaYaMEC7wKd+oxrkgfkivWbJ5aPmoXPXeOr0IpSI/34eFGd84OJRcUKX9hLVy
	Fjl3H5/qGl/IQgMVoXt6Vu7sOFzFrQ2rM5msh3LaSzMy4qQAboN8DEXoIN/P4Nx4uQsr
	JeKaQWD6j67vvj6RhxCiQdjBBpnsOar9sNzM2rxNeyS26yGsKQAKPTXzmMUR1Mplm27w
	nCf+Hazhv0/nHiVSG1lNf2VGLxOIEJG/2ow/pTlSjUOQbxV+0FPganSwHlS2h6fjGqu+
	XEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T+X/+Elx0aEl6HKJVJx909w/G/x0/1i0TAWRO2sOHvk=;
	b=JJKbgj/J2xHs03Oc7F4Yx1+IQ9krA+fYnHUQOO1Iy4XkD0NqhUHXztYSRP41248AX9
	E495mSPVI0eG9F3TmfSqCfas0hRW9cZExrWRVjqknCkT77jdfYVJb8tUHL7klvPPaxLP
	MCpO3T4G94tvf79Tol6cR1uf6KBs87TUA0gnA52LjlMJP0TmCZ6gHFYvER9iGJgzD43d
	pfVp+WGXoJXhc8lBxs9lXmpHxnabCcEZ38FiRJVHxrIIECIW8wN4P3NB4PdNMFNze6ZP
	QPhMLYhWv5JojE2vWocs7RY9nlcfCw3DGVsrlXTq/MPRl79YRTEfZVDqe5EYlK+HXob1
	0vAw==
X-Gm-Message-State: APjAAAVEtEgaQZnnnWfgNAQ7cLlaJEaWFPV+xYtrRtVMstuYyd8xyczE
	cmU0eVG7r/CCsQmQa4AmNdq4ki5ccIEe9quBf2U=
X-Google-Smtp-Source: APXvYqzouKMVE0TULYcpg0Gmv6D2HgEux+GpfvCeunOkT9at9+6O1I3j9SEKQAmLsWzsx3kY5iKbVX52vY0ydxPpIe8=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr25418134ilq.192.1580770828405; 
	Mon, 03 Feb 2020 15:00:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Mon, 3 Feb 2020 15:00:27 -0800 (PST)
In-Reply-To: <20200203110820.kokz6qu4l74nyhlk@qschulz>
References: <CAA=hcWQSba31fHCkAEdaK4+FwR_Szzs9t0fTajq4+USqnbZb1g@mail.gmail.com>
	<20200203110820.kokz6qu4l74nyhlk@qschulz>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 4 Feb 2020 10:00:27 +1100
Message-ID: <CAA=hcWSa+athn4Jw_nOG3ofVEmCYpTqyJVWPGcv-kNV2FmjVeA@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 03 Feb 2020 23:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

Thanks for your response.

On 2/3/20, Quentin Schulz <quentin.schulz@streamunlimited.com> wrote:
> Hi JH,
>
> On Mon, Feb 03, 2020 at 09:56:49PM +1100, JH wrote:
>> Hi,
>>
>> I added my local machine to ubifs, is it correct?
>>
>> UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"
>>
>
> Also, you need to select UBOOT_CONFIG somewhere, with the above line,
> you just say "if nand is selected as an UBOOT_CONFIG, do xyz". You still
> need to select it (with I assume, UBOOT_CONFIG += "nand" in a bbappend
> somewhere).

Sorry for not being it clear, I indeed defined UBOOT_CONFIG = "nand"
in the local.conf. Should I define it as UBOOT_CONFIG += "nand" or
should I move it to a u-boot bbappend?

> What's in your mx6ull_14x14_evk_nand_config?

The mx6ull_14x14_evk_nand_config,ubifs was from a tip found and copied
from Internet, but the original definition is from included
meta-freescale/conf/machine/imx6ullevk.conf:

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "mx6ull_14x14_evk_config,sdcard"
UBOOT_CONFIG[mfgtool] = "mx6ull_14x14_evk_config"

I tried to use UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_config,ubifs", no avail.

> I haven't used that option before but what's ,ubifs supposed to do? Are
> you sure this nand option for UBOOT_CONFIG would actually create a .imx
> and not a .ubifs for example or something along those lines.
>
> TL;DR: Make sure UBOOT_CONFIG has nand in it, check that .imx is built
> with your defconfig and check that you're actually enabling the UBI
> command in your defconfig.

Yes, all enabled in my kernel 4.19.75:

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
# CONFIG_MTD_UBI_GLUEBI is not set
CONFIG_MTD_UBI_BLOCK=y
CONFIG_DTC=y
CONFIG_OF=y

> Also, it would be helpful if you could give links to the recipes you're
> using. I seem to recall in some other mail it was
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-bsp/u-boot/u-boot-imx_2017.03.bb?h=sumo
> but it could be thud version as well.

Yes, I am using the thud, the u-boot-imx_2017.03.bb is the same, here
is the link:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-bsp/u-boot/u-boot-imx_2017.03.bb?h=thud

Thank you very much.

Kind regards,

- jh

On 2/3/20, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I added my local machine to ubifs, is it correct?
>
> UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"
>
> I built the u-boot.imx, but the ubi was still missing in u-boot. What
> I could be missing?
>
> => run nand-boot;
> Unknown command 'ubi' - try 'help'
> Unknown command 'ubi' - try 'help'
>
> Thank you.
>
> Kind regards,
>
> - jh
>

