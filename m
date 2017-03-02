Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 66C10775CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:22:55 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id u48so56193996wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 08:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=S157eGUZAyZ12cHIjg0u6Xjg9cGBj1JDjIykMI+NbfM=;
	b=tMHwmAI2zO/gP1UhPVgmLAomgDLws8p5mUGO6BUzJRya59PkzlHGfW8LFj2s71QqfM
	P4LrowNgRu5B7q6MnmcLIkVzryGKFxfUy7RtVE2g6zJRuDQnIL6pc28PIe6Q5TSBiSCz
	oBSziOCs3t8Z5Z6XkqkLjJVPKA3lxxLwJP2BrSPwPG9MOrriLJZqoIgZfNX+Eea6gRwm
	yvkigB2Gtac/PCF7IY+iiA5ew1FIFS0xJ3bMbG9K1HPkxR4Lkyn/aAz8NXRshHaOixFR
	xhblEjhlDaI9GgIDHmNS8mR+340V4rZLoMGoehX2IutReKecC83UDpdpArqXihFJNi1t
	FnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S157eGUZAyZ12cHIjg0u6Xjg9cGBj1JDjIykMI+NbfM=;
	b=gGLDL08IU0Flq+lgyDUOA2unVQaeYDzlDk8KGOmBwkkyejErexivKFFan+9NcY8vGb
	ZbqvsVqMUCCZrU1I9qyrXmx24e6omuXrqtLzyCjdXBtVuqT+NslX2kmLesYhu0MPUMvS
	IhwP0iBJInxJ6vNH+v9REUNYo+lxUbdHjlknjAm22px+zcmwSqd87CsGKRIe7M8MgsTi
	Bm3hdt8Lk1GwQ56Qjti/nOblIZWxSZQ234fvqM9gal3H+k6fO8UYR/8hJQhtmI50mr4P
	LLL0+iUXUESlTo3R5OPKtyVTIaOw1tCQu029et8kBgxDnn1UgZoQiBh11E2L+e51MlMy
	VzXg==
X-Gm-Message-State: AMke39n/vzFeV9ttriWKbLKXSdAx0pvZfEQe43E3bs1WNoULNbLfF8mjq6/5rpROTbeyg5EK
X-Received: by 10.223.130.214 with SMTP id 80mr13666229wrc.43.1488471776108;
	Thu, 02 Mar 2017 08:22:56 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q12sm27752980wmd.8.2017.03.02.08.22.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 08:22:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Mar 2017 16:22:46 +0000
Message-Id: <1488471766-14723-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gcc-source: add comment explaining why a function is Python
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
X-List-Received-Date: Thu, 02 Mar 2017 16:22:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index fab99f2..03bab97 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -18,6 +18,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
 
+
+# This needs to be Python to avoid lots of shell variables becoming dependencies.
 python do_preconfigure () {
     import subprocess
     cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
-- 
2.8.1


