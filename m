Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6B17A6A680
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 09:01:37 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so6792654wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3uutmcwvscY/kEIh0NM46itDU1BeLVzn/WKdtgzCypY=;
	b=hIACV5kBWYG0oBh9QcQBbzvjgEr+dpm0wHPeZzbqejW3WM08hozfqNZmgoQqvQVXOi
	fQvdkeS8Jwn3JXEPlNkuhnSOtE30YAxnAdJ0j3gRFxVHvJlPH4xItX9B/tR8Xj7Uwygs
	ABI/+UEkoC3vFiOPLD9Uwh3aMgsVOfguSwr95qG0lnALBvVQjmzGM7bTULU2TKFD92cT
	9sfDQ+TPJmlHKkauzfPzp+ynCr9Q9RYEsEwUjBFrxCzUNPGJ3WmygAVQG9t6dczHkwGZ
	0h5O62H4lWxbehsAnY+njoleiMdhWh0AIPdPbwpht3YienOhrqqYiAIQ4lCBkIAdof/Q
	Iakw==
X-Gm-Message-State: ALoCoQkeoWvJQj7KyQkUUUt5MxIvPopBjH5YTM1HdTQMsfHoybfuZvkEpq6g/GzDQYg1m6w0EDDN
X-Received: by 10.180.101.98 with SMTP id ff2mr34929871wib.40.1402995698480;
	Tue, 17 Jun 2014 02:01:38 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	fn1sm19009474wib.18.2014.06.17.02.01.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 02:01:37 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jun 2014 11:01:27 +0200
Message-Id: <1402995688-21105-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/2] hwlatdetect 0.85: fix variable ordering
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
X-List-Received-Date: Tue, 17 Jun 2014 09:01:46 -0000

The OE styleguide says to group R* variables below do_install.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
index a5d2eac..8319eb9 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
@@ -4,8 +4,6 @@ HOMEPAGE = "http://git.kernel.org/?p=linux/kernel/git/clrkwllms/rt-tests.git"
 SECTION = "tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-RDEPENDS_${PN} = "python python-subprocess python-textutils"
-RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
 
 require rt-tests.inc
 
@@ -21,3 +19,5 @@ do_install() {
 }
 
 FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
+RDEPENDS_${PN} = "python python-subprocess python-textutils"
+RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
-- 
1.9.3


