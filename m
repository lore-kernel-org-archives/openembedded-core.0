Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RN9Pc-0008Ss-Sn
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Nov 2011 21:33:52 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RN9Je-0006MT-PC
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Nov 2011 21:27:42 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <505c8c4924bc7fcbea892c32b7144ee3b1b4c81b.1320607825.git.scott.a.garman@intel.com>
References: <cover.1320607825.git.scott.a.garman@intel.com>
	<505c8c4924bc7fcbea892c32b7144ee3b1b4c81b.1320607825.git.scott.a.garman@intel.com>
Date: Sun, 06 Nov 2011 20:25:16 +0000
Message-ID: <1320611116.3041.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/1] useradd.bbclass: fix how RDEPENDS is setup
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
X-List-Received-Date: Sun, 06 Nov 2011 20:33:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-11-06 at 11:31 -0800, Scott Garman wrote:
> Fix bug where only packages named PN included base-passwd in
> RDEPENDS. Also remove shadow requirement, since some targets
> do not use shadow and file ownership can be changed with only
> passwd/group entries.
> 
> This fixes [YOCTO #1727]

Don't you need shadow or some equivalent to provide /sbin/useradd so
that the postinsts work for on-target installs?  Removing shadow from
RDEPENDS does sound like a good plan for the no-package-management case,
but I'm not sure it's safe otherwise.

p.




