Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71ED160557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 01:36:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7I1asKE017436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 18:36:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 18:36:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Aug 2015 09:33:10 +0800
Message-ID: <1439861590-17352-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openssh: Upgrade 6.9p1 -> 7.0p1
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
X-List-Received-Date: Tue, 18 Aug 2015 01:36:58 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

7.0p1 includes the fix for CVE-2015-5600, and release note is in:
http://www.openssh.com/txt/release-7.0

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../openssh/{openssh_6.9p1.bb => openssh_7.0p1.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_6.9p1.bb => openssh_7.0p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_6.9p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.0p1.bb
index 3529c86..105875a 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
@@ -24,8 +24,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "0b161c44fc31fbc6b76a6f8ae639f16f"
-SRC_URI[sha256sum] = "6e074df538f357d440be6cf93dc581a21f22d39e236f217fcd8eacbb6c896cfe"
+SRC_URI[md5sum] = "831883f251ac34f0ab9c812acc24ee69"
+SRC_URI[sha256sum] = "fd5932493a19f4c81153d812ee4e042b49bbd3b759ab3d9344abecc2bc1485e5"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
1.9.1


