Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7515608BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 02:28:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5L2Spvr007299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 19:28:51 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 19:28:49 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 10:28:45 +0800
Message-ID: <cover.1371781463.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] libxml2 CVE-2012-2807
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
X-List-Received-Date: Fri, 21 Jun 2013 02:28:49 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 info:
* add Upstream-Status for libxml2-fix-CVE-2012-2807.patch and libxml2-CVE-2012-2871.patch

--
The following changes since commit defa05f2085f78d9ec9ada7051c284e1fc72e6c1:

  bdwgc-native: Add missing pkgconfig DEPENDS (2013-06-19 18:03:21 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_libxml_0620_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_libxml_0620_2

Jackie Huang (2):
  libxml2 CVE-2012-2807
  Add Upstream-Status for libxml2-CVE-2012-2871.patch

 .../libxml/libxml2/libxml2-CVE-2012-2871.patch     |    2 +
 .../libxml/libxml2/libxml2-fix-CVE-2012-2807.patch |   80 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.1.bb          |    1 +
 3 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch

-- 
1.7.4.1


