Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 352BB6DC28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:33:47 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id z12so5658339wgg.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 09:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CA4xax7BcAfnPKAAkqXOH7LSYn7tFm+h7JwErdmHuJA=;
	b=M/H2TTCbyn/MlCqT5X9h6unj9M1Vr0aFxM6klcWCCHlpMSGia0dxhAHZRxrDCQjxHu
	GcL2RcMx3UIjzpxkVzkaaHcY/Lf9xNNopom4mLHnr5/PElqdW7G0gO1JIHsYYyNYl8vh
	o1kkMj4g8rl0N5oaRMDcKxOARggogcNQKWhUenvvI/+XpJfyqvi23PeqzqKXorIC5fv8
	mDg55CiTtpVTmP1prUn5OWb+ApZFZgHMW9WcVgoBeFxRkWJgghyfuNR5WuSzZf6kbXjT
	8W5SLxNjq8sr6tDdLfu3Jki2IHstJrDiV52zGO8Ppm4laA9VPkNG90zczIkSAQ8XGMlH
	HjjA==
X-Gm-Message-State: ALoCoQkTCLzsPvWoOViWXDaqCSx282vrPz6TtaunzcpZmMcDpaiD5m+97aRlkR6opKY3np5bVeL6
X-Received: by 10.180.76.171 with SMTP id l11mr19142585wiw.13.1385487225995;
	Tue, 26 Nov 2013 09:33:45 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gb1sm62287420wic.0.2013.11.26.09.33.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 09:33:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 17:33:43 +0000
Message-Id: <1385487223-1941-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] weston: upgrade to 1.3.1
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
X-List-Received-Date: Tue, 26 Nov 2013 17:33:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/{weston_1.3.0.bb => weston_1.3.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_1.3.0.bb => weston_1.3.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/weston_1.3.0.bb b/meta/recipes-graphics/wayland/weston_1.3.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/weston_1.3.0.bb
rename to meta/recipes-graphics/wayland/weston_1.3.1.bb
index 7a0b3f9..82bcf3b 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop"
-SRC_URI[md5sum] = "29ad994dd5ea07f52d7bffb24c25d9f7"
-SRC_URI[sha256sum] = "8e4f5b4736358b63d83c3252567ba7aa49cc0da9e2e2c30f59ddf635159702a0"
+SRC_URI[md5sum] = "ffe7c3bc0e7eb39a305cbbea8c7766f3"
+SRC_URI[sha256sum] = "f7141334b141ae1a6435bd03bfdb01b7fb628f39259164f201e7e71c8d815bc7"
 
 
 inherit autotools pkgconfig useradd
-- 
1.7.10.4


