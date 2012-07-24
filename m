Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StdkP-0002qD-1g
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 13:57:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2012 04:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126236140"
Received: from unknown (HELO helios.localnet) ([10.252.121.60])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jul 2012 04:46:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 24 Jul 2012 12:46:22 +0100
Message-ID: <1783304.g0GBo72QxG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207240539570.19401@oneiric>
References: <alpine.DEB.2.02.1207240539570.19401@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: "bitbake-layers show-overlayed" doesn't match its "help" message
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
X-List-Received-Date: Tue, 24 Jul 2012 11:57:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 July 2012 05:53:40 Robert P. J. Day wrote:
>   those two layers have the same priority, but the help suggests that
> you'll only see instances of recipes from layers that have a
> *different* priority -- not quite true.

Agreed - the intent was to try to indicate that the recipes that were 
"overlayed" were the ones "underneath" but priority is not always the only 
factor in which one is preferred. I've sent a patch to remove the "confusing" 
bit of description.

> p.s.  i'm assuming that overlaid recipes are just a bad idea anyway,
> and should be used only in unusual circumstances, yes?

Yes; much better to use a bbappend. It's difficult to avoid if you are 
introducing a newer/older version in your layer, but if it's layer intended 
for public consumption and is not a distro layer, you should still think twice 
about doing it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


