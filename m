Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T8UQ8-0006lN-RA
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 13:02:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T8UEE-0000QG-Bx; Mon, 03 Sep 2012 12:50:02 +0200
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 03 Sep 2012 11:50:01 +0100
In-Reply-To: <2466289.CAG9RzjSbc@helios>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<8e6521856490f08291c3c01a3b16e5f270fe6bac.1346668109.git.paul.eggleton@linux.intel.com>
	<1346668525.2673.116.camel@phil-desktop> <2466289.CAG9RzjSbc@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346669402.2673.122.camel@phil-desktop>
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
X-List-Received-Date: Mon, 03 Sep 2012 11:02:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-03 at 11:37 +0100, Paul Eggleton wrote:
> On Monday 03 September 2012 11:35:24 Phil Blundell wrote:
> > On Mon, 2012-09-03 at 11:30 +0100, Paul Eggleton wrote:
> > > openswan was only ever provided in unmaintained form in meta-demoapps
> > > which has been removed, so we never really provided it in OE-Core.
> > 
> > Isn't packagegroup-base-ipsec rather useless without it?
> 
> If you ignore the RRECOMMENDS line that follows, yes.

Is there a meaningful use-case where installing kernel-module-ipsec
without any user-space support is a desirable thing to do?  And, even if
the answer is yes, is it really valuable to have a
packagegroup-base-ipsec which just recommends a single other package
without doing anything else?

p.




