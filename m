Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id EF9537F556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:14:26 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id l51so11767923qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 21:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ejP+ZLWlbHV8Qf6l5Ev38BxlGHxIyGYM0Ac/jFheulE=;
	b=AQn3oPt/r1TBRbgbKJ0vOIjOydPLiHprR8n/mFMRmjBJV/JU9bG6ksh/rb77SuY9zq
	bE7NSa2/gL2pKOzuCdAIrY1JJb7AcmhvTFxsrQ9BBwzKH6x59/+u/F5pYd4Ww4Ix8Ds4
	rP0fQOiG46NbE807ALDHWBkIdZOJW1rIkfEr2T9NyJAoPnIB1AJ32qRnSU5IQgNEDbsn
	S2LMsvht22qq1KkERH4WNjymlKcqrgelOPlGkSIlZJ/fugUHxum/n8Eu9TRQ203GOetq
	fJv1a2trUMa+2ckLsf/7/oLJEuj9HBFaZd/Kkzkf1yQKy6vZptyLGcyg7y2KVYmte3la
	NfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ejP+ZLWlbHV8Qf6l5Ev38BxlGHxIyGYM0Ac/jFheulE=;
	b=mwZrJtVs2jYdAOXTOwrseFYrnZtZSkrainZ/mPjRSOEF8c+UJHX0pCLaR/SvCoCZOu
	XPP8ErtBV6WMBoTIcMZUv+m5JvwBypvqy6pMVNhU1me1L2Zy2dOUcv8nMlyfwi406mBo
	NM8mDKgdU/KQkr8Zh4KaxDfJQY3JfEqLWO3DzK61vtig0vR9sd5SF39eZtXl1UERutqo
	8ZTrF/FRtzj7ChATjRAQlQKNIfGMhQyaBkDugSTyrY6gSfh4GCaH/PAlzkR5cBvrxXNp
	gxRXkBx/CvRl3USsZGiDDFaDVx5S6uB+y3BR4o0UGn+wAWTAUsO2g7So/zbntd+Lse8B
	KlLA==
X-Gm-Message-State: APjAAAX0N8OysQWPsZNR5Peycb5/MrrjBKVLGfcR4IyK0uqwXH/0MThT
	XJzpGeuo74MT4R7OOfyYgaTsHdhJOqw=
X-Google-Smtp-Source: APXvYqxvhMLoX53K+tqR139QdZTa0YKRYtbZlRgxpCsVi6PFPYcq0MQ42BPSA0nFMJLqLDwU4Y2y6Q==
X-Received: by 2002:ac8:29e8:: with SMTP id 37mr12782881qtt.21.1570767267677; 
	Thu, 10 Oct 2019 21:14:27 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	q64sm4045287qkb.32.2019.10.10.21.14.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 21:14:27 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 00:13:59 -0400
Message-Id: <20191011041359.5933-2-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011041359.5933-1-maxime.roussinbelanger@gmail.com>
References: <20191011041359.5933-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta: add missing description in recipes-extended
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
X-List-Received-Date: Fri, 11 Oct 2019 04:14:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-extended/cups/cups.inc         | 4 ++++
 meta/recipes-extended/timezone/timezone.inc | 2 ++
 meta/recipes-extended/wget/wget.inc         | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e303f3424d..2149cbe4cf 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -1,4 +1,8 @@
 SUMMARY = "An Internet printing system for Unix"
+DESCRIPTION = "The Common UNIX Printing System is a printing system and \
+general replacement for lpd and the like. It supports the Internet Printing \
+Protocol (IPP), and has its own filtering driver model for handling various \
+document types."
 HOMEPAGE = "https://www.cups.org/"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f6bab1acb4..91a5cb3327 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,4 +1,6 @@
 SUMMARY = "Timezone data"
+DESCRIPTION = "The Time Zone Database contains code and data that represent \
+the history of local time for many representative locations around the globe."
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 07e8d8e871..2338328216 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -1,4 +1,9 @@
 SUMMARY = "Console URL download utility supporting HTTP, FTP, etc"
+DESCRIPTION = "Wget is a network utility to retrieve files from the web using \
+HTTP(S) and FTP, the two most widely used internet protocols. It works \
+non-interactively, so it will work in the background, after having logged off. \
+The program supports recursive retrieval of web-authoring pages as well as \
+FTP sites"
 HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
-- 
2.20.1


