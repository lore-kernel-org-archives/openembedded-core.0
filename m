Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 701C965DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:10:43 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id fp1so10291059pdb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DtyZIMMozMb1h3zfyExzEmPVD0FtQMroFyAUXYrzDWk=;
	b=v7biJ4p43/P1TefKaIWhfjl8tJvhDxslLnHZIWGY9f7U3H4Cai8eT6uJ39agHJE3bC
	JYOQXKbwpfc9Gs4R1G24Z6FZ8uyuVNdClu4T8100mBWvuPqecRT1mHm6pFY/tJ7e0b3J
	qcIj17K53zd2nLFjkfhrIk5Nke3sNJlIN1xO7GUaVh6aJwGoOyNaNWBuMZVkU1NN4fTe
	Twxr7dzQjMjL4B7Ue5HCXoBktMRYQ2ZCXOPVKiRvRJCu5Xt4wLiIJmV8RB7Q9m+TbRWh
	Zvji8XlSRdskLYG/Ld3KRZXqNBXCpQMjItlAMH+4Ee/5XxQeK+AJ3/7abcvLz+u0Fdpm
	I3Cw==
X-Received: by 10.68.98.131 with SMTP id ei3mr32399144pbb.127.1415718644706;
	Tue, 11 Nov 2014 07:10:44 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	mi8sm19562178pdb.91.2014.11.11.07.10.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Nov 2014 07:10:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 07:10:34 -0800
Message-Id: <1415718635-25408-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415718635-25408-1-git-send-email-akuster808@gmail.com>
References: <1415718635-25408-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] tzcode: update to 2014j
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
X-List-Received-Date: Tue, 11 Nov 2014 15:10:52 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014i.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2014j.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014i.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014i.bb b/meta/recipes-extended/tzcode/tzcode-native_2014i.bb
deleted file mode 100644
index d77dd5d..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014i.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014i.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "7fa413158f01a961348aa6a289b6be21"
-SRC_URI[tzcode.sha256sum] = "62591075fb0d47459889b71bac3c8487f09b7417b81dfa541d750b4889e84783"
-SRC_URI[tzdata.md5sum] = "00adeb62a0897aac5ba67da838351adb"
-SRC_URI[tzdata.sha256sum] = "2af331bdd2b794ec59b8ded7300fb29dc3573a009ec14183f5c9ad38e3886153"
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014j.bb b/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
new file mode 100644
index 0000000..b76aa33
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
@@ -0,0 +1,10 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014j.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "970119e9765bc5a9320368851c91ecb6"
+SRC_URI[tzcode.sha256sum] = "7fd46125464856309fc81fe85a67a61de862b8ab884ce8ca82051f5fa308ede2"
+SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
+SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
+require tzcode-native.inc
-- 
1.9.1


