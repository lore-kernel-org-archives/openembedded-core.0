Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id F0E7E7E951
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:33:05 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v24so2788087ljg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=My0pos370m/SUScdvGxtp+ki2hPnM1gw89GvlHT+tlI=;
	b=HyKw+e3DwWbpX4Z3KFoqf84G8zBx28FplnAAC7Uh0N+i7tVYLUTUpklXIgRpk/o+aT
	s9RpS99acMKnh1BJT1CcNX+uUvMuoSVKHTYB0byKZYnTqeRVFWkRM+Dqdtn05VXGzQnQ
	9kXyfbnQ/eidhFSgp6CF8j8I2duiDWwKlXW/ZthhTxZ9gfVuo4Z5e8YmglFCPi7YtD4k
	OJD5fFhW4FHILO0wnc+CnPFLHyYTwt7RM8SpoNxWGmUSOwnn/socQGFBwZIDjwSaFPhC
	eQGf5N90xKvcitnvrbpHWPADzGwYTNpQprlNK8em47X0QDKga9DZkXUrrboIiSnDM63v
	CRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=My0pos370m/SUScdvGxtp+ki2hPnM1gw89GvlHT+tlI=;
	b=CCDniAAb7ru5WscwIKGRn6F+GsqsmJy2CxoPqt29I6H+iyqFHB53ka0cjbSBIZoXoS
	ToQWKZaqASWhBD5o88kyzE7Pvz/8lQocUa8pdC8LoXErnWwg3z9GPHuV48aaIwoCfdZr
	XS6szvyCbzRSg0FoUZ9jhuufxLWSovW9HMGOvvLnKMMOEei4q9EJGGZpOvcFLX0LVoLx
	cAhtlvw08cREQPkfceOQxozWGEjIhTYTHWoZEzSl5dHH0mp5cVf5UqSS23TVlT2MWTPL
	CwGK1nS5HsYY2HWYYYvD0bKIchFYNiZ7Bvcldlv3WQd0ElRYKLvUhqBLVyML3JIES3Y9
	+P2Q==
X-Gm-Message-State: APjAAAUR/vYmm0xvFGe/fNiBgfTwI9vvs/FltQlja3J5KeO6fk/qLEGj
	sfPCNq5ake9evM7ZnuelmMffNyFkQow=
X-Google-Smtp-Source: APXvYqzLnoRsflILf++4UpM404wOOiFMum15B5I4WKnzDPtgnkdZ3LsvsPMe9/GslbjxfQrlOni2xA==
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr2981468lji.133.1561649586177; 
	Thu, 27 Jun 2019 08:33:06 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id c15sm479653lja.79.2019.06.27.08.33.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:33:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:33:03 +0200
Message-Id: <20190627153303.24445-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxi: update to 1.7.10
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
X-List-Received-Date: Thu, 27 Jun 2019 15:33:06 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxi_1.7.9.bb => libxi_1.7.10.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.9.bb => libxi_1.7.10.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
index ab49cdba3f..5a08e07362 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
@@ -17,8 +17,7 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "1f0f2719c020655a60aee334ddd26d67"
-SRC_URI[sha256sum] = "c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45"
+SRC_URI[md5sum] = "62c4af0839072024b4b1c8cbe84216c7"
+SRC_URI[sha256sum] = "36a30d8f6383a72e7ce060298b4b181fd298bc3a135c8e201b7ca847f5f81061"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.17.1


