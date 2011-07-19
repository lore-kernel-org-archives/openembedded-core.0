Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjCjW-0004Sj-H0
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:01:18 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjCfb-0002Qf-FU
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 17:57:15 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2011 16:57:14 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311091035.30326.36.camel@phil-desktop>
Mime-Version: 1.0
Subject: libgcc_s.so.1 not stripped
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
X-List-Received-Date: Tue, 19 Jul 2011 16:01:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I noticed this morning that libgcc_s.so.1 is no longer being stripped
correctly.  I'm not quite sure at what point this started happening.
From a first inspection the problem seems to be that it's losing the +x
bit in the mode which is causing package.bbclass to think it isn't an
executable that requires stripping.

p.




