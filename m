Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8741676536
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7UKbh0I024166; Sun, 30 Aug 2015 21:37:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qus_UGxneD35; Sun, 30 Aug 2015 21:37:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7UKbVOn024157
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 30 Aug 2015 21:37:42 +0100
Message-ID: <1440967051.32588.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Sun, 30 Aug 2015 21:37:31 +0100
In-Reply-To: <a8e3762db99ca7fff60e6e83402a65f5215ec49c.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
	<a8e3762db99ca7fff60e6e83402a65f5215ec49c.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/12] wic-image-minimal: add wic image recipe and .wks
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
X-List-Received-Date: Sun, 30 Aug 2015 20:37:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-08-30 at 20:47 +0300, Ed Bartosh wrote:
> Added example of recipe and .wks file to create partitioned image.
> 
> This image is using quite complex partitioning scheme.
> It uses its own rootfs to populate two partitions in two different ways.
> It also uses core-image-minimal rootfs to populate another partition.
> 
> This is how wic reports about artifacts used to create this image:
>   ROOTFS_DIR: tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/rootfs
>   ROOTFS_DIR["/core"]: tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
>   ROOTFS_DIR["/backup"]: tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/rootfs
>   BOOTIMG_DIR: tmp/sysroots/qemux86-64/usr/share
>   KERNEL_DIR: tmp/deploy/images/qemux86-64
>   NATIVE_SYSROOT: tmp/sysroots/x86_64-linux
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

Since we use this as the selftest, I think this may be better positioned
in meta-selftest?

Otherwise the patchset looks good thanks. I'll merge this up to this
patch.

Cheers,

Richard


