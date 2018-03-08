Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id ECB9B7891E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 03:18:53 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g8so1731880pgv.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 19:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=J4Q9UdlwruTllrCnk1GVAgr3yDAQEyMD5Jv2uX1Fyiw=;
	b=mApdpyyOJRzotiMq5cZZwJS5DLPS0TkDyafSffRgQN7JtnjJcq8Iki3FioEtftPHtX
	/SX9JqyBxo7NWSO7EmO+2PPZ2IxXnH1Gfwge8w6+0TJ3Lc2+8AxBfzEq6TChB+Ql3jds
	/8hvEdA1Y5CmSzKwDfYO+US68KSX761DIGGXcTaI79p7/a01e60gY4LAd3T/DTHCt2Sg
	9EKLR8z8H4NHTsLqp4E1gKHNxSIN3sRejwqQrmm17nrP3fFgKOQMfh2WgvzmYenoGKqJ
	2pl0/sLbZMZ4snproDpJBaM0L/iDiPRyvEVx6BMyIHbyxfafXZQk/ROShQMU0Ya4okhv
	t6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=J4Q9UdlwruTllrCnk1GVAgr3yDAQEyMD5Jv2uX1Fyiw=;
	b=c2OEqJpn/2KeMZXKUHTqueZy88v+7AlCt7+JJiY8feRbTSv24QxTkwzclLV8jV4R1m
	ewbK6UfDJoBPAoxKjLZIcdq9M6wPYkgz40lIfm6LfUvxXCjrNntKMSGQNI1bvCHLXQDO
	QblYnivg6Owjf5RjfX0IaML9eFSH6g6sl50ZCjiz2j+glvSXtkxDLbIL7DyOqRCKzoUX
	TQxXA6KF0hVhkgFAyrMxiroB4Y6/DVLLDRYCyPAEUXHQ9i9275eRTy7B3KE4xlJ94WQv
	e2g773fsNTrXhUC4VA8My+k0nOmgoGyymMJQVfmywGX2VQOy7Z1+Q0whBJhWNRU5/MHg
	1xBQ==
X-Gm-Message-State: APf1xPBFPl0cKBxoe3ZhytFd21SPToIqaLCbDdiTi3WPAM5JvJzFsCeB
	55epnVIqDEvDHmttReOi08Q=
X-Google-Smtp-Source: AG47ELua4GEG0lrp2DEysqQ1SS20luva6RxYD3ObUdJF8x4kZRDoT38FveuBmMRYXg4Nk1ox4rw0pA==
X-Received: by 10.98.57.215 with SMTP id u84mr24395851pfj.152.1520479135440;
	Wed, 07 Mar 2018 19:18:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	a5sm35203772pfn.66.2018.03.07.19.18.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 19:18:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 19:18:51 -0800
Message-Id: <1520479133-30471-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [pyro][PATCH 1/3] linux-yocto-tiny/4.1: update with spectre fixes
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
X-List-Received-Date: Thu, 08 Mar 2018 03:18:54 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 5adec18..fe46a0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.49"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_machine ?= "c71e0bd7f702aa090b9733ad4e0382ac6c5908dd"
 SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
2.7.4


