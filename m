Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdfpV-0001r2-Gp
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 11:24:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Dec 2011 02:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99185943"
Received: from unknown (HELO helios.localnet) ([10.252.122.57])
	by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2011 02:17:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 10:17:43 +0000
Message-ID: <1965049.NZCOpGhGnY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4EF22C79.7080906@windriver.com>
References: <cover.1324441819.git.shane.wang@intel.com>
	<4EF228C9.6070606@linux.intel.com> <4EF22C79.7080906@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] [RESEND]Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Thu, 22 Dec 2011 10:24:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 December 2011 12:59:05 Mark Hatle wrote:
> On 12/21/11 12:43 PM, Saul Wold wrote:
> > Which is why I think this issue is cropping up. So, then the proposal
> > should really be to add SUMMARY to all recipes and initially make it a
> > warning for now if non-existent SUMMARY as with DESCRIPTION and then
> > remove the existing SUMMARY = ${PN}-${PV} ...??
> > 
> > The audit would then be the list of warnings which later becomes error
> 
> I agree, this should become some kind of an audit warning, so we can improve
> the quality of the recipe information.  I'm not sure I want it to be an
> error though as it may impact folks with existing OE recipes...

Do we want to be showing this warning to everyone or should it just be part of 
a class you can enable (e.g. oelint.bbclass - which needs some work by the 
looks of it)?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


