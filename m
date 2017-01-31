Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3A371E50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:54 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id k200so28225839itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KxxqQXQuYTz8LAurcAPuhesq4McoWBYhB7VZWxxVprM=;
	b=kwGYjsZtVm4Rc/upsqGY4Ke+qHpOCpRdpindQGbepSTLwfH2G4HllTAYKx0/L5QfU3
	OJT4urdocfn+nELnZitDCnlNr8Hca22P1qkCmtxomfwBxWLiQdtdUO0hYBKjw3crYuvj
	qkGF/ZARodvch3+yM3zmQbod/7XFJaf/1LI0rddqquo3PGIxRiSjeS2rQUF6dAlnEcKu
	tEUjR4FPxXwF8bel42X1/qKj9no+nQUTGVQP43pfoYXY5ynEixpOfOWzMVBY7mItSWhJ
	RrLbwy4qGoCSSlqhtqHUOL9TFjET77isTM5ud3RgWHEJkbMuGBeNqbIF/ItLnteUwJLU
	Ra0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KxxqQXQuYTz8LAurcAPuhesq4McoWBYhB7VZWxxVprM=;
	b=F79MOwCskioy2B0eWBoYogbxXXaK1TSddHgxGaXGU+45rrbZlzesvjKz8CR3vK3lZF
	5I27xIpt60waSor9/znbWejdQhjDFGuibgEvv4Qimz1w17h6BmGeMHX1aoPWcdcR30mR
	u2BB1f83nObPpB1dz0iSQtCq0HV5W7zh+MQ/tpGZLpF5G/5bO2Hf91DxEWRCfbN9+eYu
	lCDx/K3VRj9fsWy4go8bVUc5ziM1e1K8E+tMBWeXWGWEAUJEVwc2b+L3ge1AMzM9IHnQ
	VWLA7KafGhI0FHYHExlnRZYH0/Bo/hPtrnFyifppThnHJcLdrk5+r6Ncmz3/oz/lEWJG
	qvUw==
X-Gm-Message-State: AIkVDXLlUw90fm+WF9Ux8MDdVBKDPdkHagk+S5gNHirFEjUiphXULBQbPtUj+rwmoJ/8NwGm
X-Received: by 10.36.178.21 with SMTP id u21mr19294442ite.103.1485867055055;
	Tue, 31 Jan 2017 04:50:55 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:54 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:30 +0100
Message-Id: <ce82bb4a72c79d3e3926ac742a349db6ace2d401.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 5/8] verify-bashisms: revise update-rc.d whitelist entry
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:55 -0000

The actual code recently changed to:
   if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 613f174..df071e3 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -6,7 +6,7 @@ whitelist = (
     # type is supported by dash
     'if type systemctl >/dev/null 2>/dev/null; then',
     'if type systemd-tmpfiles >/dev/null 2>/dev/null; then',
-    'if type update-rc.d >/dev/null 2>/dev/null; then',
+    'type update-rc.d >/dev/null 2>/dev/null; then',
     'command -v',
     # HOSTNAME is set locally
     'buildhistory_single_commit "$CMDLINE" "$HOSTNAME"',
-- 
git-series 0.9.1

