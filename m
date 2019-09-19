Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAF77FEAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 21:34:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a11so4690609wrx.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/BjelQuatw5LsbTaWlTtH6x9OUHW8vxLwSYj49BfaPk=;
	b=bFGYxFlhxTlPcSMzb5TfQP04Qviv7K8Xk7QHxjJnZaRXJz8XsrTIqPx/CEp6CwLNaK
	x7Du8Bq1a5EdSFOpW5bPtNY7kXAIo1FnYo+ajNc+sswieAvnS+7uCjW3/HQTb5oNud8J
	NSQ1RwT8LBWwGMqvhnQLqhU/SYdco3ljGj8lLQS7RT/x8DZLNvViBpCMqV96ErhdH8cP
	7aIMdc0wdsYRBSqVjSVan13eXQDq22lAke6FioD5nPPnEn5TXlMyVVb6J19+7pik6KWx
	HKR3A0YJ2EygGP27wqw3EAuMMgHXITLiMRabuwYJeLYabDneTWMAY6D45duSpYAkp5qv
	K6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/BjelQuatw5LsbTaWlTtH6x9OUHW8vxLwSYj49BfaPk=;
	b=XFJXj0wjwXAhIOwF5U2UOFjO1jqnDWMizqE6no80MCGnIGOeKVPz4BALG3zroc4kfI
	SlDzd+69GXapis2v5scK1/66YSu6oaUBLyMocbonc/p28BBEHvkcRG9cIxO6t2gOt+vd
	g5pttdZxaG6k1UVfNGRttC76vpiIuE8tJdc8Ha0kLJAc1aV6ypCvzeP9FSZafcwXuWn0
	LvyCueabNTRuGTOMHcxqink+7bEUxWAOflA+Z6mL1KEmWUdvQhciuZIlYpJyzoO8Ga9L
	g2Ho0UHMjXDR7y/vnBwtB6Bbj2DyFhvQA/A2Jd7aMN3e/LpqpAMn5hSDPReMB8EKCT+B
	WcFQ==
X-Gm-Message-State: APjAAAXkXbXAhanl37rJtKYWHYjQnxm2fAaQEIkkv8FTRlBWOBFTry0J
	wNuid4qKKJU53lFYU1ODDU5/79xdm42usw==
X-Google-Smtp-Source: APXvYqx4qjqPPQ0E/Pt1AwkjW0bSzUpfp8KMYxAauqIVFKSS3uZ2P7i67NKs+310Dpt1tyL2zq3ALw==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr8659203wrw.7.1568928874642;
	Thu, 19 Sep 2019 14:34:34 -0700 (PDT)
Received: from localhost.localdomain ([81.29.205.101])
	by smtp.gmail.com with ESMTPSA id o11sm5851068wmc.7.2019.09.19.14.34.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 14:34:33 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 23:34:02 +0200
Message-Id: <20190919213402.24408-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] initramfs-framework: fix var name
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
X-List-Received-Date: Thu, 19 Sep 2019 21:34:34 -0000
Content-Transfer-Encoding: 8bit

Use appropriate variable name for root of partuuid.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 2e400bff41..f8c73b9726 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -27,8 +27,8 @@ rootfs_run() {
 			fi
 
 			if [ "`echo ${bootparam_root} | cut -c1-9`" = "PARTUUID=" ]; then
-				root_uuid=`echo $bootparam_root | cut -c10-`
-				bootparam_root="/dev/disk/by-partuuid/$root_uuid"
+				root_partuuid=`echo $bootparam_root | cut -c10-`
+				bootparam_root="/dev/disk/by-partuuid/$root_partuuid"
 			fi
 
 			if [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
-- 
2.21.0


