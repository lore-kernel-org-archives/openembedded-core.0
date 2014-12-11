Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 89AB97101A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:27:20 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so6017454wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 03:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rI4fdVGKN5llHRZc2hxbI57swKRfwfm7h1nwkX66Lr8=;
	b=YU3ZXC4qcgYMVYNnONLJfpE3J/hkE+HbD5RTKWjMIN7u9xT3eo0QjeyzmoxVEHtg2f
	VRh9eny+jFLxak5tWgUGyGvFXYWfFq7XFXuqT7cRRBogGBzsEnLbkDtz/91ekrG4PEDf
	b7vPFRTRC++/txZziw0sm6DXTnuqzyTMBGQEFXj5ZTq4PSpS+WIrfh5T2JqlNWmVSKdY
	aCnKNkR/KpGF4l3wpJT0v//CddDzO0hWzEzxQ0cGUkEtVC23rOM2VmklYdobSlo4zC/V
	M0qpVqCcVOG6OQT5LxMWNZYAxZUI0dkZgCBGXDGWXM3kkeDeIIkhPezdJ6WiDQRG3+cD
	CQIQ==
X-Gm-Message-State: ALoCoQk6cYe5mPr098OSIJlNzpcQug3ro/boBWybvfeywRQBvrUh8FTEy7y/4C+YX5kY5YRUHbWG
X-Received: by 10.194.94.233 with SMTP id df9mr15427034wjb.46.1418297241329;
	Thu, 11 Dec 2014 03:27:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id jr4sm1308557wjc.20.2014.12.11.03.27.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 03:27:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Dec 2014 11:26:38 +0000
Message-Id: <1418297198-12636-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1418297198-12636-1-git-send-email-ross.burton@intel.com>
References: <1418297198-12636-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gst-plugins-bad: add PACKAGECONFIG for the RTMP plugin
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
X-List-Received-Date: Thu, 11 Dec 2014 11:27:21 -0000

The RTMP plugin was non-deterministic, based on whether rtmpdump from
meta-multimedia had been built.  Add a PACKAGECONFIG to resolve this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 2ecdcf2..0f64871 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -37,6 +37,7 @@ PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[schro] = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[faac] = "--enable-faac,--disable-faac,faac"
+PACKAGECONFIG[rtmp] = "--enable-rtmp,--disable-rtmp,rtmpdump"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.7.10.4


