Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qm5hu-000300-Az
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:07:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 08:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,276,1309762800"; d="scan'208";a="32092277"
Received: from unknown (HELO [10.255.14.126]) ([10.255.14.126])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 08:03:15 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 08:03:09 -0700
In-Reply-To: <1311708150-24226-2-git-send-email-msm@freescale.com>
References: <1311708150-24226-1-git-send-email-msm@freescale.com>
	<1311708150-24226-2-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1311778995.2193.1.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH] Update TERMCMD message to align with previous change
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
X-List-Received-Date: Wed, 27 Jul 2011 15:07:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 14:22 -0500, Matthew McClintock wrote:
> A previous patch changed the default TERM to use xterm. This updates
> local.conf.sample to match the change
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>

We should probably change the suggested / commented TERMCMD to be
something other than KONSOLE too, as that doesn't work so well for
KDE4...

Joshua

> ---
>  meta-yocto/conf/local.conf.sample |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index 499c48e..7a0fc89 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -205,7 +205,7 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
>  # out if that is desired
>  NO32LIBS = "1"
>  
> -# If you do not use (or have installed) gnome-terminal you will need to
> +# If you do not use (or have installed) xterm you will need to
>  # uncomment these variables and set them to the terminal you wish to use
>  # when resolving patches which cannot be applied
>  # Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



