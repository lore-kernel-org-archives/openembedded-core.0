Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBhRF-0003V9-QL
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 09:32:45 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBhFA-0000sk-4p; Wed, 12 Sep 2012 09:20:16 +0200
Message-ID: <1347434289.29443.96.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 12 Sep 2012 08:18:09 +0100
In-Reply-To: <505034AD.3010306@linux.intel.com>
References: <1347387265.29443.38.camel@x121e.pbcl.net>
	<504F80B0.8050406@linux.intel.com>
	<1347431813.29443.94.camel@x121e.pbcl.net>
	<505034AD.3010306@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES
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
X-List-Received-Date: Wed, 12 Sep 2012 07:32:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-12 at 00:07 -0700, Saul Wold wrote:
> On 09/11/2012 11:36 PM, Phil Blundell wrote:
> > On Tue, 2012-09-11 at 11:19 -0700, Saul Wold wrote:
> >> On 09/11/2012 11:14 AM, Phil Blundell wrote:
> >>> Commit 13544fbc6217fee1731a6da1e2cf94901a500842 changed the ordering
> >>> of PACKAGES so that ${PN}-dev came before ${PN}.  However, this caused
> >>> the FILES matching to go wrong if ${libdir} == ${base_libdir}.  Fix this
> >>> by moving ${PN} ahead of ${PN}-dev once again.
> >>>
> >>> Signed-off-by: Phil Blundell <pb@pbcl.net>
> >>> ---
> >>> V2: now with high-tech PR goodness
> >>
> >> Did you do a build with BUILD_HISTORY enabled and verified nothing
> >> changes in the standard case?
> >
> > Yes, see attached.
> >
> 
> Sorry, there is way too much in that diff, have you reviewed what 
> actually changed?
> 
> In the FILES and FILESLIST?

Yes.  There are no changes to FILES, and no relevant changes to the
FILELISTs.

p.




