Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id DA7FE7C206
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:09 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id c16so8257520lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9q04jrOYvgVIoUefEvfoAd8RoXcdYv7TBwAxrYjwmMo=;
	b=McO4Ts5yfuV/xPPpXR4kQgIzqIyVvc0qiE5DZlpqx7TLrP5APuB8/p8JghXiQOgs9y
	sj/cu1uT1Kq05TFDKgtdtSje+Z/a3SuyJFvRxmZgqwTK/qlLnPFjc+pJZjDSBIayHMRf
	lLyN/Rg3KFWkBPyM+X06yKMpRt4cZ/Je92DN8+WyNEGt7K3gyMrhnCzM2XDMVCYnpVx+
	cWVTcJqe7rVul3X1ndIhps1q8mcR025MfthUNDVQepofui19KZiyYHsU15s9MCmahyzp
	GikNk6E8z6h/8FEFp3uMu11b8z4x5ukVoZ0HmSPtjLLP8UEGH2pHC7UVznrhQ21TNKy/
	YNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9q04jrOYvgVIoUefEvfoAd8RoXcdYv7TBwAxrYjwmMo=;
	b=ZxOisI+ImaS7EpZVr+YyhHLiTGzAtky+BwKANPgVLDw7dHrV0syi/VDDf02MMtp/dn
	IKyCYLWVTuWYRnZ5m3C+w9dNKyS7cLKYbJlP6lzoF+kn5/vJH79XvCz4uHO4gwxk72Z9
	O5UvfNpbBCCygSc5Wgr8Me+3Zx8Qmy2HGkUTp/67Zk93SqcTx3wJteYJbtc5CVuq4h/a
	r1+/PGh8/k23Xre+esoEqJ+51oOUeWiw5cHSzcGcOs6UjMqK+0uExZEx8mw+FBtNv2JU
	gVc68f+7x6l//XpULcbnBs2USr5J+8TVsTcrPvzPoo3ZzSsLFKsVXA9oX80ZstBTOv/3
	qBlQ==
X-Gm-Message-State: AJcUukfc4jZ6/QKMSQ76jSWBu+sZHm1uBfav8yXxPW9scNquxmsW4dfm
	n7SSP+kbqr3qfcvf/33pPfupR1ZT
X-Google-Smtp-Source: ALg8bN5NOkkwZeK2Sv3YQlV9v5ii1Bsal0rNPotG72vfatUTEK840dA2/cAEzjPcssE1xtIdtDLJbA==
X-Received: by 2002:a19:d242:: with SMTP id j63mr11103633lfg.26.1547742430023; 
	Thu, 17 Jan 2019 08:27:10 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:51 +0100
Message-Id: <20190117162659.24997-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/11] libfm-extra: upgrade 1.3.0.2 -> 1.3.1
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:10 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libfm/{libfm-extra_1.3.0.2.bb => libfm-extra_1.3.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libfm/{libfm-extra_1.3.0.2.bb => libfm-extra_1.3.1.bb} (80%)

diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.0.2.bb b/meta/recipes-support/libfm/libfm-extra_1.3.1.bb
similarity index 80%
rename from meta/recipes-support/libfm/libfm-extra_1.3.0.2.bb
rename to meta/recipes-support/libfm/libfm-extra_1.3.1.bb
index 734d010d319..85102a1a3d9 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.0.2.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "02a024714d51e0d37afc7bd596a44f3b"
-SRC_URI[sha256sum] = "18d06f7996ce1cf8947df6e106bc0338c6ae0c4138c316f2501f6f6f435c7c72"
+SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
+SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
 
 S = "${WORKDIR}/libfm-${PV}"
 
-- 
2.17.1


