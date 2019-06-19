Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3A2E7E6E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:44:41 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w13so26275210eds.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VElHJWzkG4sctscg0HqZXaa444XfMyqv5rzR+Nme3dQ=;
	b=ji6GTgT/vEHsWQv0msZHloB0nukjFQF4HdJc0TWYuigpOxvsK/1PNNAoBSpnsv7Bdb
	ZmquwchWSsbhuq4EY54SxJqWYJGrKOpCnu0BiEqTsxiD4DLqwBdKlIqFJcz5JP9KLxLP
	Et3ytiwpV35ItY2E65VyXtoSTekDhKa8wf8F0B/dN5QykFEARiCChgG7voTICdKa3/Eq
	rq4u35eCQJcWi+FYcXj9Z7WYvRTcokeNaooxWbBCwqzEJTYtFiJeZzHk4IZ46I4Qb4M5
	LlX+ZzZD0HRWAXVspSl2e4Z8JPx2bfBRh2RUnTICiePBHaXPTiIorCp0mYCQVpX0KpOo
	XrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=VElHJWzkG4sctscg0HqZXaa444XfMyqv5rzR+Nme3dQ=;
	b=DPQGI3VXz4XXkSHOqqJUAhIwu8gj5JU8JHSvy3reYgmabid6Pxty2tLA2xQTfb23XS
	iw5F/N9vnUohL8NW2j9gRreAmSSZS+bThCHP3cmgd/rNsJzP0V/S797eLb6RiXrN2cXJ
	3rMchg5Wz++TIgtYJ5Iul2s1Ru9hZqSIvPnBLSLvTuRzQaVZa7UDGucjrniHbOywW1aF
	Pz/01jPUDJTIQ1M3uUt4T5iJky8sHI0ciGxvbS0g3s+7//FRtYwSG/Kym0tpav3KPtiq
	ypPbO2P0GNO7G4JLOLi++LKES48huHgYC0jCV5A2i3F+2sZhhMA3DCn/DlC25RbWpAlt
	diLw==
X-Gm-Message-State: APjAAAVvWFLyqrnvPz7dYPbPEjKRPE+W/3tIt8AMm8DeJb5nQcoAOpq/
	z8Sr1Ysd2RA83pyvHTAJNQs67c7vbao=
X-Google-Smtp-Source: APXvYqxPIYCnak4O8MxqfVTSqWvUt5W+6Q3L/r7kxA1nhNCFWxRvib1UccAUJQp5NUHsAdCztSDtGg==
X-Received: by 2002:a50:ad01:: with SMTP id y1mr108163983edc.180.1560937482487;
	Wed, 19 Jun 2019 02:44:42 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x8sm5527821edx.67.2019.06.19.02.44.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:44:41 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 11:44:35 +0200
Message-Id: <20190619094436.2024-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH 1/2] less: Create symlink for pager
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
X-List-Received-Date: Wed, 19 Jun 2019 09:44:42 -0000
Content-Transfer-Encoding: 8bit

Some system tools (like dpkg) expects a binary called pager when they
run on a interactive console.

This patch addes this symlink via alternative, so other packages can
also provide this symlink.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-extended/less/less_550.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/less/less_550.bb b/meta/recipes-extended/less/less_550.bb
index bb1618f1eb..8f59bd6087 100644
--- a/meta/recipes-extended/less/less_550.bb
+++ b/meta/recipes-extended/less/less_550.bb
@@ -24,6 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
                     "
 DEPENDS = "ncurses"
+RPROVIDES_${PN} = "pager"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
@@ -39,5 +40,6 @@ do_install () {
         oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
 }
 
-ALTERNATIVE_${PN} = "less"
+ALTERNATIVE_${PN} = "less pager"
 ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_TARGET[pager] = "/usr/bin/less.less"
-- 
2.20.1


