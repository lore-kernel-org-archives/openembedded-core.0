Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id D4E3A738AE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 04:09:56 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so20332205pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=tCjfAU0XKFkuGlJoBkozYcLgGZYAG5JJRZtB45ZqeNw=;
	b=lYST6cdUBVXzmWA92Bd89m8H6B+WJqy9H+JGsqikxTgj2Wc8vxoTy948cVgRdgvuq8
	SgKMhhtuDfz1C8TTsUoAFvZTJimnuWDPNEVeF86f2aAlayQa+VfoW4MN/FhPJlO8KPI8
	Tqwj8jFVPWoUwYTb77SXW7pL4R1bkd55ZCvdadvwB02XvcVrcB1ey8K3H6+mJJscihs0
	bCR8pO1fTSZ4zCsq1xWuqlNqarRZ4lecX5+pnhPAvZaH5zoXXSfoKfCsNSS1v/pI7RNC
	012IXsKAOH1FWSxgpM7V8l9HxsFZbxdSO0ATY8oJUS3nk3gVYLhMEYX21kzdWJG337ph
	f+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tCjfAU0XKFkuGlJoBkozYcLgGZYAG5JJRZtB45ZqeNw=;
	b=SWKwvnMR6Md9xsi5XTCO6YAHFU2zjrkXUdBy45i389rgO2Kn1DQxJnKqvya0900v+r
	zgajPdopk2A9t5Ww03JScXMhlL3RQNNZnsIn8vp/TqilQ5/2nzXNYcnMbOZ2goNFG50h
	PEmlMG0c+WjWV0T6ITcbbFL3cM42nbrW3wZKThe9l52Ifu1IBbOMyjwuMUnQ3kCiSx2Q
	xjZsBQ6wnDGYEr2dIgqtObHS1dzaGcG3mcSEYDCs0/lPdyHTr5qQODahxzBQjLDFCwId
	qFNZx+AjozNw5TDlakBkeFGC/+a6BXW+3NgND+CnhfWYei/wPyqZFAB/d+tGDLValeHf
	E4ug==
X-Gm-Message-State: AEkoouvtBSjAwxZA8vOIdMy9YPoEcmERF3iiCRPL/VTy8PHG2i/ZTerTTCu2db/OTda9kQ==
X-Received: by 10.67.7.98 with SMTP id db2mr139813942pad.156.1470456597659;
	Fri, 05 Aug 2016 21:09:57 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	y184sm31177239pfg.94.2016.08.05.21.09.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 21:09:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 21:09:44 -0700
Message-Id: <cover.1470456330.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/6] Jethro-next pull request
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
X-List-Received-Date: Sat, 06 Aug 2016 04:09:58 -0000

Please consider these changes for the next jethro-next

The following changes since commit 7ed60009e2bcdd2380265ca95eb5de2328825eb5:

  libxml2: Security fix for CVE-2016-4448 (2016-07-09 15:47:51 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro-next

Armin Kuster (4):
  qemu: Security fix for CVE-2016-2858
  qemu: Security fix for CVE-2016-4001
  qemu: Security fix for CVE-2016-4020
  qemu: Security fix for CVE-2016-4037

Ismo Puustinen (1):
  libpcre: Fix CVE-2016-3191

Jussi Kukkonen (1):
  bind: CVE-2016-2088

 .../bind/bind/CVE-2016-2088.patch                  | 247 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   1 +
 .../recipes-devtools/qemu/qemu/CVE-2016-2858.patch | 182 +++++++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_1.patch            |  99 +++++++++
 .../qemu/qemu/CVE-2016-2858_pre_2.patch            | 137 ++++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_3.patch            | 165 ++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4001.patch |  50 +++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4020.patch |  38 ++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4037.patch |  66 ++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   7 +
 .../libpcre/libpcre/CVE-2016-3191.patch            | 174 +++++++++++++++
 meta/recipes-support/libpcre/libpcre_8.38.bb       |   1 +
 12 files changed, 1167 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4020.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4037.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch

-- 
2.3.5


