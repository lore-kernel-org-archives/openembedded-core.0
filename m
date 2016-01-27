Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8AA770CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 09:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R9ZRlH010244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 01:35:27 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 01:35:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 01:35:20 -0800
Message-ID: <cover.1453877220.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7] [jethro] Consolidated pull
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
X-List-Received-Date: Wed, 27 Jan 2016 09:35:30 -0000
Content-Type: text/plain

The following changes since commit 8ce8f62b22b1e20db0f62d7bd8246738147d5f2e:

  nativesdk-buildtools-perl-dummy: Bump PR (2016-01-21 16:21:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-jext

Armin Kuster (5):
  glibc: CVE-2015-8777.patch
  glibc: CVE-2015-8779
  glibc: CVE-2015-9761
  glibc: CVE-2015-8776
  openssh: CVE-2016-1907

Derek Straka (1):
  bind: CVE-2015-8704 and CVE-2015-8705

Mariano Lopez (1):
  rpmresolve.c: Fix unfreed pointers that keep DB opened

 .../bind/bind/CVE-2015-8704.patch                  |   28 +
 .../bind/bind/CVE-2015-8705.patch                  |   44 +
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |    2 +
 .../openssh/openssh/CVE-2016-1907_2.patch          |   65 ++
 .../openssh/openssh/CVE-2016-1907_3.patch          |  329 +++++++
 .../openssh/CVE-2016-1907_upstream_commit.patch    |   33 +
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |    5 +-
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch  |  155 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch  |  123 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch  |  262 +++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 ++++++++++++++++++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  385 ++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |    5 +
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c  |   10 +-
 14 files changed, 2480 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8705.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch

-- 
1.7.9.5


