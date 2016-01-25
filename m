Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE10077101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:45 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id o11so115460110qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8QxsbYSiOm9d4T7jgG0wdG0G5ayS+aaopxRA3sJCa8s=;
	b=vrVN7IB6pfnKCJmnbu22rO5MnLxTQVMbKmSA34AUOqIU58AruMQhRIWEaZbuP40r6+
	jbNGMS40ytHHKLD79dtlekTqoUs3t+wPr7scgIGcfHvFP4rN/75ZCaCWTQoF8oFpIM+W
	Y+T6mk1B+OOFj+7WCJ6YZ4jsSSkJvZTyE5eSFss7aFizlxjCk15OHgbGG6jY/wUHrmcb
	TEbDDoulaDvDGy6BflyX7C/CiELoqxNAVM7kCQ/oW2y6RqdA6RS2cDFhAY2zV2g4gsXu
	wO4AHz2I4s+Zc0MtQzPD6mjcYSc3+NJP7rc8xXE+0CgWeOx5qLyQ08ZivC4Eh6lVvgis
	EGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8QxsbYSiOm9d4T7jgG0wdG0G5ayS+aaopxRA3sJCa8s=;
	b=WyNSS5u1g1P7jwlB3+dT/bOecg6KjewCdRY2PXNBHLljVkL2OotfTOJPkSEm5tCYZx
	kaDHTe0iLjqROVvb4xjzIQEDS50uK1kHQhGGHP1AzrYZAdlp/1VdnflpXhL3+uHdlJkI
	shzmdkmPq7gl5mCBZByCqIswBFXLA3kVo1G/XraNQvEYFYiSmkyNjpHlyLejoK0r7czl
	cgzrvO/UegZVoe028uVwE8KaXTbqaf989LIwBqbQ/em0gawjMwN5Aqrx6Ne/8qi34uBD
	H6R3CFNQsibTDN6hU79oLxDZu8xxvbTFzlJnNNnNS+jwTRPaoCU+98TpKjF6013CyIt1
	aK6w==
X-Gm-Message-State: AG10YORihz3RnvbO0O3+/OaYiUkcZqeMIXkbSMenhAgLVqHE9xKATg54h7ZSMJHyVirFbQ==
X-Received: by 10.140.100.141 with SMTP id s13mr22200395qge.25.1453746766625; 
	Mon, 25 Jan 2016 10:32:46 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:24 +0000
Message-Id: <c668391781fe6fec58f87b830967eee778ec0f51.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 08/11] bsd-headers: Fix LICENCE and dev package RDEPENDS
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:46 -0000

Clear out runtime deps for dev package, since PN is empty packager will
try to resolve to PN when building images with musl and error out since
PN is deleted as its empty

musl-dev explicitly depends upon it so it will get pulled into build
in right order

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/bsd-headers/bsd-headers.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/bsd-headers/bsd-headers.bb
index 12a2cca..8f43d43 100644
--- a/meta/recipes-core/bsd-headers/bsd-headers.bb
+++ b/meta/recipes-core/bsd-headers/bsd-headers.bb
@@ -2,7 +2,8 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 DESCRIPTION = "bsd compatible headers"
-LICENSE = "BSD-3-Clause && BSD-2-Clause"
+LICENSE = "BSD-3-Clause & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://sys-queue.h;beginline=1;endline=32;md5=c6352b0f03bb448600456547d334b56f"
 SECTION = "devel"
 
 SRC_URI = "file://sys-queue.h \
@@ -24,4 +25,7 @@ do_install() {
 #
 # We will skip parsing for non-musl systems
 #
+
 COMPATIBLE_HOST = ".*-musl.*"
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.7.0


