Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id CACA0731D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:33 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a202so1409710oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0NEuIhjxJGUa+rmNm0NuVQzD1l2TlQhTB41+NQ7bgPg=;
	b=D49vzCla57gazBRtJhB8MnpwuWeWcq/ulYuPn59JP2+y6RsP5EL/VPboCKy3arQIMA
	hCk46aJIwlytU+x7IBMK6PYjZt+gLKuQjs47Wsi/e9AyIt2ZnA6FowhQ0W93wj/BwKYe
	m35nxqM3dAgwHiavoqKZfazplGkbOrMJ/jC3gDMcVdX12KRihZ9G8zy10he8u/JwPusn
	wTnsSmNvked2uTGcwo+WiGOybRnVZA7wXxbDSg6iDAqdZBgEVn2fCMQyBMTCZWrlR/SA
	/dAamUfiGnCJLCsFaYgN+YXnbdd4mnXrSPvJnZPxjAU2mFDipmGBM9OxbCyh6dz/t0aF
	0wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0NEuIhjxJGUa+rmNm0NuVQzD1l2TlQhTB41+NQ7bgPg=;
	b=cWQa1DK0eIFLpTvQ9gCmwZOPEBUi335Lyj+KazkPyZl0uc7Ih76rRMYyaCmhEwKYH+
	op2fU9ZY+O4WyPtaqTwCs/aLwzlhUxPeuBe24T+tc7tDFutgj11C8MUV45QKXDrQCRew
	D4V2W0Fjyw6Ram3B89bZM7AUCqr4jxgf/1hxrenXnGtD/l/NqX6zZnMPfePTTk5VkNt3
	f2O2yPFleGALhBT2QqCO/0ItLBQSBHRrRoY/dPi3AcyCYxnlqnO9fTEP/VSQBd9fYaZ8
	vVRAyYeen7TFCxa6lq18S7ljnLzTQSr/o04QKSgRzTBPdBbt1Tu4rdJACl1ZIIjH4Ihz
	civw==
X-Gm-Message-State: ALoCoQmhNh4upxxbk0vuNu9vo1u9fiK4DLxdS5aoD86BM7y1QelxL2dB2jVKfALdpk3C8eJB/JSkwnHRoL2+Jv4wpjBsJtkkHg==
X-Received: by 10.202.223.193 with SMTP id w184mr30103257oig.17.1453344214292; 
	Wed, 20 Jan 2016 18:43:34 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:42:59 -0800
Message-Id: <1453344203-7118-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 01/25] gst-player: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:34 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-player_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 9850242..c6c8f36 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -1,5 +1,4 @@
-SUMMARY="GStreamer playback helper library and examples"
-
+SUMMARY = "GStreamer playback helper library and examples"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
 
-- 
1.9.1


