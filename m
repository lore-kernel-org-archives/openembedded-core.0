Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qgi4B-00012e-5R for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:52:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qgi0N-0003Ja-Rk; Tue, 12 Jul 2011 20:48:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E1C9551.7070803@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<d92f0fcf6f83379a91b23e697cd43ac00078257e.1310425837.git.sgw@linux.intel.com>
	<C1E5A836-FA0D-40EF-9257-11885C935182@dominion.thruhere.net>
	<4E1C9551.7070803@linux.intel.com>
Date: Tue, 12 Jul 2011 19:48:16 +0100
Message-ID: <1310496496.12607.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 08/26] sqlite3: inherit shared_lib class
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
X-List-Received-Date: Tue, 12 Jul 2011 18:52:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 11:41 -0700, Saul Wold wrote:
> The renamed shlibpackaging.bbclass has PACKAGES += "lib${PN}, that an 
> perpend according to my understanding.

No, that's an append.  See the fine (though I say so myself) manual:

http://bitbake.berlios.de/manual/ch02.html#id868981

p.




