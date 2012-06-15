Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SfT22-0005HG-Dl
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 11:41:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5F9UpvP017093
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 02:30:51 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 15 Jun 2012 02:30:50 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 17:30:40 +0800
Message-ID: <b3046732c8d7bff6019356aee7013c3b43e3027d.1339751573.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339751573.git.xiaofeng.yan@windriver.com>
References: <cover.1339751573.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/3] multilib.conf: Add the support of multilib for lsbinitscripts
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
X-List-Received-Date: Fri, 15 Jun 2012 09:41:30 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the multilib support for this package to multilib.conf because error will
appear when building an lib32-core-image-lsb without this patch.

[YOCTO #2571]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/conf/multilib.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 9fc5a90..cea8694 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -420,6 +420,7 @@ BBCLASSEXTEND_append_pn-lrzsz = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsbsetup = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsbtest = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-lsbinitscripts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsof = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-ltp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lttng-control = " ${MULTILIBS}"
-- 
1.7.9.5



