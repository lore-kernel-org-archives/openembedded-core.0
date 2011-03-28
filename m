Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4Erj-0004ks-Rg for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 18:00:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SFwTCw031232;
	Mon, 28 Mar 2011 16:58:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31143-02; Mon, 28 Mar 2011 16:58:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SFwJLj031226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Mar 2011 16:58:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7049c8b55628f8d6269cefe4a06f994cc60d49c2.1301322225.git.josh@linux.intel.com>
References: <cover.1301322225.git.josh@linux.intel.com>
	<7049c8b55628f8d6269cefe4a06f994cc60d49c2.1301322225.git.josh@linux.intel.com>
Date: Mon, 28 Mar 2011 16:58:15 +0100
Message-ID: <1301327895.3018.200.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 2/4] clutter-gst: add 1.3.6 for use with clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 16:00:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-28 at 15:28 +0100, Joshua Lock wrote:
> From: Joshua Lock <josh@linux.intel.com>
> 
> The inc file should be usable across clutter versions, plus this is already
> set in the clutter-box2d-1.4_git.bb recipe
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../clutter/clutter-gst-1.6_1.3.6.bb               |   16 ++++++++++++++++
>  meta/recipes-graphics/clutter/clutter-gst.inc      |    3 ++-
>  2 files changed, 18 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
> 
[...]
> diff --git a/meta/recipes-graphics/clutter/clutter-gst.inc b/meta/recipes-graphics/clutter/clutter-gst.inc
> index 614c62d..b1c8617 100644
> --- a/meta/recipes-graphics/clutter/clutter-gst.inc
> +++ b/meta/recipes-graphics/clutter/clutter-gst.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GStreamer"
>  HOMEPAGE = "http://www.clutter-project.org/"
>  LICENSE = "LGPLv2+"
>  
> -DEPENDS = "clutter-1.4 gstreamer gst-plugins-base"
> +DEPENDS = "gstreamer gst-plugins-base"
>  
>  FILESPATH = "${FILE_DIRNAME}/clutter-gst"
>  
> @@ -11,3 +11,4 @@ FILES_${PN}-examples = "${bindir}/video-player ${bindir}/video-sink"
>  
>  inherit autotools pkgconfig gtk-doc
>  
> +FILESPATH = "${FILE_DIRNAME}/clutter-gst"

Why is FILESPATH set twice to the same thing?

Cheers,

Richard



