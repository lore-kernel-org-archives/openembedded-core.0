Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4941A7F7F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:11:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l7so24267091wrp.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qy7v/TGIQka0JEWDng9RfMMQS0o7ayE+HPFNopuFnoY=;
	b=HbYcjWLYoU/nUjS7dMsh1RiPndd2zbbB9K/3+vBmbDf8/akddZHHho3ju9AdSaz6yI
	IRJhDKPHjDPTvHFo09niymngjtU5siuz0A9boRSCVTIfdDz+KLim3BWI4XHiBPK5iYjY
	3dK3W8bbwxOANIqcGSD+SzwpQgnbxHAOBKHeRtQ8sO6t7+WB0y+69Jvc33NxX73vtw3v
	rDwlmPwwWnmH7HRzkb9tLgaQcsHLxrojO1X5sUfh91s1J7K1MpkjLEgc7Q3bNMZUXw4j
	eBiqbmtB1JjFeIrHBdsC+r/k3h24YeLSBCL64difQYfVH8+IkacsqpSe7axh+gfWykuj
	zUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qy7v/TGIQka0JEWDng9RfMMQS0o7ayE+HPFNopuFnoY=;
	b=j0U61OdvvFrMsaKx3FZWIemqPUcCp5XxjMp/CSLLiMIMeHVrDzKdw+vwqI54J4OM/b
	+yeJlw7/7jsiZWsDQg9u0gpTpmsMHwcHHzPQp3hkS0KEriUW378+cMCGzvPmfU+HnNko
	e2tXZ1rcd67jMQfijyJs1wLRn7DEeXGN69CE8jxmk0DOOTxcDaCxKH3/2NSTw77YjlEJ
	KBFV5G1waX8z6pGFzsSaVCy3NpwLYiIXBhXsqmtyTh1KCRAjEaVHqRSCbWnIvYcc4+j5
	9wJv+9TysPHB6zj4XHNc7rUqlEXAHITlupt1FNxdKP7hdm0sWZfP5bEA0+11TLuQxjAH
	m8nQ==
X-Gm-Message-State: APjAAAXZKS5SKcUpha2oYB6+yOedtBuwNhCoDklgoaINTWCQe5ibpkXJ
	ls8VdLa62uAIYuEt+gY0ocj7GdPA7mg=
X-Google-Smtp-Source: APXvYqwHCsNU3nD2m1/MWSK7ekM+DxIeBZBlzi/v+lxrRD3hun4/rDgAN14usUZUhF8iUYWEZ+Ibug==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr26077326wro.253.1574176302579;
	Tue, 19 Nov 2019 07:11:42 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m3sm29676660wrb.67.2019.11.19.07.11.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 07:11:41 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 15:11:14 +0000
Message-Id: <20191119151113.36769-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v3] python3: add python3-misc-native to RPROVIDES
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
X-List-Received-Date: Tue, 19 Nov 2019 15:11:42 -0000
Content-Transfer-Encoding: 8bit

The package python3-misc is not in the manifest file
so it needs to be added explicitely to RPROVIDES_class-native.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
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


