Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 149377F990
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w9so5388068wmm.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1DTrSVj5HgaUQWs4Kn10QaGiPPH7WpZTUo8kHiiHym8=;
	b=IRlMKhRJ+6nTqdZ68nm1jel8gx1kOyZQZ5NgO2iFPe4Y7C3t5aF9bZYjZ1WoU8GzSk
	Y+IWaZktZprYzpnlvenArxmhSVmrJ9QDwHarhRDB6t7xZjwxUNFtxVQL05o1hLwrFWAY
	IPwqfSKw081lQoIYhiIlpyXfKfMLv6zdM9Z8lyY/RbK745u42yU0Rj2ijw7WmOaYjCzi
	A+5+bS5tiVnSbb1e13WqanzxAhbnIHJyvgXdj7bpAyi5/I6Jsk3oXqqBvQjnfwacHu6d
	R4voWIifHqxo16ofuQ2kvFS3u8XESmnKFzpwR899NEhnX0XLZCzR3fo76sIeJPmRvKbC
	Cz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1DTrSVj5HgaUQWs4Kn10QaGiPPH7WpZTUo8kHiiHym8=;
	b=jcRlBQi6JbFFw88SDqIBkXrvfEmJ9PJtMmJhMYBmxR/TUt7Lkub+R+fTheHUrrR2If
	v2iJ5BNtKaw5LfvglvjKsIM/cfjfdMdgo3W5synqQKSY9mfYrORgZivqpD9576gKQmQf
	M8gPX53Lj+mOqJYbD/Ujr1BPpuYIaNXfQT6q0Ul51i2wA+99TCeN8SyFPTcP0TSxiUzC
	gSwBvaCr3XVdYGgLexIfsueEdkrE1y+3gnzIV+dWtg0izfBX+3XSxSYSLcB6ag4pSJ+6
	YQJ6SxfT5u1W0yx2226YXmziS8NDsMEkkqDAxdWjp7ONVF35vIO9REFZ8iHttk1RSLoe
	3CoA==
X-Gm-Message-State: APjAAAU0rRhbXaQuqL3lG3YwM3rnnHQmbgalZYHrL1aEYSn2kV7Q8+Wm
	cMGC+VverM+80C3Q8VCpmJXK16+ANnA=
X-Google-Smtp-Source: APXvYqyzzSD7pLxJkBu6TxbO0lte1R5rUxkrV7P9W1hq07ME0E5VgnB8sXAbQSPO5gJhXXO9jZ6ysA==
X-Received: by 2002:a05:600c:295:: with SMTP id
	21mr4336760wmk.43.1572519327264; 
	Thu, 31 Oct 2019 03:55:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:17 +0000
Message-Id: <20191031105518.7716-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105518.7716-1-ross.burton@intel.com>
References: <20191031105518.7716-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] squashfs-tools: clean up compile/install tasks
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:28 -0000
Content-Transfer-Encoding: 8bit

The makefile can do the right thing now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 0e1be6bc1ff..4fd33f80482 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -28,13 +28,11 @@ PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
 PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
 
 do_compile() {
-	oe_runmake mksquashfs unsquashfs
+	oe_runmake all
 }
 
-do_install () {
-	install -d ${D}${sbindir}
-	install -m 0755 mksquashfs ${D}${sbindir}/
-	install -m 0755 unsquashfs ${D}${sbindir}/
+do_install() {
+	oe_runmake install INSTALL_DIR=${D}${sbindir}
 }
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.20.1


