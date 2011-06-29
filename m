Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qc3Aq-0000GN-Rh
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 00:23:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2011 15:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="20569104"
Received: from unknown (HELO [10.255.13.240]) ([10.255.13.240])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2011 15:20:01 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 15:19:56 -0700
In-Reply-To: <4E0A4BA0.9050409@mentor.com>
References: <1309292092.16722.3.camel@scimitar> <4E0A4BA0.9050409@mentor.com>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1309386002.24735.6.camel@scimitar>
Mime-Version: 1.0
Subject: Re: Building behind a firewall/proxy
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
X-List-Received-Date: Wed, 29 Jun 2011 22:23:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 14:46 -0700, Tom Rini wrote:
> On 06/28/2011 01:14 PM, Joshua Lock wrote:
> > All,
> > 
> > For the Yocto 1.1 release we want to ease the pain of getting set up to
> > build behind a firewall.
> > 
> > I have a series of patches under development to run a one hit sanity
> > test which tries to verify the user can fetch and in the case of failure
> > point the user to a wiki page where we'd document common causes of fetch
> > failures.
> > 
> > We're also going to look at the site.conf file, which can be used to
> > specify proxy settings and other site specific settings such MIRRORS,
> > and ensure that it can easily be edited to help people get set up.
> > 
> > It'd be great if people who operate behind a proxy/firewall can help us
> > document the steps they had to take to work around this.
> > 
> > Further if you have other ideas as to how we can help make this process
> > less painful please let us know.
> 
> Is SOCKS5_PASSWD SOCKS5_USER in the default BB_ENV_EXTRAWHITE list atm?
>  If not, it needs to be.
> 

Noted, thanks Tom.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



