Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 19C01600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 19:12:39 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id my20so1257677pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 12:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ldabB3/dkCG9lmW7RFmb61gxYScaSBXuXV94fvNduK8=;
	b=y8NX/Ufjfwhi8/S02eK5J75vfFG25myprkDXl7HcDxq726zKi2TLGIRqZE4yeqBmqA
	DETId91pAilc6dNCZPtHcmdrT6lL/FWTafqW80Op6J0bS5PjNnLmldO2P9ouuCMdA1gf
	QLkZcI7bJ9a7c2LG1oFObtjnK90SVIbFQ2NK6k5KEYOeuPh0U+F1bXI8a8267eIpzM0F
	4yK4IYykfUfJ+OdjaRgZPsy2ikXGIEnLWEFKOxivLa1XSfB1XxtL09cZHjTy1KHpLKso
	qldQUordNk0DK29U8qNTgr2Tawrdy8R1+5ru6D5rv51X6Hb3gDK2oU7vuTNVA/jlqkPf
	IlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ldabB3/dkCG9lmW7RFmb61gxYScaSBXuXV94fvNduK8=;
	b=OYfAm8sQi5uPNcxJNArJDilypFcTTakweF1xCzQqg100PkWTCbTvwfokpSK/fnuE+D
	Y3JEHN8ejkPUHJ9BVnb5HsAXTUWNS7nDIRhliCbmIJ9Kd7INjWHhimkmFH0XxO0+XIER
	qxIbtb66vI56/wIleXLVyi1uVNjLEtaC7iFc8MGMt3cFmfiEAkR6kqzPiUa3NL29mOfH
	X/3+oqmOTbJu6TTye3nD32XGSihGo4h4dH2VQ+QsQxOUjuVBwLexVsWidO/OPNO76cDa
	aVyEAYtQqdlkdL6cac8FLdp/iGRBgLe+q/Mqjug6vmkXKsJxREE/MiT7E6Nb/f+FDcQ3
	xxwg==
X-Gm-Message-State: AE9vXwPMxD9cfTFDWiiyIQYpeEaMXg2mpKkpxDM988n1er3oSR3pQPBZ0vEbKXIp1HgJXg==
X-Received: by 10.66.152.238 with SMTP id vb14mr58229256pab.78.1474398761144; 
	Tue, 20 Sep 2016 12:12:41 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	bu15sm4424561pac.15.2016.09.20.12.12.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Sep 2016 12:12:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2016 12:12:30 -0700
Message-Id: <cover.1474398462.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/7] Jethro pull request #2
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
X-List-Received-Date: Tue, 20 Sep 2016 19:12:44 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these changes for Jethro

Similar fixes for krogoth are in my staging branch

The following changes since commit 6f0350d1cbf5829bfbaa3a43227f8d564903743a:

  wget: Security fix CVE-2016-4971 (2016-09-17 22:33:07 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=akuster/jethro-next

Armin Kuster (7):
  qemu: Security Fix CVE-2016-3710
  qemu: Security Fix CVE-2016-3712
  qemu: Security fix CVE-2016-4439
  qemu: Security fix CVE-2016-6351
  qemu: Security fix for CVE-2016-4002
  qemu: Secuirty fix for CVE-2016-5403
  util-linux: Security fix for CVE-2016-5011

 .../util-linux/util-linux/CVE-2016-5011.patch      |  59 +++++++++
 .../util-linux/util-linux/CVE-2016-5011_p2.patch   |  91 ++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.26.2.bb  |   2 +
 .../recipes-devtools/qemu/qemu/CVE-2016-3710.patch | 112 +++++++++++++++++
 .../qemu/qemu/CVE-2016-3712_p1.patch               |  73 ++++++++++++
 .../qemu/qemu/CVE-2016-3712_p2.patch               | 132 +++++++++++++++++++++
 .../qemu/qemu/CVE-2016-3712_p3.patch               |  34 ++++++
 .../qemu/qemu/CVE-2016-3712_p4.patch               |  80 +++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4002.patch |  39 ++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4439.patch |  46 +++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-5403.patch |  67 +++++++++++
 .../qemu/qemu/CVE-2016-6351_p1.patch               |  75 ++++++++++++
 .../qemu/qemu/CVE-2016-6351_p2.patch               |  60 ++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  10 ++
 14 files changed, 880 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2016-5011.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2016-5011_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4439.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-5403.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-6351_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-6351_p2.patch

-- 
2.7.4


