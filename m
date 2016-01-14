Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69A5A65CC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 15:25:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2016 07:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893171337"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 07:25:11 -0800
Date: Thu, 14 Jan 2016 17:27:33 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160114152732.GA5872@mbabyjoh-mobl.fi.intel.com>
References: <1451920857-2487-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1451920857-2487-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] matchbox-keyboard: export GTK_IM_MODULE_FILE location
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
X-List-Received-Date: Thu, 14 Jan 2016 15:25:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

gentle ping on this one.

On Mon, Jan 04, 2016 at 05:20:57PM +0200, Maxin B. John wrote:
> This commit in gtk+ moved the cache files below <libdir>
> "
> commit c8849046860a9b17fa943247d85ddadb29262b48
> Author: Matthias Clasen <mclasen@redhat.com>
> Date:   Thu Jul 4 09:27:17 2013 -0400
> 
> Move the module cache files below libdir
> 
> These files contain architecture-dependent paths, and thus placing
> them into sysconfdir causes unnecessary hassle. Now the immodule cache
> file is looked for in libdir/gtk-2.0/2.10.0/immodules.cache.
> Belated backport of a change that was done in the run-up to 3.0.
> "
> 
> Since gtk-immodules-cache.bbclass creates the cache file in
> "/etc/gtk-2.0/gtk.immodules", the environment variable "GTK_IM_MODULE_FILE"
> can be set to point GTK+ at the file.
> 
> [YOCTO #6774]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> index 6cf188b..63d9b8d 100644
> --- a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> +++ b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> @@ -1,6 +1,7 @@
>  #!/bin/sh
>  
>  . /etc/formfactor/config
> +export GTK_IM_MODULE_FILE="/etc/gtk-2.0/gtk.immodules"
>  
>  CMD=""
>  
> -- 
> 2.4.0
> 

