Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB1272701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:00 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so8557507pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=w/sH/3v8qme0rsGaO4FAkwLb/KRBrnQ2sPrTg/PgxZs=;
	b=v2OSrheaW6qHdpW3PqxX4oibht6YuNsdx6iheEJiD2Wq1uouFWURtl1e73w1YvPJjh
	CMlBt8AuUY/MDMy3ns+V3nWWwtS/O5oZcD1XAaGbZjAO4JeWuMiS7s/b5l8WZIs4U+8r
	PdyytHtSU0PF1zRY/8xS1ZWIrAf9VTTVzHu5cGSVeZevDd65FY7cxYVI+VpCar3Jvb2V
	ZtHi2NjgtstfO9dqt5SqKdga8iPVNFRNYTSE3g12v26ITwBHXM6ceB8bCPqk1+UfcOhO
	iidEtjddLxqqJV8ZK//CqILsLL4WHsfrD+QZ8fpAlVqVwW2hqS2BYHLSUIRNP+dUm3EG
	/pwA==
X-Received: by 10.68.69.46 with SMTP id b14mr6792846pbu.9.1423152361775;
	Thu, 05 Feb 2015 08:06:01 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:02 -0800
Message-Id: <dfccf97f48151c867129f60cba10829d07dc946e.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 54/61] tzdata: update to 2015a including leap second
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:00 -0000

Changes affecting future time stamps

The Mexican state of Quintana Roo, represented by America/Cancun,
will shift from Central Time with DST to Eastern Time without DST
on 2015-02-01 at 02:00.  (Thanks to Steffen Thorsen and Gwillim Law.)

Chile will not change clocks in April or thereafter; its new standard time
will be its old daylight saving time.  This affects America/Santiago,
Pacific/Easter, and Antarctica/Palmer.  (Thanks to Juan Correa.)

New leap second 2015-06-30 23:59:60 UTC as per IERS Bulletin C 49.
(Thanks to Tim Parenti.)

Changes affecting past time stamps
Iceland observed DST in 1919 and 1921, and its 1939 fallback
transition was Oct. 29, not Nov. 29.  Remove incorrect data from
Shanks about time in Iceland between 1837 and 1908.

Some more zones have been turned into links, when they differed
from existing zones only for older time stamps.  As usual,
these changes affect UTC offsets in pre-1970 time stamps only.
Their old contents have been moved to the 'backzone' file.
The affected zones are: Asia/Aden, Asia/Bahrain, Asia/Kuwait,
and Asia/Muscat.

(From OE-Core rev: 4ee327602a0cc3200b5d6490ef2f115768cff2f4)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2014j.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2015a.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014j.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015a.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014j.bb b/meta/recipes-extended/tzdata/tzdata_2014j.bb
deleted file mode 100644
index f0388c2..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014j.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
-SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2015a.bb b/meta/recipes-extended/tzdata/tzdata_2015a.bb
new file mode 100644
index 0000000..6151aee
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2015a.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "4ed11c894a74a5ea64201b1c6dbb8831"
+SRC_URI[tzdata.sha256sum] = "c52490917d00a8e7fc9b5f0b1b65ef6ec76d612b5b20c81bf86a04147af18e4c"
+
+require tzdata.inc
-- 
1.9.1


