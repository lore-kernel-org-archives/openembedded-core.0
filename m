Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD1D7610E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:44 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so31931090pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ac87wk6VVjuQz7i7lE6ekLhu8zGlx+g1ZhTEpvQ85IE=;
	b=uQh+QcBMDArfeVO1ieEtWxFcbgQmej6nYtaDG+S3Th28IF/+ytpXbdRtBN+BQJ+WX1
	NuWupCYIAzUITx4RLrBqrpIlaKQ/nkLd2ALljDtKpLkFh9+b54XlFjKEa2L3cqp597kX
	xrnIBaCAPmvU0ZKJ4QZfjgxiqYX9wzsFlNM1l7olaxG2o/bv37tqt5PW2W7PievdTVp5
	DQvvPfNhVIKNOBCku/xIuwOLZi7kLCtbDFsZ4K9/IxpI1yt5LYz+bGEZIoyzXdkHQIhs
	wHaDoDkDTRw3C7lRDbiYX6pfnnjESqBxs/UtCvxqiUHsR9Un9deaD6/tuKWRP7buwL0b
	XVJw==
X-Received: by 10.70.94.98 with SMTP id db2mr40793569pdb.130.1437232604748;
	Sat, 18 Jul 2015 08:16:44 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k5sm14629761pdb.53.2015.07.18.08.16.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:42 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 41EA2FC12EB; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:10 -0700
Message-Id: <915a0342ee70ac764489366403c83520a50de3fb.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 03/25] tzdata: update to 2015d
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:49 -0000

Changes affecting future time stamps

Egypt will not observe DST in 2015 and will consider canceling it
permanently.  For now, assume no DST indefinitely.
(Thanks to Ahmed Nazmy and Tim Parenti.)

Changes affecting past time stamps
America/Whitehorse switched from UTC-9 to UTC-8 on 1967-05-28, not
1966-07-01.  Also, Yukon's time zone history is documented better.
(Thanks to Brian Inglis and Dennis Ferguson.)

Change affecting past and future time zone abbreviations
The abbreviations for Hawaii-Aleutian standard and daylight times
have been changed from HAST/HADT to HST/HDT, as per US Government
Printing Office style.  This affects only America/Adak since 1983,
as America/Honolulu was already using the new style.

(From OE-Core rev: b9f366ab4e0a9cad69b631f402b9afa02d40f667)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015d.bb | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2015d.bb b/meta/recipes-extended/tzdata/tzdata_2015d.bb
new file mode 100644
index 0000000..d8e5f24
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2015d.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
+SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
+
+require tzdata.inc
-- 
1.9.1


