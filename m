Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E325D7F7AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 14:57:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t1so24202835wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7vHYntOiO6XC61sMK8Dlq4wM6baiaenXKeqegVTrsIo=;
	b=TqydfC9zFoox9yxmyadZ6oY16sMMrV40sh9YYjuUkjXnpdWdNadQ4QgDZhCYL8a2Kg
	PFFoENfUF+8RnjkxWiWo6a6Ou1K+8Gx0d0wGALzq7qz3GJPnoJLov0JCrL/WMrcc3Wl5
	Khf+sWxF2Yoq2TSrW3aH258SITYjgOKHGxVuEk8FaC9lNqy89es9xTVyH5afdt9pL6gG
	S0JiPdvIvLwzrbbgMIuy+Zs+k0/bERMb4DXWllOcsQWFNIBc7yhQkHkCMbCgrvM2+V82
	OWGQqaN/TA6rdr+HX7eVBCyQKL3OSsNC87jTk7532hKxMTSQAHbodFSPSm7NDKYAqRbT
	p2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7vHYntOiO6XC61sMK8Dlq4wM6baiaenXKeqegVTrsIo=;
	b=cwBUn63gJofgJ6tOwhlzm8l4nQGD89vhq9BT/tDJVY5elvPqmVUS60J7z0Xfs8ZLQm
	eRnkTFXrUlZrjklZOkJ0VICUZy4PQUFde+IF0BqjEarQG0BD2Lao+rquJoCgN3P0hO4Z
	Jc3UKUe5BZaPFXXY4uI8My8M/fvJ5W7g+dy+E9h7uTuijS6PA8y6l2g2GnAK/0/K8qXf
	Cq3sldIJf5T5fjP71GyKOkx+uYLCwiUxBUNv/amYQx3YVUu4d+BFYhImTJyYwZNAtIM2
	fxiMkGJ4VYfJYVx8LBvzpQfyvFTgIUS8iM1s2pbHXdFELxSVr7bdZswAzLsx/HO8sCh7
	vILw==
X-Gm-Message-State: APjAAAV4/RGJyH962GW1dq3lQ1rYgWx7WR8Ko7pqkOkJqoK4vzwsVzUY
	r5Qo2KZ//7tTbVqDcgYbIwe910oysK0=
X-Google-Smtp-Source: APXvYqzPbkdm6KTRTlIIoWxTMIzU7U6AJOIDtI4dPDXX+hmRzETzGuNFa0qxymyyOnz5UA+4hORbFQ==
X-Received: by 2002:adf:c449:: with SMTP id a9mr26652490wrg.240.1574175431192; 
	Tue, 19 Nov 2019 06:57:11 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n65sm3473508wmf.28.2019.11.19.06.57.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 06:57:10 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:56:52 +0000
Message-Id: <20191119145651.36394-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [PATCH v2] python3: add python3-misc-native to RPROVIDES
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
X-List-Received-Date: Tue, 19 Nov 2019 14:57:11 -0000
Content-Transfer-Encoding: 8bit

The package python3-misc is not in the manifest file
so it needs to be added explicitely to RPROVIDES_class-native.

Change-Id: Ia59f2fbbe4e4f96c57a948f104a0ffc81e72affc
Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 meta/recipes-devtools/python/python3_3.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index 90914f9053..57eaaea5e7 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -226,6 +226,9 @@ python(){
     pn = 'python3'
     rprovides = d.getVar('RPROVIDES').split()
 
+    # ${PN}-misc-native is not in the manifest
+    rprovides.append(pn + '-misc-native')
+
     for key in python_manifest:
         pypackage = pn + '-' + key + '-native'
         if pypackage not in rprovides:
-- 
2.20.1


