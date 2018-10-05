Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAB6979A5E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 20:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8F457183C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id gTKQpcw6Yayc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E980E18530
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7F301A096
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB1061A097
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BF00B202F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w95KjvAO003737
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2018 22:45:57 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w95KjvOe003736
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Oct 2018 22:45:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 22:45:55 +0200
Message-Id: <20181005204556.3678-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181005204556.3678-1-pkj@axis.com>
References: <20181005204556.3678-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/4] glib-2.0: Include the complete license information for pcre
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
X-List-Received-Date: Fri, 05 Oct 2018 20:45:59 -0000

For some reason, the copyright part was left out of the license
information for pcre in LIC_FILES_CHKSUM, preventing it from being
used in, e.g., documentation to satisfy the requirements of the
license.

Also drop pcre/COPYING from LIC_FILES_CHKSUM as it does not really
contain any licensing information, it only refers to a LICENSE file
that does not exist.

License-Update: Include the complete license information for pcre
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6dab19283c..ad4f2aebd7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://gmodule/gmodule.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
-                    file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
-                    file://glib/pcre/pcre.h;beginline=11;endline=35;md5=de27f2bf633d20a2b7af0b1983423283 \
+                    file://glib/pcre/pcre.h;beginline=8;endline=36;md5=3e2977dae4ad05217f58c446237298fc \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
-- 
2.12.0


