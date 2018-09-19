Return-Path: <liu.ming50@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7A03A793B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:26:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f6-v6so1954921plo.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 20:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JjVnQpT++j4G8/l/Z9P+5qqwlA9YOllAnRrYfYyCKA4=;
	b=mVEC7u2j87xWOp+jLvD8N9m4puTvsyYKNmSjl0A2A+paL0aGXrDVDQ0QxRQn5h6E13
	N2sdCmUOw9GgFz8qLdmbZ8HRBzotl03kZ+YJxCwCfXcOqfx9ZuqQe+8ligCKz6CXzpGr
	gO6cDCiXAxKqdLGRjkWMkq5UJvtx101heKnN7MbwQoG30FOt0itrgWaHSD+P5TWeSM1i
	icFidHkk1XbsCwbyDTwyd9vFUCxFUT4K6JxOpVP+8VZhgxQyIVdLy7nT0qmUfsSjJI3p
	ED86V65aDtJHkUXhpMKvRZNLeJLYyrbj/wfvKaPRgUKPpDLVwWjMfzfaMrHo40FAyxew
	O8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JjVnQpT++j4G8/l/Z9P+5qqwlA9YOllAnRrYfYyCKA4=;
	b=haJ63wqVCpCc6SoEbo31uKFxTZWIYIo8JpDVd+2fYcYcOOCU6oC8VaYkBqHMVjXcMs
	twLBfQuperjDpjIOPC/NVTdm84lRQuhZUZ2SpUVsQmkLpdULcst0Kwyog5gN2BDCAVy/
	LwM5UJSOVAhciYrAgQx9wBvOWamMXxG1lB0vFqVyNtKZ/REy+gXX1EXX/Qs5ESiW2J7U
	7598bFCDKhOm4J6sRPmT08CTMwxATt6xa1DHnI+Wo8s38bOKvI0ltgl4s8xDsdf0MHZf
	5CDEgr5vVPReQtpxS9Ns4madx9MsbwoyE3q7kSD7Comm3r2a1z/b2t1ltKBDHglajNp7
	DOgw==
X-Gm-Message-State: APzg51CbIBlqkKsSoW7ZxxiWPa/ZMytSaEJu1t88v+bXvzZCVx15XWAt
	8XBZmy0c5SzdHtpSm6mSHFGeXzjZ
X-Google-Smtp-Source: ANB0VdZVi00aZDdnb/1Lruqpysrmx+Z4f7JVWuAk22WyePUAPk0pY1+iswR+7WrXB2IgvRyuFQtcNg==
X-Received: by 2002:a17:902:7614:: with SMTP id
	k20-v6mr32117893pll.170.1537327608404; 
	Tue, 18 Sep 2018 20:26:48 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(3c.86.38a9.ip4.static.sl-reverse.com. [169.56.134.60])
	by smtp.gmail.com with ESMTPSA id
	u17-v6sm39163235pfa.176.2018.09.18.20.26.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Sep 2018 20:26:47 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 05:26:41 +0200
Message-Id: <1537327601-24881-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] mesa: enable virgl driver for qemux86/qemux86-64
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
X-List-Received-Date: Wed, 19 Sep 2018 03:26:47 -0000

From: Ming Liu <liu.ming50@gmail.com>

virgl driver should be enabled for qemux86/qemux86-64 machines, or else
it will cause runtime issue due to virtio_gpu driver missing.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5afd0db..8d0e2cb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -91,6 +91,8 @@ GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RE
 GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS_append_qemux86 = ",virgl"
+GALLIUMDRIVERS_append_qemux86-64 = ",virgl"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "6.0"
-- 
2.7.4


