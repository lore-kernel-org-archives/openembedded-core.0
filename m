Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJApM-0004Al-IP
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:20:32 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJAcp-0004Jm-KO; Wed, 03 Oct 2012 00:07:35 +0200
Message-ID: <1349215508.4422.81.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 02 Oct 2012 23:05:08 +0100
In-Reply-To: <506B6552.3040503@linux.intel.com>
References: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
	<1349215253.4422.79.camel@x121e.pbcl.net>
	<506B6552.3040503@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Add detail to shared area warning
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
X-List-Received-Date: Tue, 02 Oct 2012 22:20:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 15:06 -0700, Saul Wold wrote:
> On 10/02/2012 03:00 PM, Phil Blundell wrote:
> > On Tue, 2012-10-02 at 15:00 -0700, Saul Wold wrote:
> >> -        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
> >> +        bb.warn("The %s recipe is trying to install files into a shared area when those files already exist (please fix %s). Those files are:\n   %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match)))
> >
> > That seems potentially misleading: the file that needs fixing isn't
> > necessarily the one that triggers this warning.  What would be ideal
> > would be to have it output the names of all recipes that have tried to
> > stage the files in question so that the user can make an informed
> > decision about which one ought to be putting them there.
> >
> True enough, but we don't have that information at that time, but it 
> gives more information than we had before, as to which recipe was adding 
> the files, I guess if I change the wording to something like
> "verify" or "check"?

Yeah, sounds good.

p.



