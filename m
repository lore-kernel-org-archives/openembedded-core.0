Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw2Wn-0003TB-R2
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 03:17:30 +0100
Received: by daln34 with SMTP id n34so2375293dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 18:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oQQObkV07Rng8Mwq9vWxKkjaVNERWUwNZk+Gxqd71XU=;
	b=xf0zFoiqFUKeYXG3dP/VIoQ9YTCVyXoq/bFwgFcryT4rNbAivy7Qe9B55wiw9ElWqY
	GOAywtMKbkkC+bWb2vVV6AFK9TVDAt1H810PSBxZebiCYepeOTS0hXlRSx8V/QdN6JRZ
	TNiupyfbnnVOyF2ug41Exze2dBBZS67NSsJ7g=
Received: by 10.68.241.70 with SMTP id wg6mr21888664pbc.6.1328926162036;
	Fri, 10 Feb 2012 18:09:22 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id t10sm17977817pbb.18.2012.02.10.18.09.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 18:09:20 -0800 (PST)
Date: Fri, 10 Feb 2012 18:09:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120211020917.GF2095@sakrah.homelinux.org>
References: <4F35945D.7020900@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F35945D.7020900@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] consolekit: depend on libx11
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
X-List-Received-Date: Sat, 11 Feb 2012 02:17:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/02/12 23:04), Andreas Oberritter wrote:
> * Fixes the following error at configure time:
> 
> |checking for TOOLS... no
> |configure: error: Package requirements (x11 >= 1.0.0
> |  glib-2.0 >= 2.14
> |) were not met:
> |
> |No package 'x11' found
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * Note that I didn't build test this, because I'm building
>   without x11. I just looked up the package of x11.pc, which
>   at least in Ubuntu is libx11.
> 
>  .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> index 3ded6df..3a4b04f 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> @@ -13,7 +13,7 @@ POLKIT_libc-uclibc = ""
>  POLKITCONF = ""
>  POLKITCONF_libc-uclibc = "--disable-policykit"
>  
> -DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} virtual/libx11"

should this depend on if x11 is in DISTRO_FEATURES ?

>  RDEPENDS_${PN} += "base-files"
>  
>  inherit gnome
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


