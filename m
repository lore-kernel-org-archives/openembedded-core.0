Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TQKL3-00045m-65
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:54:49 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TQK86-0000r7-Eh
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:41:26 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2012 16:41:25 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350920486.3259.330.camel@phil-desktop>
Mime-Version: 1.0
Subject: Why does glib-2.0 DEPEND on zip?
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
X-List-Received-Date: Mon, 22 Oct 2012 15:54:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It seems that glib-2.0 has had a dependency on zip for as far back as I
could be bothered to trace the history.  However, I couldn't immediately
see any reason why this should be the case.  Does anyone know where this
came from and what purpose it serves?

thanks

p.




