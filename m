Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 00E77783FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:44:11 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y25so3948920wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CUI8BukaCqV5Pk3CBe8NVM7Bpy8P1VH+LauHIHR8DOU=;
	b=hfpnaQJ+PcU6xcUlfrA3T2egtWED8JKzD6AH7V8n3+CsNH3bk0gZpTIBYiy30HpngR
	jeI+17cwlNpZpvKDeS+jQghWoeWxE9rYxUP0Sl9SdjvWygHvEHNiAgOKxN5qYnQgD5Ra
	XmqKPTV0rrhQX4/hLujtH8rEx05Bzake7x1d/RCCAqzn2YibNml2QbG2SZRoEvSl4m/d
	kLzdd/enMUOhioghG2c+0KaFVYSO59I/pfe3DS3VdgrP3Fn/zr9yTghRNrseqrN9s59k
	6g0q2XFiuSppokuh0GOPksO9vZMUfOueBhabh3V+2gH5J+vJL06cZqTaYxk2qDZnPKSz
	tIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CUI8BukaCqV5Pk3CBe8NVM7Bpy8P1VH+LauHIHR8DOU=;
	b=nGdZZR7zyj/jFVykqAZjRcYTOYbvuC9U1430GSyX8/wr0IbcoBYHR0aBIN01KlMFUp
	pTR/leuKm0vQAgX5XPoNS4bb7KJinwPiVgk2ai8jGt37UHwBjswRiIsqkqGXgMxKr7/m
	CU4b1AhUryY30wkGEv/MRG2wOv3gXUGjzypRXJjM6JH0Kp84PmjkYUFP8kkgo3hZTU8u
	DTmST5MzXCIWi57nND37r9Z2wXMZQuwPmrHaSzAfaze67rdmNg2m/heGtR7T2HoOuGqD
	7oI/oEOOpWp4kgTbKxNdcdIYe0DBS3gBc+3YhwoDXW8EZCgYeDn6ubBRbpMA6ZLh8yQ9
	QhFw==
X-Gm-Message-State: AKS2vOz1o75FLoDL7YW4/3ZBuE0941Zb/ode+RGPLHibk/9xpOTBnuUQ
	ejzy9IPouhWIN44p
X-Received: by 10.223.165.76 with SMTP id j12mr6830550wrb.147.1497609852356;
	Fri, 16 Jun 2017 03:44:12 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r130sm2607717wmg.4.2017.06.16.03.44.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 03:44:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:44:12 +0200
Message-Id: <20170616104412.4919-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH][morty] eudev: set LGPL-2.1+ for libudev package
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
X-List-Received-Date: Fri, 16 Jun 2017 10:44:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.bb
index 211252cebc..857d20db78 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -1,6 +1,7 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-LICENSE = "GPLv2.0+"
+LICENSE = "GPLv2.0+ & LGPL-2.1+"
+LICENSE_libudev = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
-- 
2.13.1


