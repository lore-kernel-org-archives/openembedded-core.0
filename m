Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58C4871CB3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:10 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so309969pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+4hjZE2GINv3rfvnkoEkWyhbl9gDYcuzKkj8lVuvhlI=;
	b=P4jfrA+Mz1Ry0ziaL4/M65WDYSTcEcWkDo8QY3uPjaN9YFRtWqLKsoxkASw3ugPyjc
	xO2f0dhT2CnQprG/g77owHMpQqjHaZby/3uaSS87Y8/IwwAEwmQgg5dJZ4Zmwq8DK7ec
	d7x8/4nFYvsf44+cyNp5zqu3HORETigI6uxzBuwZZMjpn8/sA75jfyLAV5BFdURqEhtB
	WuIuqwtWKyH4vzGYARW0vyyp3LSC3sQW74Sv6NXwzNai9rre1SBQePK9BILmRRuhY3TL
	joB352ovzaFNzakn49YMyuR9Qdia2ogMzENOjBGWre9RJENQl7wYAxPBDyVJY9N1iIkX
	zQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+4hjZE2GINv3rfvnkoEkWyhbl9gDYcuzKkj8lVuvhlI=;
	b=cw9rh0CdBzEpvj16KnsMy5+ZxLDpAi9+R+8eOXG0w+OzaiBbD1NmM3lI3MMjDVGHtX
	ydilbYCLt0nGMAo9fH2WfbK1E/+QRgc/dIE1RqXj/0OibROHV9IaVm6oZDpcqRj7kZia
	YU7Dm/Ul9O62FTSdH2MpAAcB/AiPqABwD/oPfR4CTJPTFh6/z+JR8vihiIgZI6YV2kZK
	wwMIl9ckPYD1hLMng72kjDvPTzXgHKuiw3UgHwYQ/ggzZ0XOoAvDXHd1oMDDtjSgRyDE
	32dnX0EYBcGLGcYbXFxXNl98GzykLVKEvwbjSXxLsD1k5DR3KURE4ij58QJStHd7OdGa
	B+Pg==
X-Gm-Message-State: AKaTC01qoqp5WUcCmoTE1Q8FR4XfLdBk8qJPaQiLAkExJ2wSqxXVKa4wfC1V9K2M7u358g==
X-Received: by 10.99.52.10 with SMTP id b10mr140088923pga.42.1481252290224;
	Thu, 08 Dec 2016 18:58:10 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:57:57 -0800
Message-Id: <20161209025801.20775-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 4/8] gstreamer1.0-rtsp-server: Add libcheck to deps
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 13ba40d..7191f98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
 
-DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"
+DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base libcheck"
 
 PNREAL = "gst-rtsp-server"
 
-- 
2.10.2


