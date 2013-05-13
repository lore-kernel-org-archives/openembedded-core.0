Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UboTp-0002e7-0Z
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 10:51:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2013 01:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,660,1363158000"; d="scan'208";a="336157526"
Received: from unknown (HELO helios.localnet) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2013 01:33:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 09:33:25 +0100
Message-ID: <11599561.3zUhJSzPUZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51909DB8.3060407@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<3529451.hQA8zCVn47@helios> <51909DB8.3060407@linux.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 13 May 2013 08:51:46 -0000
X-List-Received-Date: Mon, 13 May 2013 08:51:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 13 May 2013 11:00:56 Saul Wold wrote:
> On 05/12/2013 10:55 PM, Paul Eggleton wrote:
> > On Sunday 12 May 2013 19:54:50 Phil Blundell wrote:
> >> On Sun, 2013-05-12 at 08:40 -0700, Saul Wold wrote:
> >>> On 05/12/2013 06:27 AM, Otavio Salvador wrote:
> >>>> I think so, it'd be good to have it in oe-core and allow use of vpn :)
> >>> 
> >>> I would like to see what the full dependency set looks like for these,
> >>> clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else
> >>> and what licenses are they under.
> >> 
> >> I don't think we necessarily want openvpn, l2tpd and suchlike in
> >> oe-core.  None of those things seem very "core" to me (in an embedded
> >> context) and testing them seems like it would be a bit of a challenge.
> > 
> > I agree, these don't belong in OE-Core. We already have them in meta-
> > networking.
> 
> This is what I get for replying to an email while traveling overseas and
> not being 100% clear about my points.
> 
> I was more interested in the dependencies then actually thinking about
> including them in OE-Core,that was not my intent.
> 
> This would would allow us to better understand if those recipes not in
> meta-networking could be moved from meta-oe to meta-networking.
> Currently, I think vpnc and pptp are in meta-networking, not the other 2.

They are all in meta-networking (xl2tpd, pptp-linux and vpnc have always been 
there, openvpn got moved in mid-April).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


