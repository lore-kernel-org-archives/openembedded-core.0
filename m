Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 735DD71547
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 01:11:02 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so6378662wid.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 18:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5f66mRSTONcznN3J0u0fFfTHytloghc1RVKlbbPY+mQ=;
	b=WA4wB2bHYpjftsoWyR06S6luy9skU1aRsK7UeplrD4AKefFFF0E0rHN0eFz5e81VQ0
	Cd/3vh4ufgmzXV8xVTaz4wY45IVPngNsp00Y1w2Dprww0BbxpLYaPgusqUiE2Bfv/KyP
	nm0WXddwOGohtZ0Okywm9Tl8cS3Ze7YRBuKHPRDXl5B/P1NoH3ZoaMf4MIwB8tBb/Zi1
	g1gproAwnqlcGuBOgWwhCjnIHv+xHHeAZh0Lgbu2Vn5Fiv+qWOdS+sbceUNYOH9r9L8D
	BPhvJ91RorWrznFUd0DK0lbJ4zKWAXY6XcL9HgTAMk4cT5au2q27dDELaibsPvk8EUHs
	XAiA==
X-Received: by 10.194.206.103 with SMTP id ln7mr513715wjc.30.1412644263374;
	Mon, 06 Oct 2014 18:11:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge1sm1803789wib.4.2014.10.06.18.11.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 18:11:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 03:12:03 +0200
Message-Id: <1412644323-15125-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [RFC][PATCH] nss-myhostname: blacklist because of conflict with systemd
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
X-List-Received-Date: Tue, 07 Oct 2014 01:11:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 1237602..575ad9d 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${P
 SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
 SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
 
+PNBLACKLIST[nss-myhostname] = "CONFLICT: systemd provides sysroots/qemux86-64/usr/lib/libnss_myhostname.so.2"
+
 inherit autotools
 
 pkg_postinst_${PN} () {
-- 
2.1.1


