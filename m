Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 197AE71633
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 08:38:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0F8chtE009494
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 00:38:43 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 15 Jan 2015 00:38:42 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 16:38:36 +0800
Message-ID: <1421311116-20022-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] openssh: deliver ssh-copy-id
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
X-List-Received-Date: Thu, 15 Jan 2015 08:38:46 -0000
Content-Type: text/plain

Deliver script ssh-copy-id from openssh which is useful to add an
authorized ssh key.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_6.7p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
index 19093fc..dcbc181 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
@@ -89,6 +89,7 @@ do_install_append () {
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
 	install -d ${D}/${sysconfdir}/default/volatiles
 	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
+	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
 
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-- 
2.1.1


