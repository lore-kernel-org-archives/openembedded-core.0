Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QXWXg-0001cH-S1 for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 12:44:48 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QXWUM-0007rI-IO
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 12:41:22 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308306340.15712.458.camel@rex>
References: <1308219330.25285.4194.camel@phil-desktop>
	<4DFA0824.5030809@gmail.com> <1308234598.25285.4740.camel@phil-desktop>
	<4DFA8F49.8000309@gmail.com> <1308305588.25285.7154.camel@phil-desktop>
	<1308306340.15712.458.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 17 Jun 2011 11:41:21 +0100
Message-ID: <1308307281.25285.7218.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: eglibc testing?
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
X-List-Received-Date: Fri, 17 Jun 2011 10:44:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-17 at 11:25 +0100, Richard Purdie wrote:
> On Fri, 2011-06-17 at 11:13 +0100, Phil Blundell wrote:
> > The thing about nfs is that it's awkward to set up in an automated way.
> 
> The qemu scripts in OE-Core use usermode NFS by default for booting qemu
> images...

Yeah, indeed, and I think the mechanism that they use to do this
supports my assessment of "awkward".  But presumably it does at least
work and I guess that might be the easiest way to do glibc testing as
well.  For gcc testing I think a dedicated qemu harness is probably a
better answer.

p.



