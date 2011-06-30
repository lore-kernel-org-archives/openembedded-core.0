Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcLZ7-000406-SS for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 20:02:13 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcLVY-0000wM-EO
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 19:58:32 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <DCEDC47D-0ECA-4433-B67E-28B6697F0081@dominion.thruhere.net>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com> <4E0C9E14.4040209@mentor.com>
	<DCEDC47D-0ECA-4433-B67E-28B6697F0081@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 18:58:26 +0100
Message-ID: <1309456706.3106.62.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Tune files and knobs to turn
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
X-List-Received-Date: Thu, 30 Jun 2011 18:02:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 19:41 +0200, Koen Kooi wrote:
> Real world experience with gcc 4.3 and 4.5 has shown that gcc is
> shockingly bad at vectorizing for NEON, so you need this unbreak-me
> option to avoid slowdowns. It might be less bad on cortex-a9 or a15,
> but for A8 not vectorizing is a net win.

What does it do wrong?  I'm slightly surprised that not making any
attempt to vectorize at all is better than trying to vectorize and not
doing very well at it.

p.




