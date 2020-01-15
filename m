Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA2017FA13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:08:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u2so951592wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lz7pxGiowu92bk36Y7cz4bCIarlg+O74v2OOBakQOLk=;
	b=EF4pgzbY1K/WHh4wssxxhuRoJUY3nGXbhZlmRfv9K08ENQGWI9rZ0+AMshVCiuSz6g
	5DLGZr0EeuBG0v43qzkbi06iSMiUQYh5GU+BSVCLDppy6h4jb3ln52u6nqgCRZaxQfkC
	qsl9C8YmWZGNILbU4xajLACmDxByoKlTGOCiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Lz7pxGiowu92bk36Y7cz4bCIarlg+O74v2OOBakQOLk=;
	b=YiGOYon322qZ1MV8hXluiK+SDXrdAvyXVBJR61eIPyIGuE5Zp8psx+9YXKZQ27RzYm
	BcAp99OKoycOYx8qaeibAiPbM55YAGNRopRYa4GWVwmfjH/+vx+T19Lch5yDf+tFMTKn
	GE2f/H1Tz53ee2hmMcuzULLqOFI3RSmZSHwThzYDXsND8WblF4TO9urUtYP4rDc1AG7B
	RZSW8nDODX29Pt782y2PhYh+XbkqvdRRgyGvYO4WuC5pFH3ZDsaUXRUwoxHTQu8bIiug
	J+ameyOBINXx/KcO9Y4NCghfAVWAf8Ig75a1q3Jl66Q3SnsvUKTasP78clAGK9uzo99l
	izyw==
X-Gm-Message-State: APjAAAUmHfQu2uHUHPHPF8fUOtV3sPieex7h21GCswlzy7thFh0w/d/r
	OG5qkiFQsKjMtQMSxLVvsQu3Ut8Xt2FrCiZn
X-Google-Smtp-Source: APXvYqwmcgtF03PbmioBMCDE1LeKUiDRKs2RFSP1bBU74EJMifolYwHRoE6QaC3apI0iAJ8E/sIQ5A==
X-Received: by 2002:a05:600c:210b:: with SMTP id
	u11mr1215804wml.43.1579111727500; 
	Wed, 15 Jan 2020 10:08:47 -0800 (PST)
Received: from ub1910.Hitronhub.home
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net. [82.4.207.62])
	by smtp.gmail.com with ESMTPSA id
	s10sm25407454wrw.12.2020.01.15.10.08.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 10:08:46 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 18:08:27 +0000
Message-Id: <20200115180828.17399-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115180828.17399-1-pbarker@konsulko.com>
References: <20200115180828.17399-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] kernel-yocto: Drop setting of unused variables in do_kernel_metadata
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
X-List-Received-Date: Wed, 15 Jan 2020 18:08:47 -0000
Content-Transfer-Encoding: 8bit

The machine_branch and machine_srcrev variables were set but not used in
do_kernel_metadata.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/kernel-yocto.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8b22c34243..70e131101e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -99,13 +99,6 @@ do_kernel_metadata() {
 		fi
 	fi
 
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-	machine_srcrev="${SRCREV_machine}"
-	if [ -z "${machine_srcrev}" ]; then
-		# fallback to SRCREV if a non machine_meta tree is being built
-		machine_srcrev="${SRCREV}"
-	fi
-
 	# In a similar manner to the kernel itself:
 	#
 	#   defconfig: $(obj)/conf
-- 
2.20.1


