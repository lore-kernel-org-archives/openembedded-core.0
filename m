Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5DC872694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5ijPZ003263
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:45 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:10 +0800
Message-ID: <f2d7d96bae850b5f2877af51a41878c092a09209.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] rpcbind: add PACKAGECONFIG for systemd
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:47 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
index 44c79eb..fd4b2b5 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
@@ -42,6 +42,12 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir / \
                        --shell /bin/false --user-group rpc"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/, \
+                          --without-systemdsystemunitdir, \
+                          systemd \
+"
+
 EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
 
 do_install_append () {
-- 
1.9.1


