Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5929660049
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:37 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g65so1839865pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HM500vjpmtDxvYSG46BrNPietPLSwvb/SJO3SAMhRdU=;
	b=BSRWp7mQXEFO001G4y7YPQQHgOQvBp4MErCHrwdwddHaB5bzpscqqHhpZ76LzFT8YD
	DNw/Up16fyZ9T4/UfBnEpbl9Cy6VcO9Ewl8GInozgh6SCwd9XsXbEg2sSttz7YJ9XWS5
	QLaJjDLMSFWPcLp0kgpZ9YP3rxiUcGwZiPDTBwQA8yHr+GcFWdW/cqWHJlsCozKXFxYe
	BppQ+GRcuCGCXw+WdVF70qqjp2rPLnPUyVGs6Bel95I68mbijCKochwe8939smP9RO6R
	Sp4c5fjru/+xlkXvH6JxWh9TXMxcdIfIHE5le40TiBW+X1IH35eFrU7cTe79BOniExBr
	buBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HM500vjpmtDxvYSG46BrNPietPLSwvb/SJO3SAMhRdU=;
	b=DuEMk1+2OmEuRRbq8BZsoHiu4vnoRpeg9nbUcd2wveV7U3sWdg6Tugz9xc8xljr+1g
	oR9rmnueNKJaC0O/gVIQ0uQQG+tE/wexolyVlBLXrjDdV/40jjeB4o5JJvAjuNIsv4nK
	abkQ2/yhsAWLG1X8IvoLpzfrbvrts85Qmd+GTakPmYyL3/VZGB8zYEYyYh0d6aNEwFN3
	3c2fzWaL2dFfxPRUD9sEAIa5lSFAY9wv0wRK4EwGX1IcBB/t0k3yZT4y3Fl3ABQHLdLv
	E0ut6BuCckCuRS18MZoTX2JYos4IjrM+u1WtbAj9JrgYsVthXUu0B2S9MmLWVerVGCRh
	rJWg==
X-Gm-Message-State: AHPjjUhpSVKCKjSJGVV9POnB0JOdRLWuFk428ID0gBkQhUTAAUSKlDxa
	nCQvAfTxOXyBPtpO
X-Google-Smtp-Source: ADKCNb5duLeXmOCSZVsSJsK9pY6PH9Y0K/ECsX44fC5AcaNnAqVdo8xQJqngvpac5yVQDPEEWlvZAg==
X-Received: by 10.84.241.77 with SMTP id u13mr5339919plm.103.1504912958540;
	Fri, 08 Sep 2017 16:22:38 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:37 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:51 -0700
Message-Id: <1504912911-23120-16-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 15/15] mklibs-native: update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:37 -0000

The upstream oe-core recipe fixed similar fetcher issues by switching
to a specific debian snapshot version. However, the debian snapshot
doesn't provide mklibs 0.1.38 so fetch from yoctoproject.org mirror
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
index fd04c97..5db795f 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native dpkg-native"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BPN}_${PV}.tar.gz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 "
-- 
1.9.1


