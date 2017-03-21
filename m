Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E21CE6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 01:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF3F4208FB;
	Tue, 21 Mar 2017 01:00:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nZtAhOz950ax; Tue, 21 Mar 2017 01:00:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 96F40208DA;
	Tue, 21 Mar 2017 01:00:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 278C2162415; Mon, 20 Mar 2017 21:00:32 -0400 (EDT)
Date: Mon, 20 Mar 2017 21:00:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: liu.ming50@gmail.com
Message-ID: <20170321010032.GF15664@denix.org>
References: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Peter Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Fix some issues of kernel/image recipes
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
X-List-Received-Date: Tue, 21 Mar 2017 01:00:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 21, 2017 at 01:54:58AM +0100, liu.ming50@gmail.com wrote:
> From: Peter Liu <peter.x.liu@external.atlascopco.com>

What version of the patchset is this?


> The changes include:
> kernel.bbclass: fix some incorrect inter-task dependencies
> kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
> kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
> image.bbclass: remove initramfs bundle related code
> kernel-initramfs: add recipe
> 
> Ming Liu (5):
>   kernel.bbclass: fix some incorrect inter-task dependencies
>   kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
>   kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
>   image.bbclass: remove initramfs bundle related code
>   kernel-initramfs: add recipe
> 
>  meta/classes/image.bbclass                    |  13 ----
>  meta/classes/kernel-fitimage.bbclass          |  10 +--
>  meta/classes/kernel.bbclass                   |  73 +++++++++----------
>  meta/recipes-kernel/linux/kernel-initramfs.bb | 100 ++++++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
>  5 files changed, 139 insertions(+), 58 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
> 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

