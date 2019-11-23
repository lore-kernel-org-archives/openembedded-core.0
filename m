Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id F24117FCE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id ay6so4566138plb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CuXFrH1dY0x1HIQ0+sYXQQeowZHqdq0E329Mm2SrfHM=;
	b=iPxhGIgvesMrAobAUgsx/7eNw28ib6qYtN3zV2DkMC8Cwm4DIcnnd0hEQ8SeRn8FVJ
	4Q4tc0bLCvk+nFhO93mME5jnhYiM2KGnw9oE8rYidQVTZRJt+h90maP0ETjPfEgxsTr+
	Msqek7i+eFiE9Psy36Cj5qVPYF2vND8pICLmGsa990S6qs/vxkafbixp2egGBo5/+f/w
	BkDY8g509Liptxx97rDR70qR4352ncFoewMy0MtSf5IIskrmhNLCAvmbJnesZfMvKJwk
	755YbBNIeG6s2pbeKqZnQVVks3lzRGMjUitvVhTdaG1j21iMRcL/CMHiRLHDJ5rEJRho
	kavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CuXFrH1dY0x1HIQ0+sYXQQeowZHqdq0E329Mm2SrfHM=;
	b=Y8K2D8jwfP69/Mf+wZFzdRvbx9xbzArkine8NDvYZqzw3VdAWIX+5Zf5TMobp7JgNj
	qvV2RRJX86de8rp/Uo3xmtg+DE8ECLnAx/8OHa/oZ8d6UDxJiNlLQ7CQH1kVPGYlnfyC
	xH1/XDKDgn7iAQ764Ra9y5zSzGEhezCQ+k5ZEYC4A2+/4B9+HjZ/rgzb/qQMM8r4yb3W
	1gnGeFk8J2a96rjcp1wyrjnhjOHildvKX05YThgpBhrcmuPHY63MqcYUrwY28js7NiKx
	PQfmjn0UebgGwNIyJ9YqJsSQySqg3dGyj7NzKcwo5OiEEM82K6i5SdSobZxvjFqS2lvN
	XZ8w==
X-Gm-Message-State: APjAAAWEsAjWgdPBNUxSYRRWTbdMS3BCmoLAKaRHgbHfHAOH+Sye+CDd
	sFzzNgVUgJstrbdvMC/16YPA3xIo
X-Google-Smtp-Source: APXvYqzu81jhtvEKG+U4dO+07cJy5S04pEHHvZqarKYWHGPdLr92n2GO/kSMC+H/MT1KkznDJcw/zw==
X-Received: by 2002:a17:90a:8903:: with SMTP id
	u3mr26521985pjn.137.1574525493146; 
	Sat, 23 Nov 2019 08:11:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:21 -0800
Message-Id: <1574525485-20450-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 07/11] gstreamer1.0-omx: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:33 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index d94bad3..4c6c839 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c6f8554513980682099a2a9832250b01"
-SRC_URI[sha256sum] = "fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a"
+SRC_URI[md5sum] = "89772e7a277fd0abfc250eaf8e4e9ce9"
+SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.7.4


