Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMI6K-0000jU-Au for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 13:06:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMHbT-0004Wd-LG
	for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 12:34:15 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.linuxtogo.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 11:34:14 +0100
Message-ID: <1305628454.2429.187.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] guilt-native: eliminate hardcoded "/usr" in do_install
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
X-List-Received-Date: Tue, 17 May 2011 11:06:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For some reason guilt-native seems to have gone out of its way to refer explicitly to /usr, which breaks on micro. 
Let's use ${prefix} instead.

---
 meta/recipes-devtools/guilt/guilt-native_0.33.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 6261330..7d0246e 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -28,5 +28,5 @@ do_compile() {
 }

 do_install() {
-       oe_runmake PREFIX=${D}/${base_prefix}/usr install
+       oe_runmake PREFIX=${D}/${prefix} install
 }





