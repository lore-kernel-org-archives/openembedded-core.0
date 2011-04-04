Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6ixT-0004Xa-Jw for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:32:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CUawZ015916
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:30:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15532-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:30:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CUT5k015910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:30:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9a399396c523241be767b1928330db35da0604d2.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<9a399396c523241be767b1928330db35da0604d2.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:30:26 +0100
Message-ID: <1301920226.24596.347.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 23/46] flex.inc: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Mon, 04 Apr 2011 12:32:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/flex/flex.inc |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> index 54c400c..01f7571 100644
> --- a/meta/recipes-devtools/flex/flex.inc
> +++ b/meta/recipes-devtools/flex/flex.inc
> @@ -5,11 +5,10 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
>  
>  SECTION = "devel"
>  LICENSE = "BSD"
> -DEPENDS = "gettext"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
>  
> -inherit autotools
> +inherit autotools gettext
>  
>  do_install_append_virtclass-native() {
>  	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4

Merged 21-23, thanks.

Richard



