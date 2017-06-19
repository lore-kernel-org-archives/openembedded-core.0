Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8AD77D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19D7720873;
	Mon, 19 Jun 2017 12:56:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Jzz6F1ZA4eev; Mon, 19 Jun 2017 12:56:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2C5220065;
	Mon, 19 Jun 2017 12:56:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E0B11624F9; Mon, 19 Jun 2017 08:56:10 -0400 (EDT)
Date: Mon, 19 Jun 2017 08:56:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20170619125610.GL28053@denix.org>
References: <1497861136-27345-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1497861136-27345-1-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/3] kernel-fitimage: Support ext2.gz filesystems
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
X-List-Received-Date: Mon, 19 Jun 2017 12:56:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

What has changed in v3 compared to v2 and v1?


On Mon, Jun 19, 2017 at 04:32:14PM +0800, Chunrong Guo wrote:
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2630b47..f40fbf3 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -369,7 +369,7 @@ fitimage_assemble() {
>  	#
>  	if [ "x${ramdiskcount}" = "x1" ] ; then
>  		# Find and use the first initramfs image archive type we find
> -		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
> +		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
>  			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
>  			echo "Using $initramfs_path"
>  			if [ -e "${initramfs_path}" ]; then
> -- 
> 1.9.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

