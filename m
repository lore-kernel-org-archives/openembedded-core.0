Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E670F60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:30:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7U8rX008196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:30:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:30:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:30:05 -0700
Message-ID: <cover.1459322953.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] minor fixes for archiver and selftest
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
X-List-Received-Date: Wed, 30 Mar 2016 07:30:08 -0000
Content-Type: text/plain

The following changes since commit b3f80743cd1b9a15a8ee4d20c2a54c2f6cbcd13c:

  gcc: Backport fixes for musl ssp configuration (2016-03-29 23:19:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 07b3a5e5f8d42008b72679b702962e4eb6de441a
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=07b3a5e5f8d42008b72679b702962e4eb6de441a

Robert Yang (2):
  archiver.bbclass: addtask do_deploy_archives_setscene
  selftest/buildoptions.py: use INHERIT +=

 meta/classes/archiver.bbclass          | 1 +
 meta/lib/oeqa/selftest/buildoptions.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.7.4


