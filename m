Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 38F2E65C60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 16:50:49 +0000 (UTC)
Received: by wiar9 with SMTP id r9so107190768wia.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 09:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TsIIllV+ZCbjr0uqI9mVy1ypP7yb8ehFuEKc+hMev0g=;
	b=BvOR7yBbSwYJoNWBsgvltQGt3SZ4br53AJgb81AZqTP1oa9Fc8clrIssgg3tiY228K
	b7FthyJab26JpcxgX9q4fqOJf18ohqGjbdWyxF9kMsQpQSIF//a2+VpoAYScmc0ULaKO
	2hdh1tp27uktIpBV80VcE2lGT7Eg4AH6xD5NTmXINd3/Z9TYeKt2zw5pKCMTW1fBbEkb
	JEsqadlPMxMoyZlUDEI+Lr/Qpd0hY+TTyv/EV7ScCTjDesLpyPlcUEcdKq+uS2xB9Fc8
	7DJlkUA7apWLkRKkv+ocHvuJXueLOYZ3nSk3oKEcTVY3ZjJUNtE+Y3GtIugcSulm3s5U
	GO2g==
X-Gm-Message-State: ALoCoQmvoK/RxxkqISa5KH0ypmS4yhEh8ijzA46BIfvMyMXYVr9AHb7fKzgNMvIHsD2pGg59e+N2
X-Received: by 10.194.120.198 with SMTP id le6mr60509639wjb.133.1435855849500; 
	Thu, 02 Jul 2015 09:50:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id v20sm4173413wjw.17.2015.07.02.09.50.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Jul 2015 09:50:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jul 2015 17:45:31 +0100
Message-Id: <1435855531-26582-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cross.bbclass: delete package_qa task
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
X-List-Received-Date: Thu, 02 Jul 2015 16:50:50 -0000

The package_qa task isn't required for cross builds, so delete it along with the
other packaging tasks to match native.bbclass.

[ YOCTO #7934 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cross.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 28fd211..752a500 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -68,8 +68,8 @@ USE_NLS = "no"
 
 deltask package
 deltask packagedata
+deltask package_qa
 deltask package_write_ipk
 deltask package_write_deb
 deltask package_write_rpm
 deltask package_write
-
-- 
2.1.4


