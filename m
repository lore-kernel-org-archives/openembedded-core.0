Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 11B687CD37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 05:34:30 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id l15so19604712iti.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e/lGEd+I5/k9gYPlyDhj8M4efRk5fjRlgIwkovH+Scc=;
	b=Y5TkTUYVkiO9Oqe4CHkxixv9cShHXczf8AB8vRWfWBCrxlIOx0Qw4OkCDkJVNwgHAO
	4FouJtE/ggi8g8+0KwlFvQkGCmeLiH/bCMUK0XEgNrnyGgoNmoRHEU3haV/mOjyhK9e3
	PwqaiOMWq7EsoXST3YCmFyEwWI7viMF/aRf6J+kmYgg6oniAED9HUCGPdzQZjfag1yoZ
	UaAQ6Kz9+3gwZ5gd8SZ/wRzRwgZUxsRUkagiNujLsGDHVKbEu5F7fKaEO2jGcn+HPcRx
	+D/TaK7eqMI1sYQPgmFiJB0Z6mq/FNmy1TbTcWnZ59YFSBaaOlWR3j+vqQQSq9m2wRko
	e+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e/lGEd+I5/k9gYPlyDhj8M4efRk5fjRlgIwkovH+Scc=;
	b=lG/iTAGhALhyauS7UpE/gwyyjcoYOL5VfMXPOebszJoTfb1nW3tbzmDQSfTzTt1749
	cxJz8pJIU7ep2fPLBDpM4UqmRpMg4HOq9ygXcRaoxkthyDdbAuxR/R+WFiBta2WMDliI
	Eq9g9LJV6jK6AVxzNbAtsg/ohlDzEZ32BffXdyL2ONlmiezw9BZXUv0NqfPNse1me4O4
	Vqvx4z9bYUY0PqzFUt/JJ1+aVcKcmylHYjaGEWki5ZiGhdb1JH/0+YJDWJEGQImGhyL4
	deZlZE3NIqt5HTmqofnVb7dupf3XqGJCFFcAaP/Ocm8eKvElg4kyRy7IDi+gIIBxU0FC
	qeFw==
X-Gm-Message-State: APjAAAUwtNXVlAxzvP0xH9jpRRtsfRb1P3Yb/evaMe7Du2Zp9bpjg8wN
	bvFAWtL7NRja48vp+dGndRp1wetwVAFVZg==
X-Google-Smtp-Source: APXvYqxmWe580pOtJC+KJf6EQCqnKcpLA05eiORqTiGWCYNhUDhflsh1yoT/JSdtU7C6ocjV1UVoQw==
X-Received: by 2002:a24:4109:: with SMTP id x9mr2103825ita.92.1551418471007;
	Thu, 28 Feb 2019 21:34:31 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id k77sm3935110itb.7.2019.02.28.21.34.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 21:34:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Mar 2019 00:34:23 -0500
Message-Id: <21f703eab2ab622967dc4c4e90c94872b5594b0a.1551418113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551418113.git.bruce.ashfield@gmail.com>
References: <cover.1551418113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto: netfilter: Enable CONFIG_NETFILTER_XT_TARGET_LOG
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
X-List-Received-Date: Fri, 01 Mar 2019 05:34:31 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

[
    In order for logging to work, as for example seen with the default
    configuration of 'ufw' we need to have logging support enabled.  This is
    currently gated on the CONFIG_NETFILTER_XT_TARGET_LOG option, so enable
    it here.

    Fixes: f56608b405f0 ("meta: cleanup invalid/obselete 3.4 CONFIG options")
    Signed-off-by: Tom Rini <trini@konsulko.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 345073bceb..328cd2ac12 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
-SRCREV_meta ?= "8d7d003531151ba0a0e0cdb3cefa0bf9b0e84b55"
+SRCREV_meta ?= "83d017da0cc6c84b0167eafcf2811d0717c35b86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index df8ecb6cee..b52c82d569 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "8d7d003531151ba0a0e0cdb3cefa0bf9b0e84b55"
+SRCREV_meta ?= "83d017da0cc6c84b0167eafcf2811d0717c35b86"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 48949d3f9b..bfc9285ccd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "8d7d003531151ba0a0e0cdb3cefa0bf9b0e84b55"
+SRCREV_meta ?= "83d017da0cc6c84b0167eafcf2811d0717c35b86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.19.1


