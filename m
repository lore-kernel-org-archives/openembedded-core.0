Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id BC3A76C3E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:52:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id j20so11187060edq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 19:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CJ8Z43R6LneJRzAkCbA1scuOIrhf5P/LKaxqBWjW7z4=;
	b=yJ4W7xnAkivwx7/QwmjRB1r7wql6TpqSUjQdGFksEcsprHErLBM1loiT/nhFJFiDhP
	/TuqcvjCxQZ72iiEg0XDev0WAWwtxdmEeu2bPs3/vfdeNFg10DyS8ThOJJp0vuLxfV6n
	xjLg87IJgTYbN9o0DIx36lK5eqgvNuMm0XrByDQJvfLSd2Pa26Rw32LBxl9Do+k+KzCD
	a/TJp2NjrzCZ59lO8zghtxII+/4M92eSSi08dBxQ7GI5OCW7gBILr6RzUvDNkQGFJ2Jd
	KShQmPjLSZvDsfp9wT6RhfvSPkBqMRcBWfTgCPBylcIw32NlOCqOG61OCNG3IH497mza
	ddqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CJ8Z43R6LneJRzAkCbA1scuOIrhf5P/LKaxqBWjW7z4=;
	b=ctY4pAC+M+ScmvWu3yksrh2DePl6iuSupBo9D9jnamxEdEI38OjJ/v777ItsVrv6OE
	x8ntarkMuP0ANqpC04VzWuVluIy3YnNZkKQawO74SqxmrXjNpSCT9kRmDkvQUw6Wb55/
	1pAJOoRggLdpMFNWGb70eeutAvwkRsSvNeKLsAO2XztIe8YcxcGfVum3MVbvNo7A3Oi1
	tSuoXvIh8uxjRd+/+ue5KxksHjEnrJCJs1Mv5zXrToyIJ8SEZtwz3XctDQFWxC1qJE0B
	MTz9PWTLN+msNc0CmzSfAYPfJX2UE1h0dwrdjlhlu30cPIh9AcFmTup/PM4w910qDZ8R
	9Nrg==
X-Gm-Message-State: APjAAAUG9oOEmGQ9pyUZo+Bo70i0fh10qausmE3UwW+tGiUaAIx2gDqL
	YDzlaiHxTw4MZQ3MPBp52Y8YOz0J+vQ=
X-Google-Smtp-Source: APXvYqyh9UhdWGIlqDZnsNRe2P10ZWF+S9pw/UawCCsWB6vOsDEK8U6kdjXLpTzUQ/fUx6eWh7npXA==
X-Received: by 2002:a17:906:5d4:: with SMTP id
	t20mr11353283ejt.80.1555987956895; 
	Mon, 22 Apr 2019 19:52:36 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id l3sm4200720edl.63.2019.04.22.19.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 19:52:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 04:52:32 +0200
Message-Id: <20190423025232.2822-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] help2man-native: update to 1.47.10
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
X-List-Received-Date: Tue, 23 Apr 2019 02:52:37 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{help2man-native_1.47.6.bb => help2man-native_1.47.10.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.6.bb => help2man-native_1.47.10.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.6.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.10.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.6.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.10.bb
index 794d308cb7..5feaeea139 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.6.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.10.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "7424901e6eca8af372d2ad62be5cf659"
-SRC_URI[sha256sum] = "d91b0295b72a638e4a564f643e4e6d1928779131f628c00f356c13bf336de46f"
+SRC_URI[md5sum] = "0d70833650a552e0af742882ba84f2ee"
+SRC_URI[sha256sum] = "f371cbfd63f879065422b58fa6b81e21870cd791ef6e11d4528608204aa4dcfb"
 
 inherit autotools native
 
-- 
2.17.1


