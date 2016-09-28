Return-Path: <saul.wold@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A09CF60234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 23:39:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 28 Sep 2016 16:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,412,1470726000"; d="scan'208";a="14303197"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.200.53])
	by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2016 16:39:25 -0700
Message-ID: <1475105965.18115.71.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: California Sullivan <california.l.sullivan@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 16:39:25 -0700
In-Reply-To: <1475105254-15660-1-git-send-email-california.l.sullivan@intel.com>
References: <1475105254-15660-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] genericx86-64.conf: Add SERIAL_CONSOLES_CHECK = "ttyS0"
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
X-List-Received-Date: Wed, 28 Sep 2016 23:39:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-09-28 at 16:27 -0700, California Sullivan wrote:
> Trying to start getty on a non-existent console will spew I/O errors
> into auth.log on some hardware. Avoid this behavior by checking that
> ttyS0 is a console that exists.
> 
> Fixes [YOCTO #10291].
> 
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  meta-yocto-bsp/conf/machine/genericx86-64.conf | 2 ++
As this is meta-yocto-bps, this should really go to poky@yoctoproject.o
rg, otherwise this looks good.

<Reviewed-by: Saul Wold <sgw@linux.intel.com>


>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-
> yocto-bsp/conf/machine/genericx86-64.conf
> index ceee247..d843fd2 100644
> --- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
> +++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
> @@ -8,3 +8,5 @@ require conf/machine/include/tune-core2.inc
>  require conf/machine/include/genericx86-common.inc
>  
>  PREFERRED_VERSION_linux-yocto_genericx86-64 ?= "4.8%"
> +
> +SERIAL_CONSOLES_CHECK = "ttyS0"
> -- 
> 2.5.5
> 

