Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iUv-0002xN-N2 for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:03:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34C0xru015695
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:00:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15522-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:00:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34C0qu8015689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:00:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <89bd2dfb441de55bbac4e7588ba4ef4ffde35913.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<89bd2dfb441de55bbac4e7588ba4ef4ffde35913.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:00:49 +0100
Message-ID: <1301918449.24596.345.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 28/46] xorg-lib: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Mon, 04 Apr 2011 12:03:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb     |    2 +-
>  meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb   |    2 --
>  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
>  meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb     |    1 -
>  4 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
> index 79078ef..c96b6e9 100644
> --- a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
> @@ -9,7 +9,7 @@ require xorg-lib-common.inc
>  LICENSE = "MIT-style"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
>  
> -DEPENDS += " xproto gettext"
> +DEPENDS += " xproto"
>  PROVIDES = "xau"
>  
>  PR = "r0"
> diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
> index d897dab..8ac8e38 100644
> --- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
> @@ -17,8 +17,6 @@ PROVIDES = "xdmcp"
>  PR = "r0"
>  PE = "1"
>  
> -DEPENDS += "gettext"
> -
>  XORG_PN = "libXdmcp"
>  
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> index 4ed8c86..9b4ce1e 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -11,6 +11,6 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
>  
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig gettext

NAK. Please don't add gettext dependencies to every xorg library because
three of them require it. Please add the inherits to the individual
recipes that need it. This improves parallel build performance as some
things can start compiling before gettext is built.

Cheers,

Richard



