Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCBgS-0000uB-Hi
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 17:18:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2012 08:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125224397"
Received: from unknown (HELO helios.localnet) ([10.252.123.240])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 08:09:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 26 Mar 2012 16:09:09 +0100
Message-ID: <1380334.QcVfQnLvhe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F7083DD.8020003@opendreambox.org>
References: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
	<5951957.sAPiJHEkf3@helios> <4F7083DD.8020003@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/bitbake: Allow to override path to pseudodone, make BUILDDIR optional
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
X-List-Received-Date: Mon, 26 Mar 2012 15:18:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 March 2012 16:57:33 Andreas Oberritter wrote:
> I'm not convinced. If I delete tmp, pseudo gets deleted, but pseudodone
> stays. In my opinion, pseudodone's intuitive location is tmp, if the
> location of tmp is known - which it is in my case.

pseudodone exists so that the script does not have to ask bitbake every time 
it is run where to find the pseudo executable (i.e., STAGING_BINDIR_NATIVE). 
Now, at the moment the script is lazy and assumes if the file doesn't exist 
then it needs to build pseudo even if that isn't needed. I have a fix for this 
already, so this problem is taken care of.
 
> Can you please at least put $BUILDDIR/pseudodone into a variable, so I
> can keep my patch small and maintainable?

If the above is fixed and you can move freely between build directories without 
re-running a setup script, then unless I'm mistaken your immediate problems 
have now been addressed...?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


