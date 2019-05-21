Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4307E073
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z3so7671475pgp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eS+TpnDfmc5bgtdL+ga8EknybPK4sJgGhaKmDYrJNO0=;
	b=bHD6ovRET8PZJUoM9OZP/yvw30FqNiadze/4fbRzOVAyzmuGKi9AtW/0ci8iS89fkO
	SBbZtgDa6Ui21wtbktquEhPrSbi/2x//c23en4a09vXPjPhRXTZlc9i5/bcyHW4z1k8i
	lnF6vXL5tgiUqLKNlBO44Aa6zYFL2gzZrUSofP8CceUUNNtB5LGSrbUVSg7L6cQictkn
	IZU5TKvv2WsOXUcGUctgc1KpDeq5aaVh53qmjX2EmibeLxixL93sIrp0pwmaLYsfcs9Q
	XsWscQMupxOdrHIRqAmmGrPzBa9cvgghTUzE96jwLSp6fLFVOkfAb5TG/H06L8KSyf7P
	/gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eS+TpnDfmc5bgtdL+ga8EknybPK4sJgGhaKmDYrJNO0=;
	b=pfpbYnUnXrDoxzUxPEqHOHWjtrUOWnEL6oSFc/l+WDI9c9jW3SkizFT/ncspw8z3SY
	OrnBnTbrGLJYJysFI+B5/18JXFJKDoFdr6bOIODWgxUoHobYB/go06bO/1xiM6bCQCit
	t8PcQ1PQ0gaJsWUIKi7WNC543popTTgtcehC07027sYq0aJry54SUNShvHb4MDHaEDSf
	KglxNfNELTd+6frPvrjJvNEIb45jw1olMNyL6s0GgP/+Z5HCLcpys64TW6oERNotYU+M
	2hGiCiQpL9rd4alEo5n/xoiBAnDw8/zoHkxjdvqccNQ+fRgTqG6MYJJ9u1qzG3CjTfsx
	b74A==
X-Gm-Message-State: APjAAAVwTKhKd3csWbGI5pdrfiXNKSzcAgvf1Hiqm85D20M3up1AyFw3
	x12y8jvtcs3OhBaKoPnh+7kJ7IFx
X-Google-Smtp-Source: APXvYqyypaz81WKysZ16Gtq4aEutLe882YrftyY4TbSB/6Acii+wMOO8w/brQGPISRqeD81CoFQmBw==
X-Received: by 2002:a63:fd4a:: with SMTP id m10mr78075575pgj.302.1558403011264;
	Mon, 20 May 2019 18:43:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:13 -0700
Message-Id: <34c283af5ae1b83fcc7cf07942df7a659bfaa921.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 11/15] wic/bootimg-efi: replace hardcoded volume name with label
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
X-List-Received-Date: Tue, 21 May 2019 01:43:30 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

volume name should refer to --label in .wks.
Replace the hardcoded volume name  with label.
set "ESP" as default name when no lable specified.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 83a7e18..19328ce 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -258,8 +258,10 @@ class BootimgEFIPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
-        dosfs_cmd = "mkdosfs -n efi -i %s -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
+        label = part.label if part.label else "ESP"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.7.4


