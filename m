Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 787CF6AC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:27:33 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so40577127pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SYFdSEUhS3wCI+2lx4aub5I/Gkz2EaV5eoXSVYM0Oog=;
	b=RTu6gdkraiXQjCbLhTJcKR8dF+PIaA221pr+CrDcnt7hzyFCHWfRsVc0sAdOLAQ4X3
	amOuMbL960upVLEYUuRyJQwXdUu0p9g4SCEjq55wWuFIfVodSiGp63nLp2lqa8RJYE9P
	EpT6MINDpnVBCt+5SnQPx0rRNG3swvLpJPIJUrOMiqa/i55Xgwq93CMGEnXvykFoPH5e
	qMgjGRgh3/uyaof9xUvgWs8thCwwukCzMp3iG/xrJXndiLPDKV2ngX7jSP9G31q10VP2
	KZP7fSBEJ7afQfBTxhfW3qH6uYDe/LN7hW+8rjWcI0Q2x3bEeYi903RxurrpN+0wLZHm
	7wVA==
X-Gm-Message-State: ALoCoQnrqfPOz2lcF6eto6lLQyWGBDvYIckbRSgK0t1XY/qK8SsVNil0nKX8/vmC/eUB76YH7RpV
X-Received: by 10.70.101.137 with SMTP id fg9mr119926427pdb.101.1426678055073; 
	Wed, 18 Mar 2015 04:27:35 -0700 (PDT)
Received: from Latitude-E6430.domain.name ([119.82.123.224])
	by mx.google.com with ESMTPSA id x1sm27111518pdr.17.2015.03.18.04.27.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Mar 2015 04:27:34 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:57:07 +0530
Message-Id: <1426678029-19516-4-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v2 PATCH 3/5] bootimg: Skip iso image build on aarch64
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
X-List-Received-Date: Wed, 18 Mar 2015 11:27:33 -0000

To generate bootable ISO image the x86 architecture uses syslinux package (syslinux/isolinux.bin).
We have already skip the syslinux package on aarch64.  Hence skip the iso image build on aarch64.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/bootimg.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index ed7b32f..5a8e70c 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -33,6 +33,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
+NOISO_aarch64 = "1"
 
 HDDDIR = "${S}/hddimg"
 ISODIR = "${S}/iso"
-- 
1.7.9.5


