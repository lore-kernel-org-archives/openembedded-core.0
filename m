Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 60C517892B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 18:49:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y5so525569pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2pp7zM6Qgzi4Sex8wcCNjCEkMt67neJ3KHirgTrbOQo=;
	b=uDRyM6gCj3jvaLzksUVV1XOZDUcKLkeLDDx7xT5R5PjXQcySP/R2AOsv6feRcI0yYC
	2L2vbUERySwDXyms/bpa3+XGsf2ybYK+4yU3E2RfMCjI573KqujdjAC8fYZHtV3T45VH
	JZtL0Ns9zSzUQXz2PCGQY/8TacJntWYHBrWFz9AxLIwlICXdDqW5pJH3cx4NZFRQfMU7
	mbjyJYaub/JJs+CA8Xe2hjW3Ty8CqitQb9lI/yUh7vIIkFCkcq4mkW+ma6HbL0URIoiA
	YoempLe8UnbfSJM8JJc9Ac7b/LV8QDE3rREQSV0kj3p6FXrpWj9jIAUfE6llhqMRzY3t
	kcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2pp7zM6Qgzi4Sex8wcCNjCEkMt67neJ3KHirgTrbOQo=;
	b=IbiU5beBJ+08WwgVTuRB24mTU86ZR3xvPYNPmlUICRdu+2HePmonm6dGUSZqwPNWYt
	rlOECsIpHzp2EWKy+7h+ObW6C+4PzReBT/5mJGiPoBCe5+qrhNA3CCD113ILgdBgqTq2
	5KWRrkKJNs0Ar4cPUOPRl4oRofKOV8b9mpLTO9waPenXLlHwgl0mnsTF0Vh7AhqKSIwL
	zig1q6ef+x3YrQXAHn14Q7BNqqCO+2j3zKVRIiEV4NYJk35tgM7F8SPLr3KXQ9c9gJ6+
	NSCBqtsxNVaJiZeS/bHf2k+njrNr/f6+e710j0XOmKua5+m7n5ssRmX+YG6WXEFHipok
	Z6RQ==
X-Gm-Message-State: AKGB3mKewCyMP2wqBx2mFPmwQptjVwdsmCRIwyE8VZwssY2e0gz9LQ5V
	EmzO1vT1LMJeBC5Bv9ramn8=
X-Google-Smtp-Source: ACJfBouMcIst3z6yV6Vw1WDezclGqL83kbw7tqTb30eWOOpOORTswabLmrYwfGxSrnRG2gMP48qZFQ==
X-Received: by 10.84.128.227 with SMTP id a90mr4911574pla.130.1515350949616;
	Sun, 07 Jan 2018 10:49:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	r77sm23618823pfa.78.2018.01.07.10.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jan 2018 10:49:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 10:48:58 -0800
Message-Id: <1515350939-18246-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515350939-18246-1-git-send-email-akuster808@gmail.com>
References: <1515350939-18246-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 1/2] linux-firmware: Split out the QAT firmware
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
X-List-Received-Date: Sun, 07 Jan 2018 18:49:08 -0000

From: Saul Wold <sgw@linux.intel.com>

Create a new qat package for those firmware blobs

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b48c746736012cfd85e8263efcf125ecd17ca7bb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 5e2b8c7..4828b6e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -256,6 +256,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-netronome-license ${PN}-netronome \
+             ${PN}-qat ${PN}-qat-license \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -699,6 +700,13 @@ LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
 FILES_${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
+# For QAT
+LICENSE_${PN}-qat         = "Firmware-qat"
+LICENSE_${PN}-qat-license = "Firmware-qat"
+FILES_${PN}-qat-license   = "${nonarch_base_libdir}/firmware/LICENCE.qat_firmware"
+FILES_${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin"
+RDEPENDS_${PN}-qat        = "${PN}-qat-license"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
-- 
2.7.4


