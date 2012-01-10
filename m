Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RkPGL-0000gk-Fm
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 01:08:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jan 2012 16:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94074460"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by azsmga001.ch.intel.com with ESMTP; 09 Jan 2012 16:00:37 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZAN=3CBOGDCAPHsMFd_JKLdLoK3kzX16pNt3110X32G-gqw@mail.gmail.com>
References: <cover.1325903501.git.tom.zanussi@intel.com>
	<CABcZAN=3CBOGDCAPHsMFd_JKLdLoK3kzX16pNt3110X32G-gqw@mail.gmail.com>
Date: Mon, 09 Jan 2012 18:00:33 -0600
Message-ID: <1326153633.2413.10.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: paul.eggleton@linux.intel.com, philb@gnu.org
Subject: Re: [PATCH 0/5] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE, v3
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
X-List-Received-Date: Tue, 10 Jan 2012 00:08:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-09 at 16:50 -0700, Chris Larson wrote:
> On Fri, Jan 6, 2012 at 7:34 PM,  <tom.zanussi@intel.com> wrote:
> > Possible values for LICENSE_FLAGS could be:
> > - Binary - provides some kind of binary with no source
> > - Patent - provides a potential infringing item, that some may not want
> > - Commercial - include recipes that may have commercial T&C
> > - Commercial_${PN} - commercial licenses specific to ${PN}
> > - License_${PN} - include a recipe that has a specific license
> >                 - maybe similar or different than Commercial_${PN}
> 
> It's a minor gripe really, but why the capitalization here? Other
> similar variables which define lists of words to control behavior
> (e.g. MACHINE_FEATURES, DISTRO_FEATURES, IMAGE_FEATURES, and others)
> have an all-lowercase convention. I think this should behave
> similarly, for consistency.

Right, the cover letter quotes the original e-mail that does have them
with caps.  The patches themselves use all-lowercase, though.

Thanks,

Tom



