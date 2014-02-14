Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8E86E81A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 02:38:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1E2cbZf004749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 18:38:38 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 13 Feb 2014 18:38:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 10:40:56 +0800
Message-ID: <cover.1392345397.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] [dora] fixes for gcc and systemd
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
X-List-Received-Date: Fri, 14 Feb 2014 02:38:37 -0000
Content-Type: text/plain

Hi RP,

This one doesn't on master since it is a backport from systemd 207,
while dora is 206:

systemd: journald fix ignored disk space restrictions

// Robert

The following changes since commit 7ee4d9e1b29a1c0a2552a008fc264c592ef5ae4a:

  pulseaudio: only package consolekit module when x11 is enabled (2014-02-13 12:35:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib robert/dora-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next

Diego Sueiro (1):
  systemd: journald fix ignored disk space restrictions

Holger Hans Peter Freyther (1):
  gcc: Include patch scheduled for GCC 4.8.3 to fix epilogue on ARM

 ...ournald-fix-fd-leak-in-journal_file_empty.patch | 27 ++++++++++++++++
 ...urnald-fix-vacuuming-of-archived-journals.patch | 37 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |  2 ++
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../0048-PR58854_fix_arm_apcs_epilogue.patch       | 23 ++++++++++++++
 5 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch

-- 
1.8.3.1


