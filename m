Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QodGT-0008If-UJ for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:21:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FHNt1026264
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:17:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25157-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 16:17:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FHHQi026258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:17:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312384532-11310-1-git-send-email-galak@kernel.crashing.org>
References: <1312384532-11310-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 03 Aug 2011 16:17:00 +0100
Message-ID: <1312384620.2344.681.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libnss-mdns: dont use hard coded /lib path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2011 15:21:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 10:15 -0500, Kumar Gala wrote:
> As libdir might not be /lib (could be /lib64) use ${libdir} instead of
> hard coded "/lib" in configure options set in EXTRA_OECONF.

Do you mean ${libdir} or ${base_libdir} ?

> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  .../libnss-mdns/libnss-mdns_0.10.bb                |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index f5df005..00f2c56 100644
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
>  DEPENDS = "avahi"
>  RDEPENDS_${PN} = "avahi-daemon"
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
>  
> @@ -21,7 +21,7 @@ inherit autotools
>  LEAD_SONAME = "libnss_mdns.so"
>  DEBIANNAME_${PN} = "libnss-mdns"
>  
> -EXTRA_OECONF = "--libdir=/lib --disable-lynx --enable-avahi"
> +EXTRA_OECONF = "--libdir=${libdir} --disable-lynx --enable-avahi"
>  
>  # TODO: pattern based configuration update
>  pkg_postinst_${PN} () {




