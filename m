Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THDJ6-0006Z5-Cn
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 14:35:08 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1THD6g-0007tQ-Re
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 14:22:18 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 13:22:17 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348748538.32611.18.camel@phil-desktop>
Mime-Version: 1.0
Subject: overuse of bitbake flags considered harmful
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
X-List-Received-Date: Thu, 27 Sep 2012 12:35:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was mildly amused to discover, the other day, that the output of
"bitbake -e rpm | grep PACKAGECONFIG" is not quite as one might na=C3=AFvel=
y
expect. =20

I guess the right response to this is perhaps that bitbake ought
nowadays to find some other way to store its own internal state, since
the idiom of using flags is pretty well established in oe-core.

p.




