Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmRTM-0001QY-Io
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:22:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmRPH-00038Q-9u
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:17:47 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 15:17:46 +0100
In-Reply-To: <A64E29D1-A803-4CC3-B7D7-C82C915869D0@kernel.crashing.org>
References: <A64E29D1-A803-4CC3-B7D7-C82C915869D0@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311862667.30326.443.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: lib vs lib64?
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
X-List-Received-Date: Thu, 28 Jul 2011 14:22:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 09:15 -0500, Kumar Gala wrote:
> With recent multilib changes for a pure 64-bit target (no multilib) should things be in /lib or /lib64?

They should be in ${base_libdir}.  Whether that's /lib or /lib64 is a
DISTRO choice I suppose.

p.




