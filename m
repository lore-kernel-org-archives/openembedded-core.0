Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 92D4F60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 12:55:50 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l65so292216763wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 04:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qMYuhzoTtaeQPoGudu6NtJI1CX/PBPtoyC594MovMC0=;
	b=TC4IvpBt5PFeRS2HqvFzigUZTsFQeuiOzrQbmVXdLofSrLdQr+KLK8xy89sz5P4SXl
	NMxh6WKIyDkIBaIapUQS0UmMqKn4WaFPV60y8+MViYGSSRGpE2KJ4E0Dvb5Br304tG0S
	IwiY4Lq0mpidDJu+LqiJrQAsdNxCJMuM+jNelwGhO2fu27KH52Np9h00Fsq59BZkjhd2
	a0EubTXCJb2COfwe3A2cfikcioBdTpd4amm6VE5khwve/iHs+Lajr0eCsV/gxuyWSCuy
	oJIJlLI/M/EPLUSHpugat7C4nj2729LR/g/QenuLyyYLmOHOo1wEaSvKaIxVC+hMSZ98
	ZQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qMYuhzoTtaeQPoGudu6NtJI1CX/PBPtoyC594MovMC0=;
	b=Xr9Jm7/drnQRiShDSMIieonXutQ+2oNT4ZF6nf9fqh8MfuMNbHhYOhAfLIqBZ3jq4R
	EupVXALFLv7ZIL7cv+Vm3nebYF0Eu4uCcjS7zqN+xiUaWoW2s27HTDQWZJ8VXBMrw+jC
	mOHo/NsqAZtc5rbbBi3GmXrWRVYrNO+wmKp5qFS0O/czPs2wjN+zhRKsRvkmUql/7mR+
	utTbls9NWU7F9QxPobY1s77t3YhjY/o4AHsQHGSU0Ekf8/i625+/ZBl4LaeqJgRIuxrl
	muvvlJF9QXGfXu8Fdpdzf5Dl1t3/6lyBGieS4eBCQ+FTHjjhUyJsksnIzu6QuI/DADV2
	V2Vg==
X-Gm-Message-State: ALoCoQlOGuBe5cWlB/LWRl2ycD+JXu6mohZGB23xoZurrpy9ze1MpF+K9F4+YliQklL6W8B+p2sC79CzvZLd0gBAXHX0JVcUAw==
X-Received: by 10.28.212.9 with SMTP id l9mr26925788wmg.75.1452689750425;
	Wed, 13 Jan 2016 04:55:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z65sm2544117wmg.10.2016.01.13.04.55.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jan 2016 04:55:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 12:55:46 +0000
Message-Id: <1452689746-22603-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] python3: add missing dependency on PN-misc to PN-modules
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
X-List-Received-Date: Wed, 13 Jan 2016 12:55:51 -0000

Installing python3-modules should install *all* of the Python standard library,
not just most of it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.0.bb b/meta/recipes-devtools/python/python3_3.5.0.bb
index d5e26ff..6184c79 100644
--- a/meta/recipes-devtools/python/python3_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3_3.5.0.bb
@@ -215,6 +215,7 @@ FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS_${PN}-misc += "${PN}-core"
+RDEPENDS_${PN}-modules += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 
 # catch manpage
-- 
2.6.4


