Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id B49DC7FC4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q6so23967514wro.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QrX3puzFbSY3PCefem4q2Ru8SYspxHWbPag0bf6UCFY=;
	b=AkzFURqotZzibPWsvrafc3mS7VI3wChR7QL+YtTq+oiNIHPONMJs/TZ8uTLSvR+MBs
	iQXjv87U5gzXCm/JqdOtkMqjDZybIqGuP5PwPc+JZ9Hc9shG59qlUOTQ+2y+JaxVDLjj
	7ox1bbsjbz2I02I83SNMt3PYRDCb6K9huD2EagZ4LLr+mrc/x3+mTLsqAIbXPyD4aOoy
	/zpgivdMzJqzgDmk3qEtf757RTc5Y9rSnVKF2N134ZtylGeerjalAKBkQQai3J1e123A
	MNJiwcwjczoP9ScJhKO/x3ViM9CAaTBzHIPuHzC6f50bNoeCbDAcUHbbNYXNuf6O9HXR
	eipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QrX3puzFbSY3PCefem4q2Ru8SYspxHWbPag0bf6UCFY=;
	b=WzK3ROaKSdwrrNKQ/WPT0pEVUXNjZJ6QNqnxn/bNg5kxWqxGtWv9/NfnNcHgk+rDw3
	1UaDvxiiKjmyaGb4xCx4N7semXI3nPYi5WspIgGQ74eDqISOnLFNwZoyU793D/iE22OY
	56uEHW3S0WX7m2GN926ebQysOWZfjhOxNxE3dPvgAoDe95H/FjmOos9h/kb7ROz9/tNJ
	j+6kILvNFeDtY7AvtsLvjhzICwQrdsft3TAJnHRuBH/sbzYAwkHZydL4WWYKztzj285H
	ZNU4sy8zoK83sTWTzOp/yhi4i13MxU79ztg222r6ZYcGHIoIvbzo2MrlS3sKJTLgWm18
	ab7w==
X-Gm-Message-State: APjAAAXHXZyjX8cb5Gg0FYR1HkD+qzM+8RP455LqsTDM8EXOW3kDvbW4
	wYx07Etj5N6jYjCzbVPkT4rJ09Bk1so=
X-Google-Smtp-Source: APXvYqwipa3a9Rr2quWc1soY9UiKGuW+a9/Kp/v7YFqfHdcjfa5qTLmmgJJj9r921SP1dC/oiWiuyA==
X-Received: by 2002:a05:6000:50:: with SMTP id
	k16mr4888892wrx.145.1579296564193; 
	Fri, 17 Jan 2020 13:29:24 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:05 +0100
Message-Id: <20200117212908.32647-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 07/10] gcr: add mime to inherit
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gcr installs mime types we want in our mime-database

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index e3e8999635..272112dd12 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


