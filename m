Return-Path: <Paul.Barrette@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDBB86CE77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 20:52:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9TKq5sL010416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 13:52:05 -0700 (PDT)
Received: from yow-pbarrett-lx.wrs.com (128.224.146.11) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 13:52:05 -0700
From: Paul Barrette <paul.barrette@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2013 16:52:04 -0400
Message-ID: <1383079924-1438-1-git-send-email-paul.barrette@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] lsb: add begin function to lsb_log_message
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
X-List-Received-Date: Tue, 29 Oct 2013 20:52:03 -0000
Content-Type: text/plain

Some init scripts call a "begin" action to log early init phase
messages, e.g. openvswitch-controller.  Add the "begin" function to
lsb_log_message.

Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
---
 meta/recipes-extended/lsb/lsb/lsb_log_message | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsb/lsb_log_message b/meta/recipes-extended/lsb/lsb/lsb_log_message
index 2995f78..9daa9c8 100755
--- a/meta/recipes-extended/lsb/lsb/lsb_log_message
+++ b/meta/recipes-extended/lsb/lsb/lsb_log_message
@@ -21,6 +21,11 @@ case "$ACTION" in
 	warning "$*"
 	echo
 	;;
+  begin)
+  	echo -n $*
+	begin "$*"
+	echo
+	;;
   *)
   	;;
 esac
-- 
1.8.1.4


