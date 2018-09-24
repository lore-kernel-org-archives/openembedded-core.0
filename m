Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DECB6791DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 11:30:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q8-v6so9647814wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=Q+GrxEDEpdh0R7VTtFaChiIMyHfdiOMkZbK6ULIOPMU=;
	b=NRQQv9uG1Zl/suu6sd+B94RnPoonQZp97LIKSUuK+BRBGMqSYfpCV+L474mkscYjDe
	OJb597OxM0gJM5RaNzyAvpVAWdhEcUw6Gv5NDzifiXg/bqI6ec37xyny6r9WeHzya/wd
	qZ7wL/uV5biZ7/Ak/NgvlfFsBXVNCJwCTcXjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q+GrxEDEpdh0R7VTtFaChiIMyHfdiOMkZbK6ULIOPMU=;
	b=KBINSy5bU6gTqmkrB/C+1M8bgDghM9qaRUQ4mnDkOnPnpwn5hDjvyOtV2UOhMvOQTx
	a2R3sxMZ08fu2x6HXDtR5eN2pWAJwWSlw+qiLGRfr0DdGVmcmLDg5W5sOuUrIdtibIWp
	Jeq5VzGZxHm0CR9gb2apqX4Q1pJl1lsqAAaOSQ/vqvY5Nac76qwF46pBalBkWr3iZXET
	bdJJzIkX6bLrqNvua55xI4nQMkOUL8y6pbhxrZ6ZktABvYRwvPVnRDrkjW0n9Dh+rErl
	SIhzqNgQ6jk1+Kg0KMDaZzXdm7njXaYfOjQa0HeYP8nMPfAu6PRbVsSa9fyNL2qRVDpZ
	AQiw==
X-Gm-Message-State: APzg51B16LqAJUQjAuIJ6w1Sc2KGl0T0kz3dlO+7hMPeDwKKVwRn2ug1
	g8wEdfRJoVGfKOD1/gjaGKV1sdK6gUd1tw==
X-Google-Smtp-Source: ACcGV62eQN9NMAYVZMtC9uIxW0JNy1tKfPjAhmPkEOjjz+KHuzrr8hw0LXTPtn2KJqtTke13XVUD8g==
X-Received: by 2002:a1c:f210:: with SMTP id
	s16-v6mr5390299wmc.36.1537788612052; 
	Mon, 24 Sep 2018 04:30:12 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v192-v6sm15385966wmf.40.2018.09.24.04.30.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 04:30:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 12:30:03 +0100
Message-Id: <20180924113003.32625-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] layer.conf: Add thud to LAYERSERIES_CORENAMES
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
X-List-Received-Date: Mon, 24 Sep 2018 11:30:12 -0000

With the release approaching, add thud to LAYERSERIES_CORENAMES and update
oe-core to use this release series. "sumo" will be removed during M4 in
the next couple of weeks so people need to start updating their master
layers in preperation for release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 2cbe952801f..0728c51e5fd 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "sumo"
+LAYERSERIES_CORENAMES = "sumo thud"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "11"
-LAYERSERIES_COMPAT_core = "sumo"
+LAYERSERIES_COMPAT_core = "thud"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.17.1


