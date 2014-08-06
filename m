Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 741C670889
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:07:10 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so3762440pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g1v1ywO7FrL+86NyrFTHvAxclUmWiA+e05If7J3Y6Fg=;
	b=IoQoTEKRTDWKFsD3IB8dQUwGTnI6+nSeTZDap8vYRXzL+iesDjpr1rJ93cf/jn94JV
	NPdNePZ324vokeTuCe8WGnGDcQFq0TCQy4yDn10wOYCSa0CeVB6L6EQLL9f9pEDUTq9v
	L0BKm3CSp/pjlt1fEoHTRv2g4LanvJTQMeEuNQpgU4w1DTIgIJYgZvD2hes7YsGrPtou
	5g7p2tb8fqbLDrNh8j37Hg1G0RXtwoeGHryyD83TjbdyRzSFaW3bwmr55MzDo1lvynt/
	J6NbMufVfo0G10bEZV1iqj8Y+cLyx8FF1IT7NGcNYfjApdmrmiA3NxR/co2TSa1leFD3
	pkiA==
X-Gm-Message-State: ALoCoQl+Jy4LrxgnEZGTH2+LKTXezerfCFC4J+r2JA9Q3xybfLrsbBc79o0iNqEWdkiwy9nUJ16w
X-Received: by 10.66.183.81 with SMTP id ek17mr12978271pac.39.1407352031839;
	Wed, 06 Aug 2014 12:07:11 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id b4sm2929766pdm.14.2014.08.06.12.07.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Aug 2014 12:07:11 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 12:07:06 -0700
Message-Id: <1407352027-29680-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1407352027-29680-1-git-send-email-akuster@mvista.com>
References: <1407352027-29680-1-git-send-email-akuster@mvista.com>
Subject: [PATCH] 1/2] tzcode: update to 2014f
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
X-List-Received-Date: Wed, 06 Aug 2014 19:07:13 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014e.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014f.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014e.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014f.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014e.bb b/meta/recipes-extended/tzcode/tzcode-native_2014e.bb
deleted file mode 100644
index 405ed60..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014e.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014e.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "552251600ee3571c244d33c7196ec2ed"
-SRC_URI[tzcode.sha256sum] = "43ebc426ab4911e222a4487f24289adfd2bc5eb09363a5e77cdabf56374a8c1c"
-SRC_URI[tzdata.md5sum] = "8a49fdedd4e832da8e85f7f9bcaedc33"
-SRC_URI[tzdata.sha256sum] = "08e243a79051f838d86ac1311a78b74047951302d448024e823b5b7aa71f86c5"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014f.bb b/meta/recipes-extended/tzcode/tzcode-native_2014f.bb
new file mode 100644
index 0000000..d9557ea
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014f.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014f.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "1e15be52900cd49e93f093d4731fec96"
+SRC_URI[tzcode.sha256sum] = "8c12b56abf614722f0ab7cfc502492063b2c7c5de19563540132b81709ac2555"
+SRC_URI[tzdata.md5sum] = "f333b2e8f876221a97871cae0c188aa5"
+SRC_URI[tzdata.sha256sum] = "eed690a72124f380bcb14947d398a7a482acb9ab792ae78bd4554e52c5ca2001"
+
+require tzcode-native.inc
-- 
1.9.1


