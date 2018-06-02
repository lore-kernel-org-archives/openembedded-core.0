Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 810497198F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 23:00:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q4-v6so10633359wmq.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 16:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XOvAgtc/32I4JQPHUSiExnwKwhBcbwwKQedxsj4zGDE=;
	b=jZXsJLCqVLg4zbxH4S4STxrdDrtpeQs65ojTN9m0BeyKIq84aDefCwCDRtaAfnl1Tp
	lP10GDg58Bc/BH7q8jNMWJfjRRjtQwLQ9PFDdrTmmnlIVLdQArOITGUygKtvHAXfPPno
	ip15MvDGBy5Mka1DhF5V4BHzw6mX1qKRkmJoySuAZgtcFzf3O1+8sqqdig6XoE5DDiDw
	KBAyvZenGhHVo860rsGpG/FlCVRnu5DBUSIT97TEkNVHjk3v1teJzuJ5zP8ITmlai2A9
	uO/kmTLk0R8qtvUjJ0KWc5tLyVFu5eTrjYn2K5tLSrFSxHvW6cVmkHgZhc/q4QlpYNAD
	R98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XOvAgtc/32I4JQPHUSiExnwKwhBcbwwKQedxsj4zGDE=;
	b=SyGNyPjfkcx1T6ZEHeEiPBajAv/F+AeHUoRX9prs5Jk0R4WbKqLFJz3lwmCG+Hri+C
	DF8Drte2xJBWeQ1tPvQirBhnGdA5h8VrDOfaA+/PhpVqtwjEs2ZTdZPnSCtUrllZWn+m
	AS7YFrSBXn+Kq6P8c0bDtsok8lnj9lsN2V449ibA00JNrM3ktrcFKnz33pJY8hYIuBpT
	mUvOgKgvqs8NXV+wdle7UXnZdKY/MEsNOOl1cSQxTdj/RFpGbsu02OF1pRdd6WlljMjl
	qbMNDMGcJaz1X79YBYGhVlc8aceVePY6ukCFnKYkPARWNk5kZpFvDPYBVZZ2+cO2gKRp
	iqVQ==
X-Gm-Message-State: ALKqPwfuXC0YIr3rRKBAOIe+AYliRTA2GHVmc1xmgCG5W/PEZdLBL4lF
	mTsRxJhE1POoqpnxzLDHCblLHXY7
X-Google-Smtp-Source: ADUXVKJ4d2Vr2GViHZ442/KV2K2NW2r46HE74bIzzzL+p3GkGy3mjDZzCroPae1E7PNmPHNbT17uLg==
X-Received: by 2002:a50:a55d:: with SMTP id
	z29-v6mr17911498edb.103.1527980407800; 
	Sat, 02 Jun 2018 16:00:07 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	g8-v6sm14081361edh.88.2018.06.02.16.00.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 16:00:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jun 2018 00:59:57 +0200
Message-Id: <20180602225958.15177-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2 1/2] chrpath: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 23:00:07 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use Debian mirrors instead.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-devtools/chrpath/chrpath_0.16.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index b61eef9c8b..0c9ce0c301 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -2,12 +2,11 @@ SUMMARY = "Tool to edit rpath in ELF binaries"
 DESCRIPTION = "chrpath allows you to change the rpath (where the \
 application looks for libraries) in an application. It does not \
 (yet) allow you to add an rpath if there isn't one already."
-HOMEPAGE = "http://alioth.debian.org/projects/chrpath/"
 BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
+SRC_URI = "http://http.debian.net/debian/pool/main/c/chrpath/chrpath_${PV}.orig.tar.gz \
            file://standarddoc.patch"
 
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
-- 
2.17.0


