Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A649260670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 21:44:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 26 Feb 2015 13:36:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,655,1418112000"; d="scan'208";a="657790076"
Received: from localhost.jf.intel.com (HELO [10.7.201.37]) ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2015 13:44:18 -0800
Message-ID: <54EF93B1.2020902@linux.intel.com>
Date: Thu, 26 Feb 2015 13:44:17 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Bruno Bottazzini <bruno.bottazzini@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1424978954-25411-1-git-send-email-bruno.bottazzini@intel.com>
In-Reply-To: <1424978954-25411-1-git-send-email-bruno.bottazzini@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH] mkefidisk: change filesystem to be writeable on grub
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
X-List-Received-Date: Thu, 26 Feb 2015 21:44:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2015 11:29 AM, Bruno Bottazzini wrote:
> This patch changes grub configuration so the filesystem will be writeable
> instead, just read only when running the script.
> ---
>   scripts/contrib/mkefidisk.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index b96b7d4..9b84831 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -342,7 +342,7 @@ if [ -e "$GRUB_CFG" ]; then
>   	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
>
>   	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
> -	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUB_CFG
> +	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS rw rootwait quiet @" $GRUB_CFG
>   fi
>
>   # Look for a gummiboot installation
>

This change basically reverts 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=24cd3ddeb70a3d3f2985ec71c87ae0108f3d2777 
by Darren. It also doesn't change the ro option when using gummiboot instead.

What is this change trying to fix?

