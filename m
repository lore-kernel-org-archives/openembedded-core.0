Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CB91B6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 15:05:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 08:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,397,1503385200"; d="scan'208";a="1026508196"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with SMTP; 18 Oct 2017 08:05:27 -0700
Date: Wed, 18 Oct 2017 10:15:17 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Chunrong Guo <B40290@freescale.com>
Message-Id: <20171018101517.4d842276a99dd48cf52c6f21@linux.intel.com>
In-Reply-To: <1508313186-12851-1-git-send-email-B40290@freescale.com>
References: <1508313186-12851-1-git-send-email-B40290@freescale.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: support ARM64 On arm64, the kernel image target is Image
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
X-List-Received-Date: Wed, 18 Oct 2017 15:05:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Oct 2017 15:53:06 +0800
Chunrong Guo <B40290@freescale.com> wrote:

This patch looks similar to 
http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143469.html

but the latter touch other areas.



> From: Chunrong Guo <chunrong.guo@nxp.com>
> 
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 179185b..53d9f4a 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -9,6 +9,8 @@ python __anonymous () {
>  
>          if d.getVar("UBOOT_ARCH") == "mips":
>              replacementtype = "vmlinuz.bin"
> +        elif d.getVar("UBOOT_ARCH") == "arm64":
> +            replacementtype = "Image"
>          elif d.getVar("UBOOT_ARCH") == "x86":
>              replacementtype = "bzImage"
>          else:
> -- 
> 1.9.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

