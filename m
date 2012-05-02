Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SPhbF-00022Q-HA
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 00:00:41 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SPhRq-00011A-Px
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:50:59 +0200
Message-ID: <1335995396.3181.10.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 02 May 2012 22:49:56 +0100
In-Reply-To: <965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
	<4FA145AD.4070606@windriver.com>
	<965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 22:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-02 at 16:44 +0200, Koen Kooi wrote:
> Op 2 mei 2012, om 16:33 heeft Jason Wessel het volgende geschreven:
> 
> > On 05/02/2012 09:29 AM, Koen Kooi wrote:
> >> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
> >> 
> >>> The user mode NFS server does not get built by default when you are
> >>> using a purely command line driven development environment without SDK
> >>> tools.  In order to accommodate simple test configurations and have
> >>> all the tools built for the minimal validation with qemu-native,
> >>> simply add the dependency to unfs-server-native.
> >> So all images I build for e.g. qemux86 now have an nfs-server? Can we please move settings like that to the specific images?
> >> 
> > 
> > This is part of the simulation environment.  Not all of the run qemu functionality works correctly without this.
> 
> I repeat:  Can we please move settings like that to the specific images?
> 
> I don't need nor want nfs servers in the images I build for qemu. And they work just fine without it.

Surely unfs-server-native isn't going to go in the images, is it?  The
name rather suggests that it is a host-side tool.

The subject line for this patch is misleading, by the way.  Saying
"qemu-native:" at the beginning makes it sound as though you are
changing something about the qemu-native package, which turns out to not
be the case as far as I can tell.

p.




