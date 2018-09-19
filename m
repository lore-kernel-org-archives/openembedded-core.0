Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id A6ECD793A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 13:02:18 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y17-v6so4958025ljy.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=U/kIX7no5+p/YP2ZR9wWaW4dbUGE08W7LsBGHHGg74s=;
	b=G6GaVdfqFN5b1PIKPa/3U5DXMPCGJZvQ+fbg/+mTzntRzfRd2EljmYgBP2ktfYLVC6
	j88J9en9FZEAiPW3uNsEfqeqRgm9yZOvenhDdYlozHUQw/gcdmikCQInnpIpjF2a/A8p
	1fNNG9Hbg/Rc/13ReIS/AaETX9Ot4l0AMBY0B/KwjW8hmcey+lLewSha3KIt5rg8EtX5
	BbZ1kr7vt4Jrdyw+fdni1SMAko8Ee7HB76MyqbXehtEXtYJYxYAVKEECdLBsux/F/HdL
	CGHkw2ccaUHj7nteAt+2MFs4Rkp0Hv2BJ14qqvdrGXkTvQ5XOva5GRS50hSiE5V7T2gF
	ysvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U/kIX7no5+p/YP2ZR9wWaW4dbUGE08W7LsBGHHGg74s=;
	b=X0Lkk6qtButcMXIHKQ08/LwiU1STYfdYVoq8Z3/rcw3LCR14CtJTFk6DQItSr0RlUf
	IFRzaXsS6MHJnYeKhuqtN65IwCyBDYZ2hpgEqhmVlajtusIeu0je1BMrlHi3aAUCRKA+
	MoxOYslVZokGMvzkesA/yGZoyyKrLOsxiWIxj82UA3bJOCX3BU9eJKZVLEmU01lVfF1J
	w+6w7AIDT0dezZv7STCJf4C9DnqdRGJW8B3B+YXSm/qi/YWFNr4MWhMUBDM/Df0aEaJH
	+C2GGxSdGCgZw6QAekGE56P1lLWhBxeO/vS269g/DCgM7iPsSOx+ADyG4c3XAw9mVeZQ
	ExKg==
X-Gm-Message-State: APzg51DTFND740/QYdH5E8AsEROD8FltBb41WNnE3iqoMwAZwqJQ7CWV
	v66AZP9nI3ksu19oENhJ0OC0sU0AMek=
X-Google-Smtp-Source: ANB0Vdagg1v1rzxbLtqgRnGI+n8fSXj+4eSO5GyPX3fPTF0mLPb8OZdKnuxT8K/TqwKWFm9nMPkp/w==
X-Received: by 2002:a2e:7014:: with SMTP id
	l20-v6mr23327085ljc.141.1537362138237; 
	Wed, 19 Sep 2018 06:02:18 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm3843950ljc.52.2018.09.19.06.02.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 06:02:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 15:02:15 +0200
Message-Id: <20180919130215.87891-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] wayland-protocols: update to 1.16
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
X-List-Received-Date: Wed, 19 Sep 2018 13:02:19 -0000

Updated package to v1.16 to match the currently used Wayland version.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../{wayland-protocols_1.15.bb => wayland-protocols_1.16.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.15.bb => wayland-protocols_1.16.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.15.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.16.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.15.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.16.bb
index 85e35f59c2..fc4b711172 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.15.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.16.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "d75ec11e8443946b4795e4be1cf22db8"
-SRC_URI[sha256sum] = "dabb727a4b64e87bfa8c025c1d63919ce12100b49fdeded31857644a59729ee2"
+SRC_URI[md5sum] = "e0b523ff162e30bab46be1d65d527683"
+SRC_URI[sha256sum] = "6b1485951fdcd36a960c870c46f28b03a3e5121fb46246916333ed07f78c98c5"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.17.1


