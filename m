Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QbgAM-0002Jw-E9
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 23:49:56 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qbg6o-0003cJ-2u from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 14:46:14 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 28 Jun 2011 14:46:13 -0700
Received: from [172.30.80.197] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 28 Jun 2011 14:46:13 -0700
Message-ID: <4E0A4BA0.9050409@mentor.com>
Date: Tue, 28 Jun 2011 14:46:08 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1309292092.16722.3.camel@scimitar>
In-Reply-To: <1309292092.16722.3.camel@scimitar>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Jun 2011 21:46:13.0877 (UTC)
	FILETIME=[CD34D250:01CC35DC]
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
X-List-Received-Date: Tue, 28 Jun 2011 21:49:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/28/2011 01:14 PM, Joshua Lock wrote:
> All,
> 
> For the Yocto 1.1 release we want to ease the pain of getting set up to
> build behind a firewall.
> 
> I have a series of patches under development to run a one hit sanity
> test which tries to verify the user can fetch and in the case of failure
> point the user to a wiki page where we'd document common causes of fetch
> failures.
> 
> We're also going to look at the site.conf file, which can be used to
> specify proxy settings and other site specific settings such MIRRORS,
> and ensure that it can easily be edited to help people get set up.
> 
> It'd be great if people who operate behind a proxy/firewall can help us
> document the steps they had to take to work around this.
> 
> Further if you have other ideas as to how we can help make this process
> less painful please let us know.

Is SOCKS5_PASSWD SOCKS5_USER in the default BB_ENV_EXTRAWHITE list atm?
 If not, it needs to be.

-- 
Tom Rini
Mentor Graphics Corporation


