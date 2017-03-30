Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2F777BD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:26:07 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id l43so57232155wre.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=FoGLOAo1QC4OhwbhWzSt78bDeHh8BkEcXf2WMjifSTQ=;
	b=JwzGBQkH+6B9w/45CTRh5aE6t0dpUDHTMsnvamJ8B1zPhyr9TPTSUnhCZ7+NSyk2mC
	54SRDozHnWC0nT7pGz6+VIohk9X+ztyiYmWFjPWiy2IQdKzrlUMl8Hd3y8ZKnWDwT+T/
	8lKXeg3HHRvdSWU5XFsfz7eQSlRrQ9A8lpsXa35ydOrmJeXhvyPeTI+qtCh0vmnw3MGx
	dKo8MqG5/M9n6Y9esKfXTUPVmf90k3osJWRsTtaKryMSTUxx+T2C6+no0D0VKYoKuDlH
	Uk0TCCmoil/mgaQOCTnadZDTmhh3Y4+WfBzHYPBpWQz8I6zP+h0anIgTR2oxvj78Ht3K
	ZF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FoGLOAo1QC4OhwbhWzSt78bDeHh8BkEcXf2WMjifSTQ=;
	b=kf3feyh0ztDAi04pPIJnHZfHguy7pdmweGSF7acdYBPyEmUH0p6PlsHoZb2kBYiOMk
	TfpvX3Y9w0kqNz3KKNBP7qPyfa5LJc9FtxQMw9E23Ti6KVtf50ShCOUYF92hNvqCFI8W
	1a1eVqYN97+AujvCuo/5CthcM6HPO1Hs3VXr4SOREkHRzneA9MEgUKAd26G0y0jXDjZr
	Ay/g2OpwqvGY0aKhrS6jg+2YW2h2ThhGOWHUq9tlIJzufL+FsHwLLK2H0u/JxNyQJ3Oq
	QX5nTJYazSc4l/jc2mh8vooQRAmyTVZB0LPHS7tPQ1ENYvqDxKER9zz7RKk5N7osEXYv
	udAQ==
X-Gm-Message-State: AFeK/H3znznHnOD+HiX8cRUtLEKKr7fz0mHqvSlakvHrdXHQ549nAGWlpxtOt/XnozH+iCPT
X-Received: by 10.28.93.65 with SMTP id r62mr2856620wmb.77.1490873168036;
	Thu, 30 Mar 2017 04:26:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 68sm1926952wme.7.2017.03.30.04.26.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 04:26:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 12:26:02 +0100
Message-Id: <1490873162-7837-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] nasm: remove COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 30 Mar 2017 11:26:08 -0000

nasm can build on every architecture, it just can't generate anything but X86
code.  As we can't know what the user intends to do with nasm, remove the
COMPATIBLE_HOST line.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/nasm/nasm_2.12.02.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/nasm/nasm_2.12.02.bb b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
index 9c4b60f..3280b84 100644
--- a/meta/recipes-devtools/nasm/nasm_2.12.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
@@ -2,7 +2,6 @@ SUMMARY = "General-purpose x86 assembler"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
-COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
 
-- 
2.8.1


