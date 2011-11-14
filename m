Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RPw7t-0003RY-1C
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 13:59:05 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RPw1l-0004cY-W5
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 13:52:46 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 12:52:44 +0000
In-Reply-To: <1321274982.26881.55.camel@ted>
References: <1321274982.26881.55.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321275166.29435.21.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] base-passwd: Fix the broken preinst/postinstall
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
X-List-Received-Date: Mon, 14 Nov 2011 12:59:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 12:49 +0000, Richard Purdie wrote:
> The preinst accesses file which may not yet have been unpacked.
> The postinst is too late for the creation of these files
> for at least the opkg backend.
> 
> This patch therefore encodes the file contents into the preinst,
> resolving the various issues once and for all.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

If you're going to do that (which does look reasonable) then you might
as well stop the package from shipping passwd.master and group.master at
all.  I don't think anything else uses those files so they're just
wasting space at the moment.

p.




