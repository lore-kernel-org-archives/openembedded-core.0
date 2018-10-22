Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1787453F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6-v6so8791806wrw.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JXuh36mOWe7YoW6ES1K21mbiCqFJJn4RNy8TSjWI3cw=;
	b=cexR8fc3zchudRVq52sGrLoMM2E6LxHHugK11QHoRIkx3QIYFlSEheT1OZv7Gyz18v
	vEugc/2v0kCBpkNgh5oD7DuK5b4+bhzb3Ou8Y7AYU2rGgTswr2+wzPR/mVBd8B7K7GfM
	x2uivk1Cek3309+siqNS6ZBtc2RCbhW7DCKbJFVMjMRh3WUU3JmVjqQbslrCq7C0G2wK
	l+KSNgLzfOY2YiAoUDAFEx+kDqqtZNq722w7WxoyFb5oi7PxWR6Gl5luF9c0+O/Tka1n
	qBKoIQmbEMNilivmf2JWNMEuZDZOnP6ymtJoD9m0oBQcqzWj0XRzuZAalnU7viakgx8f
	aQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JXuh36mOWe7YoW6ES1K21mbiCqFJJn4RNy8TSjWI3cw=;
	b=nW/2p2q6mwLn3ckh1z6Rd1Tw6sWm2Swn9+X2GzDL/+K0h2n7Djw6g8Ml4q+mIR9tAU
	5Y99arITgyxrH3aZ80NiuKHzmNKkuEUzYsiR+b5i4K0FHKcmM7U7iDE5psDkV91FbW/+
	FXqN9mBO8NV0PTZmrPbk98S3lBT7a9LIyGH2gExNeFLsEeBfjvFHDhIyo4x3oXxTSssM
	GqCJA32EtygfxjF19kb2Gbiv/ElcyZHUyPtkXe1PrireI2aJ4ju+F/3JyfNb/wL0CmUM
	SNYuyUP8oMnOp2s3YOzsspasvInNP9vweUTQ2GumrcYeNODhLzqRGhpOMkO7rfsliZs4
	lkZA==
X-Gm-Message-State: ABuFfoinM2YnzF3tJySxVSOZzeQ1ZGPT0rEIcVl14EhNXR09LogyBsqk
	AJVpct9PGbvMGbtSx5gD/f5sMmg3YJg=
X-Google-Smtp-Source: ACcGV61vcjqxOPTxJt4B6oMVnscynAT7OVMV7P+nCIci5OxR+2rWqiDhVlMfzqcH2b61k2mw/SI0hw==
X-Received: by 2002:adf:c793:: with SMTP id
	l19-v6mr45337018wrg.230.1540217141887; 
	Mon, 22 Oct 2018 07:05:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:10 +0100
Message-Id: <1540217112-24479-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 11/13] xf86-input-libinput: update to 0.28.1
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:41 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xf86-input-libinput_0.28.0.bb => xf86-input-libinput_0.28.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.28.0.bb => xf86-input-libinput_0.28.1.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.1.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.1.bb
index 5853b5b..0b77546 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "2d7519ac0e39d4c88f3be32e81a637aa"
-SRC_URI[sha256sum] = "21994d065fc26e85d1c3fc87d8479b9c22699ed5a0119df98fbe0000e84630a1"
+SRC_URI[md5sum] = "9d2fb3d6b452d568a275908b856de0e2"
+SRC_URI[sha256sum] = "9ada448e076c0078a84b48e5298fa8ce317565f9b342b74c20429214a707d98b"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.7.4


