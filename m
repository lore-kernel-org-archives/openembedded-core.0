Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjWAm-0000d5-Oz
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:46:44 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjW6q-0003Ae-Oh
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:42:40 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 13:42:39 +0100
In-Reply-To: <5A3CA715-DE17-48DC-A7DC-8063B44942E9@freescale.com>
References: <5A3CA715-DE17-48DC-A7DC-8063B44942E9@freescale.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311165760.30326.66.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: sudo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 12:46:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 07:16 -0500, Kumar Gala wrote:
> Trying to build a powerpc64 target rootfs and I'm getting the following build failures on sudo.  Wondering if anyone has seen anything similar:
> 
> http://pastebin.com/MeqPn46Q

There was a bug like that a few months ago which was caused by broken
siteinfo files.  Presumably your tree is fairly up to date, but it
sounds like you have a similar kind of issue.  You'll need to
investigate why configure thinks you don't need -ldl.

p.




