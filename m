Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D45036D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:08:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL78QnJ024274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:08:26 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:08:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:08:20 -0600
Message-ID: <1385017702-22903-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][RFC PATCH 0/2] dpkg changes to support CentOS 5.8 hosts
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
X-List-Received-Date: Thu, 21 Nov 2013 07:08:27 -0000
Content-Type: text/plain

Since CentOS 5.8 isn't considered supported by oe-core, this is just an RFC.
It's being sent for Yocto Project compliance reasons.

Lei Liu (2):
  dpkg: Fix a build error for dpkg-native on CentOS 5.8.
  dpkg: Fix a link problem for dpkg-native on CentOS 5.8.

 .../dpkg/dpkg/glibc2.5-sync_file_range.patch       | 86 ++++++++++++++++++++++
 .../dpkg/dpkg/no-vla-warning.patch                 | 24 ++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.1.bb          |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch

-- 
1.8.1.2.545.g2f19ada


