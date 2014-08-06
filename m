Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 991B970A07
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:07:11 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so3798420pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aVQw5i3PGJQAgel3jo0mHgHZ0IZ7H6NIfgUwCJi/c78=;
	b=GuZ0u2dbwWZT0W6ESRTlJihp+JyNn9B4ydhRhAzHI6MkDkGVcsnW+k6sDlKLpPaQdj
	1K05mK+UDFjvsnu2R8POuQXLT36D0Cirvwes/Bm5gtIvynFSV/Semzujssx3GQ6DXxY+
	8YdEUf0X0iOeienOWPf73N8HekjOpAIkcT0Vxi82VmIEpRGiH+gX253sPJ3axLaNE0LU
	kllsFgJH+VaGGF0t7oWbGP3vjkS+qaSIpvqtO44rb1BGDU0RWXcD25YY9HU5WKvltO4X
	fF80bkMbGF/wYoM9SN3viRAjJn7khzVE9QH1UQRWrv/WiRmpM8Wo+shxdorp3GdX5TwM
	z1jA==
X-Gm-Message-State: ALoCoQmwyQeZanZHtmJV5+dAP32G15XJvFNgtGZWbB6dc4XxbDOU/7C+HQw0/2tx3gfH6O7iJCqa
X-Received: by 10.70.138.102 with SMTP id qp6mr13168976pdb.132.1407352033010; 
	Wed, 06 Aug 2014 12:07:13 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id b4sm2929766pdm.14.2014.08.06.12.07.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Aug 2014 12:07:12 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 12:07:07 -0700
Message-Id: <1407352027-29680-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1407352027-29680-1-git-send-email-akuster@mvista.com>
References: <1407352027-29680-1-git-send-email-akuster@mvista.com>
Subject: [PATCH] 2/2] tzdata: update to 2014f
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

md5sum on asia file changed do to severel tzone updates

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/tzdata.inc      | 2 +-
 meta/recipes-extended/tzdata/tzdata_2014e.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2014f.bb | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014e.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014f.bb

diff --git a/meta/recipes-extended/tzdata/tzdata.inc b/meta/recipes-extended/tzdata/tzdata.inc
index 06a6bea..f13a4fe 100644
--- a/meta/recipes-extended/tzdata/tzdata.inc
+++ b/meta/recipes-extended/tzdata/tzdata.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Timezone data"
 HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
 SECTION = "base"
 LICENSE = "PD & BSD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1"
 DEPENDS = "tzcode-native"
 
 inherit allarch
diff --git a/meta/recipes-extended/tzdata/tzdata_2014e.bb b/meta/recipes-extended/tzdata/tzdata_2014e.bb
deleted file mode 100644
index b53d323..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014e.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "8a49fdedd4e832da8e85f7f9bcaedc33"
-SRC_URI[tzdata.sha256sum] = "08e243a79051f838d86ac1311a78b74047951302d448024e823b5b7aa71f86c5"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014f.bb b/meta/recipes-extended/tzdata/tzdata_2014f.bb
new file mode 100644
index 0000000..caad383
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014f.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "f333b2e8f876221a97871cae0c188aa5"
+SRC_URI[tzdata.sha256sum] = "eed690a72124f380bcb14947d398a7a482acb9ab792ae78bd4554e52c5ca2001"
+
+require tzdata.inc
-- 
1.9.1


