Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECAA71D86
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 14:00:41 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r141so90497642wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZEL+0+IQP2c6ztQZrBbk7zxsMR6A49ClhvjR+uDpgmM=;
	b=jamPVUpq1Q5ADRkBfmr2P2Ef/VCn4IP5lmkVUyE65Ls7z3hYyKVkWB4NLP26ICwzAI
	abiXNvB0YD7Xqs4nq9t4wO7yWDuTFmayh63NvvVVaoTNBiGIo0jmyeZlzvzBdV2Vwl7z
	rQvvtGIoo9IaZsSoU8DJFCU8nToSe+WNCqZ4NWU6JhMOsh6FW6mBi5MXuZOAreNbSbPf
	RKj6//5NH/ClqBzZbk/S2ZtXwaq+uZkLm2wff62a9pGkOvVQxA8VUXsiYk4rryd7Ko7L
	7cvSmpWWkWZ5JitgjYbAcOeJ35drDMW9CfaaTev3HJFqZg9tsAWvDFMT2cth5HfGCltS
	eI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZEL+0+IQP2c6ztQZrBbk7zxsMR6A49ClhvjR+uDpgmM=;
	b=qPchDmlNnLxAnexiw6Nu3rk4026I/lFuyCLxdaZ7c1OVjyF+ZKDu97sQMuQ0g4N9ik
	lxld98h3pq1Jzpij8M6p2aAI3AU1+IgqDtd4y9ACH76IcJk1CgiGQsN/1WOAAUbrJ+HD
	JMxBuxXJJsroKpuIxg51un5pcXvIcXfgYOqVxKHUMES0aBIdMlKe5nPMpD1osgWhfsyO
	wqNgUV5j0nP9tvD7MgSeciqDlJLZxsZrNZtIcB8Y+g9BOLk4qh7hlDLuTi4HeA1JGn4j
	UV64DKURPef+gNf8PhcR0WmPKdHQroia1IzIBOut6HDMON/q7aQKBed5uigyiSVZ7CA3
	IjpA==
X-Gm-Message-State: AIkVDXJMkB/5UdfnDr9oVNoY/GeE2CDM+NrKydGiSHVEX+tvsQnOvAAdwR4XoEFQRuK2knfF
X-Received: by 10.28.217.83 with SMTP id q80mr26245288wmg.58.1486044040829;
	Thu, 02 Feb 2017 06:00:40 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o70sm39977490wrc.20.2017.02.02.06.00.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 06:00:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 14:00:38 +0000
Message-Id: <1486044038-2553-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] usbutils: add dependency on udev-hwdb, not libudev
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
X-List-Received-Date: Thu, 02 Feb 2017 14:00:41 -0000

libudev will be autodetected by the linkage, the intention here was to depend on
udev-hwdb to ensure that the USB ID lists are installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/usbutils/usbutils_008.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
index 75312c3..cb79360 100644
--- a/meta/recipes-bsp/usbutils/usbutils_008.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
@@ -21,5 +21,5 @@ inherit autotools gettext pkgconfig distro_features_check
 
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 
-RDEPENDS_${PN} = "libudev"
+RDEPENDS_${PN} = "udev-hwdb"
 RDEPENDS_${PN}-ptest = "libboost-system libboost-thread"
-- 
2.8.1


