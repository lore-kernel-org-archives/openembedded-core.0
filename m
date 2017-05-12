Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD45A77CEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 18:10:44 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u75so8801929qka.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ox8MMTDfO7YtEFFKZxoqH14adQx46UWWS0hl6ojWupk=;
	b=NuuHf/Gu55+qrZNWl1adnUVRet/IRuOgsvw9Ck5sBiIBJ4Pfiaxg5u+Q2kBVWkOcYz
	okB9MvgBPKEx6GSo9EzP4YeyykyrXuJ6jMezbCApCOq/wjnIYhPMvSCWf6QYV/I4e6Rn
	v0+t9Odl6XA51xS8vgtGJS57TwosXOFnFaZ+OQ9H1nAbM8mGCnh2/p4XY9g3IsMSWOt+
	4O7H7oLWqSHteCdeqeU3NpDEm8l8ngY9ud0xE+OWgkqmCCWk0/prlpwMbQeH3xrFwFVr
	VBpOt1AXQpbbSB9os3iRXJcNjkluSdFNMRSimRyXYToVcyXoTuEhYAWJH3OjRcwZInGM
	U6ng==
X-Gm-Message-State: AODbwcCYryZ+7RW4lqzX0/C0pX1keTYlnv43r6REVW7JVeAdWTy9GkL/
	CFNPe4fICjpiTQ==
X-Received: by 10.55.104.210 with SMTP id d201mr4940278qkc.22.1494612645358;
	Fri, 12 May 2017 11:10:45 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id j4sm2752436qkd.19.2017.05.12.11.10.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 May 2017 11:10:44 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 14:09:06 -0400
Message-Id: <1494612546-2295-2-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494612546-2295-1-git-send-email-ferlandm@amotus.ca>
References: <1494612546-2295-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 2/2] nasm: upgrade 2.12.02 -> 2.13.01
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
X-List-Received-Date: Fri, 12 May 2017 18:10:44 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-devtools/nasm/{nasm_2.12.02.bb => nasm_2.13.01.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.12.02.bb => nasm_2.13.01.bb} (77%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.12.02.bb b/meta/recipes-devtools/nasm/nasm_2.13.01.bb
similarity index 77%
rename from meta/recipes-devtools/nasm/nasm_2.12.02.bb
rename to meta/recipes-devtools/nasm/nasm_2.13.01.bb
index 3280b84..b17bb53 100644
--- a/meta/recipes-devtools/nasm/nasm_2.12.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.13.01.bb
@@ -3,10 +3,10 @@ SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d15843c3fb7db39af80571ee27ec6fad"
-SRC_URI[sha256sum] = "00b0891c678c065446ca59bcee64719d0096d54d6886e6e472aeee2e170ae324"
+SRC_URI[md5sum] = "b3ae134bd1b5ead73d659286f568da95"
+SRC_URI[sha256sum] = "aa0213008f0433ecbe07bb628506a5c4be8079be20fc3532a5031fd639db9a5e"
 
 inherit autotools-brokensep
 
-- 
2.7.4


