Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B71E6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2ISGl003216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:19 +0800
Message-ID: <1472436999-27335-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/21] ltp: add libwww-perl-perl to RDEPENDS
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:30 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add libwww-perl-perl to RDEPENDS for ltp as
  STPfailure_report.pl provided by ltp depends
  on LWP/Simple.pm which is provided by libwww-perl-perl,
  otherwise comes below error

  root@super_micro-1:~# /opt/ltp/bin/STPfailure_report.pl -h
  Can't locate LWP/Simple.pm in @INC (you may need to
  install the LWP::Simple module) (@INC contains: /etc/perl
  /usr/lib64/perl/site_perl/5.22.1/
  /usr/lib64/perl/site_perl/5.22.1
  /usr/lib64/perl/vendor_perl/5.22.1/
  /usr/lib64/perl/vendor_perl/5.22.1
  /usr/lib64/perl/5.22.1/ /usr/lib64/perl/5.22.1
  /usr/local/lib/site_perl /usr/lib64/perl/5.22.1 .)
  at /opt/ltp/bin/STPfailure_report.pl line 33.
  BEGIN failed--compilation aborted at
  /opt/ltp/bin/STPfailure_report.pl line 33.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20160126.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 278f492..0d3ca1d 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -96,7 +96,7 @@ do_install(){
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd libwww-perl-perl"
 
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
 
-- 
2.8.1


