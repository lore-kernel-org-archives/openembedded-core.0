Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm5gr-0002u0-Gu
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:06:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5cn-0002A7-Bs
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:02:17 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 16:02:16 +0100
In-Reply-To: <4E30244A.5030209@windriver.com>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
	<4E30244A.5030209@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311778937.30326.361.camel@phil-desktop>
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
X-List-Received-Date: Wed, 27 Jul 2011 15:06:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 09:44 -0500, Mark Hatle wrote:
> On 7/27/11 9:29 AM, Richard Purdie wrote:
> > This means if PKGARCHCOMPAT_ARMV7A is set, "armv7a-vfp-neon" is renamed
> > to be "armv7a". Other compatibility mappings can be added as needed.
> 
> There are multiple armv7 cores without neon...  I think there might even be one
> or two custom cores w/o VFP.  (Yes I know this violates the core spec from ARM,
> but people do that all of the time.)

Which spec are you thinking of?  As far as I know, VFP has always been
optional for both ARM11 and Cortex.

p.




