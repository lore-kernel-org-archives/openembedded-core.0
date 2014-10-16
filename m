Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDD8560DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:51:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G9p1M5024058
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:51:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 16 Oct 2014 02:51:01 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 17:48:32 +0800
Message-ID: <cover.1413452836.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/3] CVE fixes of package readline and gnupg
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
X-List-Received-Date: Thu, 16 Oct 2014 09:51:01 -0000
Content-Type: text/plain

The following changes since commit 505a6b696ae990442de720e5e1135a3e44d5f75c:

  bitbake: fetcher: fix BB_STRICT_CHECKSUM datatype check (2014-10-06 16:09:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/CVEs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/CVEs

Kai Kang (3):
  readline: Security Advisory - readline - CVE-2014-2524
  gnupg: CVE-2013-4242
  gnupg_1.4.7: add package config libusb

 .../readline/readline-6.3/readline63-003           | 43 +++++++++++++++
 meta/recipes-core/readline/readline_6.3.bb         |  2 +
 .../gnupg/gnupg-1.4.7/CVE-2013-4242.patch          | 62 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |  2 +
 4 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline63-003
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch

-- 
1.9.1


