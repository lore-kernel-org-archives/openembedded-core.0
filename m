Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDA973D13
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 13:13:54 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so158248332wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 06:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HrcVu6tifwJHmltFG9b463t6KYN1Ak7s7St7fiP/NWQ=;
	b=TpOPKXaSiUJ3vNjnkczfC3Cuz/JHtWNEhyvhQnSIQQuqkdyeqKlFgfvDKwLJS+S+OL
	OLC1uxpnvUIUYq5crfd3dn2XeW7tDxcbZPwOydIcLFLmEFrc5YwKeF2g4ph1xegm6+fG
	QSne361GbBF2EfXf3U0G94M639r83bBCI+OGNa3GynTdk/OjV7mC4ZizTDQ/ddtJWLix
	LQWHiB6jQJSa7kMLh/U9iHONgeh6iXsw7m55WvRBm7z0R8/LqC66fOLVy1BvTVKsz4bE
	+vJXg5/aau8sD2OFYBvQUXQTDSnpehJLHqCot96KmM+qSftXyDi138ETBNHBiJUqnSjT
	HBLg==
X-Gm-Message-State: ALoCoQmcW4/4PPI+DeT5kHdBIn0yTM1Sksr57g2JMBSdG3gjjoFQPG3oamVpn0JahPvosAEy3pMU
X-Received: by 10.180.86.165 with SMTP id q5mr5260873wiz.52.1444137234301;
	Tue, 06 Oct 2015 06:13:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jt3sm29408553wjc.12.2015.10.06.06.13.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Oct 2015 06:13:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 14:06:34 +0100
Message-Id: <1444136795-1844-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] rpm: fix return without value in patch
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
X-List-Received-Date: Tue, 06 Oct 2015 13:13:57 -0000

The error patch in rpm-check-rootpath-reasonableness.patch did a bare return
from a function that should be returning an int.  As this is the error path,
return -1 instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch b/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch
index 3986030..3d8d645 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch
@@ -37,7 +37,7 @@ index 40c42bd..88d85ab 100644
 +    int ret,rootdir_len;
 +
 +    if(rootdir == NULL) {
-+        return;
++        return -1;
 +    }
 +
 +    rootdir_len = strlen(rootdir);
-- 
2.1.4


