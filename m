Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QcJiP-0001lo-Eq
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 18:03:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 08:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,450,1304319600"; d="scan'208";a="24800964"
Received: from unknown (HELO helios.localnet) ([10.255.17.99])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 08:59:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 16:59:54 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
In-Reply-To: <4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106301659.54941.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Thu, 30 Jun 2011 16:03:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 30 June 2011 16:49:57 Koen Kooi wrote:
> It's a white list, so:
> 
> # 0 - non dev contains .so
> # 5 - .la contains installed=yes or reference to the workdir
> # 7 - the desktop file is not valid
> # 8 - .la contains reference to the workdir
> # 9 - LDFLAGS ignored
> 
> Are warnings and
> 
> # 1 - package contains a dangerous RPATH
> # 2 - package depends on debug package
> # 3 - non dbg contains .so
> # 4 - wrong architecture
> # 6 - .pc contains reference to /usr/include or workdir
> # 10 - Build paths in binaries
> # 11 - package depends on devel package
> 
> Are fatal errors. The splits seems arbitrary to me, but it that's how it
> was last year before RP disabled all fatal errors.

OK, comprehension fail on my part, sorry. Good to have them listed out 
explicitly though, thanks for that. The fatal errors are definitely not good 
things to be allowing through if we can avoid it.

Without checking, do you have a handle on how many of these we would have to 
fix in OE-core to make it build without fatal errors?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


