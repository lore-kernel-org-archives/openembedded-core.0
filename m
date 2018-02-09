Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3BAD78654
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 02:44:40 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id e20so8334531qkm.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Feb 2018 18:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Poa/lIxvZVzyVMnQQCBu2JH24V0tqsP4vJcsM8+cvRg=;
	b=S5rxvIrTiT5u69umOxvgT7trFxsFAvdWGebUlTmrfHaLJqRc6bZWy0menha2KYV1cj
	BK0F6hHs4vHdoz/Fe288dHFSWuDmArkloChc4GSgABMxUvLpr0NUFWKWZY2W85sbgtVr
	aEdBSNJgVsWwuqTap9bjG8ZJ/IcPD3hZRT/jU9WG3naZ8kGISxCWuHFwIsDeAcnmZ0C3
	Cy4maZ7tllIO1ngdomM7pn7mLFHRAoRwBOFN/rZjH3cJalFQCX59Z7RgeUoz0vTok29D
	DaGjb6o9UuTIlBmKV29514q1nLAAFamra69CXndEtjhOaHar6K3W/kIefsHVe39t7nY4
	xj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Poa/lIxvZVzyVMnQQCBu2JH24V0tqsP4vJcsM8+cvRg=;
	b=QwfAaU7evtRfkpTz/bBSGrWoig9Z112vlh/APGhiBOBIV69YOsoEOqKfING8ao0XVW
	PeTGw2KMiGY+Lpq42p5JB9ns5aC5LZroG49aGDoE7vGm7iMszU1CzM4cA+K29dFKKsu8
	MYujCUcYArmYHHM01+mcd1K4AgfXKGXPZ8PUZ/UajXEeg9H20FSCWvBaFNEoFW16911U
	LdASw+gZ4+6kwyt99Len3T95NFOrAS+dhxDDlJ7kXtIFsBDnDc1zxst2XOvkqo7aYMfs
	xh3/qBuIfkPvX6jQog1fJm+gddw3rHARs3l9Hm+z9FX0L9jj9PNxjwvO1w0u3fj9zmkE
	qTmQ==
X-Gm-Message-State: APf1xPANxeUblB3RBQqsbp7rqFu3KllBlHuGcHlwIqSe6arAEZm6d8ol
	z+6kuA/OzuFRgUCAu3yoesrXQvd1wQ==
X-Google-Smtp-Source: AH8x224XEa1tJ25sUl7pK8Gj9FFf3l6RhGgUEE4y6iouR2qiZfzKJza/9bhheuv3gqaSjV4I9OWQqQ==
X-Received: by 10.55.144.198 with SMTP id s189mr1827815qkd.168.1518144281170; 
	Thu, 08 Feb 2018 18:44:41 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id f4sm1085439qtc.16.2018.02.08.18.44.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Feb 2018 18:44:39 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 23:41:18 -0200
Message-Id: <1518140478-7992-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] initramfs-framework: rootfs: add support for LABEL
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
X-List-Received-Date: Fri, 09 Feb 2018 02:44:40 -0000

The rootfs can also be found via the partition label.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 14768f1..76fa84d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -31,6 +31,11 @@ rootfs_run() {
 				bootparam_root="/dev/disk/by-partuuid/$root_uuid"
 			fi
 
+			if [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
+				root_label=`echo $bootparam_root | cut -c7-`
+				bootparam_root="/dev/disk/by-label/$root_label"
+			fi
+
 			if [ -e "$bootparam_root" ]; then
 				flags=""
 				if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
-- 
2.7.4


