Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 083177CE71
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:46 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 125so2203648pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YdI7sNNaZLt+z+LYikEUWHGrFURRHwNZweyJfDkUbjo=;
	b=JoXW+V1KKJbzXgi/lS3LsH0C9kbc0OCQuxb76T8p3uBi03gFSGwXyausjQUUPdyFGw
	++V6Z0xgQB08d2epzT8ETjFlmXNPTPrhYNEh7EhVejZeN3ZrpHfO+Q2uEsjuDKZ4kR2+
	R2qiqq6vOB3OLZmZn/pJ8t+A+TE3kJAsLX/oZAoTbKYKS1lCsZ4hV4BaR7344YJ+Wrdk
	7u0lINmse+fGOhR0e6ySxiKUw3iTOdsb885fbb7wlZnJlAWRe+UekfZGNdCD7PBjjUrt
	misWKl1mXJMdxL0pKsxyg97HgkJ3HGKTCa27PqG1c0UVHrdvORarqgIG9nYir/D+60D+
	wSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YdI7sNNaZLt+z+LYikEUWHGrFURRHwNZweyJfDkUbjo=;
	b=rZ5RP2dwhgh8W7iuzF7j4/7VFzaZH+BkJ3cUFnkDzjptZRyy7/EuOHIgYSvJHVkJA7
	BVl+l7gSPQ7u1+1tLRLr/Z1VAawLKNn8QEAIB5hYL1Wio+ucJI8QCMXkUJd9go/nNkUQ
	gcjot0iyIfBT0zxWJnQw+xvwN75ZJaoIQWjy0CWbx1zXjNpqeggpngtrVps2Idt2zI+n
	2VKD5WKprs1WrxTSwxmDDs9Tj2EG5gJTmLQowCBQzgBHcSbdKSJb6V+cxlee2y/J0m7w
	g2HW2lov7VXMWdPHcpM2rAt3mCiefaAR+VrTGq9a2V6B+cYOA+azkF1b+kgqn5iqu41h
	OtlQ==
X-Gm-Message-State: APjAAAVcDVKAFWHxUNH/qJNgrvEHGkVuZQRS4WlyTD9Alh/xkTc8pUyC
	hOFN51hYH1q8gAOnUchchjbRd+9/
X-Google-Smtp-Source: APXvYqywdmiHBd38z5K9Zl5shkKZnLkWcG+qcwDXw4uo+cowLIbqOTs97D/vEaxQ2Qy2aNXx3MOOdw==
X-Received: by 2002:a17:902:7203:: with SMTP id
	ba3mr25231615plb.168.1552241268063; 
	Sun, 10 Mar 2019 11:07:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:35 -0700
Message-Id: <1552241263-26116-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 04/12] xvinfo: update to 1.1.4
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:47 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/{xvinfo_1.1.3.bb => xvinfo_1.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.3.bb => xvinfo_1.1.4.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
index 2965ef7..a913ae1 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
 DEPENDS += " libxv"
 PE = "1"
 
-SRC_URI[md5sum] = "558360176b718dee3c39bc0648c0d10c"
-SRC_URI[sha256sum] = "9fba8b68daf53863e66d5004fa9c703fcecf69db4d151ea2d3d885d621e6e5eb"
+SRC_URI[md5sum] = "b13afec137b9b331814a9824ab03ec80"
+SRC_URI[sha256sum] = "0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f"
-- 
2.7.4


