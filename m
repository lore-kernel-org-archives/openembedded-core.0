Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 300FE6A622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:21 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so3951951pad.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4MdjFSEag+BeSImkSdp6vq4Tsk18VJmNjvSAreqieEk=;
	b=mBFPtGDGWebs/fVVD8j3BdndVox5qguQptNMwrfjT40iZgbhlIcYUaosPmR+jGE0L1
	KToahgULi7BV0hrAcf2yoRRhduiTuJ+Xqv66gh0hxbYU44j0F/c0ltpPqHQQFdit6qlI
	tGdYuJfW03jtwIMGHiSawGnvMi1JCIT4ChNorBOF7K0tpJGFLpdwQ5I1Tx0tXKSjz3zn
	QurqAW4p0Scuz4N52qiwNXwdMwYjO+0vCamHyKuskj4WUzdPA1YOjlBN3pdDtf9Zkzh3
	oBRJLs9nGceDk6VivkekNUsfdPtOd1y+ipU/Ur5lgO8zoYQo40H84RgECPy7EHjMekA/
	YORw==
X-Received: by 10.68.228.161 with SMTP id sj1mr11729261pbc.151.1370897181761; 
	Mon, 10 Jun 2013 13:46:21 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	ix3sm11541082pbc.37.2013.06.10.13.46.19 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:21 -0700
Message-Id: <cover.1370896970.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] sstate fetch improvements
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git improve-sstate-fetch

Christopher Larson (3):
  sstate.bbclass: kill MIRRORS and FILESPATH to speed up fetching
  sstate.bbclass: fetch archive+siginfo in a single pstaging_fetch
  sstate.bbclass: brute force silence fetch errors

 meta/classes/sstate.bbclass | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

-- 
1.8.3


