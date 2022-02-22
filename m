Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDA4C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:56 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.8755.1645501975180031473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=I8rE1VMX;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7E1825C0183
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 21 Feb 2022 22:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=iUnDvb1HjtKi5hq3R3j3ylK3mNhf4m
	Sxb58qkdLWlVw=; b=I8rE1VMX2OKoDGnQNF7pHSXztmWJML2V3vFV11hUoe8ftF
	VmMjeA4XpmC1U+v5+TR9pOha1g/YIBMF5QouNDBJ+2+44TVK6kgK0QDQu6uRxbPr
	WWZ6F+c5lfI+Nrxi//K4COsya9x1ZCcc1EA1/lx3y4JfoNw/fWoBJiqE7o+gBq1l
	wEkFj95qcs26VeDRQxrAphf6AKHjMzCP8VURBdeWH/k0VWCDM+PhNXRvC41n8+8Q
	SZig8bwjGikcPUpM6hrQGoVXlQUd+3s7QeLiIax7A/GM6OGB9ZMrWtt0OscoCZzN
	fg+KcjGCamEX8XLt6IUxi1l2iCxvhJHHOBEdf2Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iUnDvb
	1HjtKi5hq3R3j3ylK3mNhf4mSxb58qkdLWlVw=; b=Q/smWJM36q2LHQOWd8pr77
	nt+rsETAhuGFxxc6npBYKMFLba/6dVvNnQAgKK1+fMwuQvZd697IznEfjcTFcO+g
	W08dQIps4Vb4TCUNdLV3NJkSDERaJ9DjotMPDgZ/wtmfWuDm8pJ8ktR6ZC/GOlQP
	G2xQUztNbS6EHR+OscVBbQh+Q6QXA8tfDaVRsXGHg0Wtm1aqqIwgdq2XeApd4ViU
	MA/bPzOwZD+29AfvOhsbJHcjkjqdSb+/tj+dVaipo8jo7O23/mdcsqoAvfIqA3Kj
	pvp5m9AVbF3lLymzLAjgyj6jniF7YyPMNWQwDvSsStl7mBevJi5qBsKoFiurXwMw
	==
X-ME-Sender: <xms:Fl4UYjSt9bFNVeMCscDIZTz7p8m0nga_tbBdK34260oL3w__wmxivA>
    <xme:Fl4UYkyTHYv1ddgvP_CrndmpFMSfv8IlwMdu0LHEVUDcOkNDyT8yWvfxTLqxgfqFj
    N5Wg5f51BZ6HlosMQ>
X-ME-Received: 
 <xmr:Fl4UYo1XXncIbXYOnIjrJozxhSZfNI0CbgjzFcM6ppAMf9nrfJPJPLe0dZlcRiHFKbajddlB82gAdUuL7AJRFQGiQAIbBsAFLCYcd66oSpOwtWGU54FffCA8BB2GJdcRnP7b5KlL>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Fl4UYjBhs9YWD4NifMQyXZa2LG4ZkNd9R92UWta1LWh8zCsaJAcG9A>
    <xmx:Fl4UYshFNQg4D1rqW0fWP-MyMytrPOg1Ima-JyIfQx6OzMKZhb93vQ>
    <xmx:Fl4UYnoCp6APhdUW1KiseQJ1sCucbrxuQx33yVrEqylh5vDbEhsLxw>
    <xmx:Fl4UYqdjDDtKToS5_lMPvVHcsqqBIFMRCkXkx_41StjIZ_XOvBwyTw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:53 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 6/8] rust: Mitigate duplicate sections on matching
 architectures
Date: Tue, 22 Feb 2022 14:22:32 +1030
Message-Id: <20220222035234.463162-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162120

This seemed to be an issue for Power once the arch mappings were fixed
(by a patch later in this series).

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/recipes-devtools/rust/rust.inc | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index cc0730e9cd2d..fd934082bddf 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -35,8 +35,11 @@ setup_cargo_environment () {
     # Later stages are build for the native target (i.e. target.x86_64-linux)
     cargo_common_do_configure
 
-    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
-    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
+    if [ ${SNAPSHOT_BUILD_SYS} != ${RUST_BUILD_SYS} ]
+    then
+        printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
+        printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
+    fi
 }
 
 include rust-common.inc
@@ -88,15 +91,16 @@ python do_configure() {
     config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
     config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
 
-    # If we don't do this rust-native will compile it's own llvm for BUILD.
-    # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
-    config.add_section(target_section)
+    if (d.getVar('SNAPSHOT_BUILD_SYS') != d.getVar('RUST_TARGET_SYS')):
+        # If we don't do this rust-native will compile it's own llvm for BUILD.
+        # [target.${BUILD_ARCH}-unknown-linux-gnu]
+        target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+        config.add_section(target_section)
 
-    config.set(target_section, "llvm-config", e(llvm_config))
+        config.set(target_section, "llvm-config", e(llvm_config))
 
-    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
-    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+        config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+        config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
 
     # [rust]
     config.add_section("rust")
-- 
2.32.0


