Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuQBb-0004UZ-Jf for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:36:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEVxOT028361
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:31:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26885-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:31:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEVqTa028355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:31:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <811a2cc3d1f9d025f99f7decfa6d3603cb3ca5f2.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<811a2cc3d1f9d025f99f7decfa6d3603cb3ca5f2.1313700595.git.sgw@linux.intel.com>
Date: Fri, 19 Aug 2011 09:31:50 -0500
Message-ID: <1313764310.13995.103.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 05/32] tcl: fix networking breakage
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
X-List-Received-Date: Fri, 19 Aug 2011 14:36:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
> 
> Without providing these site entries tcl networking doesn't work on the target.
> 
> Original OE commit:
> 
> commit 0c340037644f87054462f62b50cd397c162615b7
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Wed May 26 13:04:18 2010 +0200
> 
>     tcl: add 2 entries to arm-linux site file (possibly only glibc specific, need to check)
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> index 2eabb4d..1b4ae83 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
>      file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
>      "
>  
> -PR = "r1"
> +PR = "r2"
>  
>  BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>                  file://tcl-add-soname.patch"
> @@ -30,7 +30,9 @@ inherit autotools
>  
>  DEPENDS_virtclass-native = ""
>  
> -EXTRA_OECONF = "--enable-threads"
> +EXTRA_OECONF = "--enable-threads \
> +                tcl_cv_api_getaddrinfo=yes \
> +               "
>  

Why are we adding these in the recipe rather than the site files? I can
see the reasons why we might but it does seem to be a change in
behaviour/policy?

Cheers,

Richard



