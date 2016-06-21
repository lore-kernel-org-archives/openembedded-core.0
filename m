Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 55BD360107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:04 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hl6so6974563pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=wG16pAHSYvo85z+hV879O4a+p1KZFKh5M5q8DAFbHDM=;
	b=nYudUxQNaToU/2eZuDu9BZThiGNSFP2jYXrCNlf8dqfw9JxJSdDl4IX6QGknkKMsKv
	5bIsPcL/cqTotyg3kaIYwLyJ3rebXarFCDC/m4+IKQi4Vs6WZO7BpGTuaeSZvR2xquII
	TASrguwf8uy1r+IFESexCiH0tGjqmExjOMef1FuJAcEuxlp5m4/9GbKEiKdbl99Qcv8u
	Z+8A/MRdlJlFU4DuApHg3P1HvJiMCSjsIHFpv6ImPiGbadXArK9wP01pLv4zPJmcisM9
	NsT2qTpLooOu+Ii82JkxYde1o78TwEmEKe7KdCcDz6h8dBkFXsixO56DvT4doGiETBa5
	qA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wG16pAHSYvo85z+hV879O4a+p1KZFKh5M5q8DAFbHDM=;
	b=bZpRCpVrfKB5qETC5Qv2dPO1hGJoMOqJszlpO4yKclMrgiTsGaeGToltsBmH6nZ/C5
	pqUXbSEUxJ1ZHLS9QzlviBzFQ/G1Devh1+w8O7qh1WQH5bGsEqvFUd2vm+OJ0/zFv9yR
	KFUrKo2+1C/M1/Edn4kRO6r90dgMPD2wnaTj+ZeVD/3INwLIPZ7Upj0vjHNBPqeQhMNZ
	mforHh7t93f7V/BJopH1oU+DTIsFcnlpRYMTEPiIZHKO/VhOGhYAlbBSl53UoYb2x0W7
	3azogXOesay9k7hjTpSFWZoVoQ/cJc5GblQXVfa0Rry/FlWSAMW0+BvjNxsh3qzkX0x0
	KNiQ==
X-Gm-Message-State: ALyK8tJEf3toJqbGLGKL79/KknUra6zIAQLtL2H8qS5xAW9XvWLFyQk4Sl+AxkD443GJVQ==
X-Received: by 10.66.88.100 with SMTP id bf4mr28919229pab.15.1466519945457;
	Tue, 21 Jun 2016 07:39:05 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	t4sm51199340paf.39.2016.06.21.07.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 07:38:59 -0700
Message-Id: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Add qemuppc64 target
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:05 -0000

This is step 1 in support of Yocto bug 9778

Boot tested on Ubuntu 14.04 (qemu 2.0)

Armin Kuster (3):
  machine: add qemuppc64 machine
  linux-yocto: add qemuppc64
  runqemu: Add qemuppc64

 meta/conf/machine/qemuppc64.conf             | 13 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 22 ++++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 22 ++++++++++++----------
 scripts/runqemu                              |  9 ++++++---
 scripts/runqemu-internal                     | 24 ++++++++++++++++++------
 5 files changed, 61 insertions(+), 29 deletions(-)
 create mode 100644 meta/conf/machine/qemuppc64.conf

-- 
1.9.1


