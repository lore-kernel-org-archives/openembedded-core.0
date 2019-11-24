Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 887FC7FCAB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:06 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id y21so5593050pjn.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zAPWOM8GAGEACS8MX4o7MWlIEWshZyXvNtsIaGYVfRk=;
	b=g+WCqZ/yk3LfuqMtPQL9JuVgNmkylSJn5S1aGnKjl3cXpAFHBJg3GHQ+rJ/1GZFy1Q
	hhU96EF3jOdIaohmA4YH93o4afyuBTSXWlrKj7/bFzQBlM/7FVjjDqEvKhGVagPX7ZVC
	baphd2ibKVvSze2bm8vT8RtyzRKoLG3Pfnn9FH7AQtO8XhgaD5F2hv1Y/ca5GLAIWiSg
	JGP9MfIT6soJEw/zihJTQ4PUtq1ZekrChOiWNynPedSLUko+MRn7JgkPxxDNZYTWqy5M
	9k66+LOnucsLHe/oOL1ZKnlxPC6GyxKD7JQ/USwymCqMu35cG2IEieXUzpVEUz1qB1VR
	LKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zAPWOM8GAGEACS8MX4o7MWlIEWshZyXvNtsIaGYVfRk=;
	b=MXrMoXdCMPVJlhcLvJkmAs8SJ5dwD/3NSL8+zfhz3dxJd59RAaf1v5OcFewy46sFNu
	dCDn0SNRHXYnj1ZoxKGgnf4WOarDe/JZRDNtskfFBqH0GAyerlGu3KHIr0gEuzpixmof
	ibhhiHnS1n+voRjfFqf0fqGNTYYUDCvrjxcMgVHXhOLarWpktYRJu5eyU+DkSiuKz3yJ
	CsJWgaKso/sDRb5TA1kDSX0m003uUO6440z+bscs1G3LxMuOTiWV34h/DTxQriCNW52Z
	Do2AE4Txu7vAuGTI89e56AHuGe9V1FmckuVInvhTXRzrUiVO/WuVqf/ZNJxiO2a0n9hl
	glRg==
X-Gm-Message-State: APjAAAXe9zW1aHKlV2MGQqTig695/l8j0pE0Rj5pjqwltuy6+/p4a8fy
	CBEpmmUfb5oAuWiAyyZr9kmNktnx
X-Google-Smtp-Source: APXvYqwYQAR/UtT1AgGnDqj4CeHnUsJmktXCzoF/799XArKBMb48qrfm5GHfRiIIpnHk0GCjJhKAag==
X-Received: by 2002:a17:90a:d58e:: with SMTP id
	v14mr36366506pju.142.1574639467390; 
	Sun, 24 Nov 2019 15:51:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:30 -0800
Message-Id: <3d6afb0ee55a4b71b9540f92bdf1973c80d10d76.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 25/35] gstreamer1.0-rtsp-server: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:06 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...er1.0-rtsp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
index 042938b..ca360bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "adc4460239ec2eccf58ad9752ce53bfd"
-SRC_URI[sha256sum] = "198e9eec1a3e32dc810d3fbf3a714850a22c6288d4a5c8e802c5ff984af03f19"
+SRC_URI[md5sum] = "380d6a42e856c32fcefa508ad57129e0"
+SRC_URI[sha256sum] = "b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d700144"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.7.4


