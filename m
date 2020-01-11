Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id A2FAD6D561
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 15:31:42 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v201so3730079lfa.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lxhDMhqtzlpvxBhxG0rdNpZGEFUfu3TGy5D+NW3fblw=;
	b=EZ+cLf7vifPBDWvd6TlK4zIAiJb0ootJ/9lMIo07tfpKnCSTv9Tu5xc+w5PQ46Wxm0
	Px0uaUfvgsFcKxFm8FniA9gETx9tXasTJZTTu3d17Ew4jTHmfCw2z1BgSO1chr7RxJ7u
	OvMGSgrJcFwC8dKZC8B/ul4/bsVAYrM7vQHbjomkBHz2+AS+9c7F7TogVEs8dnAntLT9
	ohXNH0imMnlGlUWkSFzgBr4BBTunP5qhPdMNE+J6Q0Red32paPWaDj4XgeOYXWOAe9Xk
	1HHpHtmoFo0TMjG2m4LsbwQQHve2cxLDnHAX+ZxMXH7Xqt6YHdMiQHGfjY97VmuaaChD
	bh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lxhDMhqtzlpvxBhxG0rdNpZGEFUfu3TGy5D+NW3fblw=;
	b=LRz16s2Qbf0ooT//HqxyuM4bVNLOtyv/24uYoLvfM7+NSkNfQ3/YA8DTdhmV6eJBXF
	eVUUXbejnsPFfb6Hazu+H1hvq0llEYMSGrZNljTdldbLeauZrwrXk8NaHK8cBRYYBl9s
	RRWE2pRJt3zfjn2L/QW/f57g6Pqz8h7FVvi2WOPgOdjyka/FjwnglRRmgdBfqQU+OVXr
	yrFYaT9WHrx5o8TKLSmYlUeRHer1+NCXB3XF+fwZJwLXqOS2XpfgDcAXuv6BlmjQ7mHH
	qd1YQ809XrvbY4ik1OgMaVM+76YdmKJ9sEdtqszcc8chX/MNh4v+OwacH2rlTgpKy6kM
	PBDg==
X-Gm-Message-State: APjAAAUDRYpHySOtJZ7tJvyMZ8GM8vT3/m6gOVAXBZC0SN9gTE5E0qsm
	ngHPQAAesvN/yzL8OYomzO+Ez5+OCkmt/A==
X-Google-Smtp-Source: APXvYqzBGb5ZUYptkuKxwNOzpqV2KrW3x/A8vdraiXw+j+74vUWg+hN2DUgJMZDLr2aS5vgFjkGQxA==
X-Received: by 2002:a19:ac43:: with SMTP id r3mr5836622lfc.156.1578756702992; 
	Sat, 11 Jan 2020 07:31:42 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id
	y25sm2871897lfy.59.2020.01.11.07.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Jan 2020 07:31:42 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2020 16:31:38 +0100
Message-Id: <1578756698-4223-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel.bbclass: merge bbclass inheriting
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
X-List-Received-Date: Sat, 11 Jan 2020 15:31:43 -0000

From: Ming Liu <liu.ming50@gmail.com>

Merge bbclass inheriting lines to avoid being redundant.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 750988f..49efc19 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base kernel-module-split
+inherit kernel-artifact-names linux-kernel-base kernel-module-split
 
 KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
@@ -676,8 +676,6 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-inherit kernel-artifact-names
-
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
-- 
2.7.4


