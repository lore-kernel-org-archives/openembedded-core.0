Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 348A47ECBE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 21:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0670740BFA;
	Fri, 13 Sep 2019 21:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8PjtpImdmWo7; Fri, 13 Sep 2019 21:19:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B85D840BD4;
	Fri, 13 Sep 2019 21:19:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 75222173BBA; Fri, 13 Sep 2019 17:19:03 -0400 (EDT)
Date: Fri, 13 Sep 2019 17:19:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190913211903.GH30018@denix.org>
References: <20190912225624.28572-1-armccurdy@gmail.com>
	<20190912225624.28572-3-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190912225624.28572-3-armccurdy@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] busybox-inittab: minor formatting tweaks
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
X-List-Received-Date: Fri, 13 Sep 2019 21:19:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2019 at 03:56:24PM -0700, Andre McCurdy wrote:
> Add an empty line to inittab before the line(s) which start getty.
> 
> Also cleanup indent in recipe do_install().
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../busybox/busybox-inittab_1.31.0.bb         | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
> index c347daf501..61fb8cbad1 100644
> --- a/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
> +++ b/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
> @@ -13,15 +13,16 @@ do_compile() {
>  }
>  
>  do_install() {
> -    install -d ${D}${sysconfdir}
> -    install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> -    tmp="${SERIAL_CONSOLES}"
> -    for i in $tmp
> -    do
> -            j=`echo ${i} | sed s/\;/\ /g`
> -            id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
> -            echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> -    done
> +	install -d ${D}${sysconfdir}
> +	install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> +	tmp="${SERIAL_CONSOLES}"
> +	[ -n "$tmp" ] && echo >> ${D}${sysconfdir}/inittab
> +	for i in $tmp
> +	do
> +		j=`echo ${i} | sed s/\;/\ /g`
> +		id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
> +		echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +	done
>  }
>  
>  # SERIAL_CONSOLES is generally defined by the MACHINE .conf.
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

