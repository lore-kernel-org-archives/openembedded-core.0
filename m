Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 75AB260069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:56:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id u57so14916203edm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 23:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1zWTNow8kwtL5ScrjckHRpjc4sXJOVH4b5cyPRIedeY=;
	b=GCD3XMmeRSzS+p9dO3naReh0FJkfXhFEQH2JIONwjhAj8h0yNwSZM501RJ07TNwDWM
	Pf80SKr8criZatsN/ueKlEMIkNZpGvoQ4fOmzymsGOjBVtS8NufiankUIs83EkNWZdS0
	oz3MfOxy1brsnmyqrsr/33/zXyiwO80+aJfqaRjIVjKkMFb4v8fR1Q0iKjdn7B8wDw6J
	UzFLxEmB7Tcov8Hivbc0X6Ai2IKht6MTk7yWLs28UQXfeDAptO9bHjus0Gog+E3ge0tQ
	orQF7fo/neaM2sf2V4HlKUsENgz4kXVizFiLNpZNGhDWE0RPiAop1KJTOklC1gTd+aV4
	QhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1zWTNow8kwtL5ScrjckHRpjc4sXJOVH4b5cyPRIedeY=;
	b=TezRLjrr3D0ahG7N4qjTEgL3JbKob7CTrTY6bxtSKn503FsrSMcZ6l4SWgYE6np0tZ
	fntpCnUrqllGRCs+pYtR5g+ZP9jBZHLeXtg3DlFXrhQ2qL6ieR61vnPZZ0tdtNLgMJ9w
	JpQQh51xVHuXRTZl/60TxxA3YTOhep3Qn4Se5F3CdUQgTZMXM4OAecX4oLm4KzmONTKd
	Fp9yI85Ly2gK4RD5ADZjf98Kw6AEsbEXuLVn/MSnp3BQM8Idw0RVajB7rdAsBptAb92L
	tkQ/WmBJCpPvigMuXVsjC2JT4uizf9EQNauXh/9IKLKs8MbuqHjR8PICrTweUC8F0ztP
	PL9Q==
X-Gm-Message-State: APjAAAWbEW781Cb5YdG/uHkJ9nd1cgZS+WlrAUvFc9Eprwo4BLsO505J
	+eg01U3Y+9+8NLDvD0oe9TVn55TFceU=
X-Google-Smtp-Source: APXvYqwyUktgY3RsTy9HzG9R0dBgcbuOyWCwUSz7Y5lXoNxbRpMSuhS/Eew83Gdz6po4T+aWGuKh7w==
X-Received: by 2002:a17:906:f1d6:: with SMTP id
	gx22mr1978910ejb.276.1556088965804; 
	Tue, 23 Apr 2019 23:56:05 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z33sm5412432edd.47.2019.04.23.23.56.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 23:56:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 08:56:03 +0200
Message-Id: <20190424065603.20591-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] wget: update to 1.20.3
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
X-List-Received-Date: Wed, 24 Apr 2019 06:56:06 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/wget/wget_1.20.2.bb | 8 --------
 meta/recipes-extended/wget/wget_1.20.3.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget_1.20.2.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.20.3.bb

diff --git a/meta/recipes-extended/wget/wget_1.20.2.bb b/meta/recipes-extended/wget/wget_1.20.2.bb
deleted file mode 100644
index cd20785259..0000000000
--- a/meta/recipes-extended/wget/wget_1.20.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://0002-improve-reproducibility.patch \
-          "
-
-SRC_URI[md5sum] = "2692f6678e93601441306b5c1fc6a77a"
-SRC_URI[sha256sum] = "7e43b98cb5e10234836ebef6faf24c4d96c0ae7a480e49ff658117cc4793d166"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.20.3.bb b/meta/recipes-extended/wget/wget_1.20.3.bb
new file mode 100644
index 0000000000..4fa273d093
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.20.3.bb
@@ -0,0 +1,8 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://0002-improve-reproducibility.patch \
+          "
+
+SRC_URI[md5sum] = "db4e6dc7977cbddcd543b240079a4899"
+SRC_URI[sha256sum] = "31cccfc6630528db1c8e3a06f6decf2a370060b982841cfab2b8677400a5092e"
+
+require wget.inc
-- 
2.17.1


