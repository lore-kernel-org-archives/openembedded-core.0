Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcGyn-0001B5-2g for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 15:08:25 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcGv5-0000n3-Iz
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 15:04:35 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BF22A833-DD0C-41FB-B9AF-CB871B8A1E7A@dominion.thruhere.net>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
	<1309432642.2551.131.camel@phil-desktop>
	<BF22A833-DD0C-41FB-B9AF-CB871B8A1E7A@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 30 Jun 2011 14:04:34 +0100
Message-ID: <1309439074.2551.135.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 13:08:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 13:24 +0200, Koen Kooi wrote:
> Does it whitelist recipes that inherit task.bbclass? I have tasks used for beagleboard workshops that drag in the native toolchain and headers for the things we need to build against (e.g. opencv, qt).

No.  The existing logic for -dbg packages, which I just reused for this
case, does:

    if not "-dbg" in pkg and not "task-" in pkg and not "-image" in pkg:

but it doesn't have a check for inheritance as such.  If you can suggest
a good way to identify recipes that have inherited task then I'd be
happy to adjust the patch accordingly.

p.



