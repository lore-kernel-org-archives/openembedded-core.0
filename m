Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5YVL-00011T-7O for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 10:47:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7Q8ZMJO004513;
	Sun, 26 Aug 2012 09:35:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03432-02; Sun, 26 Aug 2012 09:35:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7Q8ZCrH004507
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 26 Aug 2012 09:35:13 +0100
Message-ID: <1345970114.7252.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.zanussi@intel.com
Date: Sun, 26 Aug 2012 09:35:14 +0100
In-Reply-To: <dc1953f169a835ec6b1dd04c78d61900f0fb53d5.1345935181.git.tom.zanussi@intel.com>
References: <cover.1345935181.git.tom.zanussi@intel.com>
	<dc1953f169a835ec6b1dd04c78d61900f0fb53d5.1345935181.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perf: add bison and flex to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 08:47:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-25 at 17:57 -0500, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> perf depends on bison and flex for event parsing - add them as
> dependencies.

Does it need these at build time or runtime? I suspect you meant to add
these as RDEPENDS as it needs them at runtime?

Cheers,

Richard

> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/recipes-kernel/perf/perf_3.4.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> index 5fb38e6..decc911 100644
> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -9,7 +9,7 @@ as well."
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  require perf.inc
>  
> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
>             ${MLPREFIX}binutils \
>             ${TUI_DEPENDS} \
>             ${SCRIPTING_DEPENDS} \
> +           bison flex \
>            "
>  
>  SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"




