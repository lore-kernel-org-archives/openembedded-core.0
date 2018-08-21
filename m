Return-Path: <logyourself@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2374779005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 11:10:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z25-v6so3606729pgu.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zT5qRwLi3eqd/vK8PDPoqKwRLa3Y99CvRaCvxNHC1mM=;
	b=HsW/ooV0TXC7Posl1v2zCAHQx6twvR+puscxilBuULa4/k4M2SfUgZBAUAZPEs+p3H
	qe4oBw7geaGXg6RTn8wuq7CH6KGJ1OQctZD/9cXZixOSf8pdjm9yig7GL0ya5IwxGgJ5
	wAfr7Txubpr2aXWLKQ03N06fP/LKuI8TH6Ge5VYU4NbM35kOrOfrW25JLClPt5TBYFnN
	QVymCUuLbFEk/RNwbLCbqyWxMPxhnZaK3tjRRyK1TNV2Q4gKEyBGcr9aYJTK6NcKpssh
	j7Lrob3X6rUIPGIixSgMt4OnCYb006lNL7XtRyIYiUoqOks3guplsBfwUhHbgOeSl88F
	WJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zT5qRwLi3eqd/vK8PDPoqKwRLa3Y99CvRaCvxNHC1mM=;
	b=WYXZlcXgeuARWkWq0X5O77mj3qLcVfvOo6mXUf405ZwtZDsqD5mJJsU8eN8hT4xfJw
	oUEv46YghEn2WtrgmXBUf7BclkPME4zpb5K3Mpot61qJrc9a6+g/AumqIzoukjbgoFNt
	xZoVkC9nAhiMMMxAxxpRXHo0mYXtnkMiI67xk3J8zAjehSBitFQtPeC1wbgCUu4St+Sh
	4PRVr9ir4rwCev2rEUatWYhWVeTrq1FQLyeviH+uhtKQQWJzud4XjFAxrDF+eRvbLwcF
	DhsHOkqyGppQhn3WejV+7DOhsAOXscgWFliEfMtUKUByYUkez0oUBB9ynUeoruAJoPm7
	D4LQ==
X-Gm-Message-State: AOUpUlHLDfqgBOik5+1dtofn+WEwTPKsmtJH8ykaLHbsuCrBvG5iKElY
	EbkutfChJvh1NDUaa3C2Vz97ibQg
X-Google-Smtp-Source: AA+uWPwD2R3SM1Om5mIp38a5Ca+zEpAjU0YdnlC2uGIR8pLxnWP3cBEymJmvhMNO6CeWRs92vqQpgQ==
X-Received: by 2002:a62:63c2:: with SMTP id
	x185-v6mr51838922pfb.13.1534849817753; 
	Tue, 21 Aug 2018 04:10:17 -0700 (PDT)
Received: from localhost.localdomain ([182.212.44.138])
	by smtp.gmail.com with ESMTPSA id
	k1-v6sm16453452pfi.62.2018.08.21.04.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 04:10:16 -0700 (PDT)
From: Junil Kim <logyourself@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 20:10:04 +0900
Message-Id: <20180821111004.11245-1-logyourself@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Tue, 21 Aug 2018 11:10:17 -0000

From: Junil Kim <jjunil79.kim@lge.com>

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index abe015de2..f4033f7c2 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
-- 
2.17.1


