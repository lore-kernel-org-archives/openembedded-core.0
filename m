Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B51A470016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 13:29:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u65so4575963wmu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wZwoDMkqkRsKzSXPjyjzean7Au1tC9uBAv9Xdu2cMIg=;
	b=lclODJuWE8KH+8k5Pn1pqdKFsDWngzcqePeGTtnFttobMpQetOIyQv2tUwevwIMRL3
	2octBLfBQ2v5AH0zG9zvUTcnz6Qc6TPwxrEYkiiDcWiLN0tYAlk1sckLTyKhTWn9GECm
	8YddhuGs9FTHn/jGyjtzuaWU7Ool5D4l+I2rxgE/YP0/iZeDSyd3IPhSlpV/rO1pmFgD
	I8lmmbTpwna9fieZqLX42iYHNoFBs8SC3xgX6Esru9urxJQH7vNwplX/ELqhjx5pf4Gr
	pUXjI6TbKb/Ag2H6WNhk7T+eU0iRut49zkRKz1+9H2G39F5veL7v2/SxXshzjYNK2DT9
	Psdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wZwoDMkqkRsKzSXPjyjzean7Au1tC9uBAv9Xdu2cMIg=;
	b=SZLzgOft9g/KsTyXiuS40S1pqzn0RbYGT+dMim3hjbGFCy5dYuMwOJ+ZDuCmxGJ2rE
	n/gqjJskiFs/d9qewWJaWRIr0T8fT5zWz41GTnnC8S+iWMBVco1kEvYoctmncHmSHWhc
	a5C7BR7Dpd3BiSvHy5Kf+zY6KTOaefeoo7kQJdPyyQ3tAeo+B+kx/LijrvofJfJpUhAh
	45/+2pGw2DvvUoI2CdmixLZeXDveVjy4dBp5on9LcwgM+Sn4OYxxArJAHkHV/pPNCB+T
	EMFoNPebopiicX43q1GjOYwX6Wyf27EoAViss8owxpf93viefz2N0+sJp02rrgjFHtfy
	iCEg==
X-Gm-Message-State: AN3rC/6uhs3QIGztaY8ubH5ZrjsJX7TapSeOpSu2Cy6/DRJcizeesHCb
	8zPihIUD+t9Cyx2Y
X-Received: by 10.80.177.246 with SMTP id n51mr4619739edd.14.1493299780617;
	Thu, 27 Apr 2017 06:29:40 -0700 (PDT)
Received: from ip-172-31-6-138.eu-west-1.compute.internal
	(ec2-34-253-49-250.eu-west-1.compute.amazonaws.com. [34.253.49.250])
	by smtp.gmail.com with ESMTPSA id
	c47sm1231257ede.32.2017.04.27.06.29.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 06:29:39 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 13:28:40 +0000
Message-Id: <1493299720-13721-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] bitbake.conf: Add python2 to HOSTTOOLS
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
X-List-Received-Date: Thu, 27 Apr 2017 13:29:42 -0000

Add python2 to HOSTTOOLS as, according to
https://www.python.org/dev/peps/pep-0394/, the command "python2" should be the
one used in scripts that are not yet ported to Python 3.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 227babd..4641506 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -458,7 +458,7 @@ HOSTTOOLS += " \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
+    mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python python2 \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
-- 
2.7.4


