Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8BF71A9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 17:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48BE420B3A;
	Tue, 17 Jan 2017 17:26:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ee0MdriLCG5R; Tue, 17 Jan 2017 17:26:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2FE7C208D7;
	Tue, 17 Jan 2017 17:26:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AEC96162320; Tue, 17 Jan 2017 12:26:54 -0500 (EST)
Date: Tue, 17 Jan 2017 12:26:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170117172654.GO15833@denix.org>
References: <1484094088-5338-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1484094088-5338-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [morty][PATCH v2] attr/ea-acl: pass --disable-gettext when USE_NLS=no
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
X-List-Received-Date: Tue, 17 Jan 2017 17:26:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping

On Tue, Jan 10, 2017 at 07:21:28PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Fixes following error in configure:
>   FATAL ERROR: msgfmt does not seem to be installed.
>   attr cannot be built without a working gettext installation.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> (From OE-Core rev: d044fad8a0ac5d57deb88b25106f3a39cb7c1636)
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - morty still requires expand option to d.getVar()
> 
>  meta/recipes-support/attr/ea-acl.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
> index 370e16f..4d6ad20 100644
> --- a/meta/recipes-support/attr/ea-acl.inc
> +++ b/meta/recipes-support/attr/ea-acl.inc
> @@ -10,6 +10,7 @@ inherit autotools-brokensep gettext
>  EXTRA_AUTORECONF += "--exclude=autoheader"
>  EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
>  EXTRA_OECONF_append_class-native = " --enable-gettext=no"
> +EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
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

