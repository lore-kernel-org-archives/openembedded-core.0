Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R3lt0-0003H6-GW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 11:36:06 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R3lo2-0004b2-Hp
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 11:30:58 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2011 10:30:57 +0100
In-Reply-To: <1315961204.2252.32.camel@scimitar>
References: <1315961204.2252.32.camel@scimitar>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1315992658.2519.137.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC] Suggestion of minor change to patch submission policy re: long descriptions in commit headers
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
X-List-Received-Date: Wed, 14 Sep 2011 09:36:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 17:46 -0700, Joshua Lock wrote:
> Whilst I intend to rectify the latter I'd like to propose we change the
> former such that the defect information is at the end of the commit
> message.
> 
> I believe this is more suitable for the project because the defect
> information and its relevance should be summarised in the long
> description, and therefore the defect id and link to the defect tracker
> are supplemental information for interested readers.
> 
> IMHO this supplementary nature should lead us to request submitters
> provide defect information after the long description.

Agreed, I think this would be something of an improvement (and indeed,
from a look at the git log it appears that some submitters are already
doing this).  Although it isn't a very big deal, I do find it slightly
irritating to have the first line of the long checkin message be
something that is essentially noise.

Possibly even better would be to think up a way to encode the defect
information, in some machine-readable form, as part of the
pseudo-header.  That would make it straightforward for folks who care
particularly about the defect information for (say) yocto to filter it
into some more prominent location.

p.




