Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdHAK-000848-0F for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 10:09:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAR8t2Qx001069;
	Tue, 27 Nov 2012 08:55:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32720-03; Tue, 27 Nov 2012 08:54:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAR8sq7i001057
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 27 Nov 2012 08:54:54 GMT
Message-ID: <1354006492.21863.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Tue, 27 Nov 2012 08:54:52 +0000
In-Reply-To: <1353986291-9144-1-git-send-email-cazfi74@gmail.com>
References: <1353986291-9144-1-git-send-email-cazfi74@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: update to upstream version 1.2.50
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 09:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-27 at 05:18 +0200, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>

What changed in the LICENSE? We try and mention this in the commit
message...

Cheers,

Richard


> ---
>  .../libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb}          |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-multimedia/libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb} (52%)
> 
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> similarity index 52%
> rename from meta/recipes-multimedia/libpng/libpng_1.2.49.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> index d33a9f5..211e357 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> @@ -3,15 +3,15 @@ DESCRIPTION = "PNG Library"
>  HOMEPAGE = "http://www.libpng.org/"
>  SECTION = "libs"
>  LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
> -                    file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
> +                    file://png.h;startline=310;endline=424;md5=62968b88b0425ceeb919de3fd21b03e5"
>  DEPENDS = "zlib"
> -PR = "r1"
> +PR = "r0"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
>  
> -SRC_URI[md5sum] = "d5106b70b4f8b464a7da66bffe4565fb"
> -SRC_URI[sha256sum] = "fbf8faa70ebca2ed2ee6df6f2249f4722517b581af5b6c3c71bbdaf925d5954e"
> +SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
> +SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
>  
>  inherit autotools binconfig pkgconfig
>  




