Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB74276710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:36:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3T8alp8020630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 01:36:47 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Apr 2016 01:36:46 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Apr 2016 04:36:44 -0400
Message-ID: <cover.1461918435.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] lttng-tools: filter random filename of ptest output
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
X-List-Received-Date: Fri, 29 Apr 2016 08:36:49 -0000
Content-Type: text/plain

The following changes since commit a9b503b268e94d311f892fa00c5d6bd9ffdb228e:

  license.bbclass: make sure that image manifest dir exists (2016-04-22 16:28:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/filter-lttng-tools-ptest-output
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/filter-lttng-tools-ptest-output

Dengke Du (1):
  lttng-tools: filter random filename of ptest output

 ...ls-filter-random-filename-of-tests-output.patch | 55 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch

-- 
2.8.1


