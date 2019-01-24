Return-Path: <prvs=920c251a5=Richard.Leitner@skidata.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Jan 2019 07:16:12 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D2BCB7C11B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:16:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,515,1539640800"; d="scan'208";a="14688600"
To: <openembedded-core@lists.openembedded.org>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
Date: Thu, 24 Jan 2019 08:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: How to include fitImage-initramfs in rootfs image
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
X-List-Received-Date: Thu, 24 Jan 2019 07:16:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
I'm currently facing issues on how to include a fitImage with 
devicetrees and a INITRAMFS_IMAGE in my rootfs image.

My config is something like:

KERNEL_IMAGETYPE = "fitImage"
KERNEL_CLASSES  = "kernel-fitimage"
KERNEL_DEVICETREE = "a.dtb b.dtb c.dtb"
INITRAMFS_IMAGE = "initramfs-mine"

To include the "normal" fitImage without the initramfs in the rootfs the 
following works:

IMAGE_INSTALL_append += " kernel-image"


When digging around a little bit I found that the 
fitImage-initramfs-mine is deployed to tmp/deploy/images but there's no 
package including that file.

Therefore I'm unable to include it via IMAGE_INSTALL.

Am I missing something?
Is anybody of you aware of a solution?
Does kernel-fitimage and kernel.bbclass offer this at all?

Any help would be greatly appreciated! Thanks!

regards;Richard.L

