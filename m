Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E84C276FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:23:03 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so187133wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dsGCCWdfWGOI86YgoKmL2QKDOAeU3/E1NT6HDOsF74E=;
	b=wF9X9kFD/BzTe81w405YzyNREc2Ts954QeOB1h8g6h+i6xFvu4wBmU5Fav//36liRf
	aN8afs0abDFCx6R5neZ6+bKTNM+czf/H9i2NsRx09U6qgX2oZwcB+SUfDogm7JMrtpdf
	VdFwicbr/2eSQX1bSDzuy9zWMaDwGI2cpmyuDPutwuirklKhQZSp0yD8q6H6sJiYQV09
	A2mshe/7i/FyiHq6okE04x4TJvEj0sKXZhcSRzomIQl49UbB2zyaBGwWdvXvps5B1GL4
	c57TTIZbRnhhmXoFU7EuwJzc2I1uGZkh3MFwyrB6gAHz6cxpnYtX1FQRyywfHE7Sxbkg
	0i/Q==
X-Received: by 10.195.11.3 with SMTP id ee3mr35871658wjd.89.1441146182518;
	Tue, 01 Sep 2015 15:23:02 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id r19sm442352wib.7.2015.09.01.15.23.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 15:23:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 15:22:56 -0700
Message-Id: <cover.1441145177.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/3] Add checks for "host user contamination"
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
X-List-Received-Date: Tue, 01 Sep 2015 22:23:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

This adds a QA test, as well as a rootfs_ function for use in
ROOTFS_POSTPROCESS_COMMAND, to warn/error when paths are owned by the same
user/group as the user running bitbake. This is useful to catch stuff which is
written outside of pseudo's control, for example.

v2 changes: handle missing files in the host-user-contamined test by catching
ENOENT OSErrors from os.lstat.

The following changes since commit bdeb32b4cdbe316f17c2fd854d59e05e8f2e8ffc:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:43:38 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core host-user-contaminated
  https://github.com/kergoth/openembedded-core/tree/host-user-contaminated

Christopher Larson (3):
  insane.bbclass: handle tests which need fakeroot
  insane.bbclass: add host-user-contaminated test
  image.bbclass: add rootfs_check_host_user_contaminated

 meta/classes/image.bbclass  | 14 ++++++++++++++
 meta/classes/insane.bbclass | 43 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.2.1


