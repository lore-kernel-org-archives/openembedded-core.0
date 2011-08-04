Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qoz6x-0003C1-6w for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:41:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74Eb02i002709
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 15:37:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02492-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2011 15:36:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74Eapph002703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 15:36:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312401799.4007.3.camel@lenovo.internal.reciva.com>
References: <1312386236-11826-1-git-send-email-galak@kernel.crashing.org>
	<1312401799.4007.3.camel@lenovo.internal.reciva.com>
Date: Thu, 04 Aug 2011 15:36:31 +0100
Message-ID: <1312468591.2344.751.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tcl: Fix packaging of platform independent files
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
X-List-Received-Date: Thu, 04 Aug 2011 14:41:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 21:03 +0100, Phil Blundell wrote:
> On Wed, 2011-08-03 at 10:43 -0500, Kumar Gala wrote:
> > Tcl's doesn't utilize ${baselib} for platform independent files but
> > defines it as follows:
> > 
> > TCL_LIBRARY             = $(prefix)/lib/tcl$(VERSION)
> > 
> > Match that so if ${baselib} is not just /lib things work properly.
> > 
> > Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > ---
> 
> Even better would be bashing tcl so that it puts its bits in ${datadir}
> where they belong. :-)  But your patch is fine though.

Agreed, this would be the ideal solution...

Cheers,

Richard



