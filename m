Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CD61A71DE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 09:19:24 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r144so19427588wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Dvk2QC/bG4k1gD5JjRVfbYgGdj000il9Y61nD/wD+II=;
	b=ylkMZm5t2EpKmw7CGEmcsytb5+Vk6HTBh61NSclty3rD16sT2DyMW30gXo+r1DRhIh
	H7kX7F1AjOFxdY0AGNuQr8MoVZL3BmirE+6ST84FguzfM35fom6I84moj2waRcGcrQHP
	lCeEerKO5k7woGbAQ5atP5CPhOdY7wlVjIRhunf7PYGjt92f6fWoTkysPsCl7xM0Zu2Q
	Qam9kFao4iwTT1idooG4w12AvMvwG1oPDkIIMkircFVqhM3j40092eWIEqfil5yJxFnE
	hQexwyy6V+4K+9iQHAxGJvGdsCwx0Tr+qopzQq7izODXWJZYpvgjUvt0lGevI175gavA
	syLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dvk2QC/bG4k1gD5JjRVfbYgGdj000il9Y61nD/wD+II=;
	b=iEfMr90owat6WOHa5f/uH1XEYH5Vnt/9fDOewIgv84yeUx5UqxpZviUkhQjpK15SfU
	3EZppU9VU4pupKHfMggLmwozebOVX1pA+FcGgSvKgQ2l4DMmQJplwlmQ8CyCsCXEmTVZ
	xmL7Pl/P4S/cLWU4j5TfT6/hHd6DkAqGrknH71boJnT3Fr78VaLSpu8lNoKR8jduBYIQ
	z64H8WBaxtTvSbKBAchPZE5zlK1OhzMAMefX05/Qu9zKkdYK0wJA9W/0n9vxiebEt8AU
	Rs/mEWyfw7UAe5oImfploTkq9Wx3FnLLovptbZPxb2kk7whEUu1TYzdg0yCABcQ/kGAA
	DESg==
X-Gm-Message-State: AIkVDXLJJLw6J6KjH8wW1ZFjBsnBsk9C4CscT0XZRm27dlf3T+pu0D878y3d5Eg2BWobjA==
X-Received: by 10.28.166.216 with SMTP id p207mr20559907wme.27.1485335964093; 
	Wed, 25 Jan 2017 01:19:24 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	t103sm22371875wrc.43.2017.01.25.01.19.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 01:19:23 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 10:18:53 +0100
Message-Id: <1485335933-9845-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ccache: update to 3.3.3
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
X-List-Received-Date: Wed, 25 Jan 2017 09:19:25 -0000

Release note available at this location:
https://ccache.samba.org/releasenotes.html#_ccache_3_3_3

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/recipes-devtools/ccache/ccache.inc                           | 2 +-
 meta/recipes-devtools/ccache/{ccache_3.2.5.bb => ccache_3.3.3.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.2.5.bb => ccache_3.3.3.bb} (61%)

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 69aa64e..59b0f9e 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv3+"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://git.samba.org/ccache.git"
+SRC_URI = "git://github.com/ccache/ccache.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/ccache/ccache_3.2.5.bb b/meta/recipes-devtools/ccache/ccache_3.3.3.bb
similarity index 61%
rename from meta/recipes-devtools/ccache/ccache_3.2.5.bb
rename to meta/recipes-devtools/ccache/ccache_3.3.3.bb
index afd1b0e..6edb017 100644
--- a/meta/recipes-devtools/ccache/ccache_3.2.5.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.3.3.bb
@@ -1,9 +1,9 @@
 require ccache.inc
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b8a4fa173ed91c1a5204ea4f9c9eadc3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=938c02728101936f2a74a67d1d82ee25"
 
-SRCREV = "424d3ae1fb73444c6c38bf189f8fc048f66d6499"
+SRCREV = "fb005e8f90d66402741c337d9c5c9c5a1c48fc76"
 
 SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
-- 
1.9.1


