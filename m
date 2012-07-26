Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuNw0-0008A3-Ms
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:16:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 06:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127147683"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 06:04:38 -0700
Message-ID: <501140C6.5000000@intel.com>
Date: Thu, 26 Jul 2012 16:06:14 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<1515360.HL1K52tqqg@helios>
	<0F8A947F-5465-4350-9700-5E0457EB1A38@dominion.thruhere.net>
	<6492036.bctPLCmjO3@helios>
In-Reply-To: <6492036.bctPLCmjO3@helios>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 13:16:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This was also my understanding. Ok so we want PROVIDES in there just for 
the case in which someone in some layer created a dependency on dbus-x11 
(in some recipe) with DEPENDS and we don't want to break his build - 
this argument will suffice, as far as I am concerned.

Radu


On 07/26/2012 03:56 PM, Paul Eggleton wrote:
>
> Without being too concerned with implementation details, I think it's as
> simple as this: if recipe A has foo in RDEPENDS_${PN} and recipe B has foo in
> RPROVIDES_${PN} then the runtime dependency is considered satisfied and things
> will work. You don't have to specify foo in PROVIDES unless something else has
> foo in DEPENDS.
>
> Cheers,
> Paul
>



