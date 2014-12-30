Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6252065C9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:16 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w62so1383773wes.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mGMgZiEOdiMYgPHZwoRhxlIe1MB70/o0O5/xiSqPlVQ=;
	b=EnM0xeXD8583nUCzkdkzmlc4dfzGvpNNxR8vfRcQvsCEl0JhbLNZ7YW34uIj0StATO
	+lpIGfAKRDYA0ursb70+fptx3XR+iCtxQY8RWpd03yul+9ADCqkw6ajqU05tBDpTVayZ
	ha7FZKLm/XZjKdvLcx5dphEfQQtntvmFfie8xj4KdJNE/vxSQnmqWSk0lgDlxpL715hd
	V1d6HL1wCJysXBJLLG8YQ2EqkYhtfwv7onjPIpr/Gm3p1uFXynArCS/k0mv7P1qrh6sK
	d6nWMo7SIhD8GvOhTRUORxXtiazciDYLIcETONEDWlxy2tpcnJJEs/vs++b5IUEbqzyH
	Mgug==
X-Gm-Message-State: ALoCoQn8xPiln8FVFSkL95IIuyU1muSy0VhZTnqKgt6GM8GawQZrHHJnj5uHoegbt6j2l9sdF8Qv
X-Received: by 10.194.63.51 with SMTP id d19mr91519736wjs.77.1419962717369;
	Tue, 30 Dec 2014 10:05:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:04:05 +0000
Message-Id: <1419962645-26989-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 7/7] gstreamer1.0-rtsp-server: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 18:05:18 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb                  |    6 ------
 .../gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb                  |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb
deleted file mode 100644
index 1f34be0..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "e39f8643eb363611c342d87088a29aa0"
-SRC_URI[sha256sum] = "10aeacc774e99d81607aeb2748c0a1c6736425b8ae3a9caf8db3cd0c4a08d06e"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
new file mode 100644
index 0000000..bb9b42b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "a9f9b8899ec7ab33663cda7627db40d3"
+SRC_URI[sha256sum] = "3089254bd31b7c1f1cf2c034a3b3551f92878f9e3cab65cef3a901a04c0f1d37"
-- 
1.7.10.4


