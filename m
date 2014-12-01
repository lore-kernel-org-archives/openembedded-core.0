Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A2ECD72221
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 23:48:16 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so15662052wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 15:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bDUnzl2qPiIND+fz4wnvK/MRSFG5dNpQDIhzDgLj6Bs=;
	b=aGo7sLCWY0XzZlljteqosqm6n8iAYpmvncO3/0cGF/8XUKc8nhEgAUWyb+hDsLEUDm
	tkll1Td4aOf5B2LmNUESNUdPyd6G4Ye2b0P9zCy7DEJyYb2ST0rY0hWoVaPFAZfXS0gS
	LPM0U7bE2+tg0QcQtBktokS1bagosB6ektHRwApsixx2I6x4RLVYLdNZXsZnlIrbo3Pf
	IbUvzpPLYzTnnnK9piAMWmmmXfaCFNGeaHatjeEBFgwivjX8XgWvREquJOZUiNxB+9od
	2CnAXqIcd03siMrOuGpUSrehLLbKRnbsB9BHPn1Kqh64z2tymlWDVuhQw3FABecGviZ8
	S2UA==
X-Gm-Message-State: ALoCoQm8WOO7oGJXMKW9N0UtScpWNUYIB+qq4Sm7F3PQ0egjLOvW8kE/PbtvkGAOvdOWXGeiSHBf
X-Received: by 10.180.109.3 with SMTP id ho3mr88738713wib.39.1417477696580;
	Mon, 01 Dec 2014 15:48:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	he3sm29570430wjc.15.2014.12.01.15.48.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 15:48:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 23:47:44 +0000
Message-Id: <5f63cd4a0ed3c48a02335ec81119e6622389edc1.1417477584.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
Subject: [PATCH 1/4] base.bbclass: don't skip defaultval
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
X-List-Received-Date: Mon, 01 Dec 2014 23:48:24 -0000

This field is now internal and won't be seen.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fcb7d89..f3185b4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -347,8 +347,6 @@ python () {
         extrardeps = []
         extraconf = []
         for flag, flagval in sorted(pkgconfigflags.items()):
-            if flag == "defaultval":
-                continue
             items = flagval.split(",")
             num = len(items)
             if num > 4:
-- 
1.7.10.4


