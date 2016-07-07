Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id DAC0960119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:35:18 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ts6so372443pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=JB1X4JdrUgIa8eVOAvG0F5YrCefXcL51eiaWCcu05I8=;
	b=WdrB6i3nXlMGjsSMB6uTZWo6uANuLvGf8xUlC+mhiM5xWiNIfZwLFYP32Okqkpju6a
	9SvjjM5uJsxLPgjSHY639Df7ZbBcKhrGpkGfFJXKxL33xEeVsjt+ezw6jHWjqLtgPJv7
	FHONAkUplBU84IsDJwzUXO7wpnqJWp3rsW751W6m7RzhJ0x05XWh0wzf7Dg018YjWZ2V
	8npWRr8r0YdV8hu3kSpLUuMdfod31ydIT6tmDEVld50LW/MLPz3klbvcAhXkfTDadMN7
	TnPXRUXokz54LzY5Hhi1E8iOBfQ2awh0ZguuaZAtef9Ncd+x7e8NSw0RIg5Z0bhTeVna
	xjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JB1X4JdrUgIa8eVOAvG0F5YrCefXcL51eiaWCcu05I8=;
	b=PfhKa5U7im6CNxsKTVs6LK39qHPup3Gn9g1EEP7v33/m3A1uxzzw52XKf3Ixo4Rmlc
	vWugm0Gy0ZBMZjoHFT4N0KuSJOWbRoU6PsbkqdAoBn0fBh0nC+gR7O5OvWerqagdEoAX
	DQwUEFXyCWRp4aCNDN6LIo+MANxnTJQpZN8je+FJGFxMnHkGTL/FMHnHXExkmLXaK5nB
	D0zgZ+GPaWvau9fAk1OpXyYB8y8Nemmq7zfegEfrnCrr7Twke5iN4O0HiMSdQN05XrS4
	8vGUE4FX0JT/mfvoytKMoDh4HzGI/3m04wrACeee1t3JLfn8BIVkqWT8Put01ugHOOQq
	Xlow==
X-Gm-Message-State: ALyK8tLc2tN6UpRUd6SsB7eVwTPdJ53gn3W91eQm7/vQU7/fEgEd0PfrAxb9yqdMpzH1hg==
X-Received: by 10.66.26.105 with SMTP id k9mr47710338pag.103.1467855319252;
	Wed, 06 Jul 2016 18:35:19 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id ct7sm447197pac.13.2016.07.06.18.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 18:35:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Wed,  6 Jul 2016 18:35:13 -0700
Message-Id: <1467855314-5646-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] tzcode-native: update to 2016f
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
X-List-Received-Date: Thu, 07 Jul 2016 01:35:20 -0000

changes done in data

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2016e.bb => tzcode-native_2016f.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016e.bb => tzcode-native_2016f.bb} (69%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016e.bb b/meta/recipes-extended/tzcode/tzcode-native_2016f.bb
similarity index 69%
rename from meta/recipes-extended/tzcode/tzcode-native_2016e.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016f.bb
index 78af639..bdf47d2 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016e.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016f.bb
@@ -9,11 +9,11 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "6e6d3f0046a9383aafba8c2e0708a3a3"
-SRC_URI[tzcode.sha256sum] = "57d8c4fcd5e8a90657d0e298eac5effb1a642119c92308db68d13a4612fa459e"
+SRC_URI[tzcode.md5sum] = "b93618bb84e38dee102e0e41ec9d13e2"
+SRC_URI[tzcode.sha256sum] = "72325f384490a310eeb2ea0fab7e6f011a5be19adab2ff9d83bf9d1993b066ed"
 
-SRC_URI[tzdata.md5sum] = "43f9f929a8baf0dd2f17efaea02c2d2a"
-SRC_URI[tzdata.sha256sum] = "ba00f899f18dc4048d7fa21f5e1fdef434496084eedc06f6caa15e5ecdb6bd81"
+SRC_URI[tzdata.md5sum] = "b20b3c1618db1984aac685e763de001d"
+SRC_URI[tzdata.sha256sum] = "ed8c951008d12f1db55a11e96fc055718c6571233327d9de16a7f8475e2502b0"
 
 S = "${WORKDIR}"
 
-- 
1.9.1


