Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web09.6508.1627035787412927425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 03:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=aljGaiK4;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id C38E632000D7;
	Fri, 23 Jul 2021 06:23:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 23 Jul 2021 06:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=KaQ4DMQTTccth
	JRMyzoGAgp5Wzc8Jj4i9aBLBbmSOIk=; b=aljGaiK4c1sanMoGmvLwIdMMEInmV
	Ezs/z2b9wM35SgWO8aMSX6T73IK+wleltB4bnxxtiWObMpHuSni22CIutSSEsTn+
	eaLTu3C/ZH2lJsxLHjCDG4AIrpiIdM3QfDmh/2rIPCP02P8txJzVIc9Zl4iBT2YY
	H88PltQ3EPsGZDNdwWUboOhq4XcCTNwJ7DT6wv+q9XJP4Rz+QZqyzdteKFJ/H4x7
	gcfvNW4ePo6fl0fJg9KqasM4SIQt8Q7GOx7FEpI+46AR3z7tg5byz8slYlBAzm/J
	nR6zTrrrzH7Rhs6Dk+buCz9WwrmjHaeMCsXNV4dDxY+PAI9vJqQAkW28w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=KaQ4DMQTTccthJRMyzoGAgp5Wzc8Jj4i9aBLBbmSOIk=; b=aAlX2rIh
	UR9zX5YUf5hm1A9Oia6JP5ZOpLEwmREHknEcheta5kinH4ltcdMHiyNlR5yKEvrv
	D2anMJ8Fx3m5HR9pkbaaMz2XpLeunyn26Kl+KNZ3g2oNH0vcz/wjv3QkmzUiZqpx
	OWrgff0a2aDNJrNsF4/sCwd5XEg3JN5rFjhIX7MOouhYCiQKqWKurNQFlY/OOxhN
	EwGGuPgasMoOZx/cxGeNVksJDgbWw8qdjy5sCJ+ndJJ6uQm1nEt0p3PuWz9r6wZu
	zPABMSHgVxVPWF/IWaUmmAPtpJahqNwPM+4o4ku+vozPTSPB4+27bwdoa9vS0Mjk
	Ls1fY8mFW3fPyA==
X-ME-Sender: <xms:ipj6YGqVh7DAr57U-SjKQeYzbLAk4LUsI9-lZg3xmtAJimtf5KZQjA>
    <xme:ipj6YEr2pes7vW5tqEzQ-8mzseANvi6OlDEoC4B11fZYgQNEPmgSX6EK-VZmP5y8L
    t694tMOasAOIuDnyX8>
X-ME-Received: <xmr:ipj6YLOxiKD2CvTRZhcgIh4DjTUP_vkZoRuhsv7eDTm9fHHu8e3Q1JPMCM4j-eT9XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeekgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnh
    gurhgvihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepuedutdfghedu
    teegleejueehfeetgefhuddvheeutefgteejueefheeigeeikedunecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhdpvghntghouggvrdgttgenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:ipj6YF7nwXl4usybjz7aG4Rmwaj27KXfCRYxN8DDnmSwsHDxQGZYoA>
    <xmx:ipj6YF67WRgFh_g5Ok3juN1yR_93FqY1B0UHrcaY2zSPGp6RocwKPQ>
    <xmx:ipj6YFjXGbxgnjOJq6dRC2lQiX9yNAnMmqUK4S4MNVc1OQipkU3OHg>
    <xmx:ipj6YFGWURIkRAyrk8jFiGfbQnDtdhRJ08PnNSijrphC--b_bo6UeQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 06:23:03 -0400 (EDT)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/1] ovmf: Fix VLA warnings with GCC 11
Date: Fri, 23 Jul 2021 11:22:23 +0100
Message-Id: <20210723102223.3349354-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723102223.3349354-1-andrei@gherzan.com>
References: <20210723102223.3349354-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 5406ce83e07c3f89b9f2bb26f083861467b7bc59)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ovmf/0001-Fix-VLA-parameter-warning.patch | 51 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
new file mode 100644
index 0000000000..d658123b81
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
@@ -0,0 +1,51 @@
+From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adr.her.arc.95@gmail.com>
+Date: Mon, 22 Mar 2021 21:06:47 +0000
+Subject: [PATCH] Fix VLA parameter warning
+
+Make VLA buffer types consistent in declarations and definitions.
+Resolves build crash when using -Werror due to "vla-parameter" warning.
+
+Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
+Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
+---
+ c/dec/decode.c | 6 ++++--
+ c/enc/encode.c | 5 +++--
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
+index 114c505..bb6f1ab 100644
+--- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
++++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
+@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErrorCode SafeProcessCommands(
+ }
+ 
+ BrotliDecoderResult BrotliDecoderDecompress(
+-    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_size,
+-    uint8_t* decoded_buffer) {
++    size_t encoded_size,
++    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
++    size_t* decoded_size,
++    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
+   BrotliDecoderState s;
+   BrotliDecoderResult result;
+   size_t total_out = 0;
+diff --git a/c/enc/encode.c b/c/enc/encode.c
+index 68548ef..ab0a490 100644
+--- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
++++ c/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
+@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
+ 
+ BROTLI_BOOL BrotliEncoderCompress(
+     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size,
+-    const uint8_t* input_buffer, size_t* encoded_size,
+-    uint8_t* encoded_buffer) {
++    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
++    size_t* encoded_size,
++    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
+   BrotliEncoderState* s;
+   size_t out_size = *encoded_size;
+   const uint8_t* input_start = input_buffer;
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 088e348bdc..a73bb916b0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -17,7 +17,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-ovmf-enable-long-path-file.patch \
            file://0004-ovmf-Update-to-latest.patch \
-        "
+           file://0001-Fix-VLA-parameter-warning.patch \
+           "
 
 PV = "edk2-stable202008"
 SRCREV = "06dc822d045c2bb42e497487935485302486e151"
-- 
2.31.1

