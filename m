Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7qgG-0007sn-HW for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:04:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EFtJpB010007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:55:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09516-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:55:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EFt91v010001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:55:10 GMT
Message-ID: <1331740508.18586.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 15:55:08 +0000
In-Reply-To: <589114a82e66c3378344d0fb0f61a19880b6f7aa.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
	<589114a82e66c3378344d0fb0f61a19880b6f7aa.1331713107.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/8] alsa-tools: update to 1.0.25
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
X-List-Received-Date: Wed, 14 Mar 2012 16:04:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 17:03 +0800, Kang Kai wrote:
> Update to version 1.0.25
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../autotools.patch                                |    0
>  ...alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} |    6 +++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 => alsa-tools-1.0.25}/autotools.patch (100%)
>  rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} (83%)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
> similarity index 100%
> rename from meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
> rename to meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
> similarity index 83%
> rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
> rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
> index ed2886d..1738081 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
> @@ -7,7 +7,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2 & LGPLv2+"
>  DEPENDS = "alsa-lib ncurses"
>  
> -PR = "r3"
> +PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
> @@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
>  SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
>             file://autotools.patch"
>  
> -SRC_URI[md5sum] = "08fe93a12006093e590d7ecc02b119dd"
> -SRC_URI[sha256sum] = "17d43de93ab2db98886d89a53e45341daa46a4ef6edd405db87f4b5a5dc64a05"
> +SRC_URI[md5sum] = "06fe5819020c6684b991dcffc5471304"
> +SRC_URI[sha256sum] = "5a1a805cf04106316d549ec650116ce6711a162e107ba8b3c551866680e286e6"
>  
>  inherit autotools
>  

I've reverted this. The checksums are wrong and even with that fixed, it
doesn't build. What testing are you doing?

Cheers,

Richard



