Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E81027C13D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 12:34:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f188so2211795wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 04:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=spLZXRuhTdktd44Z7SY32mMTVh4LrTnHr3VSHowWI1A=;
	b=ZwPKHXc+WuWFtMxAi1Uzv4y+yxynx2wycd4Hl0SIsTJBAm45npcx/LRGgScIO7XUZm
	t1rM6Kf7RYjVQyuM7XTZdJQxADg8jkIRc/rKj4wqMgyMjk5LvYQLP0Asxl6IJc248hGE
	2XamEdnM+nTZW/5WFJScsSqe/8b9otVSqscAdpfLfMGfu2ec78RKCJFSgzzPkL0skHTC
	QRnyAeDXnXPT4Her3FTcq/4L51IpJGolh0fdsfKTF36MdV1VGTQnVnXtD55WM06sXM7Q
	lqHqpaVlm50t/8xiiv10UsAFz+huJ9hsxGcBu3c0JlisXVbX1agBaNkIfFfchA+N8I6o
	e7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=spLZXRuhTdktd44Z7SY32mMTVh4LrTnHr3VSHowWI1A=;
	b=dg3nGIvXxeeAzn3Y7svyOO+vMjl8vFjbhV+4ryAJH3PfF8ODJrEvuhYNpvBUj6reJ4
	AWCAfMCQ+uLvzBvyLirikQqjm/kH119xWQ2EYYK7mHkBQQritHo5pmK3nb/wMCexan9l
	anlZrQQAkfcsGzgiM78Hu0ObM1YeOlZcoxnrAEqoqHOTapEG2rDI67DG2zZ7SyFLu06J
	5aj2CV6Kn3alwZ7207mNLA4d3TyNHalkoRO7JuaCZ8OJUrcKwmsnKMAFGpXqg7sb/I+a
	Mi3HcZAfZuSqGeBEhofG6ZU6LBI6bchMDisVZkZpISOv7UdjVHjvpv6eGAx7NN85nMYS
	oiSQ==
X-Gm-Message-State: AJcUukdToWKHHJ9Kd5XHwgz6shaPtrFB8l55k235x2qrrVgJwCquWeJf
	YRPFj10pSGd6H74ai8F3uqF2JJmUeWw=
X-Google-Smtp-Source: ALg8bN6DwnObtJ1crbuuYpLR8Naz3a3J3DrqmAG18ZwPLtoVdLBY1avPMZ4DItIfNM5LaANmKVz1rA==
X-Received: by 2002:a1c:570d:: with SMTP id l13mr2231821wmb.139.1547210099153; 
	Fri, 11 Jan 2019 04:34:59 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q9sm47794825wrv.26.2019.01.11.04.34.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 04:34:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 12:34:55 +0000
Message-Id: <20190111123455.1352-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python3-smmap: upgrade to 2.0.5
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
X-List-Received-Date: Fri, 11 Jan 2019 12:34:59 -0000

The maintainer lost access to the smmap PyPi account so as with gitdb, set the
PyPi name to smmap2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-smmap.inc                       | 6 ++++--
 .../python/{python3-smmap_0.9.0.bb => python3-smmap_2.0.5.bb}       | 0
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-smmap_0.9.0.bb => python3-smmap_2.0.5.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index c81474e922f..1a2259e4b8e 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -9,8 +9,10 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665
 
 inherit pypi
 
-SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
-SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
+PYPI_PACKAGE = "smmap2"
+
+SRC_URI[md5sum] = "1c59a985be5aa645c4c5a4e063a40dd5"
+SRC_URI[sha256sum] = "29a9ffa0497e7f2be94ca0ed1ca1aa3cd4cf25a1f6b4f5f87f74b46ed91d609a"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-codecs \
                    ${PYTHON_PN}-mmap \
diff --git a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb b/meta/recipes-devtools/python/python3-smmap_2.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-smmap_0.9.0.bb
rename to meta/recipes-devtools/python/python3-smmap_2.0.5.bb
-- 
2.11.0


