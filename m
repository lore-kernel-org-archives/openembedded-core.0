Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2C577199
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 11:23:01 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r129so112814263wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TgRMcU6Jr7wIKj0kYGfSwhjYz7Ql3kdAXL6LpynW+9g=;
	b=2F5vFXqe+VllPc87k6bIiUsH/PYiW+Bt98JhP2U/2Har23ovNRcWM8SxD9rlkiMxuK
	cW2bkBsZaNtwKtkqTj3LT/2XMZjCz2ieDgotckoak3XkqVc13xPeFzHcpfYwJigulOl6
	yYUNyLZlRRX+dqEfu4IOFi/BYCFsAcwy9OCLIYuRbs6k7rY9pqWrS8+bNi5CHOXyqxsT
	r00Njlk77IkY5jEQn3TMq32sNpJCjWBKSPnXfstb+/E90eoVzZsqYtGyKHxnP434peU8
	cyaTVNq3KhZma5aqVTuMSNl7B6V1Z/kFy8UuV9+YhSO3YMRkeFye3/7mhPfilnEC47m6
	LV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TgRMcU6Jr7wIKj0kYGfSwhjYz7Ql3kdAXL6LpynW+9g=;
	b=ZE3hGF+QsaWTXKzuTteEiidH/ATZNtsfVNrn8HOwQsGP3lUw9PP5xi2/YgpagCvdsk
	3oqzAU6CGVE6m1XcvfXYsr50+QutdNhQD6+GfI3RX7iGuhGyeKWUUDimMoch4EHrwRjE
	wecySsOAtIN5DHMmEFmCWCQrym6vOOL2or0Elm47huS/226lgIxeSH1qBLBSzSi2AlV7
	eDM0yOU9LyxDK2qsUxcfnmA5+QvXM1r7K/vIGN2UJ2zxYHR9iUnJaDQdPkFb/0IdalU3
	VfQ9zIz2TrR9bJeEOh35wK+bDXWMcmTLMrEmrA7DB2L+U0vOmg3ox4i+elrYTsn3OmIp
	VivQ==
X-Gm-Message-State: AG10YORivggPL1IL9JKabARo8uzm70wSccUkFIDhVik6X5VsGayC1zMSYd7E+D5bULtvey2w
X-Received: by 10.194.113.227 with SMTP id jb3mr28572007wjb.49.1454412180751; 
	Tue, 02 Feb 2016 03:23:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	kw1sm1021342wjb.12.2016.02.02.03.22.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 03:23:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 11:22:58 +0000
Message-Id: <1454412178-7095-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] python-pycurl: remove unnecessary exports
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
X-List-Received-Date: Tue, 02 Feb 2016 11:23:01 -0000

These variables are exported through distutils.bbclass, so there's no need to do
it again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-pycurl_7.21.5.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
index af517a1..7b41f6d 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
@@ -21,12 +21,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-# need to export these variables for python-config to work
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
 BBCLASSEXTEND = "native"
 
 # Ensure the docstrings are generated as make clean will remove them
-- 
2.6.4


