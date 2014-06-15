Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id C3D616FDA0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 01:40:12 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y10so3250363pdj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 18:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L2loyfqfRPPC8AebxAcoVDHjVtEGOocWHKvX8WuW2i4=;
	b=BwwHXSmPT3++/jyYuKU2Ju++BNbeh0SEOzJ8FI0gWYs8fqbrLtaylbg0rHsRI6yeiv
	Fv3xRk37FUcPM07vrsq9oc8qh+Qzjg3JepFIXo8BoYP63mWUuEZ51zkOTCcYP75nqr/W
	GX5AnsYgxd2pyRxAiADlK7zV+HOQ5lZDW0T8LKL8BavICrdsrS5+CXXUP083jMxATf5J
	TJcScc5hmxm9Gqcv5I3i3VS2JGg7h6r8JkPdSmH04xs5umAmC3l3ULyupEbvzVbwBAI8
	nlaakti9WIYFMN8/N1c1Ion0VLc6Q6LeQzwprVeNtyt1jhtQZodQAZbuV2huxX+4k/fz
	we1Q==
X-Gm-Message-State: ALoCoQn71pwCKKxZkOFAhGW0nRFuJOBvYijuqPdSd1VtAsI6PIgOA57TJlKIybWcRmu+fjUO6VQE
X-Received: by 10.68.226.105 with SMTP id rr9mr340843pbc.161.1402796413446;
	Sat, 14 Jun 2014 18:40:13 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	qq5sm11021999pbb.24.2014.06.14.18.40.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Jun 2014 18:40:12 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Jun 2014 18:40:03 -0700
Message-Id: <1402796404-12726-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1402796404-12726-1-git-send-email-akuster@mvista.com>
References: <1402796404-12726-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 1/2] tzdata: update to version 2014e
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
X-List-Received-Date: Sun, 15 Jun 2014 01:40:18 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/tzdata_2014d.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2014e.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014d.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014e.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014d.bb b/meta/recipes-extended/tzdata/tzdata_2014d.bb
deleted file mode 100644
index 984c665..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014d.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "299b86c0368ecfb321f15d5c408a1d9b"
-SRC_URI[tzdata.sha256sum] = "4b4966912f5d4a299b0bdf47e6f3103d82dc6a0b5a6b321e2b9d5662597a62f0"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014e.bb b/meta/recipes-extended/tzdata/tzdata_2014e.bb
new file mode 100644
index 0000000..b53d323
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014e.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "8a49fdedd4e832da8e85f7f9bcaedc33"
+SRC_URI[tzdata.sha256sum] = "08e243a79051f838d86ac1311a78b74047951302d448024e823b5b7aa71f86c5"
+
+require tzdata.inc
-- 
1.9.1


