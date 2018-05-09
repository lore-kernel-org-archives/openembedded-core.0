Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 784D774FEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x9so7021989pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ETYr9wqIkOUuDzejsJi57LWNOFES9Pddiv2vt5p62MY=;
	b=g7YxexsHhes9swXHSNrgJGgeF7MLM3D1M1AsXt1k3qCH86nzV9Nqc7wwXykV+gspCz
	dWe5QQropd234uKxafeledOWarF8NuxPnNukZQuI5K5Q2/gt+Ktou2YI27b1IvuuT85o
	qCLK859XrsmA88++vOAQFApTVaJvllYgRjgua+ZYaPWFZd/0a6GUeAKLw7e7d5WU2V93
	wKF5cLvKxZv0KMJ0sEDtPz1S0hQfCBBHaGSltJPEMFsgxrBmKjFNKbJe5L0+FtMJLLPQ
	/X0c6zyAo/VjfdFhcH7MsukcQ3hHUNEdZC6F2krAPz1+c8RtBsntYjVOL9HiFvl1s2Pl
	jvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ETYr9wqIkOUuDzejsJi57LWNOFES9Pddiv2vt5p62MY=;
	b=Aj0KMlUqjH71QMTiuObuHo3HZx3P+ifmxkkN/jwKnr9wCNRBbuNajRJAjAQ5qjJNmp
	crlO434aP1XXPxxmLR6uPjD1TcvvzSbMP4FwER8BpP6L2pis6iQa44CvWcJARbDqOqp6
	1whRK0Y3eflMAS+9vcYu1tPtyQqNNiaEVJxevITQ0M2tldf/iYG7a+5AB1uLHTPqmnFi
	AK9vDoC0mGb1sc9XcddOCWH4aONyy/oLzzg8iykkfJ1BVEyljiMSQJICGxRlFzwhBHl1
	v84CCwMEjcI2ZH92NoKr6KR499rC2cZuzg85Gxy4h8w4WjDsbkGdkYb0vXUKKNUTl6SN
	RRoA==
X-Gm-Message-State: ALKqPwcz3d5dD7Q68ic7g5mxQMYdogH7ns8BY2A8KbvGv1QbF2iEimsi
	R4l0d69C3Avu3p1pJDol4V80nw==
X-Google-Smtp-Source: AB8JxZrLrsCOfZeXtHPGg5be7kCOawdIubTeEejY2U4V2txh9RWSEClZPtQKoq76DGc2o4mT/f5CjA==
X-Received: by 2002:a63:74c:: with SMTP id 73-v6mr144009pgh.216.1525897468159; 
	Wed, 09 May 2018 13:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:16 -0700
Message-Id: <20180509202422.22501-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH 3/9] alsa-lib: Upgrade to 1.1.6
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
X-List-Received-Date: Wed, 09 May 2018 20:24:27 -0000

License-Update: FSF address updated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa/{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb}        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb} (75%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
similarity index 75%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
index fb6b4fb501..6364e9eafa 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
@@ -3,12 +3,13 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
+                    file://src/socket.c;md5=dd1bc7f44872690224d89c1a9806e495;beginline=1;endline=26 \
+                    "
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a2b465c3a5265d8a57f3ff39c6c4fc29"
-SRC_URI[sha256sum] = "f4f68ad3c6da36b0b5241ac3c798a7a71e0e97d51f972e9f723b3f20a9650ae6"
+SRC_URI[md5sum] = "2f981a8f7897c59ec2ddc44916d33788"
+SRC_URI[sha256sum] = "5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724"
 
 inherit autotools pkgconfig
 
-- 
2.17.0


