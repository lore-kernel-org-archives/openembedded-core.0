Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SCEja-0004C1-D7
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:33:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2012 11:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125293350"
Received: from unknown (HELO envy.home) ([10.7.199.147])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 11:24:36 -0700
Message-ID: <4F70B439.3000400@linux.intel.com>
Date: Mon, 26 Mar 2012 11:23:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332744104.git.sgw@linux.intel.com>
	<321a1ce94fe3a79b6dfbd3c681c16b9452927167.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <321a1ce94fe3a79b6dfbd3c681c16b9452927167.1332744104.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [Build App RFC 2/5] image-vmdk: Add symbolic link
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 18:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The idea being what? To keep a short-name symlink to the longer named
actual image?

Please include a commit message.

On 03/25/2012 11:47 PM, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image-vmdk.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
> index 3e63006..9d596cd 100644
> --- a/meta/classes/image-vmdk.bbclass
> +++ b/meta/classes/image-vmdk.bbclass
> @@ -10,6 +10,8 @@ inherit image-live
>  
>  create_vmdk_image () {
>  	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
> +	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
> +
>  }
>  
>  python do_vmdkimg() {

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


