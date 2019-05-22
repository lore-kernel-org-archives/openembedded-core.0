Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA7D7D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:02:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so1771457wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2KjVEFMpcobrpC1g88bYQbGIrcMqPqWOZpQuIZohnPA=;
	b=GP1IJRDOVpbNuH3Vem2Zatlde96UbhDIxg/PLu33FOQEJg9U7PaM/kmWmzhNYY8B5+
	WEpk9BCUl/tuRr4iihYsG0HrOFGkvj7REi/xQ6C4+rmWKXDoJ6YsbO9rGLgmi6nW8NHc
	uasV+wkVGIJC1P5lhpHQnWomtX3iFhtOfOyl38gz37DBnkO3lD7Q/b4yXrl89FyPGfUl
	Dbc3vtaQ59wzxHPeevi+NdLfCukHOE07/dJuWXy1zrp5a4YpwutL05lH82cd9LpjAEQo
	aj1XeLUHmvl/kxik145f1FrrwCDrXcCIcgSbjincS6KgYbRp3GZlXK0jKskcplMia/5a
	uZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2KjVEFMpcobrpC1g88bYQbGIrcMqPqWOZpQuIZohnPA=;
	b=tqXckseTnHublQkZS2GOg1XH4bNXPoYG91t89I7rEuaji23Xlx4T8+/244+sFBH+Uh
	KBptg40zxxArO/UTpIL3dXVA1wXn032qz1iX5oO83i2Vqc+cYRIzt96UGkVJPzat41uk
	jsTnpMdmFWQ3DjDtSjs4GDCCAnnRFu76/Q4BcODJM71FMY2ioRFsSCo18VZOSkrIFSKm
	uGLQGMI9lQCxiEGgwJYvrGLva84Y4Iaph6r+t/n9VY5U0rCb3okiAjqXBmfIaXRKRapI
	1+Fl/x/TeslVs6PVH/yEZ2SnSlWAYwS9OZANKsO1xTnhwh+FQFfhZVt5cxOrA6EzmNG7
	QVAA==
X-Gm-Message-State: APjAAAUzNOX53M0Mhfyu4nPJ3Yh82/Ua1plMc1ye6HRvjbgI0iSFTOw1
	pg49zxdbbXBLU80tOCZQ/t5ASCWx
X-Google-Smtp-Source: APXvYqz1wSV46wel/Vz1K8vev+wvtaLpqj4AkNY5I8zH0ws3/zqtCN3Uk0AJkaUI9ya4eeVMXj9qmw==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr54707818wrv.52.1558522965886; 
	Wed, 22 May 2019 04:02:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l8sm27439501wrw.56.2019.05.22.04.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 04:02:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 13:02:39 +0200
Message-Id: <20190522110239.52521-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522110239.52521-1-alex.kanavin@gmail.com>
References: <20190522110239.52521-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] iproute2: upgrade 5.0.0 -> 5.1.0
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
X-List-Received-Date: Wed, 22 May 2019 11:02:45 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iproute2/{iproute2_5.0.0.bb => iproute2_5.1.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.0.0.bb => iproute2_5.1.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
index 8f33c7fe194..6854a130042 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "d22107b4d7cfb999eeb8ad8a0aec1124"
-SRC_URI[sha256sum] = "df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba"
+SRC_URI[md5sum] = "a2b8349abf4ae00e92155fda22de4d5e"
+SRC_URI[sha256sum] = "dc5a980873eabf6b00c0be976b6e5562b1400d47d1d07d2ac35d5e5acbcf7bcf"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


