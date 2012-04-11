Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SI7LC-0003O9-EI
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 01:52:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Apr 2012 16:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88039761"
Received: from unknown (HELO helios.localnet) ([10.252.120.54])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Apr 2012 16:43:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 00:43:23 +0100
Message-ID: <3244255.dlY7GkIzop@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <20120411114320.GA3637@jama.jama.net>
References: <1334160821-11771-1-git-send-email-florin.sarbu@windriver.com>
	<20120411114320.GA3637@jama.jama.net>
MIME-Version: 1.0
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Wed, 11 Apr 2012 23:52:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 April 2012 13:43:20 Martin Jansa wrote:
> On Wed, Apr 11, 2012 at 07:13:41PM +0300, Florin Sarbu wrote:
> > Added the vala package from meta-oe to support future systemd integration.
> 
> When you're adding it from meta-oe, why not in current version with
> needed patch to build e.g. midori?

IMO, we shouldn't be adding something as esoteric as Vala to OE-Core unless it 
is absolutely needed. AFAICT the only part of systemd needing vala is the GUI 
which given this dependency would be better placed elsewhere.

At the moment in the stabilisation period we're not in a position to do 
systemd integration in OE-Core, however AIUI the first step along that road as 
discussed recently at the BSP/Collab Summit will be to split out the systemd 
parts of meta-oe into a separate layer.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


