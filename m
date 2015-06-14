Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A6DE873E3B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 05:03:48 +0000 (UTC)
Received: by pacgb13 with SMTP id gb13so14848294pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 22:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TseLC7tNown2WCfy+Bcnt0MCKcXe5ofYFLoRfc/aQi0=;
	b=E1GQuxr0DdWAG4P5jTfhjNRZBafGC1XkM4exWwKb9xPfuK/eWXnz2TkATgy3HsHoRD
	UZXx+7fRKN9VFTG1l4fYYy3OKpH1eHXbr4P2PfCzQjp2B1Qy1CdTERuoK1aHyOi0JZ2T
	OCW6epcmZxCzaAj9wM+VA8pwks3ZSWY9bLcbzkYiYJufzkF0Ao0UmesaiBCcq1laYHGZ
	yeWax5bYLVFxSWYqY+y8PnbDVTSWgSFSW/58sqLKo4+tMEAyGmp6EIxKjK3bzNrthdJo
	zw7vsbxnrM3JldfMS0jYJCy+qDgu7iHAghP4PUYjMRzaqK2vBmgbK50TGx6z+B1n+pTP
	0v0g==
X-Received: by 10.70.103.200 with SMTP id fy8mr36281288pdb.136.1434258229760; 
	Sat, 13 Jun 2015 22:03:49 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id gc5sm8158162pbb.53.2015.06.13.22.03.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Jun 2015 22:03:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 22:03:42 -0700
Message-Id: <1434258222-9867-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1434258222-9867-1-git-send-email-akuster808@gmail.com>
References: <1434258222-9867-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2015e
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
X-List-Received-Date: Sun, 14 Jun 2015 05:03:48 -0000

merged inc back into recipe.

Changes affecting future time stamps

Morocco will suspend DST from 2015-06-14 03:00 through 2015-07-19 02:00,
not 06-13 and 07-18 as we had guessed.  (Thanks to Milamber.)

Assume Cayman Islands will observe DST starting next year, using US rules.
Although it isn't guaranteed, it is the most likely.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015d.bb                 | 6 ------
 meta/recipes-extended/tzdata/{tzdata.inc => tzdata_2015e.bb} | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb
 rename meta/recipes-extended/tzdata/{tzdata.inc => tzdata_2015e.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015d.bb b/meta/recipes-extended/tzdata/tzdata_2015d.bb
deleted file mode 100644
index d8e5f24..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2015d.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
-SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata.inc b/meta/recipes-extended/tzdata/tzdata_2015e.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata.inc
rename to meta/recipes-extended/tzdata/tzdata_2015e.bb
index ee56d36..9179d7b 100644
--- a/meta/recipes-extended/tzdata/tzdata.inc
+++ b/meta/recipes-extended/tzdata/tzdata_2015e.bb
@@ -5,6 +5,11 @@ LICENSE = "PD & BSD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1"
 DEPENDS = "tzcode-native"
 
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "36f9056efb432ca945c73397acfce0d4"
+SRC_URI[tzdata.sha256sum] = "ffc9b5d38abda8277aa479e3f75aa7668819d0977cd1a0c8ef3b09128334ba6f"
+
 inherit allarch
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-- 
2.3.5


