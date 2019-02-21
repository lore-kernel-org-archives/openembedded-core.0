Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id ED9B87CB0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l5so28775720wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4xXBubmoFZDWSfMn6uVmRG9gOAtrloYJQkCGwTc4LpA=;
	b=aPgakBm3c4u30KPRzq8RfDuxSpDQVlDWnpp8XdltG9CWl8mSaBAn4H2fUeE1JQdLtE
	x9eUf5oUmi/UsdG43vaXGQYO3tfJIsaf5MaHzhh9btexDffrlpmCIb35wWO8FzQC2u4K
	QSe/aALVz/GbcI2LotzuqWjEFRG1HA0EU+CoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4xXBubmoFZDWSfMn6uVmRG9gOAtrloYJQkCGwTc4LpA=;
	b=CkngXz51DCrJBpAPI80pZ2OTwTv3vaSRZbBleA71kgDRx1HZezuQoXUP1WC2Rb5UGK
	UqYbZisPnGbhzUG8W9X6bMzGdyPrmdk8BwL8T9D+dcLOD7c7rkSh+5piVEnBSllP5lvv
	ZwyefHi8oozUvWq3bWzw11hQ3kQa+shZ4qTV7/Amn0AE1pO/UmZX33H+iT6IryObuANp
	qIZuGBCrC4bQi7aKjKKKwVWGNjxdqGoXQsGsH7urTwg55ZMiifWw4e47i/SMKs9zK5PN
	8mzVetcR0G1ivPfj8KcoS1g8HrcveyIHFGhlLzgYWZ4NNLGHRDVPI6UUEEJqSpvKJUmK
	RE9A==
X-Gm-Message-State: AHQUAuYw4IAOt3RynPEmbbMjO+MTJASzYWwrgVlEg7L+8pfltIZ+yDXp
	vQvVe58S4vTCB65ZlkRI6o1MRD/qQz4=
X-Google-Smtp-Source: AHgI3IZ79xx2LbgeRpp1zeH9XvWvSuYjeXra3OmUO5mMAjKdnN7u+qyPDdr4udGiruB+welbY4Md+Q==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr27469655wrl.69.1550752892216; 
	Thu, 21 Feb 2019 04:41:32 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:17 +0000
Message-Id: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 01/14] blktool: upgrade 4-7 -> 4-7.1
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../blktool/{blktool_4-7.bb => blktool_4-7.1.bb}                | 2 ++
 1 file changed, 2 insertions(+)
 rename meta/recipes-extended/blktool/{blktool_4-7.bb => blktool_4-7.1.bb} (90%)

diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.1.bb
similarity index 90%
rename from meta/recipes-extended/blktool/blktool_4-7.bb
rename to meta/recipes-extended/blktool/blktool_4-7.1.bb
index 0e6f7ee6df1..468925e329b 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "glib-2.0"
 
+SRC_URI[sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
+SRC_URI[md5sum] = "62edc09c9908107e69391c87f4f3fd40"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/${BPN}/${BPN}_4.orig.tar.gz;name=tarball \
            file://0001-fix-typos-in-manpage.patch \
            file://0002-fix-string-error.patch \
-- 
2.20.1


