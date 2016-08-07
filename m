Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 052F173204
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Aug 2016 14:48:42 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h186so23286715pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nigauri-org.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=LyoYSof6erjVrqdBg1jUY6DW7PEn9YdNCbVaA5OyIFg=;
	b=XzFwzdlGZhj7iewpPUz/TtN7KkWnGESuz+Q3nAtZseezPMHn5MU0/c9YkOmYNPo4f2
	/jlmyQ6ZX+AMPB6r0YPe4UM3mhR7gfn2+cAbopO7opbM1n0CcWcR71g9e+ZfVNxvYyyz
	sa8azmJKMIqdw9hk39ssXUN0QS87OFEmV96O4r4dcl/tEfHRq6PG4ydFBhH76aI7WswB
	ZPEsk3RCabCR3MLaOrvSMe+5ku9jsjOF6C8998HitKdg0Pqq3AnkROE5nW/BaOzqpzv0
	E3lAPWk3jnBvI8XHIJNQLJvP9WFHPAen4GUC5zNsj8i7IWHIYB9mxOnRE3wtwiRb3JqQ
	9PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=LyoYSof6erjVrqdBg1jUY6DW7PEn9YdNCbVaA5OyIFg=;
	b=EIH30jw61CS7sIGOezmB67a/VMM2mWKThr+uR1C/mRSUSajEIwuQdZyuanIYscerC4
	PfBEoH3XYaq9B8loNcVI24QxjQnCDvLYpmSmMZ7iH8IGcgK/cYBYuaxWMaM+LlEhBb7j
	Ee03//MftMKK1d5et+taca9S9pdAav7Mv2WkMRV3iL4DvZwRotnSQU27CQSIF+lJqb5v
	2K0gWcb3X4Js8uv/07TyIoOhlmFiccqq+s/GFLRxxSIzfe4gRF4HFxX/E9wOdBPEx4uZ
	ZVw946olF9quEyBjvXiIFQ1aKnZNBbF374D+UHY/Nia53l/0ILWiK5jJaNS/lvE/Yu9k
	jmVA==
X-Gm-Message-State: AEkoouuOPud1VL6zy7QAiGhqGYD091LdltsBIAKa+njBQ48Pm3SaCSvY7IK1w2n7zCNTQA==
X-Received: by 10.98.19.214 with SMTP id 83mr156130514pft.117.1470581323203;
	Sun, 07 Aug 2016 07:48:43 -0700 (PDT)
Received: from guhya (w203126.dynamic.ppp.asahi-net.or.jp. [121.1.203.126])
	by smtp.gmail.com with ESMTPSA id
	u1sm41275696pfu.12.2016.08.07.07.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Aug 2016 07:48:42 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Received: from iwamatsu by guhya with local (Exim 4.87)
	(envelope-from <iwamatsu@localhost>)
	id 1bWPNX-0008hC-Jn; Sun, 07 Aug 2016 23:48:39 +0900
From: Nobuhiro Iwamatsu <iwamatsu@debian.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 23:48:38 +0900
Message-Id: <1470581318-33390-1-git-send-email-iwamatsu@debian.org>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] mmc-utils: update to latest git revision
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
X-List-Received-Date: Sun, 07 Aug 2016 14:48:43 -0000

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

This commit update to latest git revision and add SRCPV to PV.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 0a8da19..775c1e4 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,9 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "bb779acfc385d135b32a6998c1d1fceef0491400"
+SRCREV = "a3d3331e6854a4607133bed152988d51250107ca"
 
-PV = "0.1"
+PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
 
-- 
2.8.1


