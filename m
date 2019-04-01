Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id DD4357964F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 00:42:10 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id p14so6484844ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=U95TAuy0vL0zVOVjD4hmTy0h9sUqBCqOVVTnWCtGvGA=;
	b=FGdZOd2tTnrtCT8i8o9/rm75t5ZsK997jBNBJmOuKkrRC/DTF0Ge8bIqPqQwrvyw6I
	JZ/CfURBLN0PVLPRQVzMPLWqqrVx2E1be3vYrEPTEbgjEty82QheqaAPBvfQ9j6XqwC1
	Pm9tSXuuwsrDdrIg8ZAjfHFP3oYQWxmHLxHjo4zkiZyg9N96V2ZIP667mCe507rT+ij/
	0o0DsovMr/AfWQ9B7hmgxxCdgTq3rADjp6qU9YIUJecjebUdbL4QMSqGDiiqEdvpKJ9Q
	0sZfpKqNv2lnmHRRPFFEZgMKfnDF4C9eWHR63xd7M1CJbMdGFyapoYCMNo0TNnHx0YUi
	oKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U95TAuy0vL0zVOVjD4hmTy0h9sUqBCqOVVTnWCtGvGA=;
	b=Lq2QEpTFB/HVdJMjSuggol1ViB2wyiipaY2nyejNpKYn+vgDIZbrOBcxpB9NP/Dwf4
	edjGa9A9RrubOFugQ7VSy0EcBKmsZX/zB4AGBSnlnSDV5uU/fVogRQAn2r8wrNmNtPpd
	W+qqFuhpcG+vT0+j6i54Jv4f5dFErtqfPub/NJWSutMyMOYnI/Bj3uK+E+jHfTXQ6taD
	SDaU5I/fyU+dKaZw+ksl98Y5B5FtjI63A9h2rY7MlVTlWILIg2o6HyWvV+Q/1rBK6jHO
	fVrR8CXsxY7PHpiwKsb66DJFeZ7G54YgGGNW1jjEvLfG7rvZqfwbZ2LXBRj5PdN9d5vZ
	L2zA==
X-Gm-Message-State: APjAAAVsWOpfaPMcvo0BJvVe1gtWDIBEZCoi0+ZyFKvuTmM9RZeoAv+E
	/av/Y6JOFGDOGloLESIFZS+qkpr7h2U=
X-Google-Smtp-Source: APXvYqy7QjVdE9scFAqYEyZ7bIxH5sveQeRzQ+WMwGgIlf9+u4qYGKkgIbQvnvzIjT5/8NUOum1btA==
X-Received: by 2002:a2e:9585:: with SMTP id w5mr16277733ljh.132.1554079331361; 
	Sun, 31 Mar 2019 17:42:11 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d3sm1739998ljc.15.2019.03.31.17.42.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 17:42:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 02:42:09 +0200
Message-Id: <20190401004209.30455-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxdmcp: update to 1.1.3
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
X-List-Received-Date: Mon, 01 Apr 2019 00:42:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxdmcp_1.1.2.bb => libxdmcp_1.1.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdmcp_1.1.2.bb => libxdmcp_1.1.3.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
index 466f3491fd..d43a146fd7 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
@@ -22,8 +22,8 @@ XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "18aa5c1279b01f9d18e3299969665b2e"
-SRC_URI[sha256sum] = "81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2"
+SRC_URI[md5sum] = "115c5c12ecce0e749cd91d999a5fd160"
+SRC_URI[sha256sum] = "20523b44aaa513e17c009e873ad7bbc301507a3224c232610ce2e099011c6529"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
2.17.1


