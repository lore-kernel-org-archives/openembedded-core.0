Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 204F560102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:29:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t138so83859wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 12:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QbD85ejzHZcBLiQWDjfGGOUm5RrK6DHY+oc+0WCKJJQ=;
	b=l5MOKPxPd7VatUoM9TFIa78HnCLoRmkiIFdKcZc1mzctSibUBH0clWf6Xobkot71cA
	4UunfgaSjMVCXtI1pMQiHyiQ/rlB2O9NeXOnxtHcxR3YfOk4/LAtPsG25z5eLt8/+7sL
	l2m0YUPFoMSeanIpuncNMbs/ye5Owhb8dqUD/ULMeQwSPCvFJSDBgfPDv6aCpDz2QO+I
	HTEogHHAajLImauA0zw1aQ1/ArKObY8HzX1cj5YKIlMkb2a1MGY/VLs6JJWx/In9/nZf
	Bk/nw5Ess6DSSEA9DDRPoA+Fta/MbAOYQnOaIMn3ndqfC+5NgHKi6bhPS/jZmxjUqR9R
	NN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QbD85ejzHZcBLiQWDjfGGOUm5RrK6DHY+oc+0WCKJJQ=;
	b=cnMPI5pUlkVENmQ1dtJhKYBSfvPvq5LuO0KM3oHyYK1yqq7gOJvXtNsa7CqTJG4NE1
	8i3r2GUfJxYGh4f1ufuMnNZ60use/NuuzSiq7xq/SpMBIEnraBdJnCQklb15I/KfX9NK
	L/s/p7hwBmg2pnbnWiE9JoEcwdOAozIjIzCv7xvPUBc34rjNideBpow5W3k/1/qVbp6I
	o6ya1JtoFtEnQRR4WxhNCtdK0hkGRaUEmLqUQcFT0Ii5gMEn6QH4tl+JclqKkbBqtUwf
	QswQVbsZUSCqZL8SCZsMVjsbyGk5Kb1M8ltnwNipjDuVtpGa2U/WMWoB00JpSzVSxB5u
	qsOg==
X-Gm-Message-State: AHYfb5jCnlxa2IkooAw2nZdEQ0JPyghc222qNoMHdxP8ILwtM+b12myj
	sDJfu0CeqoK38/Dk
X-Received: by 10.28.46.197 with SMTP id u188mr358595wmu.26.1503430188350;
	Tue, 22 Aug 2017 12:29:48 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	13sm20370808wrw.72.2017.08.22.12.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Aug 2017 12:29:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 21:31:30 +0200
Message-Id: <20170822193130.8658-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] systemd-machine-units: import last recipe from meta-systemd
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
X-List-Received-Date: Tue, 22 Aug 2017 19:29:48 -0000

* this recipe is intentionally empty, but useful for BSP layers to
  provide machine specific systemd services in this MACHINE_ARCH
  package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd-machine-units_1.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-machine-units_1.0.bb

diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
new file mode 100644
index 0000000000..a64464cffe
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Machine specific systemd units"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r19"
+
+inherit systemd
+SYSTEMD_SERVICE_${PN} = ""
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.14.1


