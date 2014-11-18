Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 486F0712A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:18:50 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so10006917pad.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6MNlySjjWB5CTxRnBL/VE+gaY1roCSH4A2zl1zxsRJM=;
	b=sAfBox7fOk6UIeDql1VZvOnaw9iqRynZ/OJ+2K9COb3gzLG+a9zSMN/G394C1x9Ebk
	NRdsjwE/b3EG6I7u+Q7vidNzIAGOX03IuOLybdNMMBYnUtJQ6GaanzaJZ6hlUnHmemeE
	mCX67FI16vOoYQeHUf8a/mWMn4u5OzQa7GcyB8xxYvsarNgEz0tldVrQt+WFeszqM604
	chM4iBPm30i+3oBMzLBFavbPHayfDxEtbEh0whcD+mXMbr2tK2uRsmYS/B0i4xP3CrkF
	wZzKIFmHzEZFyhMKt573EN6acvVwi74u8PlRUngdhefT+sMmhNpyUuEZuXCL1/Sw6ljY
	4pcA==
X-Received: by 10.70.133.72 with SMTP id pa8mr37550524pdb.59.1416327531588;
	Tue, 18 Nov 2014 08:18:51 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ex4sm38470695pdb.17.2014.11.18.08.18.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Nov 2014 08:18:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Nov 2014 08:18:25 -0800
Message-Id: <cover.1416241492.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/6] Dizzy Next
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
X-List-Received-Date: Tue, 18 Nov 2014 16:18:56 -0000

Please consider the these changes for Dizzy next. 


The following changes since commit 6dcaf44d8c28c466ff271d5f5585a84632bf8769:

  subversion: Security Advisory - subversion - CVE-2014-3522 (2014-11-11 09:04:57 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Armin Kuster (2):
  tzcode: update to 2014j
  tzdata: update to 2014j

Chong Lu (3):
  curl: Security Advisory - curl - CVE-2014-3613
  curl: Security Advisory - curl - CVE-2014-3620
  nss: CVE-2014-1568

Yue Tao (1):
  subversion: Security Advisory - subversion - CVE-2014-3528

 .../subversion/subversion-CVE-2014-3528.patch      |  29 +
 .../subversion/subversion_1.6.15.bb                |   1 +
 .../subversion/subversion_1.8.9.bb                 |   1 +
 .../recipes-extended/tzcode/tzcode-native_2014j.bb |  10 +
 meta/recipes-extended/tzdata/tzdata_2014j.bb       |   6 +
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |  69 +++
 meta/recipes-support/curl/curl_7.37.1.bb           |   2 +
 .../nss/files/nss-CVE-2014-1568.patch              | 670 +++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |   1 +
 10 files changed, 1058 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014j.bb
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1568.patch

-- 
1.9.1


