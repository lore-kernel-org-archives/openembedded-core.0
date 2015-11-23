Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D9E1D6AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 14:37:24 +0000 (UTC)
Received: by wmww144 with SMTP id w144so99001913wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 06:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=skKYQvw0zH8RbNjSeZJrCmv9XBDVk49rFF+/ywvxPQM=;
	b=VxYK1wqQf5DYmXkGxmX461byFcPTUs12n1nfWPs3poFcQBVWtTc2picCLUjx1OrPuN
	QhAqADzspugdoKnD7xW4cJgXm2RPMI+htMajuTaKfcih0NJ05aZVwBBadQKesFUc9klM
	dyFJKOvmgt+eYZsrVMgv9LiboO8Q99Vmx3uCsQtp1RTyUIAFoR2Wob7yoS2oAwuXQc/9
	4RamKdDSKPId3P4x+QlWuB8AG1mhPeHcHvS5OIQhsM4HBAUmFuuUDJWT1MELwgtTDGiq
	VILWfwf0CBtddXE2jOcGcH7VYnDlu6KRUStbh/jNFv8EtwxaEU/7qseBsyU4Q2z4xoDV
	w2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=skKYQvw0zH8RbNjSeZJrCmv9XBDVk49rFF+/ywvxPQM=;
	b=TVz3F+HX2S3VD4JkXhqa/adaTri9Qm6OMH7P63vkF/Pr2n5U3QL8MY4FOJCvGrISI8
	S+faMUxJK/ggW0GMGeHmH8zL5sfvs6H1YJQ5LSf0OAKW1Me+K5cSXJI46L81IfUH4EpJ
	igvAWiM9pbjWZO8Z19fsMgj6rdJGQHFVTU/RgVhcF0YovIKzXg+tdlAwx9hPK+SaKAw8
	VGn7sPw58Rg/Kr6zo+nQHOm8KOoU7zYszK8G7cVGYXNAMm88fEAYA/poEuNEqg5tDI7w
	umXusUOH+lPI6SXxB3w4d/YjKIwXS8JjX6WAck2la9B5uTE10Lm54kR3O8H+VwBKEGfm
	cSJQ==
X-Gm-Message-State: ALoCoQl35ivq5BGtchGLgLWLEcgOy8DqPeWaJ8nIsJ8BNaz0XxYlBgZWlghUos6HVCBuH4BBXF2h
X-Received: by 10.28.232.136 with SMTP id f8mr18039060wmi.1.1448289444907;
	Mon, 23 Nov 2015 06:37:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id bh6sm2575137wjb.0.2015.11.23.06.37.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 06:37:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 14:28:41 +0000
Message-Id: <1448288921-23123-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448288921-23123-1-git-send-email-ross.burton@intel.com>
References: <1448288921-23123-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][jethro 3/3] yocto-bsp: Typo on the file extension
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
X-List-Received-Date: Mon, 23 Nov 2015 14:37:25 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

By mistake, the file initially had a wrong extension name, so changing to the
correct one.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (100%)

diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
similarity index 100%
rename from scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
rename to scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
-- 
2.1.4


