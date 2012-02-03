Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RtS8J-0002sz-KW
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 00:01:31 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RtS0d-0007hv-UC
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 23:53:36 +0100
Message-ID: <1328309603.2716.197.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 22:53:23 +0000
In-Reply-To: <7D46E86EC0A8354091174257B2FED10127649BE9@DFLE34.ent.ti.com>
References: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
	<1328305049-18696-2-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED10127649BE9@DFLE34.ent.ti.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] u-boot inc: update inc file for newer u-boot versions
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
X-List-Received-Date: Fri, 03 Feb 2012 23:01:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-03 at 21:43 +0000, Maupin, Chase wrote:
> > +# no gnu_hash in uboot.bin, by design, so skip QA
> > +INSANE_SKIP_${PN} = True
> 
> BTW, I believe I can remove this line since I didn't see any QA warnings when building without it.  I have seen versions of u-boot.inc that use the INSANE_SKIP and versions that don't so I'm not sure what the right thing is here.

If uboot.bin is what the name suggests (i.e. a straight binary file
rather than an ELF image) then the GNU_HASH check will be inoperative
anyway and there is no need to skip it.

I'm also not entirely sure that setting INSANE_SKIP_xx to "True" is
going to have any useful effect.  If I remember right the value of that
variable is meant to be a list of checks to skip and I don't think True
is going to match against anything there.

So, all in all I think you are probably correct that this line can be
safely deleted. 

p.




