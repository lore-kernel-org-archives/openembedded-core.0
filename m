Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1350772A85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 18:46:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3SIk0fO005630
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Apr 2015 11:46:00 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 11:45:59 -0700
Message-ID: <553FD567.8010004@windriver.com>
Date: Tue, 28 Apr 2015 14:45:59 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>, <openembedded-core@lists.openembedded.org>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
In-Reply-To: <1430239116-7671-1-git-send-email-marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/8] Add basic fitImage support
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
X-List-Received-Date: Tue, 28 Apr 2015 18:46:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-28 12:38 PM, Marek Vasut wrote:
> This series cleans up the code in kernel.bbclass and
> separates out the uImage generation. The 7th patch
> in this series then adds support for generation of the
> advanced successor of the uImage, the fitImage.
>
> This series adds only very rudimentary support for
> generation of fitImage. The advanced features might
> be added in subsequent patches.

I read the series, and nothing fundamentally wrong jumps out.
Just one comment and one question from me.

Cheers,

Bruce

>
> I would also like to thank Richard for explaining to
> me how to properly do the implementation and I hope
> this series is at least close to that.
>
> Marek Vasut (8):
>    kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
>    kernel: Rework do_uboot_mkimage
>    kernel: Pull out the linux.bin generation
>    kernel: Pull uImage generation into separate class
>    kernel: Separate out uboot_prep_kimage
>    kernel: Build DTBs early
>    kernel: Add basic fitImage support
>    kernel: Build uImage only when really needed
>
>   meta/classes/kernel-fitimage.bbclass    | 234 ++++++++++++++++++++++++++++++++
>   meta/classes/kernel-uboot.bbclass       |  21 +++
>   meta/classes/kernel-uimage.bbclass      |  36 +++++
>   meta/classes/kernel.bbclass             |  46 ++-----
>   meta/recipes-kernel/linux/linux-dtb.inc |  14 +-
>   5 files changed, 318 insertions(+), 33 deletions(-)
>   create mode 100644 meta/classes/kernel-fitimage.bbclass
>   create mode 100644 meta/classes/kernel-uboot.bbclass
>   create mode 100644 meta/classes/kernel-uimage.bbclass
>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>


