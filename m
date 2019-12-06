Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9557F989
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:06:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TtBN5m22z3Q
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 14:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575637565;
	bh=dMW4qya7LYQuIZRPdew17gD77sogp0YBON33a5licSo=;
	h=From:To:Subject:Date:From;
	b=pMsujkyIbV9CgbLUI9MZetCQvVj0dVbNQP5zn85+BY/Jx/+BY+ENma6D6AFFbrSE+
	7M87fUs3LYQn2AJszpmy+HJNpl/dND0/BA5z1RDw89vPop45l4SI1MmyknMAIdP3kB
	H6/0YBq252LWf0+yt76b1FrkyIgR1nQWj4X+Wxkkyg3okQ8IFunbo6y6SxPVtHU3N5
	nYY5s0d50G34B5aVgT3xqielO1NbAOT5chDQq6evpgvVIQ9Wa4Vbvd2trbDX+tCVHk
	tjS6FR3S7rs4l02OX9+UmrNAPUoI/3PgX47ArY8Lrhu1qq6v+oX9P+AUXnGP6m+clS
	M+zJi29AVXvozOiIvzAkVA0xq8kglXiYKBWzDQuj3F3q9S6WFiruFaFo1ktY++pILq
	U20nrUg0EYc6EojaLBtmvCpQiNOn3c4i3w7DOaWyBtefMUSNVr7PGHxjWf8WrAKRe6
	di82WDCi3LAQK2gYN61flSpODXPsgxaygEfszrAu4Z+7QfL5xy+Ocqj0Y/xwnclbri
	63L35k2jvTP8ktB/tziVNI9cqnuH8jPlr36f5mwBRzK9BMwy05zjH2QUl0mY1E1oJX
	LmOI5iVGaUl0Jn2QZ78Twfj80ZBPH25rOqE3xMs0dYwRLV9jd5Mg53a678pJdOpsqF
	Rg3rHkhzJjyVLLQCD1fqal4E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 15:06:03 +0200
Message-Id: <20191206130603.3719-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] glib: Whitelist CVE-2019-12450
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
X-List-Received-Date: Fri, 06 Dec 2019 13:06:04 -0000

Fixed in 2.60.4, but CPE data is outdated.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
index 740473719d..5aefa6ad8b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
@@ -23,3 +23,6 @@ SRC_URI_append_class-target = " file://glib-meson.cross"
 
 SRC_URI[md5sum] = "f036f78a7fca330d9f7d939fcf794bde"
 SRC_URI[sha256sum] = "8b12c0af569afd3b71200556ad751bad4cf4bf7bc4b5f880638459a42ca86310"
+
+# Fixed in 2.60.4, but CPE data is outdated
+CVE_CHECK_WHITELIST += "CVE-2019-12450"
-- 
2.17.1


