Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E76E6EEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:58:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="456746583"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2014 00:58:17 -0800
Date: Mon, 17 Feb 2014 10:58:16 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140217085816.GO10078@lpalcu-linux>
References: <cover.1392625337.git.sgw@linux.intel.com>
	<cf0e00e6b461971018da7eb5d0369eac048ad15d.1392625337.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cf0e00e6b461971018da7eb5d0369eac048ad15d.1392625337.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] lsbinitscripts: Update to 9.52
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
X-List-Received-Date: Mon, 17 Feb 2014 08:58:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saul,

On Mon, Feb 17, 2014 at 12:22:58AM -0800, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/lsb/lsbinitscripts_9.52.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
> index 11deae2..bc3e620 100644
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
> @@ -6,7 +6,7 @@ DEPENDS = "popt glib-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
>  
>  S="${WORKDIR}/initscripts-${PV}"
> -SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/2453811ec27a781a77f309f356663d9e/initscripts-${PV}.tar.bz2 \
> +SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.52.tar.bz2/2453811ec27a781a77f309f356663d9e/initscripts-9.52.tar.bz2 \
This doesn't look like an upgrade... Besides, I believe you already
upgraded this recipe to 9.52:

Author: Saul Wold <sgw@linux.intel.com>
Date:   Mon Jan 20 18:54:30 2014 -0800

    lsbinitscripts: Update to 9.52

Am I missing something?

laurentiu


>             file://functions.patch \
>            " 
>  
> -- 
> 1.8.3.1
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

