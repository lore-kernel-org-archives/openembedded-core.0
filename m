Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QTrdF-00059Z-I0 for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 10:27:25 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QTra6-00069m-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 10:24:10 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DECC37C.2010003@windriver.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
	<300cfa12d67e37c81fbbcdaba5c7d7686a191cfe.1307331820.git.scott.a.garman@intel.com>
	<1307347216.3131.5.camel@lenovo.internal.reciva.com>
	<1307357181.7672.3.camel@rex>  <4DECC37C.2010003@windriver.com>
Date: Tue, 07 Jun 2011 09:24:04 +0100
Message-ID: <1307435044.3131.16.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/4] tar: upgrade to v1.26
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
X-List-Received-Date: Tue, 07 Jun 2011 08:27:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 07:09 -0500, Mark Hatle wrote:
> On 6/6/11 5:46 AM, Richard Purdie wrote:
> > PRIORITY does seem a bit of a pointless variable in the default metadata
> > and I'm borderline in favour of dropping it and leaving it to any
> > distros who want to use it, maybe sharing an include file.
> 
> I agree as well, PRIORITY seems a bit iffy at this point.

So do we have a consensus that PRIORITY should be removed?  Is there
anybody who wants to speak up in favour of keeping it?

> > SECTION does at least start to become useful in an image generation UI
> > as a way to group packages roughly by type which makes me think it has a
> > good default usecase (and OE-Core did clean up the values of it to at
> > least be consistent).
> 
> I think the value of SECTION needs to remain.  It's being used to group the
> packages (as Richard mentions...)

Yeah, fair enough.  SECTION does appear in output packages (at least for
ipk/deb, it's mapped to the Section: header), but there is probably no
harm in having it used for source package grouping in oecommander-type
interfaces as well.  And I guess, unlike PRIORITY, it does seem
reasonable for the core metadata to assign some half-sensible default
package sections as a starting point for distro customisation.

p.




