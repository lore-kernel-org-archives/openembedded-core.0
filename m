Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF4E61086
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 43BF040BDF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:04:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id oumpZLhfunos
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:04:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31ABE40B37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:04:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C39E17443E; Fri,  6 Mar 2020 17:04:37 -0500 (EST)
Date: Fri, 6 Mar 2020 17:04:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20200306220437.GF1578@denix.org>
References: <1583279109-41106-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1583279109-41106-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] openssl: recommend cryptodev-module for corresponding PACKAGECONFIG
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
X-List-Received-Date: Fri, 06 Mar 2020 22:04:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping. Any comments?

On Tue, Mar 03, 2020 at 06:45:09PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> index c2ba005..a9965e7 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> @@ -34,7 +34,7 @@ PACKAGECONFIG ?= ""
>  PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>  
> -PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux"
> +PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
>  
>  B = "${WORKDIR}/build"
>  do_configure[cleandirs] = "${B}"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

