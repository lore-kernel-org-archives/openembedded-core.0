Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2019378C59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:01:06 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t25-v6so3540575wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HQEi36EIQuLlIhRO25KRyY0L6ha9fDFAvvN9Xi2YS/o=;
	b=TX1SHKxmbdNpsIf5Rgtq6fMjtLOhbJGIAb/zNXv4aKLcRn87SDqfy2MFj/M+GKdED7
	NIFrtGyg/f88Za35VAhPyWxqa6+1k80+hl/h32BvKB41/8wqijrKiRfoEp0Iho2SeLAL
	2SjQ4wHBjavWLy34eL3L1cFnWhf8nWCOphGCBdPr+3O2w4GO9jYIGhPuJB08o1cPQKOW
	FAn8Jit+CD/T4jRQhZdVGZVztd3+kLrIoOQUk1MoTybCtuo9ycaGHgCsTIBToxY+b6wM
	u733BLUZFAXas/NNc5OIjPDIuqJFhH8UY6REYIk2Ld0hPKIEdOyRBWQeFyYgWpycfaSH
	6lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HQEi36EIQuLlIhRO25KRyY0L6ha9fDFAvvN9Xi2YS/o=;
	b=mTqBwy74WWkoAI4OorI3dKJUPeQGmQmIIZhTr0ZXPuZB9V06j5xE9hMPRDRCqepo97
	KWjmAZVA4hlUPR2RUOrOTHcfztXDZDJ9cBnX+xXEBYo6m16mb9OTdiDiUgHaHnnnldd7
	wZjZ4uRnJDorM7HVAm/D0jijKvp92ja7DXV7hQCW7T5bsA2VjwHZxiOV6rhiIyVhzOAX
	/JUHm/PoajrvdvUAhGZvIOFU+xbX8hwh3MyYL187XDgtXYUfNcnZIjchEj79P0IwNrVh
	YGPHwS2O6bQ6qRSl8TASX59ybUTscUwHA5Br2D7mb7BhUFNxXsOiv0VAYkraOo/YumgN
	zU5Q==
X-Gm-Message-State: AOUpUlGQNbTEjNbMg5sBZ5pkMWl7EPrmi5lpPE5xLqBP7FvlaXTS4aV4
	BCKSWc9xZnLiB/V2YgYuhzB5vGTjCPk=
X-Google-Smtp-Source: AAOMgpcpWjMi3W3kIeMVoCffZ58hEIAtN+h/bt4s9TQALiO8rewm6Upy3k+L2olm/WVuCeDjq54lNA==
X-Received: by 2002:a1c:5c93:: with SMTP id
	q141-v6mr2723357wmb.133.1532646066492; 
	Thu, 26 Jul 2018 16:01:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h7-v6sm1948532wmb.48.2018.07.26.16.01.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 16:01:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 00:00:56 +0100
Message-Id: <20180726230100.6629-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/5] ovmf: remove ossp-util from DEPENDS
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
X-List-Received-Date: Thu, 26 Jul 2018 23:01:06 -0000

This was added back in the meta-luv days[1] presumably under the impression that
it needs ossp-uuid but in reality we rename ossp-uuid's library and uuid.h comes
from util-linux.

[1] https://github.com/intel/luv-yocto/commit/e08817342b9ea7381944e6c10c555d1c5c62aa6e

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index e57fa097274..d2ecb619d99 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -43,7 +43,7 @@ PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
 
-DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native qemu-native"
+DEPENDS_class-native="util-linux-native iasl-native qemu-native"
 
 DEPENDS_class-target="ovmf-native"
 
-- 
2.11.0


