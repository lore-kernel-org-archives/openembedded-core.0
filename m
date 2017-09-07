Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id E5871780B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 13:35:11 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id v109so4090684wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=j1PVn/af4X6Tc1er6+FBlAKlVhZlwjMSfJ8lSdOY4zg=;
	b=VUiaY611wmXQqij9WJQotgZT9EIr+FW42ZDc5ep7BqOUoW8i+dtivuwl7CZWi3yH0O
	rdiaSQbxZaqpnS6BYXP6Bn80gcW0UyfWYHPmIADU90gxD05v7WUN44voOAwJhHSkSC1x
	PGlktBy6Fo5bJX/Od38/ZvZK0PNkL+NyTwdAX+evJFkw2hbmRwx3B7zRBGPpB9RWdJO/
	ilnO3CNTkOZ8PvPBUBYmnXFY9eBeJf2hKPLcQ7xDozbcEYyUdJPMoq4qAriAIisaf0yB
	vKNuSTPN587DK6Q3iZYv7S/8dUlvhDh+o/DKojRO8ks+w4NipUCJdzlRbD4V21MiiPt6
	feOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j1PVn/af4X6Tc1er6+FBlAKlVhZlwjMSfJ8lSdOY4zg=;
	b=ZqWyywkRIUpwIeINvswveBB60UN/pa4a3se8lWDiqqt18+ItC+v8fredXowpCKE1TL
	A+jrsroQu/JUIcpUuK+WF5kqZva4n+qVZRT6rTHrE/u8G1jlVHgZAA8MsJ5UqUgxHaSC
	n8ZS19VXgWbFAdVhyI3ulapYsq8C2Do9w6l5zXwGWJ8rcElDxutHrDrFzHvG7bFuUvdu
	T5tqce0ErwMsccE1h3VfEfk7xLWXc11vI/azZoicahqFtUbMWIkl2gIEGcE/jB/CH+57
	CrJuH6LRoh018MICXLBfFQ62FGgUL3Rk7dT5Gc6Fc2mVOTiYA8LuYgxWdG0oXjBs+BYK
	UAcQ==
X-Gm-Message-State: AHPjjUjoAmG3d3Y+peS/KWwgG+TaLWOQ688a6pbULZxo8HSK4oEP9Hmz
	aJ+Y9vtFk/IgaPSA/gE=
X-Google-Smtp-Source: ADKCNb4Y+vymm25Ovegj7TemtenuZfGM+tqx5q+uYqlzpjSDulxVxq1tltFsb38zOOizJ8THvLgY5A==
X-Received: by 10.223.161.194 with SMTP id v2mr2358796wrv.45.1504791312005;
	Thu, 07 Sep 2017 06:35:12 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i75sm1437114wri.82.2017.09.07.06.35.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 06:35:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Sep 2017 14:35:09 +0100
Message-Id: <20170907133509.30701-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libfm: remove file which conflicts with libfm-extra
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
X-List-Received-Date: Thu, 07 Sep 2017 13:35:12 -0000

Both libfm and libfm-extra provide /usr/include/libfm, so remove it from libfm
to avoid sysroot conflicts.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libfm/libfm_1.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libfm/libfm_1.2.5.bb b/meta/recipes-support/libfm/libfm_1.2.5.bb
index aca59e1476a..1ddddfdc990 100644
--- a/meta/recipes-support/libfm/libfm_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.5.bb
@@ -32,6 +32,7 @@ do_install_append () {
     rm -f ${D}${includedir}/libfm-1.0/fm-xml-file.h
     rm -f ${D}${includedir}/libfm-1.0/fm-version.h
     rm -f ${D}${includedir}/libfm-1.0/fm-extra.h
+    rm -f ${D}${includedir}/libfm
     rm -f ${D}${libdir}/pkgconfig/libfm-extra.pc
     rm -f ${D}${libdir}/libfm-extra.so*
     rm -f ${D}${libdir}/libfm-extra.a
-- 
2.11.0


