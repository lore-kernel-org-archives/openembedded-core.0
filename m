Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id C534F6A622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:47:38 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so2458358oah.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=y5uxfDGC/6w4WlgKX4AcYIc3cS7C9cRNaFnVe/HjCyQ=;
	b=r1zUSrbEtSu+nYPD4j3sHAN/eYjUgEbKZcnvOU1aUl6VFC0e4chDEl9Oij48shbMvA
	Pu/thti/5rTB9gOJhlGP8JW6Pwf5YfCcI6u7yXMz7v0jBYj4do4Vj6iScnUhnQBufNmB
	AD5SMdwWpa0O65DRzGcJcPEGLiOS8S4IN864z5aaSQRF2RjCX10ZsNaI9RS8GjcCRdIH
	NK/ljXn1SwmkL7PyxCyu3+OCG+6M9pYR7jVzj2X15niBHMxPatOJIteN516dpqQiY/ev
	SZzXsnSV5Wkp5Ooq4qNZjUTzPuxntSlfUiJfn9A6ClhpW5cgvnnHnO3ijA+pBvaiHE8n
	oZGg==
X-Received: by 10.60.117.41 with SMTP id kb9mr9970976oeb.33.1370897259842;
	Mon, 10 Jun 2013 13:47:39 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id kz3sm24258712obb.6.2013.06.10.13.47.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:47:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:47:03 -0700
Message-Id: <cover.1370896990.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] A few miscellaneous improvements from Mentor
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
X-List-Received-Date: Mon, 10 Jun 2013 20:47:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git misc-improvements

Christopher Larson (4):
  connman: use PACKAGECONFIG for WISPr support
  libnewt: split python module into libnewt-python
  packagegroup-base-vfat: include dosfsprogs
  insane.bbclass: quiet package errors not in *_QA

 meta/classes/insane.bbclass                        |  6 +++--
 meta/recipes-connectivity/connman/connman.inc      | 10 ++++++---
 .../packagegroups/packagegroup-base.bb             |  3 ++-
 .../newt/libnewt-python_0.52.14.bb                 | 26 ++++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      | 15 +++++--------
 5 files changed, 44 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb

-- 
1.8.3


