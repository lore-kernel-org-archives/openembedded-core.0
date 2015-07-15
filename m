Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id DF266607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:04:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A37336001AA
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 15:04:13 +0100
Message-Id: <cover.1436968899.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [Fido PATCH 0/2] Fido OpenSSL Upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jul 2015 14:04:41 -0000

Please merge the two changes in the joshuagl/openssl branch of the openembedded-core-contrib
repository into the fido branch.

These changes merge OpenSSL updates from master to fix recently published vulnerabilities.

Regards,

Joshua

The following changes since commit 0a849983d066cd1beee64cef94b2c8421275b45c:

  unzip: drop 12-cve-2014-9636-test-compr-eb.patch (2015-07-08 13:06:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/openssl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/openssl

Jan Wetter (1):
  openssl: upgrade to 1.0.2d

Roy Li (1):
  openssl: upgrade to 1.0.2c

 .../openssl/openssl/debian/c_rehash-compat.patch   | 22 ++++++--------
 .../openssl/openssl/openssl-fix-link.patch         | 35 ----------------------
 .../{openssl_1.0.2a.bb => openssl_1.0.2d.bb}       |  5 ++--
 3 files changed, 11 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2a.bb => openssl_1.0.2d.bb} (90%)

-- 
2.1.4


