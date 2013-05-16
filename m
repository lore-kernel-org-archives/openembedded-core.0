Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1Uctz6-0005ky-C0; Thu, 16 May 2013 10:56:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2013 01:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,683,1363158000"; d="scan'208";a="338507964"
Received: from unknown (HELO helios.localnet) ([10.255.12.131])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2013 01:37:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 16 May 2013 09:37:23 +0100
Message-ID: <3292696.1H20MyJFTP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <E8F9ED28-58F5-422C-8B07-ACD8791202A1@dominion.thruhere.net>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<E8F9ED28-58F5-422C-8B07-ACD8791202A1@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 08:56:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 May 2013 08:23:35 Koen Kooi wrote:
> Op 15 mei 2013, om 22:33 heeft Richard Purdie
> <richard.purdie@linuxfoundation.org> het volgende geschreven:
> > On Tue, 2013-05-14 at 09:36 +0200, Koen Kooi wrote:
> >> 2) *Never* use PRINC in type b) bbappends
> >> 3) Avoid PRINC in general
> > 
> > Could we undergo some mass purge of PRINC from master branches and then
> > change the PR values once and for all in the core recipes? We could make
> > PRINC throw a bb.fatal() from that point onwards.
> 
> That would be nice.

Maybe we could add some logic into the PR server that if it sees PRINC go 
backwards, it could just print a warning and increment the stored PR value to 
compensate? That might mean storing the previous value of PRINC if we're not 
already doing that of course.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


