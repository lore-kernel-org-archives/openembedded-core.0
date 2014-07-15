Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id BFDCC7058C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:28:18 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id v10so7130726pde.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=P825sm/OTChnYN6ZgM5XB3+oT2o8Xku5UyEOeNwcQqM=;
	b=clPRHeImsgCHs97VHsH/FnTYgs6PwGTjrnqA6QXjsb7JpI3eSYmhPm8tS3hZo33szj
	2q1U4fV7mp7+pyIRGNgEZh3QOf/TjOc0G5Ln1XLuRdjYZp7pghVHIm79jI50cYTJltJy
	svr9Gl8WH5imOegIncJ71t+tJEfCSmZB/BnrazslNCCiclXjt0uCqxMQJj3PAKoCjknK
	goVU6cDq2MRzJXWPZuHsC/hRxJdsi8iAPO/RqFAv36dhzMHQbUGLx9upyCB81dUSuuXV
	kifPpvU7PgkcRfhBwFklgN/g/eiZZS6hqjXq1fOtyemEaUocYTpb0vFCeE6bYzD4qhhW
	/vHQ==
X-Gm-Message-State: ALoCoQmjBjw5as6lmKvu3r+BMzICG+HOfikyLMMLyMCxFGp3Vi+euIhYCc++4UpFp4S0cb4qMavn
X-Received: by 10.68.211.195 with SMTP id ne3mr9196483pbc.121.1405430899629;
	Tue, 15 Jul 2014 06:28:19 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id kl4sm3085154pdb.76.2014.07.15.06.28.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Jul 2014 06:28:19 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 06:28:08 -0700
Message-Id: <1405430888-12456-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] [v3] lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 13:28:18 -0000

update to version r119
Use github instead of svn
LICENSE md5sum changed since it was updated in r117
FIxes CVE-2014-4611

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (68%)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_git.bb
similarity index 68%
rename from meta/recipes-support/lz4/lz4_svn.bb
rename to meta/recipes-support/lz4/lz4_git.bb
index 38e36d8..3978d76 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_git.bb
@@ -2,15 +2,12 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-# Upstream names releases after SVN revs
-SRCREV = "112"
-PV = "r${SRCREV}"
+SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
+SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
 
-SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
-- 
1.9.1


