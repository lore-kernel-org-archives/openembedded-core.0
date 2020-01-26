Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0593A9169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:24:57 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id x8so3908769pgk.8
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uwjF9oS0jqthwG1nesxeCn/B+YOHkDbdCFxPd9bf17Y=;
	b=mw7XovEB0nfrGbYaMMrBKn+r3cr2C4griVTBAfQfcAN01SYhsx5tz213zejrHpeRgL
	6ziNni2XgK6dknrIcuO2LqEg/z27VxsIqCQeyyntN7cu18CtitlJC28iwTznRLnPs/F2
	4wtWtY/TZjlAS8tXxsj5hXTeWgPdPhxh66EYECUiCCLK8Ue8YBh7/OIK/FVzBFREZNBi
	jINLKF2LetlIul+kRypPlmg2bLlu6sYlgGWUZIQ3411WXCjWmFEz3vhIYnwnfc3wZU1x
	w7a0Z7AN6sQJpR6MUow9S1x6HouyWCOmfjybzNBfrXdwD1uiZlluptAm+Ug4kgB33wSE
	6hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uwjF9oS0jqthwG1nesxeCn/B+YOHkDbdCFxPd9bf17Y=;
	b=izdAIz2es+8IQrdKf+/5Ar68IeKwoG1k79dw08GVyzJRzjIA2tH2fs8rDm4zDSevKY
	+UZhs24rqGQntrYfrlnPc37CMusNsNpP9pcDLULu+XuoLYnxg7NfbUUpy7A0CMn0k4TQ
	d1naVaPC81K3PXN7URCnmXLOdngB1HD+zWVzzC41JzybWHVBqmQig7ll0CPA6MebIWYA
	Sywddq+OwDE+b6S1eWJsGzVUcDgf0YgCoQyLGcrsafkIXvFUJ228mU1MTnAe99Do7KIJ
	wpDs2U4eFHkzrREt9eKFZNAzzh3Cl4GW8wWsyeAZrdLy/yz6q5UqGjf6U2QhsRvQQyKV
	oMlw==
X-Gm-Message-State: APjAAAUtUt9VeRLmuRqwTf6npMoTQ+IpQs7YDj+97xUweVQOYdJUbhqU
	+DonT7pC+jc/p1hwGqkk2Yf3Om8O
X-Google-Smtp-Source: APXvYqw6ezAcnw22jw0uvhLOSyl3soJMGlVmuXrmUpB3YxnSlTGJtFlvmDpM3pSxXvYrlYn2jdxjhg==
X-Received: by 2002:a62:e411:: with SMTP id r17mr11873928pfh.119.1580055898911;
	Sun, 26 Jan 2020 08:24:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.24.58
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:24:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:27 -0800
Message-Id: <a2507600fecdf815ad80da569c5e8ad65286b812.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 02/29] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Sun, 26 Jan 2020 16:24:58 -0000

From: Adrian Bunk <bunk@stusta.de>

This is not exploitable when glibc has CVE-2016-10739 fixed,
which is fixed in the upstream version since warrior.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python.inc       | 3 +++
 meta/recipes-devtools/python/python3_3.7.5.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 5d280dc63b..a2424a67bf 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -29,6 +29,9 @@ CVE_CHECK_WHITELIST += "CVE-2017-18207"
 # of Python that cannot really be altered at this point."
 CVE_CHECK_WHITELIST += "CVE-2015-5652"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index c560c4a29d..c90054d45a 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -46,6 +46,9 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "3.7"
 PYTHON_BINABI = "${PYTHON_MAJMIN}m"
 
-- 
2.17.1


