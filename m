Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B98C47F095
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:42:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C8gmn7012255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:42:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 01:42:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2019 16:55:26 +0800
Message-ID: <cover.1562921582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] rpm.py: two fixes
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
X-List-Received-Date: Fri, 12 Jul 2019 08:42:47 -0000
Content-Type: text/plain

The following changes since commit 80ab79168ede2786868cbd354f0950c949f73527:

  gnome-themes-standard: remove (2019-07-11 09:32:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runtime-rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runtime-rpm

Chen Qi (2):
  rpm.py: ensure no user process running before deleting user
  rpm.py: move test_rpm_query_nonroot test case to RpmBasicTest

 meta/lib/oeqa/runtime/cases/rpm.py | 74 +++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 29 deletions(-)

-- 
1.9.1


