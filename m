Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC4176420
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:45 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id oj9so2023049obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nzR9wTRhap1dWYDODd034VbpI+06Lj5r/8W7h+hefTc=;
	b=B5utjFY6pYc/R+dh1yazDqp6wnHgcU8ap4Ry4qSVjDbSJoGQRuGuni9Gyicvi+EPLm
	Dhi0Sk3z4kyr9rcDIeN5HgpJ5XnKyd60P7ypsq4NUv7+FeaLRv5T6j6KlQ/B20RFXu75
	tlewsvaEp4nZ1QeNLAMP0OhhH+DY2PDLbEkybiaS6rJFvmIRDu0h5jV5svyQjSONvJpM
	cByJc64ZHMDZBdgyy9K4Ul/cFHVSKHtH04ujt51W8Pvvz/A0YxxwXgPqJTNo50de1fD/
	fml5Q9pzjpgEyXPt+4y12SHW/Fyi0soTvRZ7uNf0ATAMUY5IOZw6VZqs9WqMyvXjZ6lp
	BU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nzR9wTRhap1dWYDODd034VbpI+06Lj5r/8W7h+hefTc=;
	b=JDzUVLrOr1G6e+AuoCel/2nfu8q4Bf6gvgzgI6vmG+/XEb0pRu//jS+QbbEnww5Fav
	8qe/l2oN4G2W5Mx85v10Q4ULNm4hgOo7uGDZ+nfwB5M/AvZXLH7CV19yrhPFr3sCq0hw
	VWBO4f7gcGo9/iZ648/u2Ctri9CMMD6Wp+xaH0TvjqOq0LtfCYbbvrHzV1945cRA+lOn
	heX0mWJDzVrx8yDjpHcnXksQ2DOHUy53qxz/b+uRaToVzUoF1rjNPPTiaFxyPXwx+3nn
	Aam6bYFPUjvcF1DuyZoQbvZP4wJMLAOzeuhgtsYMFS37845na2DlQNr0Z4WOSHcv+OME
	jtUw==
X-Gm-Message-State: AG10YOTA7hnbb1ICLJKNnzR//UO8KCST1GYFb/hYfJ7X7CO4TKCWG6x9Mt2MR4/EjEzezw==
X-Received: by 10.182.29.70 with SMTP id i6mr13205378obh.73.1453354666186;
	Wed, 20 Jan 2016 21:37:46 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:45 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:39 -0800
Message-Id: <1453354610-19218-22-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 21/32] gstreamer1.0: update 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:45 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/{gstreamer1.0_1.6.2.bb => gstreamer1.0_1.6.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.2.bb => gstreamer1.0_1.6.3.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
index 3e9825c..ba1b83b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://0001-Fix-crash-with-gst-inspect.patch \
 "
 
-SRC_URI[md5sum] = "5e610b5a94c209487310739b39b6c464"
-SRC_URI[sha256sum] = "5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2"
+SRC_URI[md5sum] = "b4cdeb2b9cb20dd6ac022a4f417eae0d"
+SRC_URI[sha256sum] = "22f9568d67b87cf700a111f381144bd37cb93790a77e4e331db01fe854a37f24"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
1.9.1


