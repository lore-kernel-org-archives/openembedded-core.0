Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2918B75F3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:09:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUR00GUYWMJB680@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 16 Sep 2015 09:08:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=kj9zAlcOel0A:10 a=ff-B7xzCdYMA:10
	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8	a=AVGh8H5I1iu6DgjCIxIA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5144E161C3D; Wed,
	16 Sep 2015 10:08:43 -0400 (EDT)
Date: Wed, 16 Sep 2015 10:08:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20150916140843.GN8323@denix.org>
References: <1441836319-20706-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1441836319-20706-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] cryptodev-tests: don't use STAGING_KERNEL_DIR, fix re-packaging in multi-machine builds
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
X-List-Received-Date: Wed, 16 Sep 2015 14:09:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping. Any comments?

On Wed, Sep 09, 2015 at 06:05:19PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
> index efc41ae..be59a4a 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
> @@ -9,7 +9,7 @@ file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
>  file://0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch \
>  "
>  
> -EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
>  
>  do_compile() {
>  	oe_runmake testprogs
> -- 
> 2.2.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

