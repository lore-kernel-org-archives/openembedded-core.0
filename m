Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Thw00-0007X4-Ms
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 06:33:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Dec 2012 21:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,249,1355126400"; d="scan'208";a="229197315"
Received: from unknown (HELO [10.255.13.197]) ([10.255.13.197])
	by azsmga001.ch.intel.com with ESMTP; 09 Dec 2012 21:19:20 -0800
Message-ID: <1355116759.26722.4.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 09 Dec 2012 23:19:19 -0600
In-Reply-To: <alpine.DEB.2.02.1212090822170.4715@oneiric>
References: <alpine.DEB.2.02.1212090822170.4715@oneiric>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means "LICENSE_FLAGS = "license_${PN}_${PV}" ?
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
X-List-Received-Date: Mon, 10 Dec 2012 05:33:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-12-09 at 08:23 -0500, Robert P. J. Day wrote:
> scanning a number of OE layers for examples of things to demo in
> class, and i ran across this in the meta-intel layer:
> 
> LICENSE_FLAGS = "license_${PN}_${PV}"
> 
>   not sure what that means, and still not conversant enough in python
> to read the source.
> 

Hi,

See section '3.4.2. Enabling Commercially Licensed Recipes' in the Yocto
reference manual for details on that variable:

http://www.yoctoproject.org/docs/1.4/poky-ref-manual/poky-ref-manual.html#enabling-commercially-licensed-recipes

Tom

> rday
> 




