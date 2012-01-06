Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RjG1V-00023g-Uw
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 21:04:22 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RjFuN-00041J-Ha
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 20:56:59 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1325873019.15053.40.camel@elmorro>
References: <4c91ccffa882d1c01bd7abc18b662dce388192be.1325867350.git.tom.zanussi@intel.com>
	<e0e076a614e96c92eb02758f77bfab293509be92.1325867350.git.tom.zanussi@intel.com>
	<1325870130.12160.10.camel@phil-desktop>
	<1325873019.15053.40.camel@elmorro>
Date: Fri, 06 Jan 2012 19:20:12 +0000
Message-ID: <1325877612.3234.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/5] Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
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
X-List-Received-Date: Fri, 06 Jan 2012 20:04:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 12:03 -0600, Tom Zanussi wrote:
> On Fri, 2012-01-06 at 17:15 +0000, Phil Blundell wrote:
> > If I'm understanding the mechanism correctly then just setting all of
> > these to "Commercial" seems like a bit of a retrograde step.  Is there
> > an easy way in this new world for me to say that (for the sake of
> > argument) gst-fluendo-mp3 is acceptable for inclusion but libomixl
> > isn't?
> > 
> 
> Hmm, I don't think it's retrograde - it's true, this patchset simply
> replaces the existing functionality, where those particular packages
> previously were all essentially marked "COMMERCIAL" by virtue of all
> existing within the one-and-all COMMERCIAL_LICENSE variable, whereas now
> they're all marked as "Commercial" instead.

Well, the sense in which it seems retrograde to me is that, previously,
COMMERCIAL_LICENSE named a list of packages and I could add or remove
things as I saw fit depending on my distro policy requirements.  Now,
they're all just marked "Commercial" in an undifferentiated way and
there doesn't seem to be any easy mechanism for me to take some but not
all of them.

p.




