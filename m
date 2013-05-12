Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ubcea-0002or-Dq
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 22:14:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2013 12:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,657,1363158000"; d="scan'208";a="301361136"
Received: from unknown (HELO helios.localnet) ([10.255.12.83])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2013 12:55:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 20:55:43 +0100
Message-ID: <3529451.hQA8zCVn47@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1368384890.16243.79.camel@pb-ThinkPad-R50e>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Sun, 12 May 2013 20:14:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 12 May 2013 19:54:50 Phil Blundell wrote:
> On Sun, 2013-05-12 at 08:40 -0700, Saul Wold wrote:
> > On 05/12/2013 06:27 AM, Otavio Salvador wrote:
> > > I think so, it'd be good to have it in oe-core and allow use of vpn :)
> > 
> > I would like to see what the full dependency set looks like for these,
> > clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else
> > and what licenses are they under.
> 
> I don't think we necessarily want openvpn, l2tpd and suchlike in
> oe-core.  None of those things seem very "core" to me (in an embedded
> context) and testing them seems like it would be a bit of a challenge.

I agree, these don't belong in OE-Core. We already have them in meta-
networking.

> Equally, we certainly don't want to have dependencies in oe-core
> pointing to packages in meta-oe or any other layer, since this would
> make it impossible to test oe-core in isolation.  So I would be inclined
> to say that the right way to deal with this is for those connman bits to
> go in a .bbappend which lives in the same layer as the recipes in
> question.

That doesn't work well for software layers - it is not a good thing for 
various recipes to get rebuilt just because you add meta-oe to your 
configuration for example.

The protocol we've established is to add PACKAGECONFIG options to enable the 
dependencies but have them disabled by default; these can be enabled as 
desired in distro or local configuration when the layer satisfying the 
dependency is also enabled.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


