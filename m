Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A62727FAA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so3624041wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j4aThid6FK9GmgsiiP/EvpwJVgZnVV+yTnRQ1j6OYOo=;
	b=q4QDE8h0Kny1Zp9KxqAV5yVEzb31KTBxbdniwVpwFEsoqX0gaIz3gmLTkrL+nRZPLP
	Z1BcrbWO8neDaWs0bgbpNxQeSpXIp6ny54nPyG1QJsdfTLgRW4NNPUWtxVPNwnqkVYLR
	aBkt4ipbb4Dm7LYiEr6O8VE6RXaas/U4ytXD6/yoFcrbwnbIgb2MZr3SLpxBqdVKkM48
	xgqkGuSc71VWadI39nlrTJgRlEzF/nN2YSdueqa7AwzIPSsQYdGfLlhh/ZU98JKEDdlQ
	D+6shNZa3HomucsmrPZwJdQFr90Y4GgB9rOucgVVVfjonYBhpRwBmu1U9IrRSG3Ghvwv
	sU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j4aThid6FK9GmgsiiP/EvpwJVgZnVV+yTnRQ1j6OYOo=;
	b=Ki372Ylg5AsVdRujx+naWMNH8RIPczYca5XM1GOi6KyHirBhohPPnIaF3E8NwBUTjj
	MsSeSNGuivjFND9iyqIoiZzAGPdM4WA+riN33R/z/A8BYQs83bg7eSxEIBS2eYXCp0Ip
	1ekSnWFV+B/b5HIfUPcW0LM0kgoXlRu6z46M1Fouo4A9prBFObliX/zWbz5nbHzrin7l
	4zS5zixsJAsc4YlEjQH8eDnMxy/tDR3KRG2OuFq1Dv486wL70gNyao3a7f5M2gLhOMpU
	vwnato/M2Fi0m61nVVprZa+MXXZIomGeT8mlZjNPotN1mNYIHCmjQto2BNHmhr1nSlxR
	wYCQ==
X-Gm-Message-State: APjAAAXUXnTmxFQNmy2yYADZ4cXdvbZ3xyam7Iq4gbJDuj0eqqDcTy03
	M0fvspME8vxQM1RlRKOgz8G+dc75
X-Google-Smtp-Source: APXvYqyDi8mDaDTrmjCwS/dy4cKr2eMepOXsnbzWdXVOjdhRa/i6NGJJZOJcyoeE3LocFP5c+yspbg==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr7800290wma.72.1576174495159; 
	Thu, 12 Dec 2019 10:14:55 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:18 +0100
Message-Id: <20191212181436.1322-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/30] dos2unix: update to 7.4.1
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:55 -0000

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dos2unix/{dos2unix_7.4.0.bb => dos2unix_7.4.1.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.4.0.bb => dos2unix_7.4.1.bb} (87%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
similarity index 87%
rename from meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
index 9a712706839..1623285fd0d 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
@@ -6,13 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0c977b18f0a384d03597a517d7d03e32"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-# Release 7.4.0
-SRCREV = "1182533bde3c1fe65be2ead465e87671faa2c027"
+SRCREV = "0490f0723b1a0851b17343f6164915f3474b5197"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.17.1


