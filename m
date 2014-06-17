Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D9C0F6FC0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:04:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2014 06:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,494,1400050800"; d="scan'208";a="558882302"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 17 Jun 2014 07:03:49 -0700
Date: Tue, 17 Jun 2014 17:03:48 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Dennis Meier <meier.dennis@siemens.com>
Message-ID: <20140617140348.GD26745@lpalcu-linux>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Tue, 17 Jun 2014 14:04:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 17, 2014 at 03:16:53PM +0200, Dennis Meier wrote:
> Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 35d837d..1182425 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -173,9 +173,8 @@ if [ $verbose = 1 ] ; then
>  	set -x
>  fi
>  
> -printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
>  if [ "$target_sdk_dir" = "" ]; then
> -	read target_sdk_dir
> +	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
>  	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
>  else
>  	echo "$target_sdk_dir"
Moving the above printf in the 'if' branch will make this 'echo' look
strange when the target directory is provided with the -d option... I
believe you can remove this 'echo' completely though. There is another
message, later, informing the user where the SDK gets installed.

laurentiu

> -- 
> 1.7.10.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

