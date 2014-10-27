Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E58EB65D50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 07:19:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9R7JCpU020554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 00:19:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 00:19:11 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 15:16:09 +0800
Message-ID: <1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414394124.git.Chong.Lu@windriver.com>
References: <cover.1414394124.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: add bash to RDEPENDS
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
X-List-Received-Date: Mon, 27 Oct 2014 07:19:16 -0000
Content-Type: text/plain

This solves the following warning:

systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash,
but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 6d3e47f..8bc1cc8 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -202,6 +202,7 @@ FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
                               ${systemd_unitdir}/system/systemd-vconsole-setup.service \
                               ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
 
+RDEPENDS_${PN}-kernel-install += "bash"
 FILES_${PN}-kernel-install = "${bindir}/kernel-install \
                               ${sysconfdir}/kernel/ \
                               ${exec_prefix}/lib/kernel \
-- 
1.9.1


