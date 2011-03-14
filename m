Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Pz6La-0004Ry-0M
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 12:54:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2011 04:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,315,1297065600"; d="scan'208";a="402237688"
Received: from unknown (HELO helios.localnet) ([10.255.12.146])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2011 04:51:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: poky@yoctoproject.org
Date: Mon, 14 Mar 2011 11:51:11 +0000
User-Agent: KMail/1.13.5 (Linux/2.6.35-27-generic-pae; KDE/4.6.1; i686; ; )
References: <cover.1299891748.git.sgw@linux.intel.com>
	<4D7ACD9C.3010002@linux.intel.com>
	<20110312023140.GA4829@sakrah.homelinux.org>
In-Reply-To: <20110312023140.GA4829@sakrah.homelinux.org>
MIME-Version: 1.0
Message-Id: <201103141151.12235.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/1] gnu-config make sure we use perl-native
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
X-List-Received-Date: Mon, 14 Mar 2011 11:54:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 12 March 2011 02:31:40 Khem Raj wrote:
> > Back to the drawing board on why the miss-match is occuring in
> > Config.pm then.
> 
> somewhere there is /usr/bin/perl referred may be a cross recipe ?

I've hit this issue this morning, and have filed a bug report:

  http://bugzilla.pokylinux.org/show_bug.cgi?id=866

Not sure if it helps but at least it should be easy to reproduce.

Cheers,
Paul


