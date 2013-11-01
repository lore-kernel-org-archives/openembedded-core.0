Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA7196D183
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 13:31:40 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id z6so1852780yhz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=q1bMesRmjuNDe3G1cbgqGzOacwFnj2V/HqaJv7UJXfk=;
	b=nFhMsJncEptWPj2u8vzG6KafPXKuCWttWsXgJ160nw2hbiHpn55LNYUk6HSdSO3/tc
	hzksPsxGussta9iDHV8FeS3+JCX1CWE6H1mtinzPcjDXrorKKwrePCY29eEGh1FvJgZq
	ewIMpvcVOvh92Xoi6QTdTi+QE3DEKYAwXMFhBkKDBZYYDdiHL/q7poGVR1gXMNFouTaq
	bc1C671Oy1atRFtXORRUZNS/P+hDuzKsApD4eDaTNlZHNiug+3keW/Kr14MEoGAKD5OE
	IBk3gFXfLjV3oHF6b7z5xjELH/Gd29fsy7GFt047uGqd95MSK1nE6+PCdrq8wAu372K2
	qczg==
X-Received: by 10.236.115.137 with SMTP id e9mr2119372yhh.39.1383312702443;
	Fri, 01 Nov 2013 06:31:42 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id u52sm4464508yhg.5.2013.11.01.06.31.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 06:31:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 08B0216F79281; Fri,  1 Nov 2013 11:31:38 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Nov 2013 11:31:35 -0200
Message-Id: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Fri, 01 Nov 2013 13:31:40 -0000

This updates lttng-modules for 2.3.2 and also includes a bugfix
imported from 3.4 kernel. The changes included are:

6c26b01 Blacklist Linux kernels 3.10+
b97d469 LTTng trace-clock: shrink kernel blacklist
7d40f8e Version 2.3.1
2aecb9b Blacklist kernels 3.10.13 and 3.11.2
4f1217f Version 2.3.2
92fff0c Import fix from LTSI: 3.4+ RT kernels use CONFIG_PREEMPT_RT_FULL
1874075 lttng-statedump-impl: Fix lttng_list_interrupts for empty implementation

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 789b5ec..e887a86 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "78c8710bb8e6b7f6301d95afec0305f40fa063ad"
-PV = "2.3.0+git${SRCPV}"
+SRCREV = "18740750760fde894eac0cd4e3ef4d8c7c4ba8c3"
+PV = "2.3.2+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.8.4.rc3


