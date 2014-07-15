Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC8070206
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:50:22 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so18620pac.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6C+v2auYjmMHdL6oCt1+49UjPI1VoojASiNlnm5Xy7A=;
	b=Elvy1dL2QQlT2GO0FwlUL2tCAlzCiNraaLFkb0xHp7GNDHMhEDLmh7/Y4OMbkRE5PB
	vLqF+EmraxzctIoZtmMFbajFrkfRN5KODKRXvn9hXfh5NFrGP9sXhZfkQ+f+ifc0Y1/m
	amQpNuJdVbyndRyvgzzDE1M/pv7nsPKoJoLTM0SqUOvjky4bLixwL2UIrxseIFfH1lFp
	OCEgl6RnM9DFwDDLUcPma9gqptRvHyavK85xECjDGG7vUbXsUIMa9TNQc7FKAA8U4EDx
	TO5KWjf9rRWhFN6hsTFdvDrTzjCb5LQDVN4Zn8zMTxbTZbSPPt/yZ2FwJg8bFZi46TG4
	omMg==
X-Gm-Message-State: ALoCoQmYpgfdyDP0gVo92eaSb6MbMOBqzWcN/rjJojU7iu3QJDydr0CR7r3yArTnHrCGiQDU5Do4
X-Received: by 10.68.103.98 with SMTP id fv2mr23528909pbb.18.1405439423475;
	Tue, 15 Jul 2014 08:50:23 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	iv2sm14348104pbc.19.2014.07.15.08.50.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Jul 2014 08:50:22 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 08:50:20 -0700
Message-Id: <1405439420-30329-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] [v4] lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 15:50:23 -0000

update to version r119
Use github instead of svn
LICENSE md5sum changed since it was updated in r117 for
  a copyright date change
Fixes CVE-2014-4611

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (69%)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_git.bb
similarity index 69%
rename from meta/recipes-support/lz4/lz4_svn.bb
rename to meta/recipes-support/lz4/lz4_git.bb
index 38e36d8..8285302 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_git.bb
@@ -2,15 +2,14 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-# Upstream names releases after SVN revs
-SRCREV = "112"
-PV = "r${SRCREV}"
+PV = "r119"
 
-SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
+SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
+SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
 
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
-- 
1.9.1


