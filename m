Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm5s3-0003KN-J4
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:18:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5nz-0002Ak-Eh
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:13:51 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 16:13:47 +0100
In-Reply-To: <EF599739-F511-4465-B5BD-B19F15534482@dominion.thruhere.net>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
	<4E30244A.5030209@windriver.com>
	<1311778937.30326.361.camel@phil-desktop>
	<EF599739-F511-4465-B5BD-B19F15534482@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311779631.30326.366.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
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
X-List-Received-Date: Wed, 27 Jul 2011 15:18:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 17:06 +0200, Koen Kooi wrote:
> From the conversations I had with ARM they implied that it isn't optional for cortex a8/9/15, only neon is (e.g. marvell dove, nvidia tegra2). I haven't seen any black on white contracts saying that, though :)

The spec on the web seems to say fairly clearly that it's optional, at
least in theory.  I guess they might have commercial reasons for not
wanting to sell it without VFP in any given situation.

See:

http://www.arm.com/products/processors/cortex-a/cortex-a5.php?tab=Specifications

for example

p.




