Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 378A878AAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:13 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id y207-v6so23146971oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FsMhr9/DXVko6Ou8qOirTK6hK4lX1LuONtIfKbOpOSw=;
	b=kQQtGgjoh5McVV17S0yEIpP+ufMyaRim2nQkWB9Fr+DF7PAlyvbMoXjPeacWGQIpsr
	UevFYRpDMJ5z5pBhOSPcjWnP5g7x9epDfTQZ+yXE5BKigR8JcTBhrMtZ55f1iScjyPC9
	O8NxLveQNsgN23gQ4fkoAFvDK1ptCRYVFH+cQjAG7LoOnk6y5lK9g91JE8mEjOEfHDXq
	rkMpmuflNts+EF8krJ+QIk0Ly/8/DMn/rk2ci9sVwhq/kOdlI2okqsrCeTn3WsQIn18z
	R24TXkAHJUjA2UrO99DvuclAZaKcjwLBHUksuSx6Hrujgi7RuXhoLLmxbki08nNlN14i
	wuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FsMhr9/DXVko6Ou8qOirTK6hK4lX1LuONtIfKbOpOSw=;
	b=jL8YETIG+VaUWyR1PagiQhKeJmvJdib2QwD1kRh6ZJckeRSBda2v71pCU9WX4yc3fY
	PGJ0Lkp9keneGm0yR1ojaDoDykUeev3UchZJYmKxdiCsYqqSeIWbxgA2/8qzHktg+D5q
	jC4kIMoI/ESU/k4Lzvb9FyC4Nbh4hJt/jq1EMjfVL0pKMorZy/JhFynM05vfCW5c9QNs
	PPPjAQuf71tUzD9gGVFvWc7RmPPTkU7zo575XdMi0AOwra9trLwUbM4iHf9IUE8ATS+k
	Rb5s8o2s51TwuKcAD8M7EM/W2ob0EuAcVJmDJ0/L7l9we3umpvWLr9m/KihKfcBlhAa1
	xntA==
X-Gm-Message-State: AOUpUlFn3hoiH4YITVdL+ppUbRvteG2WGvb1fSn+lkvAdZnHDvE+NWU0
	aYhcTWE+0SLNbPYJNbT53Oq78Tvd
X-Google-Smtp-Source: AAOMgpchF+hl1I731u1OV8m6XSmAylaZ7NzzDv+DxVWZFl14RZKdIvujUnAsPn9WrnCef0k38sV+Ow==
X-Received: by 2002:aca:5cd4:: with SMTP id
	q203-v6mr16356189oib.217.1533572414154; 
	Mon, 06 Aug 2018 09:20:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:04 -0700
Message-Id: <1533572407-3066-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 5/8] linux-stable-tiny/4.4: update to 4.4.141
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:13 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 8a98189..96df596 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.113"
+LINUX_VERSION ?= "4.4.141"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
+SRCREV_machine ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
+SRCREV_meta ?= "b41a36ffe53f73c86a0f3672d32b5ebec59ab15e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


