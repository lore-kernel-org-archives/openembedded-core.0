Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D910272491
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 14:49:36 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so79083006wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 07:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aOI4+B7OOnHh+mmHyWlpKkRl9AFc84TsYEaRaU853E8=;
	b=PKlopGbanI65Tzgmhk0qy2icTFPvQk9YOpXOftEcWktDeqb6aXoscHN/KGITZov20I
	U5ZSQa2/wk9/IerortxxgZo/l0NA+WREtosWZOThrBjRw9Q96zmz2/I249HkvCnx+c1K
	csSAySnhOpySX2MT+Ssm3u+U/U7o8TjCZ87Bg9lm71AjMuV7uJ1iIwFmQz6nA8MdzN0w
	AJ9z9Kwqb+RBSffO9SRMtHT5ZYd7Wi3k9uNwigyrjcYumX62IKwHBzFMQUr2t279tZ/z
	tmpJ2IbskZFUa/7PJE4n/hET7PYQjM/VSGQ6V+F8mVeXdXYd7QYGZ1yi9i5o2l5FfPlO
	UB+w==
X-Gm-Message-State: ALoCoQkMzGfjOVNPxHZRSkkuPI5CMXaOWPtP5ci7NZXiLO9+71kZWQi1HPHhad22qSn0Shn78DWq
X-Received: by 10.180.160.210 with SMTP id xm18mr32304677wib.93.1434984576132; 
	Mon, 22 Jun 2015 07:49:36 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	m10sm17588413wib.17.2015.06.22.07.49.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jun 2015 07:49:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 15:44:33 +0100
Message-Id: <1434984273-30731-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] neard: remove unused service file
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
X-List-Received-Date: Mon, 22 Jun 2015 14:49:37 -0000

Upstream ships a systemd service file now, so we don't need this anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard/neard.service.in | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/neard.service.in

diff --git a/meta/recipes-connectivity/neard/neard/neard.service.in b/meta/recipes-connectivity/neard/neard/neard.service.in
deleted file mode 100644
index a6f8a84..0000000
--- a/meta/recipes-connectivity/neard/neard/neard.service.in
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=neard service
-Documentation=man:neard(8)
-After=syslog.target
-
-[Service]
-Type=dbus
-BusName=org.neard
-ExecStart=@installpath@/neard -n
-
-[Install]
-Alias=dbus-org.neard.service
-WantedBy=multi-user.target
-- 
2.1.4


