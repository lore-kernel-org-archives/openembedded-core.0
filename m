Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 805E178787
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 09:00:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36021535"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 17:00:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6BAD349F19B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 16:59:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 16:59:57 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 17:00:09 +0800
Message-ID: <1516957210-15531-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 6BAD349F19B0.A8D70
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] lsbinitscripts: 9.72 -> 9.79
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
X-List-Received-Date: Fri, 26 Jan 2018 09:00:03 -0000
Content-Type: text/plain

1.Upgrade lsbinitscripts from 9.72 to 9.79.
2.Modify functions.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/lsb/lsbinitscripts/functions.patch            | 2 +-
 .../lsb/{lsbinitscripts_9.72.bb => lsbinitscripts_9.79.bb}          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.72.bb => lsbinitscripts_9.79.bb} (73%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
index 9c58d90..41231ea 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -22,7 +22,7 @@ index 0f627f1..a6aa092 100644
  [ -z "${COLUMNS:-}" ] && COLUMNS=80
  
  if [ -z "${CONSOLETYPE:-}" ]; then
--    if [ -c "/dev/stderr" -a -r "/dev/stderr" ]; then
+-    if [ -c "/dev/stderr" ] && [ -r "/dev/stderr" ]; then
 +    if [ -c "/dev/stderr" -a -r "/dev/stderr" -a -e /sbin/consoletype ]; then
          CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
      else
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
similarity index 73%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
index 2d74a6f..4cb1a4c 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
@@ -11,13 +11,13 @@ RCONFLICTS_${PN} = "initscripts-functions"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.gz/sha512/b6ed38f9576e9227c2ecf047e2d60e1e872f40d51d13861b0c91dddb282f10f7e6b79706a4d1435d7a57a14a0b73a1b71541cfe44c00e8e03ef96b08de19ec32/initscripts-${PV}.tar.gz \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.gz/sha512/359c51dcb8aa0a745a3dd3bb67386f41d33eabc781ff2de9b211aab2706dd5e84e885e9e237b88a33fc6cb3e5dd1dbccf7c4ab32f288de76ca16d1118144abd4/initscripts-${PV}.tar.gz \
            file://functions.patch;striplevel=2 \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
 
-SRC_URI[md5sum] = "d6c798f40dceb117e12126d94cb25a9a"
-SRC_URI[sha256sum] = "1793677bdd1f7ee4cb00878ce43346196374f848a4c8e4559e086040fc7487db"
+SRC_URI[md5sum] = "9605286e0d512623a05ba892ac8d9819"
+SRC_URI[sha256sum] = "ab45fcde7f50a9a16890ac0714772bc9591117950addf68755589a85ccffb1c1"
 
 # Since we are only taking the patched version of functions, no need to
 # configure or compile anything so do not execute these
-- 
2.7.4




