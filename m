Return-Path: <geissonator@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id A8DD77547F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 19:50:01 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id p79-v6so9519517itp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YMxTLwujVeXZPkFUnYEJCaI4SXhKgDj26KdcoiD8FGU=;
	b=JnunR3piQcrIc49q3vnD1YeA6Z0Q0Ys479VmYVPX8QTwRx7vF4X+cr2obKdBx/16aL
	XKfu18RfzzHLD6CrpoVGuXl8hoCEimgbR+qHZsN3vI36chFpGcBULAbG9wQtDB/qiVMP
	VJ/quwG9OBeqQB1J6eG9OyXDYDKNEjQJCIRBkaFx4+QFpda0RX9xx7MKetc/Cvsza1i2
	7WsoEB+s+LC480U/iwuLds6iLnP70mIWfYZNatRqq5Ah4MIBaaWewqXVmji+rSte5jS4
	5QRwNmXS3gaBcezASueROySVevdqG2JmhM7fcIxRAoL4+AdgA9Rz0g+nhHcMhBGEbpmX
	WwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YMxTLwujVeXZPkFUnYEJCaI4SXhKgDj26KdcoiD8FGU=;
	b=kjqvLert9Dw+PNzTHayPKkwea/rH/mnQGFbsXjHHE5xXeuDhhaDkrkSeHrBuo8gjt+
	tEWc+gjLTbgLu0QMX2Qb10aauxDuuYA3s0HEAXAeB7Du9YqWglno/bWhEFfcd4n57usl
	wr//xuQYxSgd1Ej92hOuO5tOwBsxXoCnN8woq+/8SzdLIchqxaYf5GX+3Lu1RmKrWzQu
	wg/WNYupMnGjWKqonejpu0PYPbEMRIv0q2EE74yEIdIAkBE14UVIp4C3RiFyVlxtUdwq
	n2mHTPHiFaU1PabASLWC9dcGGw8QuTVSGnu6JovhlZyuxzlM6F6BArMPY7dSpmtVbc3y
	w04A==
X-Gm-Message-State: APzg51AIQNhRsVidsqdsoxMcLGmsorDpF169enHx4j4Qey0yt7gc46Sd
	uJh5sJAKyyHhQ4RwuSGPaZ6JOTNy
X-Google-Smtp-Source: ANB0VdYFCPPsl9ELnSl2wptxFCDBs6ipd30dJG7Rri6fdeLYGC9ZxJ/0KIwYUOVcAJ44aViQ2gbY1g==
X-Received: by 2002:a24:c8d4:: with SMTP id
	w203-v6mr7729466itf.84.1536868202449; 
	Thu, 13 Sep 2018 12:50:02 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com ([32.97.110.55])
	by smtp.gmail.com with ESMTPSA id
	v14-v6sm1731754iog.42.2018.09.13.12.50.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Sep 2018 12:50:01 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 12:49:39 -0700
Message-Id: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Thu, 13 Sep 2018 19:50:01 -0000

A quick search in the python package shows the following test
directories being included in the python image:
./Python-2.7.14/Lib/bsddb/test
./Python-2.7.14/Lib/sqlite3/test
./Python-2.7.14/Lib/ctypes/test
./Python-2.7.14/Lib/unittest/test
./Python-2.7.14/Lib/lib-tk/test
./Python-2.7.14/Lib/email/test

Move the bsddb, ctypes, and email packages to the python-tests package
to conserve some space.

Packages not include in this patch:
- sqlite3 has it's own -tests package
- unittest is already a test package
- lib-tk (tkinter) seems to have its own special installation and does
not allow the manifest override for its test directory
- bsddb is no longer in python3 so update for it was not needed there

Just the ctypes and email change saved us ~150KB of read-only
filesystem space in our embedded env.

Changes since v1:
- Used manifest file instead of python recipe to move files to -tests
package

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json  | 5 ++++-
 meta/recipes-devtools/python/python3/python3-manifest.json | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 723e513..8db2afe 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -925,7 +925,10 @@
     },
     "tests": {
         "files": [
-            "${libdir}/python2.7/test"
+            "${libdir}/python2.7/test",
+            "${libdir}/python2.7/email/test",
+            "${libdir}/python2.7/ctypes/test",
+            "${libdir}/python2.7/bsddb/test"
         ],
         "rdepends": [
             "core"
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 90a41fb..963140f 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1040,7 +1040,9 @@
     "tests": {
         "cached": [],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/test"
+            "${libdir}/python${PYTHON_MAJMIN}/test",
+            "${libdir}/python${PYTHON_MAJMIN}/email/test",
+            "${libdir}/python${PYTHON_MAJMIN}/ctypes/test"
         ],
         "rdepends": [
             "core",
-- 
2.7.4


