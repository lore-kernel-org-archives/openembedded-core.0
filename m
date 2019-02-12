Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAE66BF38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 05:48:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j3so740179pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 21:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ruBwcjZ5zTzzi1F5VCR1GX7kidmeH+th+wTq9hqp8Iw=;
	b=bOxHOnGASaDgW/5TeTWlUs4aVBpw4kdcmSBrazteI5M7pobmgAGPbZjPzQYhux0Ql6
	JHjY3LFntjhu+jfM6OmuZaYXYJAjllM/bGMQUw7VuVBll/QxhIc/5fNZfXalZfiTS0Fx
	XGl+K4V55kv1KAuC+AF5DGVte6ZpPsULBos8RiCmSKs2+5bfGiiBb41jD2bbJYfv7JbA
	RACeG6kJTkji1KjoxZJEqV469H2jMfNQyGJ0mmL52j08K+rTkpKDNH3vgaQ++zSOpHzT
	xAeerRWWRVEiMGNacmyL0ELQ+gQHFrMUAtVPmEyqMtq9O+mnscEuJU3IKqORU2DMz1XO
	lcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ruBwcjZ5zTzzi1F5VCR1GX7kidmeH+th+wTq9hqp8Iw=;
	b=jnIjsJh8/rfSnefzsXMbuNp2Fdd2FXFo+Scmgvz4ps1uEMbyV/uMOrcWLFJp9NzbGT
	akfbmINlhZNfboEmxVLy4+m7WfJysxDHTD3HJxGhJ++0HONshjkr4lz/yryLgiO2yYMw
	jmz310mPBYiy++puKV3qE6I3edcV/z4SV2Oaah7Rn47FNQbaBj0NvswO8MVQ78qOWvOM
	1+fyJsHFlUpBCGtHBsGQJPtjjw4RTX/wAt0J2u9j+YPjhh987Ir71k8/j+gh1p7R4gXE
	T349nOY5gxHk13uIMqnycWwdj6Xvw5ckqqbphsq+5qas7ICaILS5L6BtuBrjGu8Z/Vxi
	iE/g==
X-Gm-Message-State: AHQUAuZFff8O7904jg7iwKBoZz+7d5Vx6FuLGqUsQmfgZqBpqsZ5NAm5
	vMPbVeDUxp1kfudAmwWhG606A3mh
X-Google-Smtp-Source: AHgI3IZ2gAq61ehdsIqonuDs3yau/h4FZKjxQc3Rb7oJ66qL2CMUSFcowLF9pUOdAgsKjV+k+CHPPA==
X-Received: by 2002:a62:3241:: with SMTP id y62mr2257292pfy.178.1549950481049; 
	Mon, 11 Feb 2019 21:48:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	b15sm2020017pfj.44.2019.02.11.21.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 21:48:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 21:47:52 -0800
Message-Id: <20190212054754.2801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Tue, 12 Feb 2019 05:48:00 -0000
Content-Transfer-Encoding: 8bit

PN-dev is empty and causes dependency loops during SDK build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 24c15e4aee..2444afabd5 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,6 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+RDEPENDS_${PN}-dev = ""
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
-- 
2.20.1


