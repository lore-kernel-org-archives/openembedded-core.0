Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 65F767F38C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 19:45:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id 196so3614725pfz.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nqmGSl5QlmKSZfRkHieBKTgHgOCB7Xat3qECckp2bos=;
	b=GBxOARoRAWU7yoSvSC368x8IqPaRhv1SPzJVK3M13A+UVt5VGPsaSyCz9TzbCst9Yp
	bh65YC0gxmSiGS+sBQBwZyKzl1cbzuHr39ZngDG2xfrFOZpLTrgzgjZlw0o/jqFaV5i4
	WXZp9t2zAQMlQPdSyjkCDmhQE0ZBnLD0SbcYyjfnDmpFn0EtiFhbFK2+ZN/jU/Nr7Crs
	9GdnsLqDZelRxADo/Bs8kpSOTtqHHQPh16+39lrLuDgJ1fzzgaKFeITKq3tMr0QLybr2
	1sxR4hJ4IELrFeJ9aHBQ4eW0nPgbnH830b7gRN8ZLKnuYTvJX8BRto+GCbI2KUCrPR/q
	mTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nqmGSl5QlmKSZfRkHieBKTgHgOCB7Xat3qECckp2bos=;
	b=NUFPmZ63+7tvE47aRIJ1AFfDSBHAYSLRjaN77MMdplTuz2IGbh0tvLW/vp7uIpTC3E
	FZeefsLfsHXmW7SJUjjTaOBBpTVbY2C5VcHzWbZaOB0WQyEBUxZP8BgZx7LtfFIrhHWo
	U/zXd5D6AblIyzKbbtTB6O3tTvKMdLyFawETM2OPGT4CEYNoq0JMx4d5w0ScVaJIq7J3
	bzCHGV1bIEXzqMltNM65jJlMUmioO3W5X7iQCwHoVUJETUZhHdQFJo5lIj5Tc/5ixOEW
	QmgdAMFzWt3kX8aLwy9xVUzrrAFTzc9P777FF2vogFjWPu2koHH9VWfgn8vfl+Pt4pq7
	iEog==
X-Gm-Message-State: APjAAAUmiYUcKO6ZZd0TcH84HeyPREn9UlZEoLuX8Z3ygKtcrRz4GHeF
	jDiHxDIQSW9icTPQsorHSX3NiW8m
X-Google-Smtp-Source: APXvYqw3XtpbyCJGs1cNcF5HgO73duEL5M+IGwTQN6BNJNYyh4MFb6Cd13F+7k3+cGwHxK7iN4oM+Q==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr8968848pgv.243.1565984739371; 
	Fri, 16 Aug 2019 12:45:39 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	o35sm5537333pgm.29.2019.08.16.12.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 12:45:39 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:44:04 -0400
Message-Id: <20190816194405.12751-5-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190816194405.12751-1-wesley.lindauer@gmail.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
Subject: [PATCH 5/6] libunwind: Fix MIT license file checksum
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
X-List-Received-Date: Fri, 16 Aug 2019 19:45:38 -0000

MIT license files must include the copyright notice.
---
 meta/recipes-support/libunwind/libunwind.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 36851d07ed..5726589661 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library for obtaining the call-chain of a program"
 DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
 HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=3;md5=3fced11d6df719b47505837a51c16ae5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d80c8ed4062b8339b715f90fa68cc9f"
 DEPENDS += "libatomic-ops"
 
 inherit autotools multilib_header
-- 
2.14.5


