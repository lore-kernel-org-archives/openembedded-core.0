Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F75D71A88
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:56:26 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id c13so142837980lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=pJTzIaQcNiwo8rX7/V8SqZ5YFWcoKIfBJSa5yAJuYk0=;
	b=gpaxNkfIpK4As67f3JiAdbvUfNoWESHyvoGdWiEKb5bgbtoQbkBWro2NuIAAwP+e/C
	y15j3Gy2HHn02PRuKAM6UEz/mpoFBi5sMPc1AKadNlUeyT1qAum2cXuOKv/glRHmEdBx
	hK3Kj4T7WFQmt32e1Xvqx/wyWTDN2rnn737oQnGHf0EDPZG5+N/OU9ie8uNQNs6pMyW5
	DjD7zDQ/+qwdlejSJsFy85hZqNCX4R9Rq4Uk5td2q7KlwutIlF2GZK6cAVz393hpy1bE
	XjGs8Sr71hb3GZqo6ldGrwWXtwUeDA6MC4YydUA5s/FKSxvA1+lW/2oPCW9yFnEr6M+i
	eg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=pJTzIaQcNiwo8rX7/V8SqZ5YFWcoKIfBJSa5yAJuYk0=;
	b=IthHE6BDtlhjUsXlaZvoOxh32F/d19kvsnqLo+jU4Ay//o3jqEeEgWNJI+CohDbb+/
	jTOg2Tl2m3yTc9S8KLFD6NAV/9EzseCHjl5mp6iXhEA1ZrdedDe5U6mepHZB210cVKxa
	2gk0L7DIPx1HtNBxQXTME4meo58eFV6M85ekAUjME8qxlczR2bHmqg7g2YXLfpfxuyCt
	1kwz1sWeVSMpV7MRspnMheLhvlcB4JcKE0NR1HbHDjJwSpo2ZKyhlLGU4004xMfKWzWt
	XjFvJwfE7FEWDY+Q70toVCgjJmt9J46VMSgIeWiAo94gSZz1sGhUHfea2/Hxbr96tEZN
	vuRA==
X-Gm-Message-State: ABUngvf9PvlJJE58DZ1KU5yTZ+w+3RGzKX9hchkbnidH8r+tzfsmnbcAGnVtuMKZakUteA==
X-Received: by 10.25.139.195 with SMTP id n186mr7533905lfd.27.1478620587788;
	Tue, 08 Nov 2016 07:56:27 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h95sm2976939ljh.13.2016.11.08.07.56.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 07:56:27 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 16:56:09 +0100
Message-Id: <9d17d4a574a0a2b809f832b33a0af41fb7682ea4.1478619682.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 3/5] wic: check that filesystem is specified for a rootfs partition
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
X-List-Received-Date: Tue, 08 Nov 2016 15:56:28 -0000

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/partition.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 8adc698240c8e3bd9f4118663a5d7a167e0bb4a4..24e657592738dc7c5cdff78e3740d7c373021e9d 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -184,6 +184,10 @@ class Partition():
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
+        if not self.fstype:
+            msger.error("File system for partition %s not specified in kickstart, " \
+                        "use --fstype option" % (self.mountpoint))
+
         for prefix in ("ext", "btrfs", "vfat", "squashfs"):
             if self.fstype.startswith(prefix):
                 method = getattr(self, "prepare_rootfs_" + prefix)
-- 
2.5.0


