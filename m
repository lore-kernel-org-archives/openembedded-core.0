Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 19203771CF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 22:51:08 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id cf3so24609149pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 15:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wwz1GNQr7pil3nIPyuHbGU6HGUW4suG3hYKw43eh5JE=;
	b=Y5VfqutcmXO/djZl6K2y3NGPuJ7WHfOfjf/v6M5Bq4SB74g80YfoxL+zT8vRAsedZg
	a+pod1Tz7vcEhvOgSRQaKgZDLuk/F98DOO4xuXUrXMtFNgwSCyKzKEX4sYchj8Q8Ega4
	BnDaOjmhUuLQm7+n1ZEf5F5CdDsKMuC+4ZziDmdn/shEelsj/e3N8retasySyBxco9lt
	px0yRHmy4jiC4J+8MifQNGacDvAD8TXj0vXa7SOD+sJpULMqICVXGpEyvwta7FbuBZ1W
	idWWaweiZFSOz5qHwtISpq7X1AtARxodGEd/JlDw0EKZPiO8XhD953jnEq+bOBTWLyO2
	m5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Wwz1GNQr7pil3nIPyuHbGU6HGUW4suG3hYKw43eh5JE=;
	b=PNbfmqixDwNlqc9qlCpYg3prnCDaoM7pI/nRXPqn1Wu5AS8uYvuCZ9VqLeElQjyEKB
	OcFSpB7RzMsD+ev17+9mZW0kerV3OKNsonVW+CzgnLsf83f4wsgHt7bjC1TgRDyMKd+x
	OXHgmHkoNAFlvhTrnk7euvItMSSs1mQPK5eUhJge/YwcKt7FmvWaEDvMZ1i+Nlnzla7h
	LDiRwxFo4cA3SlGUx1lfFk5Dq+e65//SYHgyE2H6cB6Tjd2+LZ82t5roGaCLddhKxyO9
	Hbtycum0nXcZhok4FijJk1imoTs5yDpc9uM1h/XI2HRSMbh2NM0rCdZ/1B96HzU4R+w3
	nU5A==
X-Gm-Message-State: AEkoousnZ5aPkekYgUE5Z5qeiuoi2xLAAKdeSKZv0CaQHycx9BgxYvNgwpv4QUmCF2uTEg==
X-Received: by 10.67.3.197 with SMTP id by5mr23488802pad.119.1470696669539;
	Mon, 08 Aug 2016 15:51:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id i7sm50695359paf.9.2016.08.08.15.51.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 15:51:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 15:51:00 -0700
Message-Id: <20160808225101.32385-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH 1/2] webkitgtk: Disable gold for mips/mips64
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
X-List-Received-Date: Mon, 08 Aug 2016 22:51:14 -0000

with binutils 2.27, mips has got the gold support
but it doesnt work for webkitgtk _yet_ therefore
disable it for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index f2ba8b6..d9f1c30 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -75,6 +75,8 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_mips = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_mips64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-- 
2.9.2


