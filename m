Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC117F391
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:43 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k3so6383129pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/x31dVdX5lCsaqzoRevO9BKq0hvXh53WieC0uxaBxBg=;
	b=i6Ovi/yQ6scBvGl2Wjmhhh4LK7N7w7eAxAZKLX1/vHKI+I315zeySW1udRmclFhXS5
	iT9MHFK2UUITjn+EO3bRImiolhfYPPOfknSyILnG/wb8Huww23+NiN5DEsYEQFjMCm93
	80Fa2LcvxXreIkSroX15xoDEplX7HEk39lrDvvCrmAIHvussRjxMHNpv4tyNKJ6a4Kl/
	oupXLbjt8mt8LYZhsqBQ3dKOwQVgCu3KZMdmid+xx73JVo/PmfZbEVEa6oY4xHoJJra7
	bvvbsM/Y+DshgGKdyNdbHyRgDIdFZ2PN/zOx/OGtqboCZVYGrCTkX6kYEohNy8MogmVj
	yf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/x31dVdX5lCsaqzoRevO9BKq0hvXh53WieC0uxaBxBg=;
	b=F1R+eHYeRzvqNEitXihSWwWXLHH8bdo2vGSXozp4pIVkTRuHlyHMQICKsHHbmWhNjy
	li8Bn7hC27SaWgYe5HR1qDKoe4aWAvXaSibOv+L1ttvc9H57Nh8FwgUAzvC0WdyyBHCX
	hAKIngMvXokAm/MZg1tm/UI58ZJjRQoRkASzyWX+O+UxJg+LsVaMlfk2mbiEcC2meL8a
	GDQWvnray81GoepC9kS9dckOl0qElmrJ1HobWn/Zfg0Aj859K0apf0q+wfo48AduD+Fg
	kP+aEsH/MBqQucM0SD9QkQ713GiCauxqD2qH0gp0lJWY+mXjBPrTXeB/lRbwUGrGcZE3
	NBLw==
X-Gm-Message-State: APjAAAURvqdTddBa3wRE631+jF2NmJV1jAZ4nm/gJplc6wRQ+KDPLzie
	S4rAFN4np4J8JucQy0D+DUiCw8M7
X-Google-Smtp-Source: APXvYqw8QObm6QmTBgWXAkOsbXALDExhVLd7cYOl8V6lbCRucjkUechAZuBEguuiGp6eSi6G60kr/Q==
X-Received: by 2002:a63:195f:: with SMTP id 31mr5660927pgz.225.1566593564605; 
	Fri, 23 Aug 2019 13:52:44 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:34 -0700
Message-Id: <1566593504-21918-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 03/13] tune-arm1176jz-s.inc: add support for arm1176jz-s CPU specific tuning
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:44 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-arm1176jz-s.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-arm1176jz-s.inc

diff --git a/meta/conf/machine/include/tune-arm1176jz-s.inc b/meta/conf/machine/include/tune-arm1176jz-s.inc
new file mode 100644
index 0000000..c741e80
--- /dev/null
+++ b/meta/conf/machine/include/tune-arm1176jz-s.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "arm1176jzs"
+
+require conf/machine/include/arm/arch-armv6.inc
+
+TUNEVALID[arm1176jzs] = "Enable arm1176jzs specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', ' -mcpu=arm1176jz-s', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', 'armv6:', '' ,d)}"
+
+AVAILTUNES += "arm1176jzs"
+ARMPKGARCH_tune-arm1176jzs = "arm1176jzs"
+TUNE_FEATURES_tune-arm1176jzs = "arm thumb arm1176jzs"
+PACKAGE_EXTRA_ARCHS_tune-arm1176jzs = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp} arm1176jzs arm1176jzst"
+
+AVAILTUNES += "arm1176jzs-be"
+ARMPKGARCH_tune-arm1176jzs-be = "${ARMPKGARCH_tune-arm1176jzs}"
+TUNE_FEATURES_tune-arm1176jzs-be = "${TUNE_FEATURES_tune-arm1176jzs} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-arm1176jzs-be = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp} arm1176jzsb arm1176jzstb"
-- 
1.9.1


