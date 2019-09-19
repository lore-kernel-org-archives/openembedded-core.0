Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D7BA77FE69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:53:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 205so2910045pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Byg3gaxXG1qlC8koXUDdKPDRtmxUbNg4VOH+rFV7htw=;
	b=X+8sxAtEihmQNCk4z29f8GZ2pj1Y64A0difxfyLrlSZLdaV1Cbnfbxmjb/ZqNQFsbh
	VwffizlYF9v8fymkj8Na398zDaWXZZ4CaWU9wGHBtGULQimlDVSVp/0TeiNhVnRhRmP9
	JEyy3J5fTEkUHRFyvDFIUGLSmO8SMY3gEIch9WGiEo+3J4bbkvxa0dpv7OVcULbG+I50
	P90jNyEZsOb9KVpXnonwpPQ+dgZ7T1MEt9tuKauXjYNzXgJ/pY3km9jRuIzswiu1+IrT
	YpUBfyT/ByTO73MgM303QSnEskEwp5FaAxSKwCl5mA3K/VFTG4tXXFJJrZ9UXYU4E5SV
	MXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Byg3gaxXG1qlC8koXUDdKPDRtmxUbNg4VOH+rFV7htw=;
	b=NQDw/Ub6TuelvCbOJs0AqzinMxPQeFRppiczy78EJt4X+WF/y17LCAAgX8tf9MczRU
	BHSNTcO3nyXF0tk4Wz0+CVYndM1X588LQwFkETa3rJPmdC044CC/WaRZjfphxhZR43iL
	ZIMkp+nsW3okYa2P5SnB1+SyXHGY8Nd0SjccPYS6zsBOqZFSyAoeU8E5plr0MPMzMFli
	axcYjTcsMHm+LLcqxwk0lGNn4Q1lblFQKaXQAGM93vO9TosOx9SQ7Yb44nZ8Kr/HF7ZF
	nrARCAsQ0A0WcKuDsP1CJr+3if5mof/gLtVdwK4bb+HJgt4GONRERBkIc5Gn+zpxwtGz
	x5KA==
X-Gm-Message-State: APjAAAWso012I+udgm1iWF/yBSMPYDKKcLgRzDtDe6MEzrZxEei18eH5
	1wMZ+HI4weg0Z4Tfb6iH8AJFWllfzRk=
X-Google-Smtp-Source: APXvYqzaU/KLw6+f9wnJOyKE4Ogy8sBAe5AtyFVxRpJkUopWSyAQvGpp2n0DVaa0508VRHaPPMkzpA==
X-Received: by 2002:a17:90a:1c01:: with SMTP id
	s1mr5409758pjs.76.1568919231361; 
	Thu, 19 Sep 2019 11:53:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	185sm10767697pfd.125.2019.09.19.11.53.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 11:53:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 11:53:42 -0700
Message-Id: <20190919185342.834295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] layer.conf: Remove weston-conf from SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 19 Sep 2019 18:53:51 -0000
Content-Transfer-Encoding: 8bit

This recipe is gone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 3e85843484..95b1128ab3 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -73,7 +73,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   font-alias->font-util \
   systemd-boot->systemd-bootconf \
   systemd->systemd-conf \
-  weston->weston-conf \
   weston->weston-init \
   weston-init->weston \
   weston-init->kbd \
-- 
2.23.0


