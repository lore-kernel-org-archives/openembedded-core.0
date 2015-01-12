Return-Path: <vincent2014@startigen.fr>
X-Greylist: delayed 1167 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 Jan 2015 22:38:01 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id D1A8860601
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 22:38:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id C03BD535DA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 23:10:25 +0100 (CET)
Received: from mfilter5-d.gandi.net (mfilter5-d.gandi.net [217.70.178.132])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 40B0641C056;
	Mon, 12 Jan 2015 23:10:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter5-d.gandi.net
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by mfilter5-d.gandi.net (mfilter5-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id lMFVHa-Ag1Il; Mon, 12 Jan 2015 23:10:16 +0100 (CET)
X-Originating-IP: 109.190.72.19
Received: from localhost.localdomain (19-72-190-109.dsl.ovh.fr [109.190.72.19])
	(Authenticated sender: vincent.genieux@startigen.fr)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9C23E41C06B;
	Mon, 12 Jan 2015 23:10:16 +0100 (CET)
From: =?UTF-8?q?Vincent=20G=C3=A9nieux?= <vincent2014@startigen.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jan 2015 23:10:01 +0100
Message-Id: <1421100601-30956-1-git-send-email-vincent2014@startigen.fr>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: fix '[[: not found' error message using dash
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
X-List-Received-Date: Mon, 12 Jan 2015 22:38:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is a fix for https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D711=
2
bash specific syntax '[[ test ]]' replaced with '[ test ]'.

Signed-off-by: Vincent G=C3=A9nieux <vincent2014@startigen.fr>
---
 meta/classes/kernel.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 70ed95b..2a6ec34 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -403,7 +403,7 @@ do_strip() {
 			  gawk '{print $1}'`
=20
 		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
-			if [[ "$headers" !=3D *"$str"* ]]; then
+			if [ "$headers" !=3D *"$str"* ]; then
 				bbwarn "Section not found: $str";
 			fi
=20
--=20
1.7.10.4


