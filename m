Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TAdnp-00019W-20
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 11:27:41 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TAdbm-0007Xs-Un
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 11:15:15 +0200
Message-ID: <1347181988.4396.256.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 09 Sep 2012 10:13:08 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] perl-native: PROVIDE libmodule-build-perl-native for consistency with non-native perl
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
X-List-Received-Date: Sun, 09 Sep 2012 09:27:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This module is, apparently, included in the standard perl distribution
since 5.10.1 or so.  The regular perl recipe has had this PROVIDES for a
while but it seems to have been overlooked in the native version.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-devtools/perl/perl-native_5.14.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
index df8f058..9f6a077 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
@@ -9,6 +9,9 @@ PR = "r1"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 
+# 5.10.1 has Module::Build built-in
+PROVIDES += "libmodule-build-perl-native"
+
 SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
-- 
1.7.9





