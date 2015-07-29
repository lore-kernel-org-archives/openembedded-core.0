Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9766576230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 21:54:02 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so12467568pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uz+TAhb9hDdfuAPuq0Vidxmt+10HZyQJYgIj5MQCDz0=;
	b=Xa9G4ua20Ykr7h0XmlLR1uzEpb1hkopympgLV3SluuNjUeaa6PFY0baZT24y3wcnrM
	Iqv1gWqRr7BzPjCRoy5KrizkZ+33sxMEH1zKq/Q1xRESCEPx3myn2XQeAw78aofBZjFy
	LowHg3YL0n/HJrBEcw4my4EntX8QoM3RDOM/jgaSL48yvwoeHaQFLQQyXZrbRWA5QLgb
	MT+ypCF8G9ptiruB9sXKyJysYQ+p+D+g/MwlIMphoyle6yXMmRTxpqUgsw6uDZcEUJw3
	ALD4MnxNzkfSf9E5pfGpAsrWSv5UMLY5+ktNHWXEpDeqBa2sTH23T/OW9fel3HIz4ayq
	ccRQ==
X-Received: by 10.70.128.226 with SMTP id nr2mr99474621pdb.139.1438206842435; 
	Wed, 29 Jul 2015 14:54:02 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id fj6sm66982pdb.21.2015.07.29.14.54.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jul 2015 14:54:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2015 14:53:54 -0700
Message-Id: <cover.1438206555.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Fix a couple populate_sdk_ext issues
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
X-List-Received-Date: Wed, 29 Jul 2015 21:54:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Explicitly pass BBPATH to devtool as Paul Eggleton suggests, to avoid
  needing to acquire the bitbake lock, to resolve the issue in
  populate_sdk_ext.
- Use the oe-core lnr script rather than ln -sr to improve host portability
  (not all hosts have recent coreutils).

The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:

  harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core populate_sdk_ext-fixes

for you to fetch changes up to a66090ba23452e0dca05e5811ebe88ea1bfc84de:

  populate_sdk_ext: pass BBPATH to devtool --bbpath (2015-07-29 14:48:05 -0700)

----------------------------------------------------------------
Christopher Larson (3):
      populate_sdk_ext: use lnr, not ln -sr, for portability
      devtool: add --bbpath argument
      populate_sdk_ext: pass BBPATH to devtool --bbpath

 meta/classes/populate_sdk_ext.bbclass |  7 ++++---
 scripts/devtool                       | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.2.1


