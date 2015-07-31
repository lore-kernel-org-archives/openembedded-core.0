Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC9F765B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:19:05 +0000 (UTC)
Received: by pacan13 with SMTP id an13so43280159pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XjzSG9I6glm/czvG01UOQOI/gyh3UtbIYDkmXS8YnYk=;
	b=SZqUDUKe7W8ikfr01/TRK8K8MoSCAiF/TZVNU4KMJhKSUBKq17PfLFQSLtstTYoyO4
	Wmnlz7foFn4CFxreQn1qGD3E5vIFqLTw6OkSacuu8NTJi7KtqEXsMkwV/0aOk2Xo5yyl
	v/1SmHX9dh5ImwDfL4taTaYZA/T1fDOtwRvUFfAZ86y7bOPs5BA9Xx3cyg7HgI2PUXwu
	m9epoPgspA0g9Dcf/4je3H+goXVUIZATYTkOuXd+3Sa91kEMPWPWlW6Px+CvWWVCvqJQ
	tcaY+XpaGAFfhQf4xoDArNbGUoUS74s2w3sJj8aAXlooAWDBRfBuuN9lfSxtsLr0x1ij
	x3Sg==
X-Received: by 10.66.222.103 with SMTP id ql7mr7902096pac.144.1438355945568;
	Fri, 31 Jul 2015 08:19:05 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ym6sm8281249pac.32.2015.07.31.08.19.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Jul 2015 08:19:04 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 08:18:58 -0700
Message-Id: <cover.1438355747.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/3] Fix a couple populate_sdk_ext issues
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
X-List-Received-Date: Fri, 31 Jul 2015 15:19:07 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Explicitly pass BBPATH to devtool as Paul Eggleton suggests, to avoid
  needing to acquire the bitbake lock, to resolve the issue in
  populate_sdk_ext.
- Use the oe-core lnr script rather than ln -sr to improve host portability
  (not all hosts have recent coreutils).

[v2 changes]: rebased on Paul's commit to use tinfoil.shutdown() which while
not yet on master, is pending on master-next.

The following changes since commit dd5c87900b73bf44cf96735706d7d06e56b4d20e:

  oeqa/commands: Increase qemu boot timeout to match testimage.bbclass (2015-07-31 15:58:55 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core populate_sdk_ext-fixes

for you to fetch changes up to ccf0ba3cb9507e1d0057bd55eeed8275711e1c0d:

  populate_sdk_ext: pass BBPATH to devtool --bbpath (2015-07-31 08:15:01 -0700)

----------------------------------------------------------------
Christopher Larson (3):
      populate_sdk_ext: use lnr, not ln -sr, for portability
      devtool: add --bbpath argument
      populate_sdk_ext: pass BBPATH to devtool --bbpath

 meta/classes/populate_sdk_ext.bbclass |  7 ++++---
 scripts/devtool                       | 15 +++++++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.2.1


