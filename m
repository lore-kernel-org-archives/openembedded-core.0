Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49C2060402
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y8so2512532wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6nhmXASt1GZL/OuDB6aiEtvjPH2bobnNroJBHdbNeoM=;
	b=OTCuAjBAVoJOhpLm6jTVFk8m8UKIZIzYVcgRoTbq4gWVrj7HcyX2wxFx7k7toFEQAB
	UfEFlldJbfAHXG/tZukaKF1Jg8fCdUXeTUCyYLDC1Sp/CCJjW+cHmOuQ/6LiyzayNvX9
	rEroP3ZHqAHlq5jJ+JPmRrhXnsnW+E6tu6qE8sxv/Y0bq+lp80BXUAIuAxfGvQFkkN7W
	E2MwgWfYUD4O0WgItv9txQw5wIGlqL4jPudiPiMX0d2caaIR43DL070vGicEzeZWi9uC
	FVncj+7XVkjHj1+qiVzK4mfeJHcItrWO+lz6QsqkQ4kC2RgKAk/R/WOICVVZe3DMdniQ
	DCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6nhmXASt1GZL/OuDB6aiEtvjPH2bobnNroJBHdbNeoM=;
	b=UhCEKZd15YCj8oo6YfbPugVbUM7XMPWKkDimupnHU7+bKVHf2J1gPODWT5Jx/61BB0
	IM96e8Sto8aaejwRslB9akqSILW5619JW5+h5cpDp7MoMEjPpptZovDM9FuSj6YvNFIr
	D4tNM2WfAYpFXHaNMucS/uvuthhaufkQbq8Qrm3Ticz4j3EV5RVjvBVo8N4raqghRm3L
	eAy4tvyz04d2zNynhjtNgvHP+HtQQl1q3Sm38E2ZAy+tyrCtkv8lgrJaQynvG6/mqwOA
	6xAtGKvQSh8VBakFtFQbvwBFBQ2LJ2panDizuyLJM1KcejXPe21cJmXfjgi27MmkduaU
	pBBA==
X-Gm-Message-State: AJcUukdpPziMLrH67EAjJJk6mG9SOnqo+vWV+8E5K339qnhsF2Qk9f/d
	hFg1BavV8tPzp5K3ekfUct3rkRs3
X-Google-Smtp-Source: ALg8bN51xxUImD2NpsLjif4IavFc6kDyUMGybth/qHamIy98WHJhuVLb3tqCsOxWkTjbRhIzivvxqQ==
X-Received: by 2002:a1c:2457:: with SMTP id k84mr3314132wmk.139.1548260279835; 
	Wed, 23 Jan 2019 08:17:59 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:42 +0100
Message-Id: <20190123161744.45763-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/10] kmscube: make gstreamer dependency optional
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:59 -0000

This in particular saves build times for virgl oe-selftest.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index c6cb1842158..b2dd6b30b0e 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Demo application to showcase 3D graphics using kms and gbm"
 HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE = "MIT"
 SECTION = "graphics"
-DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins-base"
+DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
@@ -16,3 +16,6 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.17.1


