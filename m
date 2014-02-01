Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id B29316186B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 02:23:03 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so5077401pbb.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=68nQmKSbNNc1bAaP56SwrHGwpbG6KQn1JJ3j63J2Ggk=;
	b=MwfKAfbuz4J30Cwrgm7cAkpL1s/NBQOk0PXKv/vdMeegJD9Dm9SSccLmvTm4IIvXKO
	eplh2KKjLAU7MX39UG2Kttr6nJvs/k4WWs3iG5hchRQ8ba/p0YhSV6C+xO/Y74UUTtky
	iSzDGjvFGC4qpphrXB6lIVTjwRpuHb+iyVV1lRsjr62BmRpSGIXOMiOww5wBESmvhwTy
	fMNuDrSs9fVyENxlY+EiLua6ju51TCcgzzGewJzQIv1tJ1om6tOxMuU1ilRd4bNiwF4U
	Y2L7kAr6WCuvWTXpdtH5rDrxI+S9J/dJGMJCvf/BOgzTW5ZeoiEk2UPnjfqNORs/jtIn
	KuEw==
X-Received: by 10.69.2.2 with SMTP id bk2mr24147392pbd.75.1391221384828;
	Fri, 31 Jan 2014 18:23:04 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	sq7sm32239403pbc.19.2014.01.31.18.23.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 18:23:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 18:23:56 -0800
Message-Id: <1391221436-3916-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ossp-uuid: Use alternative source mirror
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
X-List-Received-Date: Sat, 01 Feb 2014 02:23:05 -0000

Original ftp location is inaccessible

Fixes

WARNING: Failed to fetch URL
ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz, attempting MIRRORS if
available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index 4bc151f..d336a88 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6a
 
 PR = "r2"
 
-SRC_URI = "ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz \
+SRC_URI = "http://gnome-build-stage-1.googlecode.com/files/uuid-1.6.2.tar.gz \
 	   file://0001-Change-library-name.patch \
 	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
 	   file://0003-Fix-whatis-entries.patch \
-- 
1.7.10.4


