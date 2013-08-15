Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 811196B925
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:24 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so183028eae.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=W8zIXoPKpsGShXZ3R++chMHFLfUuaUYOfw6l6LhMR0g=;
	b=xeLFqYIboE7HHb/+WF0VbiW0BO2SETUU25cV6O8BZgN89lpiTG2tdf6WvHbYggeg3H
	K3/gGy9Mu7ASmAA3kLmCWLmdqn/nDCfWabz1iIBejQeRAnRvQY2NmWPwij86WGMcjXp1
	qI3zIHGytmmV9/26kgjkuu0cHOnGDi24H0evmUwuvCORdYE0Hnf0eoz3asXQvkQ1qL3R
	m3sw5H1Vlhck6QJmICF4Z4KvHPEseNCy9+ewayU+DVmwiddeJOsBAFDVRX1TqWxaTDVb
	xA4n4+hXWH5UmwIltKyplwznlH8SnWlSsPq0Rx0d8rY/EACACzl/aoHPqDqBtokYpTMz
	9JgA==
X-Received: by 10.14.108.9 with SMTP id p9mr20858717eeg.8.1376551404960;
	Thu, 15 Aug 2013 00:23:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm70013638eei.10.2013.08.15.00.23.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:36 +0200
Message-Id: <07a6fdddcb0d6f55a22ad805b13c45472ae0ef95.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 25/33] patch: add PACKAGECONFIG for attr
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:25 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/patch/patch.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 332b97a..b49226a 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -9,5 +9,8 @@ S = "${WORKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr"
+
 ALTERNATIVE_${PN} = "patch"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.8.3.2


