Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPioz-0003NJ-E3 for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 01:18:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q42N9Cg5027054
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 00:09:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25807-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 00:09:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q42N92Fa027048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 00:09:03 +0100
Message-ID: <1336000145.30113.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 00:09:05 +0100
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/7] unfs-server: Do not use DESTDIR
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
X-List-Received-Date: Wed, 02 May 2012 23:18:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-02 at 13:53 -0700, Khem Raj wrote:
> DESTDIR is makefile variable not available in
> bitbake environment
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> index d03c153..682891d 100644
> --- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> +++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} = "pseudo"
>  RDEPENDS_${PN}_virtclass-native = "pseudo-native"
>  RDEPENDS_${PN}_virtclass-nativesdk = "pseudo-nativesdk"
>  BASEPV = "2.2beta47"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/oldstuff/people/okir/nfs-server-${BASEPV}.tar.gz \
>             file://001-2.2b47-2.2b51.patch \
> @@ -53,7 +53,7 @@ EXTRA_OECONF = "--enable-ugid-dynamic \
>                  --with-exports-uid=0 \
>                  --with-exports-gid=0 \
>                  --enable-mount-logging \
> -                --with-devtab=${DESTDIR}${base_prefix}/var/lib/nfs/devtab \
> +                --with-devtab=${base_prefix}/var/lib/nfs/devtab \

This is not correct, you want ${D} there I think. It is rather odd
though and we might be better patching the makefile for this.

Cheers,

Richard



