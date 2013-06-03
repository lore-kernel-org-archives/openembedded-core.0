Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 033E26A5C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:22:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 03 Jun 2013 05:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,792,1363158000"; d="scan'208";a="343996936"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2013 05:22:39 -0700
Message-ID: <1370262140.14580.21.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Ning Zhang <ning.zhang@windriver.com>
Date: Mon, 03 Jun 2013 07:22:20 -0500
In-Reply-To: <fc2f4a65e654e548bfba36505ed37285270667f5.1370228342.git.ning.zhang@windriver.com>
References: <cover.1370228342.git.ning.zhang@windriver.com>
	<fc2f4a65e654e548bfba36505ed37285270667f5.1370228342.git.ning.zhang@windriver.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] yocto_kernel: modify the msg when adding duplicate items
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
X-List-Received-Date: Mon, 03 Jun 2013 12:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-03 at 13:21 +0800, Ning Zhang wrote:
> Privious check-in "yocto_kernel: check current items before add a
> new one" had been merged before I apply the feedback from Zanussi, Tom.
> Now fix it as a new patch.
> 
> This fix modify the output message when customer adding duplicate
> items.
> 
> [YOCTO #4558]
> 
> Signed-off-by: Ning Zhang <ning.zhang@windriver.com>

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>


> ---
>  scripts/lib/bsp/kernel.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
> index 9ed6e94..94ae950 100644
> --- a/scripts/lib/bsp/kernel.py
> +++ b/scripts/lib/bsp/kernel.py
> @@ -260,7 +260,7 @@ def yocto_kernel_config_add(scripts_path, machine, config_items):
>              print "\t%s" % n
>  
>      if len(dup_items) > 0:
> -        output="Below item%s already exist%s in current configuration, ignore %s" % \
> +        output="The following item%s already exist%s in the current configuration, ignoring %s:" % \
>              (("","s", "it") if len(dup_items)==1 else ("s", "", "them" ))
>          print output
>          for n in dup_items:



