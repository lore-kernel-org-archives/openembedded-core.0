Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StG4M-0000QR-Vb
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:40:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2012 03:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="170103015"
Received: from unknown (HELO helios.localnet) ([10.252.121.29])
	by orsmga001.jf.intel.com with ESMTP; 23 Jul 2012 03:29:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 11:29:26 +0100
Message-ID: <1532317.TE5c1Jzpbs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <50058C43.7090105@linux.intel.com>
References: <cover.1342011575.git.paul.eggleton@linux.intel.com>
	<50058C43.7090105@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] rootfs generation improvements
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
X-List-Received-Date: Mon, 23 Jul 2012 10:40:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 July 2012 09:01:07 Saul Wold wrote:
> On 07/11/2012 06:04 AM, Paul Eggleton wrote:
> > Fix up handling of "complementary" package installation (dev, dbg, doc,
> > etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.
> > 
> > I've tested this with all backends using buildhistory to examine the
> > changes to the image contents, and compared the lists of files in the
> > SDK-from-image output with the rpm backend. Unfortunately it does
> > increase the do_rootfs time slightly; one of my next tasks will be to
> > try to do some optimisation here.
> > 
> > The following changes since commit 
b76a7bc8dcb7aed7d6f026e77a226837004c50af:
> >    libgomp: add libgomp (openmp) library, and build for powerpc targets by
> >    default (2012-07-11 11:35:16 +0100)> 
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib paule/rootfs
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
> >    paule/rootfs> 
> > Paul Eggleton (3):
> >    classes/rootfs_deb: use more reliable check for package existence
> 
> Merged this one into OE-Core
> 
> >    Rework installation of dev, dbg, doc, and locale packages
> >    classes/image: add staticdev-pkgs IMAGE_FEATURES feature
> 
> There was an issue with either one or both of these during build
> testing, I know you are looking into it.

Indeed, this triggered some kind of environment size limit and has exposed a 
few other lurking issues as well. It also failed to handle debian package 
renaming. I have a reworked and extended patchset coming, please disregard the 
unmerged part of this one.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


