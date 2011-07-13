Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QgxaC-0004IT-0r
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:26:25 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QgxWF-0004Tr-6X
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:22:19 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 12:22:18 +0100
In-Reply-To: <201107131215.26777.paul.eggleton@linux.intel.com>
References: <201107131215.26777.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310556139.2378.3.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: RFC: classes cleanup
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
X-List-Received-Date: Wed, 13 Jul 2011 11:26:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 12:15 +0100, Paul Eggleton wrote:
> * flow-lossage.bbclass - unused, looks obsolete (refers to gcc 3.4)

Agreed, this should be deleted.  It used to be inherited by some of the
gnome recipes (and, in oe.dev, still is by a few) to work around a
compiler bug.  But none of the recipes in oe-core do this, and we don't
ship the affected compiler versions either.

There is one recipe in meta-oe which inherits this class so I guess that
should be fixed before it's deleted.

p.



