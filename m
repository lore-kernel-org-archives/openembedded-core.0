Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 61B1C6D377
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 13:21:07 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Oct 2013 06:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="312153472"
Received: from unknown (HELO [10.255.14.253]) ([10.255.14.253])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2013 06:21:08 -0700
Message-ID: <1382620868.3152.18.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 08:21:08 -0500
In-Reply-To: <afa3e31d527432bf9ff8473d51528d9e204465ed.1382620128.git.tom.zanussi@linux.intel.com>
References: <cover.1382620128.git.tom.zanussi@linux.intel.com>
	<afa3e31d527432bf9ff8473d51528d9e204465ed.1382620128.git.tom.zanussi@linux.intel.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] wic: Remove selinux_check()
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
X-List-Received-Date: Thu, 24 Oct 2013 13:21:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-24 at 08:11 -0500, Tom Zanussi wrote:
> This seems to be an obsolete checkt - we don't have any problems with
> image creation under selinux, so remove this check.
> 

Just noticed the typo, fixed in the branch.

Tom

> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  scripts/lib/mic/conf.py | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/scripts/lib/mic/conf.py b/scripts/lib/mic/conf.py
> index 58fad51..b850d80 100644
> --- a/scripts/lib/mic/conf.py
> +++ b/scripts/lib/mic/conf.py
> @@ -186,10 +186,6 @@ class ConfigMgr(object):
>                                                self.create['name_prefix'],
>                                                self.create['name_suffix'])
>  
> -        # check selinux, it will block arm and btrfs image creation
> -        misc.selinux_check(self.create['arch'],
> -                           [p.fstype for p in ks.handler.partition.partitions])
> -
>      def set_runtime(self, runtime):
>          if runtime not in ("bootstrap", "native"):
>              msger.error("Invalid runtime mode: %s" % runtime)



