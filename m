Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8922278684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 18:06:48 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id s12so8037939otc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9V9ObFWikt/461c87Rfz5SeszmN6czq3QrHG6jWu73o=;
	b=FfEjjL4/KZ4z1ICo9CWYf6jobASxDHDH3k4CpEEhBxgXQKrt7MsrpvxLry9kAvbr7u
	yTQnsWTvmBZHerIKsKiwrxxL5rBuvG1IaX09IprIQVzlew+n84DFnfaNYZAa8AmLvEqL
	WvNtigQ3nNYGWSmEYICFv+KFZG3M12rjV6cJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9V9ObFWikt/461c87Rfz5SeszmN6czq3QrHG6jWu73o=;
	b=luLqsE8kUu2DAxpz2N+8LSZzezhKMgbD/1BIsq1FJW5tQPnMvZZ6F2OEDy+blJSvaO
	voJ9D6wPRYLej/UTzwXBNP4A/CIc6SbO7Qlra9/taYUhPGK9PYE5rdGfq7gegfO1j/Lw
	k5swDL6tsHbtUr0+fWg1PpYpK5MjJAGq9qvFT7/ZUD6HGM1l8t7LDAzUdBBBghdxtqyc
	laqEgOGmhKxonznMhEt/i/ZqY4+DC2A8UFLurArRAe0IQx25+GA4Y92l9TSQA6sqj4UW
	m2SMMDViBv7lJrq8wfncUZ6dqYwtLm8QPZU2rQ5C3mdx4r0zYPEtiSAoknbb2khRLz61
	TBSg==
X-Gm-Message-State: AJaThX4RfilsgiPNMv+XwnxSIalVjm9dHd9y5A4xACPTr3X25UQU/lfC
	hUy05nyQBGOYBQ2cjqO2KZvje8gjcXE=
X-Google-Smtp-Source: AGs4zMad306GJlOUl8SCSshYDju7KNSQu7Aah/adkoMT1ljrA9EhxgofdDoMdw8quDD7osh2Fmr7Dw==
X-Received: by 10.157.36.103 with SMTP id p94mr6359441ota.172.1510596408968;
	Mon, 13 Nov 2017 10:06:48 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink65-176.telefonia.InterCable.net. [201.172.65.176])
	by smtp.googlemail.com with ESMTPSA id
	q51sm1504974otb.71.2017.11.13.10.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 10:06:47 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 12:06:25 -0600
Message-Id: <1510596387-27934-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] cross-canadian: update GNU name for ILP32 triplet
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
X-List-Received-Date: Mon, 13 Nov 2017 18:06:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed and agreed in Linaro Connect Budapest 2017 [1],
the GNU name for ARM64 with 32-bit ABI has been changed, e.g.,
from:
  aarch64_ilp32-linux-gnu
to:
  aarch64-linux-gnu_ilp32

The current code has "ilp32" as an OS variant; this change
updates that variant to include the underscore in order to
match the agreed convention.

More information about ARM64 ILP32 can be found here:
* https://wiki.debian.org/Arm64ilp32Port
* https://wiki.linaro.org/Platform/arm64-ilp32

[1] https://lists.linaro.org/pipermail/cross-distro/2017-March/000864.html

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 1928455..cce09c9 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -38,7 +38,7 @@ python () {
     extralibcs = [""]
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
-    for variant in ["", "spe", "x32", "eabi", "n32", "ilp32"]:
+    for variant in ["", "spe", "x32", "eabi", "n32", "_ilp32"]:
         for libc in extralibcs:
             entry = "linux"
             if variant and libc:
-- 
2.7.4


