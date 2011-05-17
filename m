Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMJQS-0002O7-11 for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 14:31:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMJNg-0004Yq-Tg
	for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 14:28:09 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.linuxtogo.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 13:28:07 +0100
Message-ID: <1305635287.2429.195.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [patch] update-rc.d: point SRC_URI to new devel repo
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
X-List-Received-Date: Tue, 17 May 2011 12:31:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

handhelds.org cvs is down and doesn't seem to be coming back.
update-rc.d now has a new upstream home, point SRC_URI to that.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index accb385..8ba6644 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb

 PR = "r3"

-SRC_URI = "${HANDHELDS_CVS};module=apps/update-rc.d;tag=r0_7 \
+SRC_URI = "git://github.com/philb/update-rc.d.git;tag=update-rc.d_${PV};protocol=git \
            file://add-verbose.patch;apply=yes"





