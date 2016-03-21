Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB0260290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:25:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2L9PqDk016561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:25:52 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 02:25:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2016 02:25:48 -0700
Message-ID: <cover.1458551516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] gpg_sign.py: get rid of pexpect
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
X-List-Received-Date: Mon, 21 Mar 2016 09:25:52 -0000
Content-Type: text/plain

The following changes since commit d3ab7005f0c899da9f9f132b22861bd5d4f952ba:

  tzdata: update to 2016b (2016-03-20 22:58:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rpm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rpm

Robert Yang (3):
  rpm: check _gpg_passphrase before ask for input
  gpg_sign.py: get rid of pexpect
  selftest/signing.py: RPM_GPG_PASSPHRASE_FILE -> RPM_GPG_PASSPHRASE

 meta-selftest/files/signing/secret.txt             |    1 -
 meta/classes/sign_rpm.bbclass                      |   10 +--
 meta/lib/oe/gpg_sign.py                            |   24 ++-----
 meta/lib/oeqa/selftest/signing.py                  |    2 +-
 ...heck-_gpg_passphrase-before-ask-for-input.patch |   70 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |    1 +
 6 files changed, 84 insertions(+), 24 deletions(-)
 delete mode 100644 meta-selftest/files/signing/secret.txt
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch

-- 
1.7.9.5


