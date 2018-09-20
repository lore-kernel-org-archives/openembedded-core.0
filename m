Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6C22D795FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:54 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id DE2AC24E0F95;
	Thu, 20 Sep 2018 13:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476175; bh=8IBClpaLgI+jO3WRN31rDI6eEGQn656caU2X8lOYrbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwO6tBLcF3hYYrkAlH3daUaaII3hpWD4A1+bbTVlgGdRNF9iBZhidtl6kXn9aBk5p
	SGixVLsXvyMZTAS3pL4hFMF3UlBEcEkn+i1KXoKZDNUTzd7B+xeQF5NtUv1C/lI5IL
	4fv40f80/FvQIF5erioLzFD6mMmCXkUZtJKBxHCVwpk5wMLzuSA/vqFZkV0ILjVXCG
	32rzKFprdj2JwpNXVx4jfKevBLATCH9VJ+MdSYozIaUpAFLmNlgFujohm/Z+onGgVH
	DpIOIAUSn7eBfWltRpH8qnG+IZlnYh/tS09Sc0elnQiko5PqhlnKD6K6ObTz4HVDwp
	sYaDjwGj1xiAw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 9777B3B26;
	Thu, 20 Sep 2018 13:42:54 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:30 +0300
Message-Id: <20180920204232.10583-8-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 7/9] gcc: Disable libitm for ARC
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:54 -0000

The libitm is not supported on ARC, so disable it

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v2

 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 72b8081cd3..9e7e7c5b3d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS = "\
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMELIBITM = "libitm"
+RUNTIMELIBITM_arc = ""
 RUNTIMELIBITM_mipsarch = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
-- 
2.16.2


