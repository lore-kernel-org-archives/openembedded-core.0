Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri8UV-0007E7-2n
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 18:49:39 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri8NP-00018f-Qn
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 18:42:19 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 17:42:19 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325612539.28005.16.camel@phil-desktop>
Mime-Version: 1.0
Subject: weird exports in bitbake.conf
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
X-List-Received-Date: Tue, 03 Jan 2012 17:49:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Does anybody know why these vars are exported (or, in the case of
STAGING_IDLDIR, there at all)?

export QMAKE_MKSPEC_PATH = "${STAGING_DATADIR_NATIVE}/qmake"
export STAGING_SIPDIR = "${STAGING_DATADIR_NATIVE}/sip"
export STAGING_IDLDIR = "${STAGING_DATADIR}/idl"

p.




