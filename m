Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qhxot-0000Vy-Jw
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 07:53:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2011 22:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,212,1309762800"; d="scan'208";a="28349998"
Received: from unknown (HELO [10.255.14.16]) ([10.255.14.16])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2011 22:49:41 -0700
Message-ID: <4E212671.8000302@linux.intel.com>
Date: Fri, 15 Jul 2011 22:49:37 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310764987-26717-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1310764987-26717-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] bitbake.conf: Change TERM default fallback to	XTERM instead of GNOME_TERM
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
X-List-Received-Date: Sat, 16 Jul 2011 05:53:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/15/2011 02:23 PM, Khem Raj wrote:
> Its better to use xterm since some folks may not be using gnome
> or KDE. Chances of having xterm on build machines are lot more
> than having gnome-terminal.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thank you, this is something I've been meaning to do for a while.

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/conf/bitbake.conf |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 463991d..128b0b6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -571,8 +571,8 @@ KONSOLE_TERMCMD = 'konsole -T "$TERMWINDOWTITLE"'
>  KONSOLE_TERMCMDRUN = '${KONSOLE_TERMCMD} -e $SHELLCMDS'
>  
>  # Set a default
> -TERMCMD ?= "${GNOME_TERMCMD}"
> -TERMCMDRUN ?= "${GNOME_TERMCMDRUN}"
> +TERMCMD ?= "${XTERM_TERMCMD}"
> +TERMCMDRUN ?= "${XTERM_TERMCMDRUN}"
>  
>  ##################################################################
>  # Miscellaneous utilities.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


