Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rryen-0004ZR-Rg
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 22:20:58 +0100
Received: by pbaa13 with SMTP id a13so3458964pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 13:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of steve@sakoman.com designates
	10.68.218.106 as permitted sender) client-ip=10.68.218.106; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of steve@sakoman.com
	designates 10.68.218.106 as permitted sender)
	smtp.mail=steve@sakoman.com
Received: from mr.google.com ([10.68.218.106])
	by 10.68.218.106 with SMTP id pf10mr32302294pbc.36.1327957984236
	(num_hops = 1); Mon, 30 Jan 2012 13:13:04 -0800 (PST)
Received: by 10.68.218.106 with SMTP id pf10mr27079386pbc.36.1327957984138;
	Mon, 30 Jan 2012 13:13:04 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id x8sm49849976pbr.11.2012.01.30.13.13.01
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 13:13:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 13:12:48 -0800
Message-Id: <1327957970-15159-2-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1327957970-15159-1-git-send-email-steve@sakoman.com>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v4 1/3] libksba: add recipe for 1.2.0
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
X-List-Received-Date: Mon, 30 Jan 2012 21:20:58 -0000

Libksba provides an easy API to create and parse X.509 and CMS related objects
and is required for gnupg

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libksba/libksba_1.2.0.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb

diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
new file mode 100644
index 0000000..1fadd48
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Libksba provides an easy API to create and parse X.509 and CMS related objects"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+DEPENDS = "libgpg-error"
+
+inherit autotools binconfig
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "e797f370b69b4dc776499d6a071ae137"
+SRC_URI[sha256sum] = "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f83e48d3e2a3c934b"
-- 
1.7.1



