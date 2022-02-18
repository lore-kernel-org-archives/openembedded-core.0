Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E71C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 05:43:52 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web09.7628.1645163031278318126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 21:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=K5G9dRlg;
 spf=pass (domain: aj.id.au, ip: 64.147.123.21, mailfrom: andrew@aj.id.au)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 8A9B03201805
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 00:43:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 18 Feb 2022 00:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; bh=wfQAqfgkbxPlogu/R9FuruLo6XUGQMVtR6p+HXjYF78=; b=K5G9d
	Rlg3iApe93NoY0/A0HYbk+IppPJX9YGbgrkcq8sjW7oimCjG/R70ajDkZWRNwm/k
	HW+UGDfKKiCATen6qVHdxsOUGzoeMT8CtJUEAEvpdgN4XjBU85F6RII+exdsu4pn
	v073Kb75cCjM0LMyZ9RDaKIOz4AFlunoSh3pHsXALmVevKSUEBlQ5moOszLXsMZK
	UchkylQEsvIMfAzVwy61UKoNXFynG42pm/l/igO3hjCTslsyJm7r5bGYFqctTDfr
	vTJjB51Zm/u6kKrLNG1HsRnjeum74r21qMyLdwBqTUg0uqIYGGrsBhWeVx0NE0t7
	fXpoTOiE2hXK2yQPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=wfQAqfgkbxPlogu/R9FuruLo6XUGQ
	MVtR6p+HXjYF78=; b=b1h0K0FoNhJKZY3KYSCGiAni4GLyof0pPfbBY+W72od7V
	IfHv1YHh8kzqX9WFPxFUPHFh+dBrUixCqV6JUWdfc4H49GwoYJ9FrB9gwut4si1Z
	LKHhBgNauq4Ok31YzZf2GlQRctvOMoiKQGG4VkL0aZmxyS1fBEmPvOpYFBSP0fhJ
	UyBujAZLZyYclKW5Hv0Mr+OxG0xMO3g6yGcpXO6kQD9XP49JPjhG69oA+pVKcB3B
	6oTxhvaZUx5i6uvPn6g/IcxqKCLEI1tTyjQdjVHAl+wK3U4pOYjDJEgZLKSsFQSL
	jkT7ehWn1KMDcroBSul0Rk7GQYAgN/B5ROsvf67CQ==
X-ME-Sender: <xms:FTIPYnHGJ5mguoZ-szs_qHu-D4ptQdGZuVaMg1JPba5T6n_mAvzZkw>
    <xme:FTIPYkUgWyjbidbfKfNGs1Puc7eJ5FU9fLDu_0A_OEeaH7z64ymWVZGRI4uJQ6g4D
    U9hVDrJy41j0X4w3Q>
X-ME-Received: 
 <xmr:FTIPYpITx5pvKFW_yeVqdHlGIhN83zwcFDlH8Iq3Qc7oUOrfzuqUWQgd0Et4TAbjsMnZ4lRT90eceg6DgW-dFRQu6ahjerHZwkhkUQUb3leIJJ8U1lmTjCywcZ7V71KD>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrjeelgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeehfeelveekjeeuvefghffgjeffleetffevie
    efveduteekleegkeefjefhtddtgfenucffohhmrghinheprhhushhtqdhlrghnghdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
    gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:FTIPYlHt061CWXJznGnt8bU8RVS3tleuZSdixixS-fTtpH0-hANpCw>
    <xmx:FTIPYtWVYqvNLiVNgTjMXG4Fe36gGmpDCiPoPxq_0RfxGaROGlCMIg>
    <xmx:FTIPYgPG2eKvjG4SjF0Yjkai9yTNk5oU0AO4waTSTGriWtjR_uFnNA>
    <xmx:FjIPYsA2h8F2uqUYe8M8jezdaoRDx5qEK_SzTM6PEkFSKqNobDmG1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 18 Feb 2022 00:43:48 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust: Introduce RS_BUILD_ARCH to handle ppc64le
Date: Fri, 18 Feb 2022 16:13:15 +1030
Message-Id: <20220218054315.169005-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 05:43:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161878

On modern Power systems `uname -m` reports 'ppc64le'. However, Rust's
toolchain names the architecture 'powerpc64le'.

Introduce RS_BUILD_ARCH to provide an indirection to fix this mismatch.

I've tested each of the generated URIs for Power using the output from
`bitbake -e rust-native` and could successfully fetch the artifacts.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/recipes-devtools/rust/rust-snapshot.inc | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 74b558262f62..9b309b6f330c 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -14,12 +14,20 @@ SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3618da916a0f92f241cf1d67d04bb578
 SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6df36990953c1670c6a5676bc12d4cb"
 SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
 
+python () {
+    build_arch = d.getVar('BUILD_ARCH')
+    if build_arch == "ppc64le":
+        d.setVar("RS_BUILD_ARCH", "powerpc64le")
+    else:
+        d.setVar("RS_BUILD_ARCH", build_arch)
+}
+
 SRC_URI += " \
-    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RS_BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RS_BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RS_BUILD_ARCH};subdir=rust-snapshot-components \
 "
 
-RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${RS_BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${RS_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${RS_BUILD_ARCH}-unknown-linux-gnu"
-- 
2.32.0


