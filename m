Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qbek0-0008UQ-7V
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:18:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2011 13:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,438,1304319600"; d="scan'208";a="19930281"
Received: from unknown (HELO [10.255.13.227]) ([10.255.13.227])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 13:14:51 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 13:14:46 -0700
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1309292092.16722.3.camel@scimitar>
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>, Sean_Hudson@Dell.com
Subject: Building behind a firewall/proxy
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
X-List-Received-Date: Tue, 28 Jun 2011 20:18:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

All,

For the Yocto 1.1 release we want to ease the pain of getting set up to
build behind a firewall.

I have a series of patches under development to run a one hit sanity
test which tries to verify the user can fetch and in the case of failure
point the user to a wiki page where we'd document common causes of fetch
failures.

We're also going to look at the site.conf file, which can be used to
specify proxy settings and other site specific settings such MIRRORS,
and ensure that it can easily be edited to help people get set up.

It'd be great if people who operate behind a proxy/firewall can help us
document the steps they had to take to work around this.

Further if you have other ideas as to how we can help make this process
less painful please let us know.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



