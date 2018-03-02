Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4408F789A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 22:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C0C720B67;
	Fri,  2 Mar 2018 22:06:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hlFpBSFpg9q2; Fri,  2 Mar 2018 22:06:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 46A9220862;
	Fri,  2 Mar 2018 22:06:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C12ED1632EF; Fri,  2 Mar 2018 17:06:37 -0500 (EST)
Date: Fri, 2 Mar 2018 17:06:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Justin Bronder <jsbronder@cold-front.org>
Message-ID: <20180302220637.GT2786@denix.org>
References: <20180302215817.20179-1-jsbronder@cold-front.org>
MIME-Version: 1.0
In-Reply-To: <20180302215817.20179-1-jsbronder@cold-front.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ccache: update to 3.4.1
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
X-List-Received-Date: Fri, 02 Mar 2018 22:06:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 02, 2018 at 04:58:17PM -0500, Justin Bronder wrote:
> https://ccache.samba.org/releasenotes.html#_ccache_3_4_1
> 
> License-Update: copyright years and file paths updated
> 
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta/recipes-devtools/ccache/ccache_3.3.4.bb | 12 ------------
>  meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++

Please use -C/-M (--find-copies/--find-renames) flags to simplify review.


>  2 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.4.bb
>  create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.1.bb
> 
> diff --git a/meta/recipes-devtools/ccache/ccache_3.3.4.bb b/meta/recipes-devtools/ccache/ccache_3.3.4.bb
> deleted file mode 100644
> index 1e535b1923..0000000000
> --- a/meta/recipes-devtools/ccache/ccache_3.3.4.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require ccache.inc
> -
> -LICENSE = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7fe21f9470f2305e95e7d8a632255079"
> -
> -SRC_URI[md5sum] = "95ab3c56284129cc2a32460c23069516"
> -SRC_URI[sha256sum] = "24f15bf389e38c41548c9c259532187774ec0cb9686c3497bbb75504c8dc404f"
> -
> -SRC_URI += " \
> -            file://0002-dev.mk.in-fix-file-name-too-long.patch \
> -            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
> -"
> diff --git a/meta/recipes-devtools/ccache/ccache_3.4.1.bb b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> new file mode 100644
> index 0000000000..e3bf74e9c6
> --- /dev/null
> +++ b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> @@ -0,0 +1,12 @@
> +require ccache.inc
> +
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fa0d99234a05c3a32d380379d5d064a"
> +
> +SRC_URI[md5sum] = "39492aea565c3e6d5affa633672a93bd"
> +SRC_URI[sha256sum] = "8c2e260d4245e362552e47bec359941210a96419ac5adf582046ceb92489f7de"
> +
> +SRC_URI += " \
> +            file://0002-dev.mk.in-fix-file-name-too-long.patch \
> +            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
> +"
> -- 
> 2.13.6
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

