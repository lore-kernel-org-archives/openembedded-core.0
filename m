Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5448476017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 14:07:14 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id y17-v6so12034464ljy.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=0aJufRMzG7bRVdzqFHD7IPLFy9g02yUocMhnSw/2GM0=;
	b=huO9YEmsbzhk16bg9IuHuZNDmQYBrT1q/1XCGyTy1H8NY0v0FQyvzjrJeF1ZHOUBhu
	zAHQ6CQM0giu8Lj/wnzTASEi75w1+P4FunZhSbeoDO/lKTE7X5iRD6o0iUA5kHCN8LzH
	p5ypfnIPm3TGf9hGkWVnC36r6UjsVPzcIZ5qCDB+r+BFaiQqQdWBovRCbUHhsSTRvGDR
	dOCn/Iqr/zkZwn2rrm8CUjruKyTgXQhQLbN8jPK/OZXI9syh2LoI7UEI1xKhCT97Xoun
	sTLgSF7fmX1dv1Cdj9IrNxSlNoIxocbiNMF2xo+5GIcs6JsJd7uKb+/NdM/hsw7MBVie
	tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0aJufRMzG7bRVdzqFHD7IPLFy9g02yUocMhnSw/2GM0=;
	b=ea58vvoIDyjobXhF33F7QmR9ePtN793q7WsrL5dbGLCdrEvK0pbTxY7c+Iwb+LEpsr
	qQ9A9HK73A2pRBnNV/qcmNSx8dkjBCFL3aUN/dO/cG/qfff7YRbByGNTSnx6DLzlbQhq
	mghUZapF8PGaD2PezeQSauxl1Tq15d9UcxZVL3gczc6usHfBK5pShidtPPwFVCZwuNwM
	k2Ji7Zlfj3CiXw/X6yU2MEnty5w6BUs+yln2WnoMOZErVT983/BVEiaticBwBc17H8Q3
	hSBx05TotXTu5yVfH2hJjH0HpOq4EGjThAiJ0X2LfSg7+89Cd/zA/23bAeNNT9NsL0/D
	YyqQ==
X-Gm-Message-State: APt69E2VyHV9QLQmcRlDo5oj+4lrYfJKhESMJloo1wk1JoYIPvw5BkUO
	ybNEHXzdP2AJ95Y53hYUOlWChlJucEk=
X-Google-Smtp-Source: AAOMgpc+OwStvIzrepYKbHj8rIVQeN+3qXw6+f5sKKGUigUU1cyO4u4LOGchqX9Odi94kTTJ8tq1/Q==
X-Received: by 2002:a2e:44c6:: with SMTP id
	b67-v6mr16394522ljf.102.1531231634398; 
	Tue, 10 Jul 2018 07:07:14 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	g28-v6sm3214198lfh.92.2018.07.10.07.07.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 07:07:13 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:07:12 +0200
Message-Id: <1531231632-23678-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/1] grub-efi: Provide target architecture for 32-bit ARM.
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
X-List-Received-Date: Tue, 10 Jul 2018 14:07:14 -0000

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 7bfc8ee..14fce97 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -25,6 +25,9 @@ python __anonymous () {
     elif re.match('aarch64', target):
         grubtarget = 'arm64'
         grubimage = prefix + "bootaa64.efi"
+    elif re.match('arm', target):
+        grubtarget = 'arm'
+        grubimage = prefix + "bootarm.efi"
     else:
         raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
     d.setVar("GRUB_TARGET", grubtarget)
-- 
2.7.4


