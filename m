Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB0873262
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:58 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8542071pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gooG94yau0gjPjW/Mr4TrC11BIwpJeyraD9PWt4415k=;
	b=MuztT28p/AKZJSehICVmFrlu+t0/BYRshy+UGejkcRuLa5xIZ0Lg2nzQ8jglXlNupX
	x00m6hMpPJ2w623GHad8YvAEPINCgTRcYGKrmODRht1sUMundliSY4S4aq+aIb/L7weq
	jL6E5vd6nvwhA1835wgVCvWZFuHObOb1eW38q8gU63s+6yfzb+W2ipxb2YwT+HsbANTz
	mjI+BVrHXvHS8U/ZuUDt5tIt/Wg0heHmnUm33veEO746NaBTwlwO2ac6fCdOAViWW3CB
	uONmB/Bf/C3pD1oU7iylXw24/fRY9rzlWXGK8Epfeq8CqW422eEC1K7t7w9HFTGOOaMq
	DqaQ==
X-Received: by 10.69.27.105 with SMTP id jf9mr6755935pbd.126.1423152359716;
	Thu, 05 Feb 2015 08:05:59 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:01 -0800
Message-Id: <44e4f601b47ba5bd54cf19fa175cb872215a9fe5.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 53/61] tzcode: update to 2015a leap second changes too
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:58 -0000

Changes affecting code

tzalloc now scrubs time zone abbreviations compatibly with the way
that tzset always has, by replacing invalid bytes with '_' and by
shortening too-long abbreviations.

tzselect ports to POSIX awk implementations, no longer mishandles
POSIX TZ settings when GNU awk is used, and reports POSIX TZ
settings to the user.  (Thanks to Stefan Kuhn.)

Changes affecting build procedure

'make check' now checks for links to links in the data.
One such link (for Africa/Asmera) has been fixed.
(Thanks to Stephen Colebourne for pointing out the problem.)

Changes affecting commentary
The leapseconds file commentary now mentions the expiration date.
(Problem reported by Martin Burnicki.)

Update Mexican Library of Congress URL.

(From OE-Core rev: ccc543570b96bb1f1efefd5ed79469da142cafd3)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014j.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2015a.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015a.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014j.bb b/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
deleted file mode 100644
index b76aa33..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014j.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "970119e9765bc5a9320368851c91ecb6"
-SRC_URI[tzcode.sha256sum] = "7fd46125464856309fc81fe85a67a61de862b8ab884ce8ca82051f5fa308ede2"
-SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
-SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015a.bb b/meta/recipes-extended/tzcode/tzcode-native_2015a.bb
new file mode 100644
index 0000000..a0a31d6
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015a.bb
@@ -0,0 +1,10 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015a.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "8f375ede46ae137fbac047ac431bda37"
+SRC_URI[tzcode.sha256sum] = "885bab11f286852f34030d7a86ede7d4126319ca74b8ee22be8ca7c17d72dd19"
+SRC_URI[tzdata.md5sum] = "4ed11c894a74a5ea64201b1c6dbb8831"
+SRC_URI[tzdata.sha256sum] = "c52490917d00a8e7fc9b5f0b1b65ef6ec76d612b5b20c81bf86a04147af18e4c"
+require tzcode-native.inc
-- 
1.9.1


