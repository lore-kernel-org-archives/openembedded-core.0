Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJORC-0000M7-UE
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:52:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJOEe-0004uR-80; Wed, 03 Oct 2012 14:39:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 03 Oct 2012 13:39:30 +0100
In-Reply-To: <1349263162.18301.28.camel@ted>
References: <1349259854.32611.106.camel@phil-desktop>
	<20121003103141.GA21043@jama.jama.net>
	<1349261089.32611.115.camel@phil-desktop>
	<1349263162.18301.28.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349267972.32611.121.camel@phil-desktop>
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 12:52:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 12:19 +0100, Richard Purdie wrote:
> Am I right in thinking this is also a marginal help to 'security' since
> if the .text segment is loaded read only, it becomes slightly harder for
> certain kinds of overflow attacks to work?

Possibly a marginal help, though (for glibc at least) the dynamic linker
will restore the original protection on .text once the relocations have
been applied, so the window of time during which you could mount an
attack based on the writeable .text region will be fairly small.  But in
principle you're right, for best security you don't want to have any
regions which are both writeable and executable.

p.




