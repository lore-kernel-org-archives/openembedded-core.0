Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhkDQ-0000Z3-C4
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:22:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qhk9Z-0007IU-St
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:18:10 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 16:18:09 +0100
In-Reply-To: <4E2057F8.5090100@mentor.com>
References: <4E1F9F59.5050305@mentor.com> <4E1FAC5A.2090308@windriver.com>
	<1310740753.2350.0.camel@scimitar> <4E2051FB.8080006@windriver.com>
	<4E2057F8.5090100@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310743089.30326.6.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 15:22:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-15 at 08:08 -0700, Tom Rini wrote:
> IIRC, it's somewhere between really tricky and just not possible to
> nicely shove chrpath-native as a dependency into the graph. 

What's the difficulty with that?  Assuming that we're talking about
changing rpaths in the sysroot, obviously it wouldn't work for anything
that gets staged before chrpath (i.e. any of its own dependencies) but
apart from that I can't think of any obvious reason why it couldn't be
done.  Luckily chrpath doesn't depend on anything very much, just the
usual autotools stack, so it doesn't seem like there are very many
recipes that would have to be chrpath-inhibited.

(Of course, chrpath itself has quite a high suckage factor and maybe we
should get/make a better tool while we're worrying about this stuff.)

p.




