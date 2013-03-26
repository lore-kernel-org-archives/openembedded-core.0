Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UKXCR-0006HA-4R
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 17:58:21 +0100
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 4B44720815
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 12:41:17 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Tue, 26 Mar 2013 12:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version; s=smtpout; bh=5XLPamd5RXUjuu7MpW6yDp50
	Yzk=; b=EsfsRerVIL0JgGBa8cIh9Ek6DMQsj062YlQ93t3K8YY7YBQ9IBfX62nV
	VHvDApQt+Aerm0ySTl8hkgBrRlRjQ6YlQ0OWcN5yZMSAjWRQ4JfHE17c78IEkjKM
	/jf8Ex/9p2VBl47Z1UlHIROa3sk4pxtYSJMupMhCR7Jx/1YMKv8=
X-Sasl-enc: zgrhi/LT/4G5M0oSPEovoDB0VErNqOjjvoAsmMEw0lBn 1364316077
Received: from [10.193.21.84] (unknown [66.187.233.207])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0200BC80007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 12:41:16 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 12:41:16 -0400
Message-ID: <1364316076.15658.43.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Subject: [PATCH] nspr: Also update nspr.pc to 4.9.5
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
X-List-Received-Date: Tue, 26 Mar 2013 16:58:31 -0000
X-Groupsio-MsgNum: 37082
Content-Type: multipart/mixed; boundary="=-v8jJUjzkQtABVDa0YnsT"

--=-v8jJUjzkQtABVDa0YnsT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Earlier commits bumped the upstream version, but we need to update
our copy of the pkg-config file too.

(It'd probably be better to generate this at build time, otherwise
 this will be a trap people continually fall into)

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-support/nspr/files/nspr.pc.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


--=-v8jJUjzkQtABVDa0YnsT
Content-Disposition: attachment; filename="0001-nspr-Also-update-nspr.pc-to-4.9.5.patch"
Content-Type: text/x-patch; name="0001-nspr-Also-update-nspr.pc-to-4.9.5.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From bd782ec46070a0c05ef0c5b13ef7d2844dd87690 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Tue, 26 Mar 2013 11:57:27 -0400
Subject: [PATCH] nspr: Also update nspr.pc to 4.9.5

Earlier commits bumped the upstream version, but we need to update
our copy of the pkg-config file too.

(It'd probably be better to generate this at build time, otherwise
 this will be a trap people continually fall into)

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-support/nspr/files/nspr.pc.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/nspr/files/nspr.pc.in b/meta/recipes-support/nspr/files/nspr.pc.in
index e7af08d..c37d0bc 100644
--- a/meta/recipes-support/nspr/files/nspr.pc.in
+++ b/meta/recipes-support/nspr/files/nspr.pc.in
@@ -6,6 +6,6 @@ includedir=OEINCDIR
 
 Name: NSPR
 Description: The Netscape Portable Runtime
-Version: 4.8.9
+Version: 4.9.5
 Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
 Cflags:
-- 
1.7.1


--=-v8jJUjzkQtABVDa0YnsT--
