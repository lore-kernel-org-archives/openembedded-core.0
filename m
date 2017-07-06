Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id BF6E777BDB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 19:49:16 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u36so1368150pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ACukxwbIAgLlLQcCzlqdlOfoPVlkDzxvOvdfIHFiRAs=;
	b=fZL6osMH3OQ48SILY0g297odw7C0BCfzwoS/miRNg+A8gX4sicv+O7q03b8LlGiZpp
	s6cWfmKAJ06LpSEdUhiqrmXXh4ys+V63fJDfEHsPGXahsHe5JeCfNMPtSpbfwl28MYhY
	mKDJKmbx927Tt/50wFC+tL+61U3IPEdGOV9MAVIbhkxiiTiN3h8+RVEhAqEnOe8vu9Q+
	m1aq+3/5wkn4xt1yScV+/uj10dtoRHXOEkGIf1+X6d2lvyL19VNGWp+rQRL0LfiqTn3a
	SgUzoh6KvqOEHUr8em4kqTvuj2oe8/u70AYLYm9c0NLJ8HsTHykyZmit14Lc2hM674dZ
	IFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ACukxwbIAgLlLQcCzlqdlOfoPVlkDzxvOvdfIHFiRAs=;
	b=oc+WutFoy2id/Bsl1oQj6b4qooP68VAhxIgMdix53tgucLf8yPx82uSr55l7SqbOmX
	7DL2/nKjioDoP8e6K+o7unDFg1k6K2mHyZEbfU1ilbA8czxxHPYTmkJ01J1VoTIfL0be
	BDyVFM5Sxo20gG1pF5RkWy9mgGsoXcWUq3azb7boBZ9/ypAvdHhVEA1JAIbZs9oAQ+Xo
	X6nGK7g927MseYWpyvWR03cF2yuKf+jmaPSXktzmR5VmtuBmLUiUV2+UKnoEjxSJ90UG
	WCwT7OLOKNapt/KlljUi0EOQ9qu5yMKLrmGgZmlOkXJPn8F3d0SpGRWhmET50+rhDIwE
	oeYA==
X-Gm-Message-State: AIVw111nKfV5LfKNDWv+o/LXlddttUCnuXaGlN3doylFJfVwmplQQHGN
	eXElKjSpdo2NWja7
X-Received: by 10.99.66.1 with SMTP id p1mr8291642pga.120.1499370557674;
	Thu, 06 Jul 2017 12:49:17 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e124sm2347580pfc.76.2017.07.06.12.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 12:49:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 12:49:01 -0700
Message-Id: <1499370542-31845-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
References: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] lsof: update SRC_URI
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
X-List-Received-Date: Thu, 06 Jul 2017 19:49:16 -0000

Upstream lsof releases are hosted on an ftp server which times out
download attempts from hosts for which it can not perform a DNS
reverse-lookup. See:

  https://people.freebsd.org/~abe/

http://www.mirrorservice.org seems to be the most commonly used
alternative (and using it for SRC_URI allows the custom
UPSTREAM_CHECK_URI to be removed).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/lsof/lsof_4.89.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 0c38e97..29245b1 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -6,13 +6,16 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
-SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
+# Upstream lsof releases are hosted on an ftp server which times out download
+# attempts from hosts for which it can not perform a DNS reverse-lookup (See:
+# https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
+# the most commonly used alternative.
+
+SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
 SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
 
-UPSTREAM_CHECK_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof"
-
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 
 S = "${WORKDIR}/lsof_${PV}_src"
-- 
2.7.4


