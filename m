Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6jA9-0004n7-CY for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:45:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34ChgHL016042
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:43:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15963-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:43:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34ChYNg016036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:43:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d7dccee03bbc7f01922e09e0dddf23d11f8623bb.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<d7dccee03bbc7f01922e09e0dddf23d11f8623bb.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:43:31 +0100
Message-ID: <1301921011.24596.355.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 45/46] libexif_0.6.16.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Mon, 04 Apr 2011 12:45:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:30 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/libexif/libexif_0.6.16.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/libexif/libexif_0.6.16.bb b/meta/recipes-support/libexif/libexif_0.6.16.bb
> index 8fb15d9..d9d1c5e 100644
> --- a/meta/recipes-support/libexif/libexif_0.6.16.bb
> +++ b/meta/recipes-support/libexif/libexif_0.6.16.bb
> @@ -3,14 +3,13 @@ HOMEPAGE = "http://sourceforge.net/projects/libexif"
>  SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
> -DEPENDS = "gettext"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2"
>  
>  SRC_URI[md5sum] = "deee153b1ded5a944ea05d041d959eca"
>  SRC_URI[sha256sum] = "db6885d5e40e3a273ff8bb9708ab739c8ace3c5abdd75509eec8ea31a31aac43"
>  
> -inherit autotools
> +inherit autotools gettext
>  
>  do_configure_append() {
>  	sed -i s:doc\ binary:binary:g Makefile

Patches 30-45 merged to master, thanks.

Richard




