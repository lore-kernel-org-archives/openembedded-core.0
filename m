Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B4ED9606BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Feb 2015 06:09:31 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id et14so21782131pad.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 22:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Tv8cq64JTJ1VACYodBqMYQxD9RGxc/PDApaGva5ERSw=;
	b=y3UGALU8O8vareybm4C9xfh+5DegkuhpDTsJ4PB4pfCs8edUIdFfz8ezYfAUK9zkht
	jgiEkWEKdV2fTo5gYJ1NWO5J0IJ9nKtqh55FJmCVs9Uzxa5odMRBOog53TBzk/oQJ7bQ
	lOnLoq2i1Tsj4mF1tNNXu1YoCP8cmodcfO7fJVyXHuQl8j5mpAIRom3Xs4zth5eYbAk6
	pGcldEDxH3OxyoYcRys73hhVgQd0euTtcuJSLVbyJaB333CX982EMeuTXP13jhW8bIT/
	DwRHlJlA8ulGkwqgwQA8+jqneMGuwFm2Yzssj8bUy8EMZGhSearf1xuhytheMu9DwQDK
	6jcA==
X-Received: by 10.70.140.44 with SMTP id rd12mr11434118pdb.64.1423289372963;
	Fri, 06 Feb 2015 22:09:32 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id kt7sm4966603pdb.84.2015.02.06.22.09.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Feb 2015 22:09:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 22:09:28 -0800
Message-Id: <1423289368-10649-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] btrfs-tools: update to 3.18.2
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
X-List-Received-Date: Sat, 07 Feb 2015 06:09:37 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index ef85057..f796f6f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
-SRCREV = "44cdb62d3478c834f41c87ea79d261b9c8982dce"
+SRCREV = "344599a7aefe23c7169ccdde3ad1b921bb60024c"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 S = "${WORKDIR}/git"
 
-PV = "3.14.2+git${SRCPV}"
+PV = "3.18.2+git${SRCPV}"
 
 EXTRA_OEMAKE += "DISABLE_DOCUMENTATION=1"
 
-- 
1.9.1


