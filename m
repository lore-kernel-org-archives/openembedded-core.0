Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4520B71E63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 13:58:26 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n3so7635469wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pEpQw1L5WF/bRoK/SZ5rqV/Vht7PU9yKJJFR6yoY7kI=;
	b=I4zCtfddt9FjBQPs5uLVBkhEtTwi9VOlG6YOqv+dKIq8wLzguitT878hNRqcjMLLkQ
	ZRcUXDcDOGiI44Ijq5skd/54kdb9UhxlnKGu7g1dH/sWumVTA8rjkw/x5kqrSbg3mYJO
	QP6SyfSIckvzjWKMPbGgrUhVwbrcjBDNek1o8Zl0tbcl2H675tsVZ+RvixhPQkpnpBoJ
	EWoFfPndwOjYZf2iP8xAp8jJRE4izpYHRoWgqpCUmhSPKBU53lvc953aYv++/Pz2pgfj
	9XPQGT9nzVzJzlUCOrWrWS+oIgWNnaIL4gcqUishT8RACnuC2QcwMYEjXvE9L3pA+t9A
	gr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pEpQw1L5WF/bRoK/SZ5rqV/Vht7PU9yKJJFR6yoY7kI=;
	b=GFl44E6YoT9/TNnn7TYfop8kzeJuxMKhgT4q5XOcS8tp+Sky5SlxkIYGDG111GpYOh
	CvX8GCLF4QHgV2gWyS3RST9k/XPB1eaC8IJs2s6pyKWeI5GeWXtl5APaYX8NXw/ugfpd
	ywD3EJiSpcbn9Q8ZIHpLPUL6ClxdXyRwmVEtpiRblm+5Gdbb9Mdz5sbGUNzzu6Ejl8D5
	Wm1TaiWSF8Zdolyc3DpylG1FamuWEwoka2iVS3khaZVX+bFY3D3GB7TvBJW6WdEjGopc
	TcR1k4Uqtlnl8D6KEbHMol2rZyfNpiuQadYbHQzO5EfiDjL8895b8E3NZPrHDXgnhYOn
	3hsg==
X-Gm-Message-State: AOPr4FUsP+2UUAyZnXKg508S9CutI6Q+rxDtYSAlQpwdbw5re2izldAIipgBN4CT9TEajZaV
X-Received: by 10.28.30.148 with SMTP id e142mr3816313wme.69.1461679107394;
	Tue, 26 Apr 2016 06:58:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y91sm3354887wmh.10.2016.04.26.06.58.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Apr 2016 06:58:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 14:58:22 +0100
Message-Id: <1461679103-2828-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] mesa-gl: add missing MESA_CRYPTO to PACKAGECONFIG
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
X-List-Received-Date: Tue, 26 Apr 2016 13:58:27 -0000

Otherwise the build can fail or there is a floating dependency on whatever SSL
library Mesa can find.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
index fc2bca9..f06a3e9 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
@@ -8,6 +8,6 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
-PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "dri ${MESA_CRYPTO} ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.8.0.rc3


