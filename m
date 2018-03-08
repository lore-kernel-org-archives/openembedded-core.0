Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 126EE789FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 03:18:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a16so1827098pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 19:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lZkNjaTVg2o1nHGDmCJJ9PWgOmGArSjUX+fHZXWqF3A=;
	b=gHC4JAc5Lksns2rXmqcKAfRDQEtZD+jq5/HCHB8+f2wEJwjggkvxZlLis12Ix/+Ia8
	1c59cjEsgzBjtbJeAI/18HgG1RJqN+X30c6nH4GLI6RgniEN1AQUbIGFoMu0OYDeay6g
	TZ+b2IWIgRFZvqe9wmVjsSyd6fW2bwMb/n1peRmRO8ff+XqZIZMnI+8gVj3pdmUmNdYZ
	rWSZkhZzML/NwX5D1oem99LfD4+rcXfAHgcHS+n41LZRU+Jgg7gNYbIjb5S180rsS+Q3
	5LuGD+POkPfCvdvLsINp63bihKDNohRW6BhupyxoGRQkQTIMGcHsAnfTCTNqPSxU6Wzf
	+Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lZkNjaTVg2o1nHGDmCJJ9PWgOmGArSjUX+fHZXWqF3A=;
	b=ezzzBFO3+Vuf4laEjH90hRQQhYMrt91dwIfO6IQiw+7kCtc5GLxjjSb6KlELodp3zU
	0UiO/rGFsn6yejKJ37CwyhxYeVickxm0Nwl5nHvDLF+V4Y14LMXtUtHX5p1RX8tc3ijm
	o+ZEA9pr044t/36nkLJBrCETJnphpPMOeSFkXlZJKnvO6FNrwjmy0mK5SkxznkrpniSK
	4tggw+xqZHzX5FzMho5sNoSaoV7z7RGL5ysYUy9BspPxbhdZ2uUuDhC5ZvcfyAm0Z0dL
	XDKD5MyMF6UEJ32B4daJtMg4IJdoaamoSzEiY19FjjZhiCWoPAX3LukTWF4t1loYBbSu
	kuSw==
X-Gm-Message-State: APf1xPC6SJI8dBs3wNgiU/xFYqUJDjwv8Xly6wNO9FnuTiV+eLOzSgN1
	GeG/b+T1nq2Kc14Vd2/2XOk=
X-Google-Smtp-Source: AG47ELuadNu86850eerGohggEVYXFajf4ZwqmsJmi7EaZHV/JMVnGFh88Zbtm/HxWXq5ln8lU9U3yg==
X-Received: by 10.98.231.26 with SMTP id s26mr24832335pfh.210.1520479136399;
	Wed, 07 Mar 2018 19:18:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	a5sm35203772pfn.66.2018.03.07.19.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 19:18:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 19:18:52 -0800
Message-Id: <1520479133-30471-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520479133-30471-1-git-send-email-akuster808@gmail.com>
References: <1520479133-30471-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 2/3] linux-yocto/4.1: updated to include spectre fixes
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
X-List-Received-Date: Thu, 08 Mar 2018 03:18:56 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 230f81e..30abef2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8a40392c9aab6a3b25560c1a5d4a31d87a65a088"
-SRCREV_machine_qemuarm64 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
-SRCREV_machine_qemumips ?= "ea667187404992a98d49ea62313f826e6b7a9849"
-SRCREV_machine_qemuppc ?= "8c3cd05eab5cf9c49847ed73d77f1d036808b5dc"
-SRCREV_machine_qemux86 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
-SRCREV_machine_qemux86-64 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
-SRCREV_machine_qemumips64 ?= "4a026b26ffed34b40a7fb8fd190ee3eed964b5ea"
-SRCREV_machine ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_machine_qemuarm ?= "f20a35023c5d96818a7ac061fe8f08432d8a5088"
+SRCREV_machine_qemuarm64 ?= "c71e0bd7f702aa090b9733ad4e0382ac6c5908dd"
+SRCREV_machine_qemumips ?= "d1367fe15275de31711b21fa736a86f99fb300c5"
+SRCREV_machine_qemuppc ?= "e97556943b41cb6422842a348ea50a3630afe78f"
+SRCREV_machine_qemux86 ?= "c71e0bd7f702aa090b9733ad4e0382ac6c5908dd"
+SRCREV_machine_qemux86-64 ?= "c71e0bd7f702aa090b9733ad4e0382ac6c5908dd"
+SRCREV_machine_qemumips64 ?= "b23f3f4a74da40c3302d95f601af333c546e6999"
+SRCREV_machine ?= "c71e0bd7f702aa090b9733ad4e0382ac6c5908dd"
 SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.7.4


