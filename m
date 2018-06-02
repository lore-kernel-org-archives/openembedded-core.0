Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3704B75110
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 23:15:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x6-v6so2329150wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 16:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IAOmEADWCUWOBJLaDnjfAjd+tBBQAO47FfWd0ckXdwM=;
	b=TnixcKxzXR7iuB8+aiVbee4G4imxGfCetEfFLGm8uOocXfG7BZaQ0HNa3jnbverzgW
	DG258q4cjA7cEZp/aNxq8WZJdmFTIaNBV5Y/+enE50xxRRPCgVSxlJnxr5MzwfQ5Dcc/
	7a+3hA8ragXjVhLTxaiOW7bJbYTI4VmbuPiLS2gzeVRtgp01UTY64a+8TnXQBtSHOM5v
	+oG9FLfWn+EoaY9cArUFs0Ix9J711AwxMhhaJszid2qflSMOuNBoYRUuOmhJTnZrhXoz
	0v4Cx8uyDOc9Ys1TlMzDjBHUf2XZ3Adp+3dg+XdYObzCeRHY3jE0O6yIF1Sw6L2U0Q7P
	eB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IAOmEADWCUWOBJLaDnjfAjd+tBBQAO47FfWd0ckXdwM=;
	b=jlZEfcn7tdkDTkG2rJmEZzkDFXgj1sVru5QDboNF50KrjQqjT69P4fch7YNQgPorNO
	wmBhgrWLBqybzHBwxdTcfARcQOn6jnBvobGfhAUJXt+sQS5fHaCcmpQjA24vWeFyOPuz
	y5Tl4JcZ2S8NHD8eplfQzoA2JsSB1SN/vseNlLGwYVSHlbRtr9RWi9zP8IREM2dh39Jb
	Tq08WY9EPeL1IOWqGPK78VXt9xo/1onY8sT7cOG3NlCgRYauC8J3EPfLqHuCleI4CYB3
	3cLDnZmVKrfE6mxu/IAyhr1mseQpKUZAxgCnK9sFkg3DCg8zpn7XtTnQwgwuYEzJNHoV
	PM/A==
X-Gm-Message-State: ALKqPweY/QuorHIiP+HdbVmo45R/udE0i0awnxTdmMISM7THGLrD1Pnb
	8SY2IQdljj+1cpexXHWl9Tgz49X6
X-Google-Smtp-Source: ADUXVKIwzUwJ/aaWU0qrsozC83Swog02/yPaS2WjvN3VTwvlgMKQUGsKri80jZQ3hOEqU4KHuIsMhg==
X-Received: by 2002:a50:a7c3:: with SMTP id
	i61-v6mr17843582edc.152.1527981348543; 
	Sat, 02 Jun 2018 16:15:48 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	d8-v6sm25065784edk.50.2018.06.02.16.15.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 16:15:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jun 2018 01:15:41 +0200
Message-Id: <20180602231541.30248-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] minicom: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 23:15:48 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use Debian mirrors instead.

Source: https://wiki.debian.org/Alioth

Removed UPSTREAM_CHECK_URI for the same reason.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index e6afe2b655..40d59e133a 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Text-based modem control and terminal emulation program"
-HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
+HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom/"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
 SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
+SRC_URI = "http://http.debian.net/debian/pool/main/m/minicom/minicom_${PV}.orig.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
            file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
@@ -16,8 +16,6 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
 SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
 SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
 
-UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
 
-- 
2.17.0


