Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9187FC4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:59 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id w8so5585323pjh.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s0U58Y+R+PHwTk11BMKVmZhSjxmj37aIcdzJOSZJFUI=;
	b=Nw+0wvXdyQspvpx1erVuEIXj5Gv2+jqWgFknZ6fZMMN01rIGE4S5BKbnG43BLXWNRF
	KZJgEeUpJUbPTsX4bPNaU0Dme2YqgO+W4qhE6P12RFwr8nBsh7H1Hit97zktIgruqvp+
	57kgXxUNwGOEnrxOXTP5DCZSe3T4Hzzettsk6eRCcMLDIAbL3S33kMrvHxTwiTzytIz6
	lRrytpxPm5slVktmP4NLBAGX90aSwym6Q+C9ksrOW53K19X6Z1pRUPj2t8h9GVjp4GqJ
	CQN8n+nps9LRTc68Y1aeSUPkhgIUBBLVTQqdXj0kDvXrWNoGxIVRiQa6x7wTR8eWYEOV
	K0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s0U58Y+R+PHwTk11BMKVmZhSjxmj37aIcdzJOSZJFUI=;
	b=Ww0XAQPZc4PvrBRFCQOsYhCRrm4RhgxB7Aycr4kpcykW3mmZGR5yBbblaxq92BtPz9
	8F+0iXcvmrsgiSJ/1Y/aAELHerQVEMptopOG76K15qpiMNw+Zc0gNKsEjg8O+ENvds0d
	ZgEvGGRs7DDm+oaWfXczxDsPTxyiUyisrfQc1Wh5lONY+kCpYQi9YKUOBVdSbI1auA+f
	NQ7MtyKPlg+8H1d2KEiZxF2KfKfJQ6QvUjPb505Z2J3fh8dKjLtYKpmNXI9/sZxdel1U
	5t8b9vc4GYF5dJC/5AyJvPrdtkC1XZCpTFT3l3Dw3SdIgY7q/Da6oBMlIjVgjeFTBFhk
	dItQ==
X-Gm-Message-State: APjAAAX3VFFfFX+YxYCEqLHrUqRFWr2oQG8BNpo12kEeeEX8BvIP2Uic
	RTY+i5wDEjDAi12r0XVrbXcBvySK
X-Google-Smtp-Source: APXvYqwq+NYtWsnBRo/TfEk1u/ry6ap/0S0N77QNtbIjsRH/2mDxxJK/PnRcODFCHz2tLNvPpUGZKg==
X-Received: by 2002:a17:90a:e651:: with SMTP id
	ep17mr35603195pjb.74.1574639460264; 
	Sun, 24 Nov 2019 15:51:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:22 -0800
Message-Id: <b27a644ef5c2fa40127893fb803230e8d918b1db.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 17/35] gstreamer1.0-plugins-base: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:59 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1.0-plugins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index 1d6f15e..9df67e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -18,8 +18,8 @@ SRC_URI = " \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "41dde92930710c75cdb49169c5cc6dfc"
-SRC_URI[sha256sum] = "4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae"
+SRC_URI[md5sum] = "b5eb0651bab70bf1714f103bdd66ce47"
+SRC_URI[sha256sum] = "5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.7.4


