Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 00F7460DFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 14:05:25 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so1326555wib.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 07:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A62Wkl1iRws/EUu7xpEEOCUlsTSlghENxqS5T/MgniY=;
	b=PJGTj3KCsFxjuktFQ3dbVYWWJVleno5MG68/E7xMDpzSr5s/4aPSn09TEXbAMbAaGh
	QXiOkuHprDVt2YHeCRTgY/oJRCQtwEtqE8jXAZtYcD5wp6Y8zpJ6qAks61DSYuWRgrQh
	MI5o3DHOMHkNVxCSDDZDvdhZBiBQ81vi5wiEUnm6h+qQefqXWqX2bX+33pFHsa94Rkdq
	2s2d1ZtfG9XrYVbKQlr2gH3OWk4Td/WBZKg9rPpE0fRaG7bcQPWkroclLa8xfeNWYOfy
	Yu3f3uTKNDfubCx///r4jSCWGdvdFEDlR0sZ1zYbEynk/XLrTHM/xzTIPYDrL5piJdzT
	VlYg==
X-Gm-Message-State: ALoCoQmQtkhlHerHYmDu+3sDcP6m0acLPx9IEacIPl2fxogpnOcCyLR5ZUUhsSn8twKTX4Ltze6b
X-Received: by 10.194.48.80 with SMTP id j16mr20344660wjn.44.1396620316778;
	Fri, 04 Apr 2014 07:05:16 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id b2sm4875292wiz.15.2014.04.04.07.05.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 07:05:15 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 3577B560327; Fri,  4 Apr 2014 15:05:15 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 15:05:14 +0100
Message-Id: <1396620314-32484-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 08/15] toaster.bbclass: image file is missing a "/"
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
X-List-Received-Date: Fri, 04 Apr 2014 14:05:28 -0000

From: Cristiana Voicu <cristiana.voicu@intel.com>

Relaced the key with the join between path and file name.

[YOCTO #6090]

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/classes/toaster.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 9fb2cec..d2fa82d 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
-- 
1.9.1


