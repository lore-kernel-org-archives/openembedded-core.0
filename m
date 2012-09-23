Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TFste-0006Yk-Nn
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 22:35:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Sep 2012 13:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,471,1344236400"; d="scan'208";a="148135450"
Received: from unknown (HELO helios.localnet) ([10.252.121.252])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Sep 2012 13:22:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Colin Walters <walters@verbum.org>
Date: Sun, 23 Sep 2012 21:22:32 +0100
Message-ID: <8646478.oESqj5TJhl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <1348429520.4646.16.camel@lenny>
References: <1348339337.4444.229.camel@x121e.pbcl.net>
	<1348429520.4646.16.camel@lenny>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: Remove hardcoded reference to /usr in System V startup script
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
X-List-Received-Date: Sun, 23 Sep 2012 20:35:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 23 September 2012 15:45:20 Colin Walters wrote:
> On Sat, 2012-09-22 at 19:42 +0100, Phil Blundell wrote:
> > -	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
> > +	sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init
> > >${WORKDIR}/dbus-1.init.sh
> Does that actually work?  The variable reference is inside single quotes
> so it won't be expanded by the shell, right?

What is being expanded here at parse time is a bitbake variable rather than a 
shell variable, so it should work fine.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


