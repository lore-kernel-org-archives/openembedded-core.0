Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BFDC87807E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 18:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2956020B54;
	Thu, 18 May 2017 18:19:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sDtpsBHrWN_E; Thu, 18 May 2017 18:19:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04C4E20756;
	Thu, 18 May 2017 18:19:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B8641624C7; Thu, 18 May 2017 14:19:57 -0400 (EDT)
Date: Thu, 18 May 2017 14:19:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170518181957.GU28053@denix.org>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Thu, 18 May 2017 18:19:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2017 at 07:34:23PM +0200, Enrico Scholz wrote:
> build fails else with
> 
> | + make -j 8 -l 6 cc=ccache gcc
> | make: *** No rule to make target 'gcc'.  Stop.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/recipes-extended/tzcode/tzcode-native_2017b.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> index 2084f79..165d2c6 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> @@ -18,7 +18,7 @@ S = "${WORKDIR}"
>  
>  inherit native
>  
> -EXTRA_OEMAKE += "cc=${CC}"
> +EXTRA_OEMAKE += "cc='${CC}'"

Should these be double-quotes around ${CC}?


>  do_install () {
>          install -d ${D}${bindir}/
> -- 
> 2.9.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

