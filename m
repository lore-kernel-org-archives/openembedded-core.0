Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQ4cW-00031m-89
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 23:03:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Nov 2011 13:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,511,1315206000"; d="scan'208";a="90400786"
Received: from unknown (HELO helios.localnet) ([10.252.121.192])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2011 13:56:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 21:56:51 +0000
Message-ID: <2738365.H3cX2LU5D7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321303197.26881.74.camel@ted>
	<22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Mon, 14 Nov 2011 22:03:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 November 2011 21:55:28 Koen Kooi wrote:
> This patch changes the default behaviour in a way that distros need to
> update their configs in order to keep the status quo. I know I use
> distccmon-gnome on my boards, 

I have to say I'm surprised, I hadn't considered the distcc UI to be 
particularly useful in our context so I'm surprised that anyone is actually 
using it, but everyone has their own requirements I guess.

> but will I remember 2 months from now that
> this patch went in? I asked this before in a different context, but I'll
> ask again: do you expect distro maintainers to vet each and every commit
> that goes into OE-core to find out when default got (silently) changed?

There are degrees of "silently". Given that this patch is being reviewed on 
the mailing list I think it's anything but silent.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


