Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QuptA-0003wu-9P
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 20:03:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qupoe-0003bt-A3
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 19:58:40 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E4FDA4D.9020508@gmail.com>
References: <91e2a59d20e1d1992691684fb2dd64a6405ec6e3.1313791350.git.dvhart@linux.intel.com>
	<fa0a22eee3461de38fc4b41a76f15980b78fd0bf.1313791350.git.dvhart@linux.intel.com>
	<4E4FDA4D.9020508@gmail.com>
Date: Sat, 20 Aug 2011 18:58:32 +0100
Message-ID: <1313863112.24904.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/3] tune: remove thumb flag from non-thumb cortexa8 tune variables
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
X-List-Received-Date: Sat, 20 Aug 2011 18:03:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-08-20 at 09:01 -0700, Khem Raj wrote:
> On 8/19/2011 3:06 PM, Darren Hart wrote:
> > The thumb flag "t" appears to have been copy/pasted to all the
> > PACKAGE_EXTRA_ARCHS tune variables. Remove it from the non-thumb versions.
> >
> 
> hmmm non thumb versions can run thumb packages. So I think its ok to 
> have t in EXTRA_ARCHS

Er, really?  If it can run thumb code, in what sense is it a "non thumb"
version?

p.




