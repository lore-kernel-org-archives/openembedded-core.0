Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 523EF605F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 09:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t159VTGj022618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Feb 2015 01:31:29 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Feb 2015 01:31:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Feb 2015 01:31:27 -0800
Message-ID: <cover.1423128496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] libtool: avoid running automake/autoconf --version
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
X-List-Received-Date: Thu, 05 Feb 2015 09:31:35 -0000
Content-Type: text/plain

This patch can make libtool 2.4.5 a little faster, but still slower than
libtool 2.4.2, since libtool 2.4.5 runs slower when SHELL is /bin/bash.

In theory, if it was 10s slower in the past, now should be less than 5s.

// Robert

The following changes since commit 2104111edc85d057eb4fadecd007f5c592803da6:

  opkg-keyrings: New recipe (2015-02-03 14:53:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/libtool
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/libtool

Robert Yang (1):
  libtool: avoid running automake/autoconf --version

 meta/recipes-devtools/libtool/libtool-2.4.5.inc    |    1 +
 .../avoid-running-automake-autoconf-version.patch  |   54 ++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch

-- 
1.7.9.5


