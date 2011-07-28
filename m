Received: from na3sys009aog107.obsmtp.com ([74.125.149.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmNzw-0004XC-B9
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 12:39:28 +0200
Received: from mail-gx0-f172.google.com ([209.85.161.172]) (using TLSv1) by
	na3sys009aob107.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjE7XhJ6xa5HLOpwxBnqscKCxPWteJRp@postini.com;
	Thu, 28 Jul 2011 03:35:11 PDT
Received: by mail-gx0-f172.google.com with SMTP id 19so1694634gxk.3
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yvU60bjl8FKWUcmhn9B45c/IssYhAx4n/E45fbFTyzQ=;
	b=qK8JfCb6JhFi3mfRgLDE4RnCxYmJ4JbaSAgcvSyHY7f45DoTJEgxs8pFx9d3qx0LgT
	4X0necHyn3vJUbE7bK9884XhS2m7CgCNHIapQiaeAzSZOtvPEnssOsMIzph13F2NDxMe
	wBquNRvZfFT4DWevyOdlAs/c2VJexocrPsvYw=
Received: by 10.90.40.33 with SMTP id n33mr407993agn.103.1311824339436;
	Wed, 27 Jul 2011 20:38:59 -0700 (PDT)
Received: from shaaah.barrettxplore.com ([67.201.170.156])
	by mx.google.com with ESMTPS id i33sm395896anm.50.2011.07.27.20.38.53
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 20:38:58 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Signed-off-by: Tom Rini" <tom_rini@mentor.com>
Date: Wed, 27 Jul 2011 23:38:15 -0400
Message-Id: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@openembedded.org
Subject: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 10:39:28 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Signed-off-by: Tom Rini <tom_rini@mentor.com>

This recipe is a port of recipes/raptor/raptor_1.4.21.bb from
git://git.openembedded.org/openembedded, commits
01e8e9f325d8d251e852e7a5704b5fe50880e1ad 'raptor: added recipe' and
f1d24b5a986233f869364eb109476f5184e76d10 'raptor: add libxml2 DEPENDS'

The recipe was modified by adding a LIC_FILES_CHKSUM assignment.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---

Not tested in the oe-core + meta-openembedded et. al. layers. We are not
ready yet to migrate from the 2011.03-maintenance branch. This patch is
proposed for inclusion in oe-core so that we can meet the new policy
requirements for inclusion in the 2011.03-maintenance branch and submit
a subsequent pull-request for commit
f1d24b5a986233f869364eb109476f5184e76d10 raptor: add libxml2 DEPENDS
---
 meta/recipes-support/raptor/raptor_1.4.21.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/raptor/raptor_1.4.21.bb

diff --git a/meta/recipes-support/raptor/raptor_1.4.21.bb b/meta/recipes-support/raptor/raptor_1.4.21.bb
new file mode 100644
index 0000000..84fa69e
--- /dev/null
+++ b/meta/recipes-support/raptor/raptor_1.4.21.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Raptor RDF Parser Library"
+SECTION = "libs"
+HOMEPAGE = "http://librdf.org/raptor/"
+LICENSE = "LGPL 2.1/GPL 2/Apache 2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+PR = "r0"
+SRC_URI = "http://download.librdf.org/source/raptor-${PV}.tar.gz"
+DEPENDS = "libxml2"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "992061488af7a9e2d933df6b694bb876"
+SRC_URI[sha256sum] = "db3172d6f3c432623ed87d7d609161973d2f7098e3d2233d0702fbcc22cfd8ca"
-- 
1.7.4.1



