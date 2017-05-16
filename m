Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 35EFC77D80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D4C520B86;
	Tue, 16 May 2017 21:48:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5FoMGOAeTZiC; Tue, 16 May 2017 21:48:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2AA4320756;
	Tue, 16 May 2017 21:48:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AAA461624C2; Tue, 16 May 2017 17:48:55 -0400 (EDT)
Date: Tue, 16 May 2017 17:48:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170516214855.GM28053@denix.org>
References: <1494358314-53536-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1494358314-53536-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] python3-nose: rename ${bindir}/nosetests into ${bindir}/nosetests3
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
X-List-Received-Date: Tue, 16 May 2017 21:48:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping

On Tue, May 09, 2017 at 03:31:54PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This resolves a conflict when both python-nose and python3-nose are pulled
> into an image and try to install ${bindir}/nosetests binary.
> 
> This matches with how other distros are solving this problem, e.g. Debian:
> https://packages.debian.org/jessie/all/python3-nose/filelist
> 
> Also, other packages like python3-setuptools are already doing the same with
> their binaries.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-devtools/python/python3-nose_1.3.7.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> index 99bba44..1e2ff74 100644
> --- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> +++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> @@ -17,6 +17,10 @@ S = "${WORKDIR}/nose-${PV}"
>  
>  inherit setuptools3
>  
> +do_install_append() {
> +    mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3
> +}
> +
>  RDEPENDS_${PN}_class-target = "\
>    python3-unittest \
>    "
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

