Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qf8EI-0000ES-8f
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 12:24:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2011 03:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,498,1304319600"; d="scan'208";a="24350940"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2011 03:20:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Fri, 8 Jul 2011 11:20:17 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107081103.37637.paul.eggleton@linux.intel.com>
	<1310119932.18564.15.camel@lenovo.internal.reciva.com>
In-Reply-To: <1310119932.18564.15.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201107081120.17232.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 10:24:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 11:12:12 Phil Blundell wrote:
> If OLDEST_KERNEL is set to a value that's too new then the failure you
> get is anything but subtle: glibc will just print "kernel too old" and
> exit.

OK, I had just assumed you would just get errors about missing syscalls, good 
to know that it would be more obvious than that.

> I guess we could enhance that message to refer directly to
> OLDEST_KERNEL to make it a bit more obvious what you need to do.
> Also, we could teach kernel.bbclass to issue a diagnostic if you try to
> build a kernel that's older than OLDEST_KERNEL.

These sound like good ideas. I'll add them to my todo list to have a look at 
if nobody else gets there first.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


