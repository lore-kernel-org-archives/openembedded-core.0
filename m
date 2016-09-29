Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D34C60616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 05:59:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T5xDVa013114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Sep 2016 22:59:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 22:59:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2016 22:59:12 -0700
Message-ID: <cover.1475128528.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] pseudo: quiet diagnostics during startup for pseudo -d
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
X-List-Received-Date: Thu, 29 Sep 2016 05:59:14 -0000
Content-Type: text/plain

* V2
  - Backport Peter's patches, thanks Peter.
  - Drop adding prefix for pseudo log after talked with Peter, we don't
    need that since the log should go into pseudo.log.

* V1
  - pseudo: add prefix for log and make log consistent

// Robert

The following changes since commit cdaafc3729700778d95afc2413553d7b41c1317b:

  oeqa/sstatetests: Ensure we cover deb packaging backend for sstate test (2016-09-28 10:15:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pseudo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pseudo

Robert Yang (1):
  pseudo: quiet diagnostics during startup for pseudo -d

 ...t-diagnostics-during-startup-for-pseudo-d.patch | 54 ++++++++++++++
 ...er.c-add-prefix-for-log-and-make-log-cons.patch | 83 ++++++++++++++++++++++
 .../files/0002-Use-correct-file-descriptor.patch   | 53 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  2 +
 4 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch

-- 
2.9.0


