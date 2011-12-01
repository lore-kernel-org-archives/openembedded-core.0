Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RW5oJ-00059D-Gd
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:32:19 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RW5hs-0005AJ-E8
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:25:40 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 12:25:39 +0000
In-Reply-To: <4ED77075.5090704@dresearch-fe.de>
References: <4ED77075.5090704@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322742340.26081.229.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: layer priorities?
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
X-List-Received-Date: Thu, 01 Dec 2011 12:32:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 13:17 +0100, Steffen Sledz wrote:
> Just a few short questions about the layer priorities. May be there is an faq answering them, but i could not find it.
> 
> What is the policy assigning a priority to a layer?
> 
> Do multiple layers with the same priority are allowed? How is this handled?
> 
> Would it make sense to add an *Layer prio* column to <http://www.openembedded.org/wiki/LayerIndex>?

We had a bit of discussion around this a few months ago.  See the
longish thread at:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007387.html

My view remains that the right place to be setting the priority is in
bblayers.conf rather than in the layer itself, but there didn't seem to
be any clear consensus last time it was discussed.

Multiple layers with the same priority will have undefined results if
they overlap.  You probably don't want to allow that situation to occur.

p.




