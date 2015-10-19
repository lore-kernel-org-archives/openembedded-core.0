Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD3D7701C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 22:03:18 +0000 (UTC)
Received: by wijp11 with SMTP id p11so20019099wij.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8CC1OxC/DxlYKr1jNROybnHaktns8Gc9ei4fqUX3V7U=;
	b=AN2nFP89mnGl4tZJI9KJvIA+IAbNw5ukT4ghh6fsQXjPmBwcOPAWGOmZKpcHsMp+mU
	o+zN8QSXdaBsMy74hpLawA9ByN8Yhzy75AcV+Z1npRQ0ibq0ZC59AMadqEIhikOWn35/
	jc4AwEIvw8vcRFSPxWmyM/rwnPtGJqrl4yBSuzuSvUaowFyy8npfarFvdu6ccttNx2iJ
	Pfx3zPwVxgUSZCqZeSMj3sSG0WGxA7k8etCfMRHfDjicwbxdFvSNvNYkVQh/Yx/y2TeG
	VBHUKT5R9wai+FZK1E0KJq3sxpRzUsDvqFJbV0w2wAgwmtloWuOntiduKC26+BftiUyq
	tyvQ==
X-Gm-Message-State: ALoCoQndxyhKkvDptcMd2Fi1vx4+P11xTY0jQC2oHh/ZNVmO2ge5YPz7QT/58pUSsaI1GjN6Abif
X-Received: by 10.194.63.81 with SMTP id e17mr39551138wjs.147.1445292198668;
	Mon, 19 Oct 2015 15:03:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jd7sm42607072wjb.19.2015.10.19.15.03.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 15:03:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:55:39 +0100
Message-Id: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2 1/5] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 22:03:20 -0000

Various key parts of the core classes (for example, do_package and
do_populate_sysroot) currently require file.  As it's not possible to build a
file-native without invoking do_populate_sysroot mark file-native as
ASSUME_PROVIDED and expect to use the host's binary.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9ddd1c0..06971da 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -166,6 +166,7 @@ DATETIME = "${DATE}${TIME}"
 ASSUME_PROVIDED = "\
     bzip2-native \
     chrpath-native \
+    file-native \
     git-native \
     grep-native \
     diffstat-native \
-- 
2.1.4


