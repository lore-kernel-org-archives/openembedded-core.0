Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 314867824A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:48:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U0mvsX028914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 17:48:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 17:48:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:48:55 -0700
Message-ID: <cover.1504054080.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/2] libpcre: 2 CVE fixes
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
X-List-Received-Date: Wed, 30 Aug 2017 00:48:58 -0000
Content-Type: text/plain

The following changes since commit 2454019844c762613a2c78ed7f7f2d30960c0bfd:

  libsdl: Move PACKAGECONFIG options from meta-mingw (2017-08-29 12:08:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pcre
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pcre

Robert Yang (2):
  libpcre2: Fix CVE-2017-8786
  libpcre2: Fix CVE-2017-7186

 .../libpcre/libpcre2/libpcre2-CVE-2017-7186.patch  | 96 ++++++++++++++++++++++
 .../libpcre/libpcre2/libpcre2-CVE-2017-8786.patch  | 93 +++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre2_10.23.bb     |  2 +
 3 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch

-- 
2.10.2


