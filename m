Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6F25A73B81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:50:45 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 16:50:44 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 3EB7C2800CF;
	Thu, 12 Mar 2015 16:50:44 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Mar 2015 16:50:38 +0100
Message-ID: <1426175440-16095-4-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
References: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 3/5] systemd: remove unnecessary 'protocol=git' from SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 15:50:45 -0000
Content-Type: text/plain

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index d5eed08..e9b3c84 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -29,7 +29,7 @@ SRCREV = "a88abde72169ddc2df77df3fa5bed30725022253"
 
 PV = "219+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master \
            file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
            file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
-- 
1.9.1


