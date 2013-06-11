Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF6B6A9D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:50:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jun 2013 06:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="348156548"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2013 06:50:36 -0700
Date: Tue, 11 Jun 2013 16:50:07 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20130611135007.GF7181@lpalcu-linux>
References: <1370957859-28122-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1370957859-28122-1-git-send-email-andrei.adrianx.dinu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gzip : upgrade to 1.6
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
X-List-Received-Date: Tue, 11 Jun 2013 13:50:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2013 at 04:37:39PM +0300, Andrei Dinu wrote:
> upgrade from 1.5 -> 1.6
> 
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  .../gzip/{gzip_1.5.bb => gzip_1.6.bb}              |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/gzip/{gzip_1.5.bb => gzip_1.6.bb} (51%)
> 
> diff --git a/meta/recipes-extended/gzip/gzip_1.5.bb b/meta/recipes-extended/gzip/gzip_1.6.bb
> similarity index 51%
> rename from meta/recipes-extended/gzip/gzip_1.5.bb
> rename to meta/recipes-extended/gzip/gzip_1.6.bb
> index f7b8593..bd1f70a 100644
> --- a/meta/recipes-extended/gzip/gzip_1.5.bb
> +++ b/meta/recipes-extended/gzip/gzip_1.6.bb
> @@ -7,5 +7,5 @@ NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
>  
>  BBCLASSEXTEND = "native"
>  
> -SRC_URI[md5sum] = "11b76536941ee1c0221fe6eefbcb32cb"
> -SRC_URI[sha256sum] = "b5d56e8ffc9918e8c941fab56e04121194f9870adeeb859e09c09eac264035a3"
> +SRC_URI[md5sum] = "38603cb2843bf5681ff41aab3bcd6a20"
> +SRC_URI[sha256sum] = "97eb83b763d9e5ad35f351fe5517e6b71521d7aac7acf3e3cacdb6b1496d8f7e"

I believe you can safely remove the PR too.

Thanks,
Laurentiu

> -- 
> 1.7.9.5
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

