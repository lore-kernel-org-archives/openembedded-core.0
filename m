Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A2ACC6D2DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:35:04 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so1911955wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 04:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1oIiSrB2abwKVjHh9pBU/vjKCZrfREbpSiWiS+Q+JNQ=;
	b=ScXGxhNGTkMq1bL3pL4RQfQ2gjCAQsHvEUQh5WWrw7gL/R1Ebxpe/U4oi4MTnQ8hBF
	c/CJV3MJ3wbteaVjYDzD0puznMUJKrcZMjpO/L3wmNE4dgEyPbL1V5iYsyZrlcaz5Kt6
	36KZ+5V5WgZIFB6FZVeAcczwx978gPT6ZAlnXQ76hFseSz1lJWj69aok9mXDTRYEIZr2
	gscuARGFnngXhB2bUKh2998EPgJUxG1+qqprsVkDC9puM0iLUUMspXcgYPFbbFm9ODoe
	TJGOit6loIzzFBOVlhXic6y7t0S41FWBbaGQo/3xfjYjlwuMl+SFAidcpCHdjpYYBHka
	eBAg==
X-Gm-Message-State: ALoCoQk1ndMb06cJrIwSx68GKpx2PUWSRWSjMPR8JQypis+InV6PlAhXXLHooyhatfHIyT+sXJDM
X-Received: by 10.180.198.198 with SMTP id je6mr2150951wic.7.1383914105184;
	Fri, 08 Nov 2013 04:35:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ma3sm5189047wic.1.2013.11.08.04.35.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Nov 2013 04:35:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2013 12:35:02 +0000
Message-Id: <1383914102-13963-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] syslinux: add APPEND to dependency list
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
X-List-Received-Date: Fri, 08 Nov 2013 12:35:05 -0000

Changing APPEND wasn't causing syslinux to re-run, so add a manual dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/syslinux.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 2a5b766..62d4b7a 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -179,3 +179,4 @@ python build_syslinux_cfg () {
 
     cfgfile.close()
 }
+build_syslinux_cfg[vardeps] += "APPEND"
-- 
1.7.10.4


