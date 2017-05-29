Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CAF5C77756
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 07:50:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 29 May 2017 00:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,413,1491289200"; d="scan'208";a="974216683"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 29 May 2017 00:49:58 -0700
Date: Mon, 29 May 2017 10:49:35 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Message-ID: <20170529074935.GA36860@mbabyjoh-desk.ger.corp.intel.com>
References: <1495782421-159586-1-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1495782421-159586-1-git-send-email-rebecca.swee.fun.chang@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro] [PATCH] cryptodev-linux: update SRC_URI
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
X-List-Received-Date: Mon, 29 May 2017 07:50:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rebecca,

On Fri, May 26, 2017 at 03:07:01PM +0800, Chang Rebecca Swee Fun wrote:
> Gna! project announced that the download site from gna.org HTTP server
> will soon be closing down. We have verified that the site is no longer
> accessible without network proxy cache. We need to update SRC_URI to
> point to new alternative (nwl.cc HTTP server) in order to avoid fetcher
> issues in future.
> 
> [YOCTO #11575]
> 
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index 24b3227..4ae0a2b 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://cryptodev-linux.org/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
> +SRC_URI = "http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \

Any particular reason for choosing nwl.cc over github ?
(https://github.com/cryptodev-linux/cryptodev-linux).


>             file://06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch \
>             file://cb186f682679383e8b5806240927903730ce85d9.patch \
>             file://0001-Adjust-to-another-change-in-the-user-page-API.patch \
> -- 
> 2.7.4

Best Regards,
Maxin

