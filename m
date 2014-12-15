Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id ED62A7250B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:10:46 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so12240115pab.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=qdBx667IvBfUjpdN7XB34GX/N5BuUWgq1fHe0W3nyqg=;
	b=kG3wvcKqRoQpdNfHRG4JBTBXbPH82cZ+OYRqZSq/b+3dWReBJiVpw+tjCwI8VWmcWW
	LQQKvMDo+80hoOz65BUPVdvL9xjvsACPmqRkXVntUEuoogUy+uP3oc9Yi3PLghmo1Mxq
	hcLHVLlWG6MVcBs20KYnHqJIO2AkMksxYUyJ78YpFwMpcB+bKyLcIftBp5ic1csqyVzU
	ykg0QtTyM3rObQyxSM2VXY7ej7ODa0iw1ohz7pg2owYtELQGZW87LXglKWJSZ3Az0hJS
	HHfUTmvQ4nLie0ChUZ6tAQpH1wXAaP+O/YHyYGkXeHbc/Yno3AwrEpYgY6b90EjvWMzz
	lJAA==
X-Received: by 10.70.89.207 with SMTP id bq15mr52433564pdb.68.1418663446710;
	Mon, 15 Dec 2014 09:10:46 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id a13sm9805551pdm.44.2014.12.15.09.10.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 09:10:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2014 09:10:34 -0800
Message-Id: <cover.1418663308.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Dizzy next Dec 15th V2
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
X-List-Received-Date: Mon, 15 Dec 2014 17:10:52 -0000

opps, off-by-1 error.

Please consider these changes for Dizzy-next

This is on top of two previous requests:
http://patches.openembedded.org/patch/84363/
http://patches.openembedded.org/patch/84341/


The following changes since commit 618a569d430e88e9a115dcf10f04384f39e28555:

  kernel.bbclass: Create modules directory even if there is no modules installed (2014-12-03 11:28:43 -0800)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Bian Naimeng (2):
  cpio: fix bug CVE-2014-9112 for cpio-2.8
  cpio: fix bug CVE-2014-9112 for cpio-2.11

Maxin B. John (1):
  python: fix ssl import error

 .../python/python-2.7-manifest.inc                 |   2 +-
 .../cpio/cpio-2.11/fix-memory-overrun.patch        | 220 +++++++++++++++++++++
 .../cpio/cpio-2.8/fix-memory-overrun.patch         | 217 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |   3 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |   7 +-
 scripts/contrib/python/generate-manifest-2.7.py    |   2 +-
 6 files changed, 445 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch

-- 
1.9.1


