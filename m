Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qp6Bf-0005Yt-5Z
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:14:44 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qp67R-0004tp-IF
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:10:21 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
Date: Thu, 04 Aug 2011 23:10:15 +0100
Message-ID: <1312495815.3169.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Thu, 04 Aug 2011 22:14:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 15:04 -0700, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Phil Blundell
> > Sent: Thursday, August 04, 2011 2:51 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
> > support for glibc recipes
> > 
> > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > 
> > This commit message is very terse.  Why is this change necessary?
> 
> Because meta-x32 layer has glibc, which needs these support files. I will update the commit message in the tree.

Can't the tclibc-glibc file go in meta-x32 as well, then?

p.



