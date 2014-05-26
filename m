Return-Path: <akuster808@gmail.com>
Received: from mail-pb0-f51.google.com (unknown [209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5766B701
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 21:29:07 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id ma3so8175389pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=B1NV4YCOeQHeBVTVshIAP6ZHOmRh7qy8AVgUv8bKnt0=;
	b=Jsngf5Ln0FMNF8CbZ6jV3UuNi+rmARLcvNi8kf8cjgvIp3h1cSjsHdXXmdqWHJCNdz
	v5Vbv2Y/9tXg0nNyiasdNOPJ/qBXwACHYgyAQwe9bQNIApVWMI+vWbmMZFXzulXRJL2L
	QEaeSvFpcgP4wKNRAi80Ve07LZ7bFPlgo+Kx70/Som/LttZYdxptRX6eRQLnln1np4CS
	FPIb2d/dPEqoGVAfT1dGe0+Ht4dj1RFIPKfRcC3d1iTpdZWuMDXKdqCkoDUy0XGpoM6O
	8G1Gk0V6I10j0xOLVM8qxtM+bMoyI0xz9xMAHmaU9GA+ZPEtz8yGQhtAzypG3PpgBngf
	tV9w==
X-Received: by 10.68.219.162 with SMTP id pp2mr30430903pbc.47.1401138337769;
	Mon, 26 May 2014 14:05:37 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	wg7sm19729596pbc.73.2014.05.26.14.05.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 May 2014 14:05:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 May 2014 14:05:29 -0700
Message-Id: <1401138331-31087-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Update timezone files to 2014c
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
X-List-Received-Date: Mon, 26 May 2014 21:29:08 -0000

This updates both tzcode and tzdate to latest

Armin Kuster (2):
  Update tzdata to 2014c
  Update tzcode to 2014c

 .../recipes-extended/tzcode/tzcode-native_2013i.bb |  26 ---
 .../recipes-extended/tzcode/tzcode-native_2014c.bb |  25 +++
 meta/recipes-extended/tzdata/tzdata_2013i.bb       | 206 ---------------------
 meta/recipes-extended/tzdata/tzdata_2014c.bb       | 205 ++++++++++++++++++++
 4 files changed, 230 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013i.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2013i.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014c.bb

-- 
1.9.1


