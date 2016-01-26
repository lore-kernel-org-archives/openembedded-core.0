Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id EBF2D77122
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:38:28 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id vt7so134873589obb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 20:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Az3QKzur6XDCkXrX8/zLXR01+rXcwlC4f9MJhyJslmo=;
	b=FhaWb2YC/V/YMKUiCVYWmrj2erK+8B10BfEPn+S23N/E1EnKSVw3cl9qJT1C3wiPDn
	s6XVaML+2ICXeE2z/BlRJfu5FMryuh+B9DsPk7aB1LShCSInRMbWu70lkmXr9GAFmMAY
	Qnccu88RizxCHd6/+lUtdetAYtyaDpkczDg7NqsygwdX7SOnM8pcrU4sm8tW6RB0sWI7
	q7YU/OTorVXBjPQDcG9vuQOeEznJaRd00obENdIAmmH9n+kpi8tXR6u/Qrb336sfnvE0
	T8pIt7t3LGkqt5C8AMeuckzTpWknK6zxfYNH3KJfn2nHNUVD8tgRLdSzxcYkbSnhzPs9
	xtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Az3QKzur6XDCkXrX8/zLXR01+rXcwlC4f9MJhyJslmo=;
	b=k3R+tcvdg3zFh9VDUAu0S88/foiTp2zqiwu4IPOFN9JUaTYtdhO+O5feD39HbJ5cpO
	4T+tAYp4rnd9vkmlDt0pQUx9i6O/CEef81DnQGTN4Az9fEq4xAEjzB80mZnqNZcyJNnY
	FxPk798rUBECRkNsHucHFzHbCxeRajkHeqGCOMNSh2iU74LF/enEzRhnoxM1ohqyAezd
	Q1tv86P1kVWSLiQT6x2j7/Na2WYGpr4eH99jz7dANL5ejINVOB6zWICp9byu+rLp79uZ
	UCJ9sTWvAE2y9Zwpt7xTvWN7PcDfn7mMQAfzQHbmlDcU9M5gqPCnZuOCa7LUumGF7zTo
	44ug==
X-Gm-Message-State: AG10YOSSj0xqya440dl9vU5oIG4HhRgFvrduKOgzH9TLczH0ywlnunHcHz9vpGQ+tUsX/A==
X-Received: by 10.182.33.101 with SMTP id q5mr16128761obi.28.1453783109164;
	Mon, 25 Jan 2016 20:38:29 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	gi5sm12310102obb.6.2016.01.25.20.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 20:38:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 20:38:22 -0800
Message-Id: <1453783102-8811-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pango.inc: drop obsolete FULL_OPTIMIZATION over-ride
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
X-List-Received-Date: Tue, 26 Jan 2016 04:38:33 -0000

Legacy workaround dating back to 2007, no longer required.

  http://git.openembedded.org/openembedded-core/commit/?id=975809901d32756a1abb03d23a459ab0c6eadc17

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 3e9c068..3d5ae36 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -22,9 +22,6 @@ inherit gnomebase gtk-doc qemu ptest-gnome upstream-version-is-even
 
 EXTRA_AUTORECONF = ""
 
-# seems to go wrong with default cflags
-FULL_OPTIMIZATION_arm = "-O2"
-
 EXTRA_OECONF = "--disable-introspection \
 	        --disable-debug \
 	        "
-- 
1.9.1


