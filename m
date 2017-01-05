Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DD3ED719B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B20920AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:17:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Wh2n7hCzbBed
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:17:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDCBF20862
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:17:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A774B16231A; Thu,  5 Jan 2017 14:17:14 -0500 (EST)
Date: Thu, 5 Jan 2017 14:17:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170105191714.GO30576@denix.org>
References: <1482521671-10899-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1482521671-10899-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] attr/ea-acl: pass --disable-gettext when USE_NLS=no
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
X-List-Received-Date: Thu, 05 Jan 2017 19:17:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

On Fri, Dec 23, 2016 at 02:34:31PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Fixes following error in configure:
>   FATAL ERROR: msgfmt does not seem to be installed.
>   attr cannot be built without a working gettext installation.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-support/attr/ea-acl.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
> index 8750c3b..e77cf3e 100644
> --- a/meta/recipes-support/attr/ea-acl.inc
> +++ b/meta/recipes-support/attr/ea-acl.inc
> @@ -10,6 +10,7 @@ inherit autotools-brokensep gettext
>  EXTRA_AUTORECONF += "--exclude=autoheader"
>  EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
>  EXTRA_OECONF_append_class-native = " --enable-gettext=no"
> +EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS') == 'no')]}"
>  
>  EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

