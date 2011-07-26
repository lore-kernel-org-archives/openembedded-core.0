Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QlkBC-0008Ud-8F
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:08:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2011 09:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="30289300"
Received: from unknown (HELO [10.255.14.155]) ([10.255.14.155])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2011 09:03:59 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 09:03:53 -0700
In-Reply-To: <1311692004.2344.259.camel@rex>
References: <cover.1311653945.git.josh@linux.intel.com>
	<ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
	<1311692004.2344.259.camel@rex>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1311696239.2314.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] classes/image_types: IMAGE_TYPES was missing some entries
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
X-List-Received-Date: Tue, 26 Jul 2011 16:08:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 15:53 +0100, Richard Purdie wrote:
> On Mon, 2011-07-25 at 21:21 -0700, Joshua Lock wrote:
> > Some of these entries are required by the GUI to enable the expected workflow
> > of the ADT, namely a compressed rootfs image.
> > 
> > Signed-off-by: Joshua Lock <josh@linux.intel.com>
> > ---
> >  meta/classes/image_types.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> I've merged this since its obviously correct, we probably do need to
> think about better ways to generate it though as Tom mentions...

Agreed, I'll add this to my to do list.

Thanks,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



