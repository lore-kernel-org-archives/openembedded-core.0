Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 41C197F47E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:48 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s15so58108931wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hzjyTcQxDxSgIOse979akkd/nsT6JWlIxNMpKAS6PJk=;
	b=ofgNowmSpwMpn2I1qeoBO5LKuL6A0ILGJSRZbs+V9GxaPIgNUa4tFeZU2AzSgL3NGK
	Hhjl9B+LLgvS0OKDo285wg7u/mFVRO7DMCxS8yCTZo01ZVxsjGyuYvj84pgI4rrPL4DM
	3BKSGR6yHpHAZY/4ynHIYxh6JkKU8H2TW9wda8XCM1Lg1I3SibW1+X0vafloNMmio3HF
	OAxWEzv9iyZ8FslEldD22gHKd8gCAhR/7FfiU42Le9gPe1tlugN1apJqUyfPT+TqS5Ah
	ZoRZWTQN3doxmt+kBWr13W5r479mJ7HfGWItKNUc4WfkAIZQlla+B4Tbw0mKgsYzVyEH
	Q75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hzjyTcQxDxSgIOse979akkd/nsT6JWlIxNMpKAS6PJk=;
	b=ZuAY62QMmlrICKgSZT9dzInrDk3RXB11oTRW6vho+hLOElr9ksmt9D+CAfxYyV1nhc
	5wL+X9CRy4eBjntGKruVv7M3wuzW9ajm7kYkjI8VsuNj3/bgRaHg6sFLiLDFCR7kbl+t
	zzVP5lfaKAYmhzoyc05Ldk4kRf27wteciyt8/+3oiEB56bHsbS+jtEzs5tlB1lSyBSNH
	Acua6noQd0Y7QnTBnuzBSdkMYJ02n0xwcL1ir/Lxh1LRUAHu9Te75+tSiebd/FUg46iO
	7DtyGN+gpCccJ0f6XvQWDj1WcCWX+IN9RLgxENnboQ5XgTVfXkenoo6cnZTcfMFIfNFx
	SOsA==
X-Gm-Message-State: APjAAAXFzUSLFMwqab6eyCaRm3HrYtqZL5+1H1QuvgSvVHSUCIWpO+mj
	8JbNpOZfTY7IeSzs8M6wzA8jm6WfbXiocA==
X-Google-Smtp-Source: APXvYqxp6tylX0Y0ZngBM1T2dWBu2KspXP6yyxTV+5IysFOMtFJj5oq+4yDS90t2SIeUX4wUVJ6TUQ==
X-Received: by 2002:a1c:107:: with SMTP id 7mr10070634wmb.84.1565173788741;
	Wed, 07 Aug 2019 03:29:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:38 +0200
Message-Id: <20190807102939.12760-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/7] ofono: correct the python3 runtime dependency
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
X-List-Received-Date: Wed, 07 Aug 2019 10:29:48 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/ofono/ofono.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 03d0fd53a61..bdbb0b5bc61 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -35,5 +35,5 @@ RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
 
 FILES_${PN} += "${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/${BPN}/test"
-RDEPENDS_${PN}-tests = "python3 python3-dbus"
+RDEPENDS_${PN}-tests = "python3-core python3-dbus"
 RDEPENDS_${PN}-tests += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)}"
-- 
2.17.1


