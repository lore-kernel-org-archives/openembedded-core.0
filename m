Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SwyQi-0005WF-UI
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:39:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2012 09:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129672008"
Received: from unknown (HELO helios.localnet) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 09:27:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 02 Aug 2012 17:27:38 +0100
Message-ID: <2026871.yolgERni9t@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1343924683-21970-1-git-send-email-Martin.Jansa@gmail.com>
References: <1343924683-21970-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] bitbake.conf: store cooker logs in TMPDIR subdirectory
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
X-List-Received-Date: Thu, 02 Aug 2012 16:39:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 August 2012 18:24:43 Martin Jansa wrote:
> * we should probably wait until
>  
> http://git.openembedded.org/bitbake/commit/?id=1e06d8012868ba5a31503dc99cbf
> 18570be629d9 is in next required bitbake version, but error message if the
> directory doesn't exist is quite clear * people with new enough bitbake
> could just change this in their local.conf
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d5a43e9..ff1cbd6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -754,7 +754,7 @@ DISTRO[unexport] = "1"
>  TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_",
> "-")}"
> 
>  # Complete output from bitbake, if you're changing it, make sure to use
> existing directory -BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
> +BB_CONSOLELOG ?= "${TMPDIR}/cooker/${MACHINE}/${DATETIME}"

I was thinking about this the other day - shouldn't we be using LOG_DIR for 
this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


