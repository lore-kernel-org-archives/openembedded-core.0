Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 92946700F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 14:32:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 27 Dec 2016 06:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,416,1477983600"; d="scan'208";a="23249878"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 27 Dec 2016 06:32:08 -0800
Date: Tue, 27 Dec 2016 16:33:29 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Message-ID: <20161227143328.GA17129@mbabyjoh-desk.ger.corp.intel.com>
References: <1482382494-2614-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1482382494-2614-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Tue, 27 Dec 2016 14:32:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 22, 2016 at 12:54:54PM +0800, Huang Qiyu wrote:
> Upgrade ncurses from 6.0+20160625 to 6.0+20161126.

This causes build failures for beaglebone and qemumips64 targets:

http://errors.yoctoproject.org/Errors/Details/115740/
http://errors.yoctoproject.org/Errors/Details/115738/

Please look into that.

> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (84%)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> similarity index 84%
> rename from meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
> rename to meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> index 6514613..7328e78 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> @@ -4,7 +4,7 @@ SRC_URI += "file://tic-hang.patch \
>              file://config.cache \
>  "
>  # commit id corresponds to the revision in package version
> -SRCREV = "63dd558cb8e888d6fab5f00bbf7842736a2356b9"
> +SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
>  S = "${WORKDIR}/git"
>  EXTRA_OECONF += "--with-abi-version=5"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
> --
Best Regards,
Maxin

