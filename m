Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qbuz6-0003Cs-Dg for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:39:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDZZXi004585
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:35:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04529-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:35:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDZQLl004579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:35:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309188248.21613.325.camel@phil-desktop>
References: <1309188248.21613.325.camel@phil-desktop>
Date: Wed, 29 Jun 2011 14:35:10 +0100
Message-ID: <1309354510.20015.375.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] fontconfig: specify font directory in EXTRA_OECONF
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
X-List-Received-Date: Wed, 29 Jun 2011 13:39:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 16:24 +0100, Phil Blundell wrote:
> since, otherwise, fontconfig's builtin default may not match ${datadir}.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  .../fontconfig/fontconfig_2.8.0.bb                 |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> index ae0fef5..5381065 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> @@ -20,7 +20,7 @@ SECTION = "libs"
>  
>  DEPENDS = "expat freetype zlib"
>  
> -PR = "r1"
> +PR = "r3"
>  
>  SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>             file://fix-pkgconfig.patch \
> @@ -45,7 +45,7 @@ inherit autotools pkgconfig
>  
>  export HASDOCBOOK="no"
>  
> -EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH}"
> +EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH} --with-default-fonts=${datadir}/fonts"
>  EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
>  
>  # The tarball has some of the patched files as read only, which

Merged to master, thanks.

Richard (not too worried about PR not being in unit increments)





