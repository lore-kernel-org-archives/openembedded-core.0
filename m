Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 437CC611CA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 02:12:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so2441078pgr.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 18:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Jb92eXEdBJc7L1cBHgRHGUWN1tPG+BPGbu9kFaO2ezc=;
	b=E6gC2foyQXRTDLWhj+13c7Ru0xyDr32JXmVDCFr30jNi3tfBwF4Uw3gdmcoalDug4a
	gEfI0SNiKQWAmtTFgLmRS1ZJQs5tTxYKqHaRN/CIz67YxvPe2e9Q8sy4Yyre12uLcgTz
	+lgip/FOPlAyYTXyFiuka7oglFYQWAMzd08GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Jb92eXEdBJc7L1cBHgRHGUWN1tPG+BPGbu9kFaO2ezc=;
	b=WQRS6ahMJMo4/H7UXttlE7a3ylzU85/o5pXNCX4Fm1sGUh0PEQNj53nr9wrqUzkW3I
	ZGmw0V9RIu71v0ubw5jt0T/4ahFlQtsgJktJwRs3hbiNnupQbcRMAVNeYZRU9C16gOgk
	AAYHAkT0qFsGiuNl6x0l91DjR4GHQYLIbsEBaoG/qqYpHax2wddSd012jpAwPhxTAaR6
	oH+rvu1iR16kH4iskqEb5Co1ZQvX14vAFMu0mG7qlwAg5/M+Qm1uYvzSOkVoAR4n/azG
	2gPA7de+/EChKUvQS7xsIYvHdxmnEPYjot2olSfnc5PS1kfrcZExT3DQTEPbVyWH/P3D
	F4jg==
X-Gm-Message-State: APjAAAXG7nREmCykH4mQWFthsrAYq/ZAyTCXfN+UBNo6eBpZpbYqBTFG
	j7f5QwbHq8wMWWEhE3PwR9AW0ybmDEY=
X-Google-Smtp-Source: APXvYqzwYx9gETt2pt0kylqne4bqzX0+3NuGUFw/5Q4h56300OkN/bdsfQcmlXMtH2GtJNKVEWtr+w==
X-Received: by 2002:a65:420c:: with SMTP id c12mr7241991pgq.270.1582942375387; 
	Fri, 28 Feb 2020 18:12:55 -0800 (PST)
Received: from localhost.yoctoproject.org (c-73-11-95-70.hsd1.or.comcast.net.
	[73.11.95.70]) by smtp.gmail.com with ESMTPSA id
	z17sm476185pfk.110.2020.02.28.18.12.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 18:12:54 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 18:12:38 -0800
Message-Id: <20200229021238.8810-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH] yocto-uninative.inc: version 2.8 updates glibc to 2.31
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
X-List-Received-Date: Sat, 29 Feb 2020 02:12:55 -0000
Content-Transfer-Encoding: 8bit

Allow sstate use in Tumbleweed and other distros as they update glibc.
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad75d3e2a3..889695eae3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.30"
+UNINATIVE_MAXGLIBCVERSION = "2.31"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
-UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
-UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
-UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
+UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
+UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
+UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
-- 
2.24.1


