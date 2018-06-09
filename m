Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B53175402
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 15:24:40 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id n15-v6so24355286lfn.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Fv9hbs8Xp6k6dCA/Z2q+MOQiU27fj7CCYCz9UtLekko=;
	b=vEkRwRS2Vs3527Y9zpv9RWzeEokJOI/W7pQZ1UvEmgWrNV3R1mRDMb8iGN345lLnl+
	4MZ4wrSlKnwHgdB9V+1qGoF/jnFNVRkG0vHWqkqybQ5JsCd//5aTTxMkj5N8d/S/mHyi
	2GMm0sXc+/3Q0mocUn4lG7P0CgzFv2FnSHgvLyzunM8i9XHPzvSTfe63mn7OVAO6t8gD
	VdlEFnFkRSDntQ6pX+kQJH2ToqJtlCDQxzg2b36Qidumy+WrwADnfX9SiauqAlliv31B
	d5t53XENrbUtgyGbsrBSMIe8S9uunwhDOZIZNQtVYrusf8AQmD88ZAjWBa8gNRA9dj7q
	RG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fv9hbs8Xp6k6dCA/Z2q+MOQiU27fj7CCYCz9UtLekko=;
	b=XOxS8rD290p8ynBR6cIpwevs0j8dIYyQN7ofPTpPpSbUwzl+qYOseOIvzGy+ngDhhc
	7olrepTMdLOv5Cj/WauNN5ZckI7+zReWLfeo6rVo9OFTAe8RtTOCVyJWqfsbk6u4q8iD
	CuvKjZHP4XP0djPu7wfxsRpgPnoTFh2MTkrJEGqCuGcuDC0TsFcQ2Js0KSyNj2jO66rP
	gg8ju/sDoAWXhAtSY63ehZhLRwBXqn6jJsZHSqwV7HyY914LUuHHyuazTsjN5sj+US/F
	ZI/2azSIMVKvhLAhS14CRPuGvjfPZQK1Bnaxp0bN67T8+16nQEjI/CUxZCHNldldGASZ
	Py6Q==
X-Gm-Message-State: APt69E2JIQTiHUahwJu7ntjKzrH23bTEwE3P7/TPwhZhnDcq4vImGQLb
	kKunjRfqvMTbbKZTS68KOaOA8Q==
X-Google-Smtp-Source: ADUXVKIWht7B5ALROuy3tOsj3H2cv3VqEO94xpph3OiV/L5EBIx2MCmr3MmBwEcMFbMbtT3cChYQlw==
X-Received: by 2002:a19:5353:: with SMTP id
	h80-v6mr6822658lfb.86.1528557881389; 
	Sat, 09 Jun 2018 08:24:41 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	l8-v6sm4859805ljc.25.2018.06.09.08.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jun 2018 08:24:40 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 17:24:37 +0200
Message-Id: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Sat, 09 Jun 2018 15:24:41 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is useful when the users want different variables/tasks when using
multiconfig.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3b2ef9f..8b2555b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:${BB_CURRENT_MC}:forcevariable"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
2.7.4


