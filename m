Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 669A571957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 20:07:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b80so4284940wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9BMKzL4OhLvs7Qi69UjwnE/55wfE/nwJYkAyeCwpw0Y=;
	b=PnoLSnmhtN2e8HdwwmFMBgSEkXOsqKBdpaDY8dMSY5zRlF27NzgDcol2hrJ0QEecYe
	XlqxLETRTfnfYjpdtPc0GrJj3i/nsT5JEUhQ71vSppltVSqzD1Tj7DJZJGazEW4jvDAu
	4v2DUPrTz5RcStCweVsz7YDuBkOPteHtuctEuCH5dqEcQBPKGaWxlvkd/QFQaePA92mP
	jrhSI25WmSgoyl+247MxvEIxBglcGuARCnwvEnwvnKSa0bMG+1MGSKI4S1986jHEOFjx
	u5IaKhFH8ibGQAi0UPrIYrfbV2JLpLyPEc0ONzpPXPTo7/eZmLK11TPf1vjNqA4RiCtu
	9EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9BMKzL4OhLvs7Qi69UjwnE/55wfE/nwJYkAyeCwpw0Y=;
	b=aHDvU6QmjNB7zR1hdb/CSq+xLDGV5QIt6QtXSOsF3iJDAeuLpqr5uGOCmRDDJClKpi
	OIw4GmW8ZdSStOlvaVbg4a4aY4CELwLzDQAZnsNaMwleDZ1RQPfx6R96sv1TnMNlZ5oZ
	uig5Sj5eahWcMb68H/nxyzdpMwDIPuvhkMQGYe9g8UbdeQ33WmUAkcteaRb97JWs2ewh
	CD8BrFYV4eiEMUJN4GrH/oZztIKTNNsBMx9nwxyLvjPNjq+ohpTQDK39CKGKrGoQ14vU
	uCaALMmwCKn1uiExKoBWQrUVOaAKcS7q4KoiEF007WIhRv12wj1unnjQtHMMn7bInX7E
	2QYA==
X-Gm-Message-State: ABUngvdaIFn2KAzP/0dIEB2xbYIvhdTuh2eJ/CZdwPvzZyy6R623H9ILzU4/K7/fe5kC9Q==
X-Received: by 10.195.2.11 with SMTP id bk11mr8147092wjd.119.1477598857653;
	Thu, 27 Oct 2016 13:07:37 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3F33.dip0.t-ipconnect.de.
	[91.10.63.51]) by smtp.googlemail.com with ESMTPSA id
	a5sm10294203wjv.6.2016.10.27.13.07.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Oct 2016 13:07:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Oct 2016 22:07:18 +0200
Message-Id: <1477598840-1768-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH v3 0/2] update libsdl2 and taglib
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
X-List-Received-Date: Thu, 27 Oct 2016 20:07:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2: descriptions changed as suggested by Alexander Kanavin
v2 -> v3: taglib build dynamic libraries instead of static

Andreas Müller (2):
  libsdl2: update to 2.0.5
  taglib: update to 1.11

 ...-sysroot-path-so-that-make-finds-our-wayl.patch | 32 ++++++++++++
 ...ideo-make-it-compatible-with-wayland-1.10.patch | 57 ----------------------
 .../libsdl2/{libsdl2_2.0.4.bb => libsdl2_2.0.5.bb} | 14 +++---
 .../taglib/{taglib_1.9.1.bb => taglib_1.11.bb}     |  9 ++--
 4 files changed, 46 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.4.bb => libsdl2_2.0.5.bb} (86%)
 rename meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} (67%)

-- 
2.5.5


