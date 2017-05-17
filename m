Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 04B3E77E6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 19:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4154C20B49;
	Wed, 17 May 2017 19:15:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7lQPsITWOZ6d; Wed, 17 May 2017 19:15:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 17A31204E0;
	Wed, 17 May 2017 19:15:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9248A1624C6; Wed, 17 May 2017 15:15:24 -0400 (EDT)
Date: Wed, 17 May 2017 15:15:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20170517191524.GP28053@denix.org>
References: <1494994244-10488-1-git-send-email-B40290@freescale.com>
	<1494994244-10488-2-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1494994244-10488-2-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH v2 2/3] kernel-fitimage: set replacementtype to vmlinux
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
X-List-Received-Date: Wed, 17 May 2017 19:15:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2017 at 12:10:43PM +0800, Chunrong Guo wrote:
> From: Chunrong Guo <chunrong.guo@nxp.com>
> 
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index f40fbf3..9fa836f 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -10,7 +10,7 @@ python __anonymous () {
>          if d.getVar("UBOOT_ARCH") == "x86":
>              replacementtype = "bzImage"
>          else:
> -            replacementtype = "zImage"
> +            replacementtype = "vmlinux"

Why?


>  	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
>  	# to kernel.bbclass . We have to override it, since we pack zImage
> -- 
> 1.9.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

