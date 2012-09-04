Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T8qdT-0004DI-2X
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 12:45:35 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T8qRX-0003Wz-1n; Tue, 04 Sep 2012 12:33:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 04 Sep 2012 11:33:14 +0100
In-Reply-To: <1554049.jPb4PTGYOQ@helios>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<2466289.CAG9RzjSbc@helios> <1346669402.2673.122.camel@phil-desktop>
	<1554049.jPb4PTGYOQ@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346754795.2673.143.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/28] packagegroup-base: remove openswan from packagegroup-base-ipsec
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
X-List-Received-Date: Tue, 04 Sep 2012 10:45:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-03 at 11:54 +0100, Paul Eggleton wrote:
> The idea is supposed to be that just having "ipsec" in DISTRO_FEATURES brings 
> in what we can to support IPsec, assuming your image uses packagegroup-base 
> that is.
> 
> I'd be more than happy if we went the other way and decided that IPsec was 
> something worth fully supporting in OE-Core, and brought in the corresponding 
> user-space bits as a result; but that's somewhat outside of the scope of this 
> work.

Yeah, fair enough.  I would also like to see proper IPsec support in
oe-core but, if we aren't going to do that, it seems as though this
packagegroup should just be deleted (even if temporarily).  Having a
half-baked "ipsec" task which doesn't actually serve any useful purpose
seems like it would just be annoying.

p.




