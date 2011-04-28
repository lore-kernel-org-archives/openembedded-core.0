Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QFNB7-00076C-WA for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:06:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S93phx016110;
	Thu, 28 Apr 2011 10:03:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16094-01; Thu, 28 Apr 2011 10:03:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S93gu1016104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Apr 2011 10:03:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6eb38936408c2f16fdc64b5d792e3391aad73694.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<6eb38936408c2f16fdc64b5d792e3391aad73694.1303889119.git.sgw@linux.intel.com>
Date: Thu, 28 Apr 2011 10:03:11 +0100
Message-ID: <1303981391.21461.41.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>,
	Antonio Ospite <ospite@studenti.unina.it>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 44/52] util-linux.inc: remove virtual/libintl from DEPENDS
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
X-List-Received-Date: Thu, 28 Apr 2011 09:06:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-27 at 00:30 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> inherit gettext should do it.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 913bb1b..447e5b7 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9
>                      file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
>                      file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  
> -DEPENDS = "zlib ncurses virtual/libintl"
> -DEPENDS_virtclass-native = "zlib-native ncurses-native lzo-native gettext-native"
> -
>  inherit autotools gettext
> +DEPENDS = "zlib ncurses"
> +DEPENDS_virtclass-native_append = " lzo-native"
> +
>  
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
>             file://MCONFIG \

I wasn't sure if this depended on the gettext.bbclass changes so again,
I didn't take it.

Cheers,

Richard



