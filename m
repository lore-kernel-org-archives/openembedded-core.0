Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD0B375948
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6FDMmnu010611; Wed, 15 Jul 2015 14:22:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ieIJoh8Zvde2; Wed, 15 Jul 2015 14:22:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6FDMagt010587
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Jul 2015 14:22:47 +0100
Message-ID: <1436966556.3310.96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Wed, 15 Jul 2015 14:22:36 +0100
In-Reply-To: <861013e3a73d1c87c6f86b1f28daf4677feaefe4.1436965937.git.cristian.iorga@intel.com>
References: <cover.1436965937.git.cristian.iorga@intel.com>
	<861013e3a73d1c87c6f86b1f28daf4677feaefe4.1436965937.git.cristian.iorga@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] runqemu-internal: add temporary disk interface to qemuarm64
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
X-List-Received-Date: Wed, 15 Jul 2015 13:22:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-15 at 16:17 +0300, Cristian Iorga wrote:

Why do we need to do this?

(Yes, I know why, but this commit doesn't tell me).

Cheers,

Richard

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  scripts/runqemu-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 6878251..03b40d8 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -270,7 +270,7 @@ else
>          if [ "$MACHINE" = "qemuarm64" ]; then
>              QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
>              DROOT="/dev/vda"
> -            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,format=raw -device virtio-blk-device,drive=disk0"
> +            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
>          fi
>  
>          KERNCMDLINE="mem=$QEMU_MEMORY"
> -- 
> 2.1.4
> 



