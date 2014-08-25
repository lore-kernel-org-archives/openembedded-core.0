Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id C354360E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:57:51 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so22173236pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to;
	bh=WVdHo5FJMFIeN4XRm2165Cjng1f/pr9uq9xsCOnKMsA=;
	b=F0rxbDXyQEOldAVKRKy9iCOtIKG6AGMqrS9Ni9K3rpjxe9PbpQjA1vIc5fhA9PoNep
	JtLxWW+jMf/g+ALNYQxL8kk85qJC1WsB23XQOZ26t/IBVl3yFyPSeNhMFRVWSMW69eB2
	zyjg3mOvVpVDZM5U43oXlpnttuwM1NmpPRygtEJcx/tp9l5Vi2pr2G6iIOfsuf/R8Fk7
	glg7VBoiMoYV5zwXiOnFUSCOrKLHzYqfp7dGkRiRGUBln+FmpYdpG2V9dt6WNtxFbNUQ
	vUxxYqWBDiop8S7ERXATH0tPutp4snuQNY2N2O48lKczhepFnqVeA44Y3uGHNyBJZGQD
	f9vw==
X-Received: by 10.66.147.67 with SMTP id ti3mr32502683pab.2.1409007472893;
	Mon, 25 Aug 2014 15:57:52 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id bv5sm922487pbc.20.2014.08.25.15.57.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:57:51 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:57:41 -0700
Message-Id: <cover.1409007366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409006757.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/3] sanity: improve mirrors check
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
X-List-Received-Date: Mon, 25 Aug 2014 22:57:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

v2: fixed subject line of first commit to mention \\n

The following changes since commit 217aa4d9802609d2c3628c8751a27a5d25900898:

  autogen-native: inherit pkgconfig to fix a build failure (2014-08-25 10:25:54 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core improve-sanity-mirrors-check

for you to fetch changes up to 8fa6adaaa363a88c888f2afab2f0117b199a54c0:

  sanity: refactor mirrors checks to be more pythonic (2014-08-25 15:50:53 -0700)

----------------------------------------------------------------
Christopher Larson (3):
      sanity: handle both \n and \\n in mirror vars
      sanity: fix support for regex schemes in mirrors check
      sanity: refactor mirrors checks to be more pythonic

 meta/classes/sanity.bbclass | 67 ++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 31 deletions(-)

-- 
1.8.3.4


