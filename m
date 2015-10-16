Return-Path: <psidhu@gateworks.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id DDC2E77128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 00:57:34 +0000 (UTC)
Received: by payp3 with SMTP id p3so55087892pay.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 17:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HFijrcCNkdSWmP/cApSV0f/SoesITKrUw21/psurKaM=;
	b=GS/cO+WLl4Jk+V2TarfgTjdkxxxU57tBVUtRIgz/479eqKtugh3nQDk9utzYh4CZkD
	NmFOP4KDyWoJeJNLQYncw61jJFNO0RbLCxkuU8d/i8t2zmR3le33It56N+G4kizBDsCo
	e7Mp5pFhrOAKiQrds6D396WvrVV7Nh4VOnj3vYaSoiSDSJpk3TzxoXkJSH8pICXWaCoo
	MjmqPbyBZEglLpfJNq5+WxGxdd6UeumYwMBuM6UzqQmbs+XTou8V8sPnC7ODjTO2ho1k
	YPGzmh5FFUUyxGSfj2tBuBOTqbDPy8akiPr37JTsbWOnRCWK4x+FDMy+x+eDeX14T69u
	cVhQ==
X-Gm-Message-State: ALoCoQksizBCTTSSOUZL7UMvnj2mVCMHP2RmC7zVYxMmztMv838VVUebrcyLS1IsKX5/qeuTEEqU
X-Received: by 10.68.162.65 with SMTP id xy1mr5001319pbb.23.1444957054452;
	Thu, 15 Oct 2015 17:57:34 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by smtp.gmail.com with ESMTPSA id
	sv9sm17640168pbc.44.2015.10.15.17.57.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Oct 2015 17:57:33 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Oct 2015 17:57:21 -0700
Message-Id: <1444957041-5419-1-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.6.0
Cc: chris_larson@mentor.com
Subject: [PATCH] iw: fix build path
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
X-List-Received-Date: Fri, 16 Oct 2015 00:57:35 -0000

The source get's checked out into ${PN}-${PV}, not 'build'. Currently, building
iw is broken because none of the source files are found.

Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
---
 meta/recipes-connectivity/iw/iw_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.1.bb
index fafb0e3..710b484 100644
--- a/meta/recipes-connectivity/iw/iw_4.1.bb
+++ b/meta/recipes-connectivity/iw/iw_4.1.bb
@@ -26,7 +26,7 @@ EXTRA_OEMAKE = "\
     'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' \
 "
-B = "${WORKDIR}/build"
+S = "${WORKDIR}/${PN}-${PV}"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-- 
2.6.0


