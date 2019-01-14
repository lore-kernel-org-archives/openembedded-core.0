Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC867C052
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b11so9274297wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VUeTb/wwGIUkjQNZ0iYEmgLmQIT3pGqL8Eia1E9r0hE=;
	b=pKgwjT8lzGwjPIm6Vr3xHAYS5BRgdlHq+kWBLG7rlo091TjzMASWHpKyWuCTJiJGLF
	CHBFqJSjuqQl4Wa2KKVJohgZkHtLq63XachY3IKOiq67PSgSrbtn2w84Zw2GKcnp8jr5
	H5VxhUqFNmY4qxQh+T6PDLxqXo3/w3SU2Y52VzuPK7PLb6v4lviIwj68QTXOBFmX/Wjf
	BwlzpWtmHJGmn5nWbmMJgyxWZURMCeC6cCgDvF1RB1TSMUYzKM1hb/+IvtbQU4kCdpo7
	CQjrCJzQHl49neCzieyRx/voEhJz6cbgsSnV2f+rpY/F1LngNBXjphw9LCy+4tUy2M0I
	/5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VUeTb/wwGIUkjQNZ0iYEmgLmQIT3pGqL8Eia1E9r0hE=;
	b=rtV3QT6MZQfuSRRtpkfXfY/ktmi0YXWLee71rX5leW60TP/sFXZpEmvMaRX4YTelCE
	qmog+oTuJAp/mDtZPIpIX4OZSMeszuDlfdOmGaJD9t6C/9Afa2w5H65B3V5kb+iitYYU
	NDU7Z8BFHaakDdy05gKTWE067Odcvm18mIgKMzRkxsl/WH7iROUwCjX6klh81jCad+mR
	WAjS9ilCK/UNuSmdMK5GZ3YM5pnhF15IDGgNVLO8zJ55NNBFqMxr3lx1PJFXS1F2DI5i
	baC6/d/dh/MtYGg0Se+6EaKcxxuA3Lf9zXOLjyotKaWV3cVAc50SkpGOcb4KFMHu+w1C
	Kclg==
X-Gm-Message-State: AJcUukcHL260RXywCmGcc9EzGxj6I2t1E/rg6kY26n0owqJkpGRcL55W
	eQ5WZK1fyuN8SsKzeIDD5XSjm59t
X-Google-Smtp-Source: ALg8bN59NsNoFvFXn4b0C9Zzr39t4KrEEU/MzlvxKHHBeZg33V7TSIg/cDOdtcftABZIP7L1goOeWw==
X-Received: by 2002:a1c:5a42:: with SMTP id o63mr11999660wmb.88.1547478220251; 
	Mon, 14 Jan 2019 07:03:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:12 +0100
Message-Id: <99e575ab7a408574f429e990a4296fec36f34b6e.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 16/23] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:40 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/atk/atk_2.30.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.30.0.bb
index 481f8e89a13..4e2dacbc4d8 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -20,6 +20,8 @@ GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 GI_ENABLE_FLAG = "-Dintrospection=true"
 GI_DISABLE_FLAG = "-Dintrospection=false"
 
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
                                                                                        '${GI_DISABLE_FLAG}', d)} "
 
-- 
2.17.1


