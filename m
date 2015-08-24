Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 190D376BDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:14 +0000 (UTC)
Received: by pdob1 with SMTP id b1so58161429pdo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lo4JAdUYq0Y/1UAsk63XKsDQVBy1OA4O3Lrnzr9TFjo=;
	b=hZFNpSceWFR/quQ9JdzTnyby7abshg4N7tAQ+O5mcq1O46LhroF6RGFKb+CrZ0vUU3
	jDMCA9oqdTV9oBvNrhdYzpTEjjIBtHNeA+3M29FNbVk9Spsuse+7YQbLdlz+CJb2oh+X
	KFWRK3DDD58kk5QWHqqFtg2qL0GeLyrG2yykdDWh1Q44zkYo9ac4HPNZQ1mUnPeaPxaM
	yBJnTSdLE7+DhTTFHpb/BvN1XdSYzyHN3DMprMJvy6mWKFY+yo+iradx6ZQwDL/qqtEE
	PmhAO1nT0LeUj4ZzFKnhOqqZ7PAiiLpoGZ/cttaZUk5RDUslXaod2zBCHwukQ830Fes9
	YGuA==
X-Received: by 10.70.127.206 with SMTP id ni14mr49608744pdb.53.1440454755027; 
	Mon, 24 Aug 2015 15:19:15 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	dh9sm4440036pdb.67.2015.08.24.15.19.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:05 -0700
Message-Id: <cover.1440454290.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Add checks for "host user contamination"
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:17 -0000

From: Christopher Larson <chris_larson@mentor.com>

This adds a QA test, as well as a rootfs_ function for use in
ROOTFS_POSTPROCESS_COMMAND, to warn/error when paths are owned by the same
user/group as the user running bitbake. This is useful to catch stuff which is
written outside of pseudo's control, for example.

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core host-user-contaminated
  https://github.com/kergoth/openembedded-core/tree/host-user-contaminated

Christopher Larson (3):
  insane.bbclass: handle tests which need fakeroot
  insane.bbclass: add host-user-contaminated test
  image.bbclass: add rootfs_check_host_user_contaminated

 meta/classes/image.bbclass  | 14 ++++++++++++++
 meta/classes/insane.bbclass | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.2.1


