Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvYlI-0004sp-GJ
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:30:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2012 10:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115943408"
Received: from unknown (HELO helios.localnet) ([10.252.123.13])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2012 10:22:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 09 Feb 2012 18:22:20 +0000
Message-ID: <1556143.JbHgubmlpB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <8E1320A1-3A67-47DB-96FD-8A75155AFA12@dominion.thruhere.net>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<eb604fbfbe547c3a7a4505eeab54f11ee00c0874.1328809777.git.paul.eggleton@linux.intel.com>
	<8E1320A1-3A67-47DB-96FD-8A75155AFA12@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC PATCH 2/4] qt4: build qmake for the target
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
X-List-Received-Date: Thu, 09 Feb 2012 18:30:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 February 2012 19:18:19 Koen Kooi wrote:
> Op 9 feb. 2012, om 18:57 heeft Paul Eggleton het volgende geschreven:
> > +++ b/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
> > @@ -0,0 +1,40 @@
> > +qmake: fix source file references in qmake.pri
> > +
> > +Fix duplicate entries in SOURCES and HEADERS, and fix the source file
> > +list for the split of qlocale.cpp.
> > +
> > +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > +
> > +Upstream-Status: Pending
> 
> Since qt upstream is git and you're including a SOB can you please add the
> git-am'able version of the patches? That will also give us some more info
> on how old the patch is since git is really bad at tracking renames.

Ah yes, I recall you asking for this last time as well. Once I've heard from 
more people testing this I'll redo the patch against Qt git.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


