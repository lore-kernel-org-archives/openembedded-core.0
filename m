Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4167ED47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:03:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id s15so314442wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FRVrIhVRSscOCM9qdVZ32fqhSntc+4qajrjE4GKkVqk=;
	b=MgnWEl371xD5yI6zs1wpMKwCMCDqNaB3nwXxoKPVtNaFAWa71gvDhpmBLk0KYSjB5m
	7mGa+ixlizNaIzM5GMXhLKADRDd79IUgfXpLCF6NKPeNXic0YyTEPRn0zY2EOb4kIL8B
	OiXn49yPIbiLw4qr2tjPjy39dIb4LMd0l5gW5bhdndqa8XtJmMb7rpkjEdYv47LBZ1p+
	DgdNS41ENZl6z5r6IHvBr3nSX6uFqE05KKLMANaeg2DxGcXUneef9kHqPSXviBuBfMFm
	cdzD+JsqgGkn9zMLyJ/un29lAtDEOqKwqTMtuGPfAl7slgdX8JK6ctPZk+O5XR/vmsXA
	SqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FRVrIhVRSscOCM9qdVZ32fqhSntc+4qajrjE4GKkVqk=;
	b=EP/EEcqTKcxh8SnRolCFpnRFvxM8ecpBTpQhvJFp8mgz1iFwynnLYUgy80lqhxOHbI
	eOVFPOPbpWAJoNFZ+Vu6quUb0vNp0xVkTRCgZxMd5hyG/e94I8SFNeQQCJpxNrfi1s2d
	uWRHl3h+I3sLKmPqWitNH5KBcocj4KCkQsFqCUEACnNmbYuclwOrLs+rTpCQaJs1lrZ8
	lh29BMOWH2r2AbvrP13v4NJuMT4yBluKExeEdkjG508Kt2i1ok2DEdgconokZ6TdJS3G
	OzodLhGq2zA4CLvG0V8otLTCsq3KXHdypoEJdukdJaMDCg/GSMlf3NnSCghEOIhf0Sut
	894Q==
X-Gm-Message-State: APjAAAVDwKY1RbnR5OEUw1702ryZT06IZjglV9XDtat3a8Ivr1bireLF
	kJUqqyNksbZZGer00Yyhhg8I2/4lPuY=
X-Google-Smtp-Source: APXvYqw08utDAvMJ3ir1oBpwIi8J26rUA/CzOG2B8Rc+bq26kg6mXnjrA6fvT+51IZS+7Xv51NtIjA==
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr6943616wmg.27.1563361409197; 
	Wed, 17 Jul 2019 04:03:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g8sm24584326wme.20.2019.07.17.04.03.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 04:03:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:03:23 +0100
Message-Id: <20190717110324.24433-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717110324.24433-1-ross.burton@intel.com>
References: <20190717110324.24433-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] git: set CVE vendor to git-scm
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
X-List-Received-Date: Wed, 17 Jul 2019 11:03:29 -0000
Content-Transfer-Encoding: 8bit

There's a Jenkins plugin for Git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 26a22ac1e84..6e137432f0a 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
+CVE_PRODUCT = "git-scm:git"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.20.1


