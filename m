Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D77BC6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 19:57:52 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so44221100wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 11:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UH903WJClfITAFj/VTB/v6g9ACaBqeVpX+8cBzhKzuU=;
	b=zYBGNLxqpj4YPC91tHH3i/ODxsFnfdKQg/3MnD3T70ep2nUXXEOJhwfVk467e987NH
	2M2RSUK3g9SrLOHoZOxsr8vwmlTG4GYsjHZgcBXOWSxR3kF+/4OUL7bbjRVxFUA11tAd
	w08HAeQIcp6WcQ9vouGUOB8rOZ0oVH1mV2/5DbXzzFbXDaBKi/+5EyZvO2W6/Ko+GImh
	mBZ0h1fu9tZa2sZUkxrSavqqlR/kQGqhmNGYNVTc/K481h/8tdQYuw6qmIKWpZyRkyfF
	eZh7BGTSWx+xJJPfM3HW/KmJEeykR6eWOn72oeIv5qzjCFyRefLLinokiBRcfiXcRpth
	WLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UH903WJClfITAFj/VTB/v6g9ACaBqeVpX+8cBzhKzuU=;
	b=cs/DFOozHUqPdgSe7oVWUAneypYXvcbbPhej7n7cWLr1sOBJpmDPzM27C6vEbaAneJ
	cXBJZdYyk7KlT9Mk3gBsR+0ztI+30R+HZQD7w1pkwFXVDvI5Lkhs21GRfU3002qohl5y
	yr1BtvcTcPE+PohK8psZM8/QpfP1TMQWb7LEGedwc5oBmtnnokJyTByAkE5p+VTqru6S
	fHZVV2qaPuJlYWD01nzS1f2MhVVCryVpSPt09uqgBpHyLHLNdaQ3QjDJyECUEdOhZOcr
	gDl771Aok1bG0f7uFXbotENBcZ+BW9NhYNOXGTHzw2ehnJm1tDGrH1JNBdyXktpdTLVk
	TSsg==
X-Gm-Message-State: ALoCoQnunQu2xhNTPQOFXtiCfI4X01an+PWfcrxZoUyc7EtS48DjrUUa3MwCLHZijTs7X9LWsQcc
X-Received: by 10.28.175.135 with SMTP id y129mr557400wme.24.1449172672802;
	Thu, 03 Dec 2015 11:57:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i18sm431221wmf.6.2015.12.03.11.57.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 11:57:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:57:45 +0000
Message-Id: <1449172665-1343-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449172665-1343-1-git-send-email-ross.burton@intel.com>
References: <1449172665-1343-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] neard: fix libdir/libexecdir confusion
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
X-List-Received-Date: Thu, 03 Dec 2015 19:57:54 -0000

These binaries are installed to $libexecdir/nfc not $libdir/$BPN.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard_0.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
index 8adf70c..f962310 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -43,7 +43,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+FILES_${PN}-dbg += "${libexecdir}/nfc/.debug ${libdir}/${BPN}/*/.debug"
 
 RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
-- 
2.1.4


