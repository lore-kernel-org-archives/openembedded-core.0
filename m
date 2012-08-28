Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T6OPK-0002Iv-11
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 18:12:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2012 09:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,327,1344236400"; d="scan'208";a="214648906"
Received: from unknown (HELO helios.localnet) ([10.252.121.154])
	by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2012 09:00:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Aug 2012 17:00:34 +0100
Message-ID: <1396466.sE1axuRxND@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <04FC3EA8-F091-40C2-8106-C288056FB189@dominion.thruhere.net>
References: <cover.1338603853.git.kergoth@gmail.com>
	<acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
	<04FC3EA8-F091-40C2-8106-C288056FB189@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] task-core-basic: drop portmap
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
X-List-Received-Date: Tue, 28 Aug 2012 16:12:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 August 2012 17:22:02 Koen Kooi wrote:
> Op 2 jun. 2012, om 04:24 heeft Christopher Larson <kergoth@gmail.com> het 
volgende geschreven:
> > Both rpcbind and portmap are RPC port mappers. Having both is redundant.
> > Chose rpcbind over portmap as rpcbind supports ipv6, nfs4, and builds
> > without the glibc rpc headers, which have been obsoleted in glibc 2.14.
> > 
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > ---
> > meta/recipes-extended/tasks/task-core-basic.bb |    1 -
> > 1 file changed, 1 deletion(-)
> > 
> > diff --git a/meta/recipes-extended/tasks/task-core-basic.bb
> > b/meta/recipes-extended/tasks/task-core-basic.bb index 8bab0db..a810d37
> > 100644
> > --- a/meta/recipes-extended/tasks/task-core-basic.bb
> > +++ b/meta/recipes-extended/tasks/task-core-basic.bb
> > @@ -148,7 +148,6 @@ RDEPENDS_task-core-sys-services = "\
> > 
> >     nfs-utils \
> >     pciutils \
> >     libpcre \
> > 
> > -    portmap \
> > 
> >     rpcbind \
> >     sysfsutils \
> >     tcp-wrappers \
> 
> Missing PR bump

The patch you're replying to was posted ages ago and has already been 
merged...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


