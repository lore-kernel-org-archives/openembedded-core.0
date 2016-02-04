Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C6B916FF91
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:04:34 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id w123so57669707pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=522elBcJ/Zj2bFM51H/02AnrOhinQmNETz43yXqFTX0=;
	b=vdlyMN3hZqxZgGH5P05mFEmV3Im1qUft6Slq0B5MMdwzgo6AdP6JmNneJa0Uyq1B2N
	BVISDVyypM53uAthSh7RPH1B/j0bd+GxiA/S8UnkfRXuxv/xN9iqe98BNP8k6Q+Juur1
	H4fC4HjD1+RfeXATv+fOC0d9IoRuO4+mdZcitFx+V3Xz2qmHADApX/ipmnPZeYgp4nT4
	v1g9l0Q+JlLmZ43TVWuY26P1sLgRUqTE1rC2Y9PlXIw7Y0IdFXxjwAGGwMBRed5LGDDx
	aEf1rpPPl8gzFmcswUjHwg09SdRfg6eKHgL/uGLwqUiX/006tJwAz8WFIKg6Ie9Xd59F
	kvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=522elBcJ/Zj2bFM51H/02AnrOhinQmNETz43yXqFTX0=;
	b=kBJuTwr6XVHAHutVkboiXQ2Oxl3CuLXJ4ejjssg8pp1AJF6CfSjTRq3IpKgMuYJN5A
	oMNigFknaOVYGP14ERKNNVgWgYD87/AEhRnYNsjd68derHkoAeaULV29tcDmkfutMu3/
	YtVjkQe2Lr22yfAG6yL6jyvs/BsXECtTlYtS3LqxYYPcdmOiLS7ufafObNFTwwXRUwYw
	g9uWMLRx5XK41GKqN6nfWicaJxNHdu/sn6roC6COtrNniIyW4Ham+yHgNVo1/xYPBroH
	ViON68Eig1sXwKUp87mbSDSvdZtA0VnCEFQxgFvOT+Iq5Ziuy7pZw8LPQZ6RjYw+kNzl
	aZig==
X-Gm-Message-State: AG10YOQDAd3IY746/jhhLHWQ8tKK0kaVksQDpMiW4unkv+q8WppRqZ/GDGK0nGoU7BKwHQ==
X-Received: by 10.98.71.15 with SMTP id u15mr15166234pfa.161.1454627075878;
	Thu, 04 Feb 2016 15:04:35 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm19535589pft.44.2016.02.04.15.04.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 15:04:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 15:04:18 -0800
Message-Id: <1454627058-26663-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/5] gstreamer1.0-plugins-base_git: drop obsolete dependency on freetype
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
X-List-Received-Date: Thu, 04 Feb 2016 23:04:34 -0000

The dependency on freetype was dropped shortly after the 1.7.1 release

  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 956b24a..06afb04 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -20,6 +20,11 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
+# The dependency on freetype was dropped shortly after the 1.7.1 release
+# http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
+DEPENDS_remove = "freetype"
+EXTRA_OECONF_remove = "--disable-freetypetest"
+
 do_configure_prepend() {
 
 	# Temp solution for git snapshot: relax version checks so we can build against GStreamer 1.7.1
-- 
1.9.1


