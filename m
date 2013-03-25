Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UJwZT-000487-Hr
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 02:51:37 +0100
Received: from mail630.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 9A470FF8B6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 02:12:29 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Mar 2013 02:55:12 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (mail@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 25 Mar 2013 02:55:11 +0200
Received: from b5-vm-mint0.betafive.co.uk (b5-vm-mint0.betafive.co.uk
	[192.168.0.100])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 549731607E0;
	Mon, 25 Mar 2013 00:54:41 +0000 (GMT)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Mon, 25 Mar 2013 00:55:07 +0000
Message-Id: <1364172907-14541-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1364172907-14541-1-git-send-email-paul@paulbarker.me.uk>
References: <1364172907-14541-1-git-send-email-paul@paulbarker.me.uk>
X-Ovh-Tracer-Id: 11560458768870115778
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrieejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrieejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [PATCH 2/2] gnupg: Added update-alternatives entry for gpgv
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
X-List-Received-Date: Mon, 25 Mar 2013 01:51:38 -0000

Added update-alternatives entry linking '/usr/bin/gpgv' to 'gpgv2'. This is
required to allow apt-get to verify a signed repository.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
index 2322a9e..63f08cb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -25,7 +25,10 @@ EXTRA_OECONF = "--disable-ldap \
                 --with-readline=${STAGING_LIBDIR}/.. \
                "
 
-ALTERNATIVE_gnupg = "gpg"
+ALTERNATIVE_gnupg = "gpg gpgv"
 ALTERNATIVE_TARGET[gpg] = "${bindir}/gpg2"
 ALTERNATIVE_LINK_NAME[gpg] = "${bindir}/gpg"
 ALTERNATIVE_PRIORITY[gpg] = "100"
+ALTERNATIVE_TARGET[gpgv] = "${bindir}/gpgv2"
+ALTERNATIVE_LINK_NAME[gpgv] = "${bindir}/gpgv"
+ALTERNATIVE_PRIORITY[gpgv] = "100"
-- 
1.7.10.4



