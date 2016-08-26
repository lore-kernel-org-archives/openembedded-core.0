Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1A34B7318F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 02:27:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7Q2RPPd013410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 19:27:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 25 Aug 2016 19:27:24 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2016 10:25:46 +0800
Message-ID: <1472178349-32199-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] groff: add file-homedir-perl to RDEPENDS
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
X-List-Received-Date: Fri, 26 Aug 2016 02:27:25 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add file-homedir-perl to RDEPENDS for groff
  as glilypond provided by groff depends on
  File/HomeDir.pm provided by file-homedir-perl,
  otherwise comes below error

  root@super_micro-1:~# glilypond -h
  Can't locate File/HomeDir.pm in @INC (you may need to
  install the File::HomeDir module) (@INC contains: /etc/perl
  /usr/lib64/perl/site_perl/5.22.1/ /usr/lib64/perl/site_perl/5.22.1
  /usr/lib64/perl/vendor_perl/5.22.1/
  /usr/lib64/perl/vendor_perl/5.22.1 /usr/lib64/perl/5.22.1/
  /usr/lib64/perl/5.22.1 /usr/local/lib/site_perl
  /usr/lib64/perl/5.22.1 .) at /usr/bin/glilypond line 79.
  BEGIN failed--compilation aborted at /usr/bin/glilypond line 79.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index af5acbe..7ea028f 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
-RDEPENDS_${PN} += "perl sed"
+RDEPENDS_${PN} += "perl sed file-homedir-perl"
 
 inherit autotools texinfo
 
-- 
2.8.1


