Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id C668260767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:31:57 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id lp2so6368776igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+xYBEmDB+ePIZLRovFjmqtWPQnFSmJ2HwxmkgF5+OUc=;
	b=IPC2ZUC+fgpK+VDQlvztTW67Usmq99lwbTvYjZVI7UvYI9hpM+SMp2xLNw/z49UmWE
	VWnI0smNHc7PtfJU3jVbFnBf0LuFJcxkG7ch0DYSuNXxpxAGrqQM6uwmvMYQ7b9WC4st
	vfo/wfxjgPRf8zvRYi18pAv+wBc8Pfl2s/mq1mwGXm+4FHW0WIlh4X5omMpid2JOMHcA
	paQgeqYj4KFl4zaVvbyvPhr31Cwu32pwKivI+2tiH10KAZxF1ZCcSMZGL69lwSAbSkVj
	EOyXIftu50XSZjJxvkwISI0pFdaW+g3i55+w8eY8hRODOLZhM9x3/z94c5DHGR7ZCp2z
	7o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+xYBEmDB+ePIZLRovFjmqtWPQnFSmJ2HwxmkgF5+OUc=;
	b=XpDKzyd/nTY4LR94Ci7SjFzCFSyBWtfwOKCAOigRvZUt3YkAcUG9fg6OTm1QOtOY4W
	pgmb3bi8ALMVpgNgJtTx9/ZMnkiUYnl898RiG0GY3bLub+i6qtON8ME1lFRYt79yuSm1
	WtSw02+z7n7QmTIG1UAo2at1tl+OHquNY/46OEGrFDmPDOOJDc4OSTVvPtDfX2BOfIBP
	2f2vTxgYYVAYeW01gdYMaKSOxRuzLza4lQuE2kspWDKDReV7k8f5hok6GDyjeAvx4MBA
	J5lSH7ZmFn1Jl6iBlhDODa2m0oRTryfQDTaliwQg+0F9VY73rEbjJ7mbAcMapwFC2TbC
	Ok4w==
X-Gm-Message-State: ALyK8tIAUc8G9o1JaPqC310YhePL5fdaQjhvoU24w1b1mublzTc8M0AK21gRMhQ3Z2r/bQ==
X-Received: by 10.50.214.42 with SMTP id nx10mr5491365igc.57.1464208317986;
	Wed, 25 May 2016 13:31:57 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	w207sm7771019itc.20.2016.05.25.13.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 May 2016 13:31:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 13:31:50 -0700
Message-Id: <2db0b62305a20e906ab5e57bff2d3587628b0471.1464208170.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464208170.git.chris_larson@mentor.com>
References: <cover.1464208170.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] grub-efi.bbclass: also write startup.nsh for non-iso
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
X-List-Received-Date: Wed, 25 May 2016 20:31:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

wic will be needing this for its bootimg-efi plugin.

[YOCTO #9556]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/grub-efi.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index d0ae6c9..b8c20dd 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -45,6 +45,8 @@ efi_populate() {
 		GRUB_IMAGE="bootx64.efi"
 	fi
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
+	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" >${DEST}/startup.nsh
 
 	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
 }
-- 
2.8.0


