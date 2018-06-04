Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 494B374FA1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:43:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p11-v6so14686348wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xjEoC4ff74h4RT5RNWJrk0Agg3/kSP8LycR0CAiPZyw=;
	b=fmWzYiJfBqXSrD2DiuDFrgopcGL52DE+2ByUZm+ZDSsJSoZury/8npsRQt+b2tWoyf
	Z3iCFiP1PJkfociryiNdLCpQJwjuS3/ghJMek/8gNKIF48X76XErebVJVGAAcvlTGVgV
	bviVrx7+k3ABP4q2S7/bj9QEjfnqWdBQhAuB2Gz947gdvUrbJb2yn2mZbD+PogdOH/aQ
	nUfEjnyiPZG9dd0JFppcGlaqZJ1rnVD6RWb4VLgEPk8XxGNtTVXiPZwLvLFIy8C7KzjA
	++Fmg/2PLBHbytyoX1IcqiRt/AYOz49NpPqsMLebFR42VTl7osg8EYmJBZijhuZwKSUj
	t4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xjEoC4ff74h4RT5RNWJrk0Agg3/kSP8LycR0CAiPZyw=;
	b=MgBLao/X/ndnycxhxvL3rOwnzBZEjbh5ZYoV4Znk3d7/uzOOtOXCh+3TV45YWKXUAH
	EzduWPNqiQ2wf0SW499cF6t2u+meknOMHm7/2iL2L35/tv+LF5M9BxI+RxkpGEngeb/E
	elhWYdN+r4RcXQeMRLG1lSSWxqNbbze47nG2oS18pgAAvT02P9LfFEdDdw8IVTTZNrZw
	Y622+SakfDIIp3eU6LuqTWUnJM+2uKD8dwXUIiAhddmwScuhOyQEI1HRYlFMYW81cp3W
	M4qmSKv+il6rQY798Ucx8qTj1D3jb1CMdS9Z8Q9o2biSW/ZENeKOGu0EuFrssV0vM2cP
	DfFA==
X-Gm-Message-State: APt69E1hhWhfjLoqV5w4qIP7qLPqB2d1yLleZEK1n2KWoGJkgROullQF
	xF2M1dGq+AhMwKLrYAGiCzMqGf5K
X-Google-Smtp-Source: ADUXVKJ4qJLu24eblYtxOqNcqPA1ILUcQLuJ+ZkoV7qmdcUMx90KoWULtSJ8esL2yejXluo31hoV6A==
X-Received: by 2002:a50:b761:: with SMTP id
	g88-v6mr13156344ede.129.1528130582838; 
	Mon, 04 Jun 2018 09:43:02 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	o47-v6sm27145947edc.95.2018.06.04.09.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 09:43:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 18:42:40 +0200
Message-Id: <20180604164240.21839-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v3] chrpath: fix SRC_URI
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
X-List-Received-Date: Mon, 04 Jun 2018 16:43:02 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use Debian mirrors instead.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-devtools/chrpath/chrpath_0.16.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index b61eef9c8b..d932089516 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -2,18 +2,17 @@ SUMMARY = "Tool to edit rpath in ELF binaries"
 DESCRIPTION = "chrpath allows you to change the rpath (where the \
 application looks for libraries) in an application. It does not \
 (yet) allow you to add an rpath if there isn't one already."
-HOMEPAGE = "http://alioth.debian.org/projects/chrpath/"
 BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/c/chrpath/chrpath_${PV}.orig.tar.gz \
            file://standarddoc.patch"
 
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
 SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
 
-UPSTREAM_CHECK_URI = "http://alioth.debian.org/frs/?group_id=31052"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/c/chrpath/"
 
 inherit autotools
 
-- 
2.17.0


