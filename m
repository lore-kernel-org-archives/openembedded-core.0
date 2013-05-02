Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXr9o-0007sT-Jn
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 12:54:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2013 03:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,595,1363158000"; d="scan'208";a="331210071"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2013 03:36:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Phil Blundell <pb@pbcl.net>
Date: Thu, 02 May 2013 11:36:40 +0100
Message-ID: <1572577.Dfl22j8Qhu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1367489790.14512.235.camel@phil-desktop.brightsign>
References: <1360157122-5181-1-git-send-email-Martin.Jansa@gmail.com>
	<1367489790.14512.235.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Subject: Re: [PATCH] insane.bbclass: Add missing R* variables to pkgvarcheck
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
X-List-Received-Date: Thu, 02 May 2013 10:54:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 May 2013 11:16:30 Phil Blundell wrote:
> On Wed, 2013-02-06 at 14:25 +0100, Martin Jansa wrote:
> > * check also RSUGGESTS, RCONFLICTS, RPROVIDES, RREPLACES
> 
> These are already checked by recipe_sanity.bbclass.  There's probably no
> need to check them again here.

recipe_sanity.bbclass doesn't get used by default - I guess you are enabling 
it explicitly? I wonder if we should either (a) move all the recipe checks to 
recipe_sanity.bbclass and enable it by default, or (b) move any currently 
there and not covered by insane.bbclass to insane.bbclass and delete 
recipe_sanity.bbclass.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


