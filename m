Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7DE96FA9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:07:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q981Mf009032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:08:01 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 02:08:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 17:08:42 +0800
Message-ID: <cover.1395823715.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] openssl: three CVE patches
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
X-List-Received-Date: Wed, 26 Mar 2014 09:08:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 43d717df16312a8f0333aff6b8b037b4b9d51bf3:

  toaster.bbclass: update buildstats event data (2014-03-25 14:19:57 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_port60_openssl_140326-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_port60_openssl_140326-1

Yue Tao (3):
  Security Advisory - openssl - CVE-2013-4353
  Security Advisory - openssl - CVE-2013-6450
  Security Advisory - openssl - CVE-2013-6449

 ...DTLS-retransmission-from-previous-session.patch |   81 ++++++++++++++++++++
 ...or-TLS-record-tampering-bug-CVE-2013-4353.patch |   31 ++++++++
 ...e-version-in-SSL_METHOD-not-SSL-structure.patch |   33 ++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    3 +
 4 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch

-- 
1.7.9.5


