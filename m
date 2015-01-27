Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6AF718E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:52:36 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so17021286pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/XrJ5jXA/unyNONYn5m1gJUilG3SunUUH5DYxmIuuZc=;
	b=es1DmiTGWRcBYio6t57HK7Bd+BOq8nybn/lrjC/UZlDQsYfMzgDh3H1pW3edsRW7ge
	KmphWSKiltLYON6MmA3A2hbTL9TPxYgjH5MXchFRjMJHQ28Cz23Zq/UT6xq8eheaxh/H
	BfhzpRONaJrGNcOby4QuitYVI6F/H7BoaAk++okUgm2ZAjXVNB9+Sauj0J4jiGuPvj2R
	gJYsUc3wpLHAWKeCy71l7QwE5Kdn8tFcjDrUWfhuChR708AoVo+4Dj/iTVZYsV4jso4w
	LfHd/yGiB3INZEXVU6rTmkkdtvT50UUd8sdc9LlNO9oL6EwHkGrAbZFlWk6p50joF+mc
	pmhA==
X-Received: by 10.66.146.167 with SMTP id td7mr40644243pab.101.1422341556961; 
	Mon, 26 Jan 2015 22:52:36 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id mz7sm533112pdb.3.2015.01.26.22.52.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:52:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 22:56:12 -0800
Message-Id: <1422341773-12634-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
References: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/5] gmp: Change the SRC_URI to reflect upstream changed location
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
X-List-Received-Date: Tue, 27 Jan 2015 06:52:38 -0000

This avoid warnings during parse though it gets it from
yocto mirrors builds dont fail.

Change-Id: Idc33d14802862196a2094ef712781530b8a9b35b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gmp/gmp.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 6aedc85..558ee06 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -4,9 +4,9 @@ DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operati
 HOMEPAGE = "http://gmplib.org/"
 LICENSE = "GPLv3 LGPLv3"
 
-REVISION = ""
+REVISION ?= ""
 
-SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}${REVISION}.tar.bz2 \
+SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
 	   file://configure.patch \
 	   file://amd64.patch "
 
-- 
2.1.1


