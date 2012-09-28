Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THbM4-00005o-SZ
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 16:15:48 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1THb9d-0000jH-Nv; Fri, 28 Sep 2012 16:02:57 +0200
From: Phil Blundell <philb@gnu.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 28 Sep 2012 15:02:56 +0100
In-Reply-To: <5065ACC4.7080505@windriver.com>
References: <1348485983-8294-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1348486253.31293.28.camel@phil-desktop> <506054A0.6090309@intel.com>
	<1348825951.32611.30.camel@phil-desktop>
	<5065ACC4.7080505@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348840977.32611.51.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Fri, 28 Sep 2012 14:15:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 08:57 -0500, Mark Hatle wrote:
> On 9/28/12 4:52 AM, Phil Blundell wrote:
> > On Mon, 2012-09-24 at 15:40 +0300, Andrei Dinu wrote:
> >> On 09/24/2012 02:30 PM, Phil Blundell wrote:
> >>> On Mon, 2012-09-24 at 14:26 +0300, Andrei Dinu wrote:
> >>>> +-	    *reloc_addr += sym->st_value;
> >>>> ++	    *reloc_addr = sym->st_value;
> >>> That patch looks slightly dubious to me.  Are you sure this doesn't
> >>> introduce any regressions elsewhere?
> >>>
> >> I have insufficient data to affirm that it doesn't introduces regressions.
> >
> > Presumably it does at least pass the eglibc and binutils testsuites,
> > right?
> 
> That patch is a workaround for an ARM issue related to thread local storage and 
> TLS offsets during runtime and prelinking.
> 
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=1443
> 
> Note, this is simply a workaround and not a final solution as it hasn't been 
> vetted upstream.

Right, I understand that.  But this doesn't really answer the question
"does the workaround break anything else?".

p.




