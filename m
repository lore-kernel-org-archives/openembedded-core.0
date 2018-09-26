Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id BD179795E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 11:54:51 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id o16so13394110wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 04:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ERz9Jk5ybP1XLPem2zq5YLB36rrOKEU8loNQsrq/Xmc=;
	b=LgvebW3ohEQyh2GBsnrAfxlqTnUeuiDe4vIAEoPEuUfovvTpODFxHnoWwKYbb1EWi/
	INcCVqG9Mw0b8zfyvVaP5A8EYJQa7fN1bE+AXsGhDTcHRyrgWHsZL062demV+rkxbruC
	zC5uTQkBR/BLbq06jMm7uZXD8Vr3RBF4CcShVcR/AxyBhTGZ3xkNsMPlz54nZz6XRxgk
	OmmiW4BQq4fjCSTNeJfNEREl/Erspl8jU5mSNQUGDj7i85SvLfSsw9ZkyxZfQQYJ1hL+
	uuYGuSmYHU5YPEu5zSs1/GvUOhtXQ2F2hx01FxDZyHXwe5KXIYETBDI283vBXEQIOAt7
	azxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ERz9Jk5ybP1XLPem2zq5YLB36rrOKEU8loNQsrq/Xmc=;
	b=kGVELkZm23MlKKb44tDcrfr9qDDhDW3PX4yF94f8zqK/gZG4Z4DVtv+gT725ZJ3DJB
	movh0o0MJvOlrGvdFrs6O6fTgmwBJfVpmvhrayOoIEhYLnyM0Nc0M1GItX77eGUEU7s6
	2VLahyA30+JG/4j34Bi2ks3vQxeQoBkzFXCDduloky3E6ssTStqDkiBWXy0FzyIORoPC
	ilqEPmV9yi/xV+xPGITxROxUKwnBdTcnX5CTAsNNBvh0TlQvKuzd5Qh5EkmA/Rz5YyR8
	SVzZaQvImjb3+N/ZK/wRNDXnrGmdkZCdvm9Pr6tFlizv0d2YsFDSWw3kARFXa/MXRKSG
	Hm4A==
X-Gm-Message-State: ABuFfojl4fBOoWJIQhxusASxsba8q9Cy4LkOWffBrDwmK1IkWYZOdkyD
	rJrZJszDcOY7AHBEH2XKQb2cBP2GeIo=
X-Google-Smtp-Source: ACcGV61Pm3ho9I+hQRJ/ov8dFlMKVuBlLOmey5LMYFL2iBlxIw0LCc3UYC/rhUsqK4XJbuxbMAXkFQ==
X-Received: by 2002:a5d:52c7:: with SMTP id
	r7-v6mr2148606wrv.102.1537962892027; 
	Wed, 26 Sep 2018 04:54:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	1-v6sm7067094wmf.47.2018.09.26.04.54.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 04:54:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 12:54:49 +0100
Message-Id: <20180926115449.27766-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: move sqlite module into python-sqlite
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
X-List-Received-Date: Wed, 26 Sep 2018 11:54:52 -0000

The module was accidentally included in python-misc.

[ YOCTO #12933 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 1e7004e05ea..d3cf66214a3 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -884,6 +884,7 @@
             "core"
         ], 
         "files": [
+            "${libdir}/python2.7/sqlite3/",
             "${libdir}/python2.7/lib-dynload/_sqlite3.so"
         ]
     }, 
-- 
2.11.0


