Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1708D7F7B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 14:54:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a15so24186655wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 06:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5mi/BWD7E3MS3mqXkftWVl81V2sZr8CYQmrUbptsHb0=;
	b=jKpJ3FP4LoSbloJga9gM1pXk6mxEw0+NKA24v1lNk6/x/+vP2WPfoUlPM9WBcwXqap
	dRTKUKf+ErIGG1yMcW+oyz86N2LV1xvA54RTfkuahgGG1vjfn42UoXNgeUHrC1MJA/J/
	cERyM2zS1cNkj0ZMxNWJAubFphvOX0qz9zxyBfHMJ6tSXeFXe8ge7sPap97BET97yT38
	fUrUXpymgq1+B6UDAM5oRjxEoVxKgM7amKuRzE4y6eySyNFd16XM6daq9WiNp/s7kBIk
	QM4pMeh/0fKTE6WFZWxrx+Y/LNh+hXiCP5dCsAlQy79GB94BAAnmR1xeHvJ4XbWPFj2p
	yxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5mi/BWD7E3MS3mqXkftWVl81V2sZr8CYQmrUbptsHb0=;
	b=ciaSxv4xVU6IjFk5q912/93D0PsEutyUGKF4Abf7f57mZjn2/PVl0PUh3TkyFocs+t
	+BPTnIa8+/mujwdFViHpYH4Au2phWB5OQEJnD/8h8xGIRz7XkPyTul9RhlRhtvwwk7F9
	2N67DNgD47cJMC5gb+RxsXnUTAI1UkQc0z7ItOCdfF8nh+NLezqul/7Z/adPGUPrQo6+
	2isLctZfx+H46SpBeeFiFSu7Wh3CsLNdOUvs0RBNmSVB9FvC3o2ZQwvSc43eBDxFUFCP
	bpk9ILrE3SSNWZlD+PSu3aAqwa+TXm3M8uURww2avHkKjIVt0IPSqIoCoXjoFR824/n8
	IPaQ==
X-Gm-Message-State: APjAAAVqqVqNxBQmZc31CRAchJqKvUlzQzR3Afxt5uiUQbR0Kj0hYwRl
	Oe0qpT45fKO23dGaqUxmbhenl7B5f90=
X-Google-Smtp-Source: APXvYqz5JzQfyPwU+llKD6LNIzriFH0/FeljpbR4nDYCxy3BLS/XnOrI6x4Fekn0kAOtsoSCM63CGA==
X-Received: by 2002:adf:ab41:: with SMTP id r1mr40127318wrc.281.1574175268262; 
	Tue, 19 Nov 2019 06:54:28 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	189sm3570687wme.28.2019.11.19.06.54.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 06:54:27 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:53:50 +0000
Message-Id: <20191119145349.35919-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [PATCH] python3: add python3-misc-native to RPROVIDES
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
X-List-Received-Date: Tue, 19 Nov 2019 14:54:28 -0000
Content-Transfer-Encoding: 8bit

From: Nicola Lunghi <nicola.lunghi@jci.com>

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


