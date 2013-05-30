Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id A18C16098C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:57:33 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-74-102.range86-137.btcentralplus.com
	[86.137.74.102]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 828A0952B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:57:34 +0100 (BST)
Message-ID: <51A75ACE.3080807@r-finger.com>
Date: Thu, 30 May 2013 14:57:34 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1369920136-2815-1-git-send-email-ross.burton@intel.com>
	<1369920136-2815-2-git-send-email-ross.burton@intel.com>
In-Reply-To: <1369920136-2815-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 2/2] clutter: remove documentation hacks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2013 13:57:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/13 14:22, Ross Burton wrote:
> These sed lines disable the documentation and appear to be historical, building
> works fine without them.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/clutter/clutter-1.0.inc |    4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
> index e1d3cf4..68cb22b 100644
> --- a/meta/recipes-graphics/clutter/clutter-1.0.inc
> +++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
> @@ -39,10 +39,6 @@ PACKAGECONFIG ??= "x11 glx"
>  FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
>  
>  do_configure_prepend() {
> -        # Fix up some weirdness in the docs
> -        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
> -        sed -i s:doc::g ${S}/Makefile.am
> -
>  	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
>  	touch -t 200001010000 po/clutter-1.0.pot
>  }

Acked-by: Tomas Frydrych <tomas@sleepfive.com>


-- 
http://sleepfive.com

