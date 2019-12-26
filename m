Return-Path: <gomonovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id DD2DF7D2AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 11:51:01 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y6so16525855lji.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 03:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xHUUlXacIsdkD5xpHlgIYsmTNVE/8HZ6eRJcgqR5B9g=;
	b=GjXOxOoOhDP4X6ZPiK6LdWzZksk6hiAx4g1LzSpAgk/Qupl7QrqrzzVscsAhTcdF2f
	RO1dydg8sVY5NMak0Z12e6+ZT4geNxwRxHJN0Y3Z3rMyp1Ti2BUYaug2viNnRkLjf1as
	RA//WDzY4qpv8MW+3sQ/onqFn1L3yBpmz9UVWfCu03s6Yhshgk8E8Z497mRAf2v+j31h
	jELY5SnpmOEP8JzBBwW/X88FRHevEDedPNjAezdeeIEOntDF3fdbvhp73jcfL+pIGNdA
	nkjlbK/rqgyHx+PkUgWeOX0sJRWDIbPm7xsxq19z5DZ+lMmclqUJ1NuvyB5buCyzwDGC
	AoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xHUUlXacIsdkD5xpHlgIYsmTNVE/8HZ6eRJcgqR5B9g=;
	b=Jg5IYR2SfxgWaF91cSmtWddlbJ8RLAFAT63ViE+QTf/nsAoOXFhZVSX5Ajo9iHpF54
	CAVa4aYEs//eCzux7fWuDpKxe43Fl9PjpeIualIXPhnIuTq+cIBBrlh8Ku9ha3o9k3pw
	vglKD4tBQNysyjw2+eFQryUK5l1rhn2pymoYSD1Amxo8TzdT4ddo9kftpOZyUdwh1Rj0
	OTvaI9YaCGPrrgrFOyq6fjekIJXkOgTtNWpfMIqy5JyiFLQzlzhDOL/J0cMxLJShng4H
	TKGPweF8t0TZhAL+lfjqr75LzXHa6bGD4lTo2dYrt1WJHbUokSgAFh5oLKWG2UTVOOGu
	GVhw==
X-Gm-Message-State: APjAAAXrZp/kJtlg71OOUu+rLpfkHR//PNHFk2QuUqfuAgvZF5wl0Nn8
	cMAHz2DuZwxW483pCZmc0GZnLoxdubcRPQ==
X-Google-Smtp-Source: APXvYqw/0SbORhl/FzuDQhVacfipG2Swb2CMGBo4iaB98a/5UinRs/3N0qHyAK+en7TqV0Ga/4UZ5A==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr8118180ljk.220.1577361062211; 
	Thu, 26 Dec 2019 03:51:02 -0800 (PST)
Received: from kbp1-lhp-A00636.cisco.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	l12sm12249959lji.52.2019.12.26.03.51.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 03:51:01 -0800 (PST)
From: Vasyl Gomonovych <gomonovych@gmail.com>
To: openembedded-core@lists.openembedded.org, zhe.he@windriver.com,
	ross.burton@intel.com, andrea.adami@gmail.com
Date: Thu, 26 Dec 2019 13:50:56 +0200
Message-Id: <20191226115057.10413-1-gomonovych@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] kernel: Make symbol link to vmlinux.64 in boot directory
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
X-List-Received-Date: Thu, 26 Dec 2019 11:51:02 -0000

Some mips 64 bit platforms use vmlinux.64 image name
Make a symbol link to vmlinux.64 in arch/mips/boot/

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ebcb79a528..750988f4e5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -613,6 +613,9 @@ do_kernel_link_images() {
 	if [ -f ../../../vmlinuz.bin ]; then
 		ln -sf ../../../vmlinuz.bin
 	fi
+	if [ -f ../../../vmlinux.64 ]; then
+		ln -sf ../../../vmlinux.64
+	fi
 }
 addtask kernel_link_images after do_compile before do_strip
 
-- 
2.17.1


