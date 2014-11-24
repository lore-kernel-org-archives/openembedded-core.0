Return-Path: <joe@deserted.net>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 05E8F721D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:40:52 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tr6so1809163ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=4Eng+WjZBv8PMq5b3iQMx8ZmHALZmnCMizDLhWzdeFg=;
	b=iU//wwEPXoO/Ub4+MeqywTUpBcv7L8HtAuKXq9CXHuxCJq2BLm8pa/KClyv1PZEFZs
	Bo1cxz5MkQXtlb0NfeyXJTy/u0QTIe/7m/Rw4QLmMewgeKz107f0TUna/2iXKXjHMvKj
	//rTWlXQl1B4PWeT4f9MSZXQvAqn/rIfo+mZvwrKFHarH4OAmBuAp74ck6NvSSrOVAwV
	mMELbxYy0k/kcSwduz74o1SzNghwrgP6fuYix8r2iRCDUYOAIi8vUk8FN/Ve4aQn1Ytw
	Ed0PMh0Qi6Vq43UkuD5icXfiesf5zmRztxj1l2bfFDOYrhb4QGb+l6klWDw/nwvGyPqy
	fHZw==
X-Gm-Message-State: ALoCoQnnltj2aDVJ77IPWOvlJZ4ppr40H3z9Nk/ApkodsPnncZCaRjerADETu2+McUnMWNL3edF6
X-Received: by 10.50.43.170 with SMTP id x10mr8219108igl.46.1416858053513;
	Mon, 24 Nov 2014 11:40:53 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id 7sm7983467iol.44.2014.11.24.11.40.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Nov 2014 11:40:52 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Nov 2014 14:41:12 -0500
Message-Id: <1416858072-3706-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] meta-networking: update LAYERDEPENDS
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
X-List-Received-Date: Mon, 24 Nov 2014 19:40:57 -0000

A minor typo was causing LAYERDEPENDS to be overwritten instead of
appended to in our layer.conf.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/conf/layer.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index d99d738..63bb07d 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -14,7 +14,7 @@ BBFILE_PRIORITY_networking-layer = "5"
 LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core"
-LAYERDEPENDS_networking-layer = "openembedded-layer"
-LAYERDEPENDS_networking-layer = "meta-python"
+LAYERDEPENDS_networking-layer += "openembedded-layer"
+LAYERDEPENDS_networking-layer += "meta-python"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
1.9.1


