Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QuMNL-0005x0-PO
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 12:32:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Aug 2011 03:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39999898"
Received: from unknown (HELO helios.localnet) ([10.255.18.125])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2011 03:27:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Fri, 19 Aug 2011 11:27:48 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
	<1313606497.3630.16.camel@lenovo.internal.reciva.com>
In-Reply-To: <1313606497.3630.16.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201108191127.48228.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Fri, 19 Aug 2011 10:32:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 17 August 2011 19:41:37 Phil Blundell wrote:
> On Wed, 2011-08-17 at 19:37 +0100, Paul Eggleton wrote:
> > +Files in the deploy directory will not be re-created automatically if
> > you +delete them. If you do delete a file, you will need to run:
> > +
> > +  bitbake -c clean TARGET
> > +  bitbake TARGET
> > +
> > +where TARGET is the name of the appropriate package or target e.g.
> > +"virtual/kernel" for the kernel, an image, etc.
> 
> Doesn't it suffice to run "bitbake -f -c deploy TARGET"?

I guess it would, but I'm not sure we really want to be encouraging users to 
use -f.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


