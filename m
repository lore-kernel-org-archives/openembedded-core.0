Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C5A7D601E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 19:40:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m3so13806465wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jO9Z3Iq0L/H4J9CMpUfkvKNY5tc8dliVataQkloddRs=;
	b=OBKnANoP29fvFOeffqcXCfAef8T4vB/JR8M+t2JTNSHJF/GVN95rFs47IWjEOxN6x5
	eGKq6AduDtrNs500egTCgYbVL/NEvNarETKtWvvaPudjoRTtVWvErqWa1xWoHz5aEZOe
	H5TUge7iDXs6imCXlLjHyyS9XB1KMgIkASWmn4O+VSDuVh+zJPPT3c1hMegb1IR1AdnJ
	AvwtKUcTQjgv8N1JjT7KvJb8L75/8hBvfNpJaHL/fDykCKAJk1z2n21W6vkPhUhKlrdC
	2JogYmMLNQECoUA4+D/0MRa6Oa3s2j5HEREhsi0A9FersENTEdzYkX5MxVNOQBDMO6+O
	kEDw==
X-Gm-Message-State: ANhLgQ0b6Uk/CiqXU5owrvg9kUJl8rGHhO/VyWi0fT3GraarBHygGkcs
	3Yhl7MOvPoORFHT9V6NVgSIGWl82
X-Google-Smtp-Source: ADFU+vsWfNeTjPRG14BiEU3lEgu8qNOl/V4Z5+kFrJ76piLKCi3VhK83QK7UAW9NYJ5jJGVYUpXZ2Q==
X-Received: by 2002:a05:600c:34b:: with SMTP id
	u11mr17449440wmd.69.1584214839854; 
	Sat, 14 Mar 2020 12:40:39 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id q6sm21603680wmj.6.2020.03.14.12.40.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Mar 2020 12:40:38 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2020 19:40:38 +0000
Message-Id: <20200314194038.5051-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH] python-numpy: incompatible with armv4 and armv5
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
X-List-Received-Date: Sat, 14 Mar 2020 19:40:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just throws lots of compiler errors regarding the floating point macros,
similar to the ones mentioned in commit 3e40a1d230a9
("boost: fix mips soft float compilation") commit 7e712e1831f8 in
poky.

Just disable, to avoid frustration.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 8413434af9..66fd589e8c 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -50,3 +50,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+COMPATIBLE_HOST_armv4 = "null"
+COMPATIBLE_HOST_armv5 = "null"
-- 
2.23.0.rc1


