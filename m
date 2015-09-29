Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C41E576AC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 09:58:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8T9wsxh020363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 02:58:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 02:58:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2015 17:59:01 +0800
Message-ID: <cover.1443520698.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: add runuser PAM config files to fix runuser error
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
X-List-Received-Date: Tue, 29 Sep 2015 09:59:00 -0000
Content-Type: text/plain

The following changes since commit 4a1dec5c61f73e7cfa430271ed395094bb262f6b:

  multilib: Add TARGET_VENDOR to saved variables list (2015-09-28 11:59:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/runuser-pam
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/runuser-pam

Chen Qi (1):
  util-linux: add runuser PAM config files to fix runuser error

 meta/recipes-core/util-linux/util-linux.inc            | 6 ++++++
 meta/recipes-core/util-linux/util-linux/runuser-l.pamd | 3 +++
 meta/recipes-core/util-linux/util-linux/runuser.pamd   | 4 ++++
 meta/recipes-core/util-linux/util-linux_2.26.2.bb      | 2 ++
 4 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser-l.pamd
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser.pamd

-- 
1.9.1


