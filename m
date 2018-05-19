Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D7F9375205
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:13:57 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id j20-v6so4551449pff.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AdaHftspI6vV1L5PmY+i1hnLTG5q+FhyX2kBa0fkFsw=;
	b=OP5d5MfjAas4DXOZfDyD9vmxzSbGpyDDYANSlXItZEkeyrmg6Uu8T6rN6mVpu7gLVC
	arhYW1OHdnILZh4Egf6RhmWCdBrZuZLZaalZsG7+iXWZj5djTxtfUw1G/26hYs3P2pEK
	hGVJ3+dXoSOLO6bf/JH1/ome1cJi7hIjNpoBGpROPJedYVy8hRAzPtjTQ8OmLfEtKJqt
	OCKG+Q2NJHbT7Wz6BqFIUhM+CkGShx2VN48H6bpOoA6ffQpeKUJHjUciB/dtLYulOZEm
	4xFDjOPUsyAc8LZYtMhE9aG+giFnOvg+dnepoimB/mLzZL+QBJPm5ZkNEO8l1YImM9Lu
	7ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AdaHftspI6vV1L5PmY+i1hnLTG5q+FhyX2kBa0fkFsw=;
	b=VsTYYFgsbqsCZtcvbkPzyVwk8R3Qeqn+EvC0hUspvX7wLe8GZat2VK72eNe4rnw1BN
	DiBQvRukMYgH733vcbWHYyY77JAUMX3dkzl+iMEYwwfaITyOBmuOKjyTTTJRqdjtzMkS
	d/weuaLvzy2wHAR7MteaUCxY/5OyGALgdE6YqerviYqfIGSXpjoMaZnWDqz6ZR/sdQNc
	Uzc7aZj6GwyWpL9SaqivWT/D+2d6U7ZomSiWlIz2nUb2NyjFHYW543OU7PBWGBr6Pg5m
	GWI8s+IdBEfVb3Af9ilYqk/Y9jo0aGcKFH+Fs+JnkenHxaCi6NKiWBFnTcpK/YEYtFHu
	T/1Q==
X-Gm-Message-State: ALKqPwf2WIgXYzKYHfudxtmbb5BpBnbobeCUJqX5wII9GtAKPeGXSsS6
	meuctSUzeVNlDjs0DlDZPRc=
X-Google-Smtp-Source: AB8JxZqIgxJrqtp3/HtWVBWWA0ENShMDUoeDuDMjTPOnJoxgb1f0KagunZGs8957NNsCVOjZKXHO6A==
X-Received: by 2002:a63:798f:: with SMTP id
	u137-v6mr1209039pgc.202.1526696039208; 
	Fri, 18 May 2018 19:13:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:13:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:50 -0700
Message-Id: <1526696034-3857-4-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 4/8] xf86-input-libinput: upgrade 0.26.0 -> 0.27.1
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
X-List-Received-Date: Sat, 19 May 2018 02:13:58 -0000

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xf86-input-libinput_0.26.0.bb => xf86-input-libinput_0.27.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.26.0.bb => xf86-input-libinput_0.27.1.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.27.1.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.27.1.bb
index 54c33d7..d31a911 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.27.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "da47ef62eab1d0e922a8fa929ff81758"
-SRC_URI[sha256sum] = "abca558fc2226f295691f1cf3412d4c0edeaa439f677ca25b5c9fab310d2387b"
+SRC_URI[md5sum] = "bdad198a7a9f2ce2c1f90d5e6760462b"
+SRC_URI[sha256sum] = "d4ad8dc5ad6f962a3f15f61ba9e9f8e37fa0b57eee9f484e2bd721d60ca72ee6"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.7.4


