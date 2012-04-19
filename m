Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SKvBm-0000cs-La
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 19:30:38 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2Q005SPLIKZPO0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 12:20:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AEE93200AA; Thu,
	19 Apr 2012 13:20:44 -0400 (EDT)
Date: Thu, 19 Apr 2012 13:20:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120419172044.GA5572@denix.org>
References: <1334830839-25853-1-git-send-email-ken.werner@linaro.org>
MIME-version: 1.0
In-reply-to: <1334830839-25853-1-git-send-email-ken.werner@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] bdwgc: Set ARM_INSTRUCTION_SET to "arm"
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
X-List-Received-Date: Thu, 19 Apr 2012 17:30:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 19, 2012 at 12:20:39PM +0200, Ken Werner wrote:
> The bdwgc recipe uses a version of libatomic that fails when building in Thumb
> mode. This has been fixed upstream already. The
> pulseaudio/libatomics-ops_1.2.bb has the same issue and sets the
> ARM_INSTRUCTION_SET to "arm" (probably until a new version gets pulled in).
> This patch applies the same workaround to the bdwgc/bdwgc_20110107.bb recipe.
> 
> Signed-off-by: Ken Werner <ken.werner@linaro.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/recipes-support/bdwgc/bdwgc_20110107.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> index 327e59b..bc7b613 100644
> --- a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> @@ -33,5 +33,7 @@ PR = "r1"
>  
>  S = "${WORKDIR}/bdwgc"
>  
> +ARM_INSTRUCTION_SET = "arm"
> +
>  inherit autotools
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


