Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 64C9D6EA47
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 12:34:58 +0000 (UTC)
Received: from [212.183.132.39] (helo=[192.168.42.139])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W9wGH-00027E-8f
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Feb 2014 13:34:59 +0100
Message-ID: <1391343549.3068.58.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Sun, 02 Feb 2014 12:19:09 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.8.5-2+b1 
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: This helper script is used only during development and
	is
	not generally useful on the target. Inherit lib_package to move it to a
	different
	package from the libraries. Signed-off-by: Phil Blundell <pb@pbcl.net>
	---
	meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb | 2 +- 1 file changed,
	1 insertion(+), 1 deletion(-) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] lttng-ust: Move lttng-gen-tp to ${PN}-bin
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
X-List-Received-Date: Sun, 02 Feb 2014 12:34:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This helper script is used only during development and is not generally
useful on the target.  Inherit lib_package to move it to a different
package from the libraries.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
index bfcd3b6..5e2b04c 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
                     file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
                     file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
 
-inherit autotools
+inherit autotools lib_package
 
 DEPENDS = "liburcu util-linux"
 
-- 
1.8.4.3




