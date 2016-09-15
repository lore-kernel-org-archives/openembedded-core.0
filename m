Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 04E5874197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 14:14:38 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id z190so52659869qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=iZBtI0eMi4bHMwC3cK+lFwlcI7dBLMBbUapX+YWS7bk=;
	b=WzZ/PbCFz0h8r0TQOQzD6FEVC7UCiPtHTfQwsqBSg7sf9Y+6Qzj/rig/3XOXeHOiJy
	GSIkSSpgMB4RRH3chIzgwSWzNk4JUD6SxpiqE3TBktVA4r0XCaPKieiqe4UkyOX+Y4NO
	jrI/3TBujdLzFc/7GfNwxAivMh/QvzGy88mWlOqtpyuhg0pjEgPzo/TlcTsv/p5Dt/2p
	PiKgg8mSNc5fceaEj55oAHaNz1PEKmYy/jyCOPAcwS0pDwru/zDaDvCsEOnGwjHyMWOc
	sP0FpdCOr+szQbBTMFijU8iIQuGfvicFWP3Z5jDRWqVXzfliCjixkK7QjbFgAjHGQ48D
	DUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iZBtI0eMi4bHMwC3cK+lFwlcI7dBLMBbUapX+YWS7bk=;
	b=E3RnGCde8ylrgc/UJ7hm+QYNk/fyhvMnxavwm1zOHPJ4H8rC5eZaY7hMv1t+rGGIbb
	2zNC8vwtYRaKVHLS/WHFxaz/d0eAjYsuFtV4NoWwSyAaPTlOr+SwDQ1rVW2gM87nSPCN
	5eqIK0R/C9QXTSbVgNiRfZ2bl9fD8w56GQ7t0iYyikbEB26VAT1YOnS8aIVno7LrHo+/
	VK88zw1i84cr6t5D9CqWu7FZgLScuCSInAXjTvAtx+vR8wbCvQbwBO+nT+EKyFReJXjA
	QawAzgoojEPsFL0pGeyuJJXP6hdz9IuSjHuw/nAJYwY58LJfdhDUuOFNDCPZTucTbrVy
	/Qow==
X-Gm-Message-State: AE9vXwO8QA6p6eUWX8bKuNTXy1m6eNCwqxccDYlefJPRXFMDEw61VVAEPAM33sCPlgfR1tQO
X-Received: by 10.194.98.205 with SMTP id ek13mr5041567wjb.158.1473948878761; 
	Thu, 15 Sep 2016 07:14:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id gr7sm3730409wjc.1.2016.09.15.07.14.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Sep 2016 07:14:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 15:14:36 +0100
Message-Id: <1473948876-18073-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] pulseaudio: add ${S}/LICENSE to LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 15 Sep 2016 14:14:39 -0000

The LICENSE file describes how the various pieces are licensed, so add it to the
checksum so we notice when it changes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6ed79ef..7e54ad4 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -3,7 +3,8 @@ HOMEPAGE = "http://www.pulseaudio.org"
 AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9ae089c8dc5339f8ac9d8563038a29f \
+                    file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84"
 
-- 
2.8.1


