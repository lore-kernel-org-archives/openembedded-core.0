Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 90D4271BF4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 21:09:29 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id j92so10311232ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 13:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vmP+/K7sW3O5MBi0ZtpRhRf+1eqkf1MfZ4VpwXap3SE=;
	b=nbUwBXZskdLXMTUX2j8zc8BgjAaYaiMmqPyjgjj//BqW/+G7VakPGxX03fGUJO513t
	VewCCcXXBlHuDGtWysypFRIww6IHzdoPsusM3P7LkzU3MvquTP7xGmNb3D6Iv/Ti4h2h
	Q1NDzlj0XfYpLK7yfUGY0ElPjGGM3ufHczaxrTY35dg9oc0ne6gA58qAeZGuNINXwV3X
	GlwTsa4GsrQbIrCWGDeswplwBq5K5Vq3QKJ/050T6Z1gtjd/RuIwnDXEp1kliMszobGl
	jopxnSaOJVSz9C1n1JORNJB05Pb9hu/c4QXtaBbXnwooVnynSlklHg6fcY+UCiFaBE3v
	ujKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=vmP+/K7sW3O5MBi0ZtpRhRf+1eqkf1MfZ4VpwXap3SE=;
	b=a//fVl5EFogFSiBWebbe6RoaTmrW5ln4awhzNh3Xz3JS4jpTF+mjUD7GzL8HRA3iaT
	62ijlHDdVWXVWASOkitmjArSS6vzjxPMtG+sIvZClmB3NP85jmO6AftUI5W7972BHa37
	ct5nFvEa0W9v3D7de4qqQsZ3ZzcB8uCYGzsUHrF0VLnso2NZDNlOXMHVGP6vN/eLhgKI
	gBgM+4Wf3FyIu/2H6ml4ddGOeXYpsDOeh0ODhhXdmTH3c3fZvVpXH7489u8cHqqRoOV3
	R0QjfShS8BUnMmFzauaDzfbxq6LG8O+EQSrS3let5ISSF30Ys/O9rZMZggqxvTmnJY43
	YVyg==
X-Gm-Message-State: AKaTC03rhd4Xd7aoKzrIEpdgI91PpzjvK8/v5J6pM8a63dyctOmbC/qC9YRm+wilUmFdEA==
X-Received: by 10.36.40.139 with SMTP id h133mr4542280ith.40.1480712971273;
	Fri, 02 Dec 2016 13:09:31 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94]) by smtp.gmail.com with ESMTPSA id
	i62sm1696438itb.12.2016.12.02.13.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 13:09:30 -0800 (PST)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Dec 2016 16:09:23 -0500
Message-Id: <75a0aae27b567c72e329ff6ebb1558b648d71654.1480711764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto-dev: update to 4.9-rcX
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
X-List-Received-Date: Fri, 02 Dec 2016 21:09:29 -0000

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 9154bb7c3113..0cda553afdba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "4.8-rc+"
+LINUX_VERSION ?= "4.9-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


