Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB54178A99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:01 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id f14so18086504wre.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8rbiFt6wPhxqqm+8PWkUFaL1FTg2KOqqoaUiktrLkJQ=;
	b=RIomr30GoLMA1PQ3CDzKtfqUzhOVp2IedYkgHevuC43rdEUTVZu7tbVBFn13OoTiNT
	rXHCfUpqwPyHHKFuq0WHccWvqE8T4eAeUK5/hRtZA6cdARFMIyTgnV0Y9wrGK/HdFc7/
	XQoAeRlkRb1/fYXyT+sOdFn403O0xp7eleRMSQTdrlfGGdNd1cZVWd9ky2YFmByFTWNO
	7BoLbhK6GN4DRB6mVmxLvDF7mGfSkOki2NSuKvqCdBDRsGB61NUJFwG7sXqeXcD42BXc
	nQuf1WlYEW1gHXQbyet5GEPEGC4lQdxrePtDZ8Ne+UdEtKW7CoUGaO4x7/l5EpY2+QaH
	qs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8rbiFt6wPhxqqm+8PWkUFaL1FTg2KOqqoaUiktrLkJQ=;
	b=Q0jLQHL0PPx4eRNOia4ZScfXU4Ur0owrMlCWQM2nye0jVRwNEUv8uDanJROlOoOMDp
	uctgkLYP/XUYeiK+1IrV/rPgt2tU1K2Fva6RyGWEEVFu1egQ6mkj38tgeDKP2vIz7Fui
	gOl3YeEalRztILZLeSIRoG253aAmVysJLYVghv5VsmVJaZGrE8TOTj/DZ4Zqlnqa9umW
	zWVG1XPX1V0tmlJOZUh2ZUU9VMgOmTy4sgu4pJIGC13Qf5gmfBLt806IfzvMULRQdS3v
	n01ACxEE4Id8eY4WHGjWvH5deXqMHs8cP4izdSltc2S9ULw/3Gvpl4MrakF0WHeD3jAg
	JqXQ==
X-Gm-Message-State: APf1xPB62w02YRYycvhah2alAOf61LSFSZZSn4dFEXD48IwzlCYWooLd
	VGyF47Mo5AgOdeRiVlmKzhvdDDWh
X-Google-Smtp-Source: AG47ELuMi9cHCNhK2VTTz2NjdGFPmTa6Sl7oxNdolWQvk6TTwYABiNw2L8o5s+LiqKlLSnQFAOhYFA==
X-Received: by 10.223.147.227 with SMTP id 90mr13301356wrp.230.1520270462484; 
	Mon, 05 Mar 2018 09:21:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:28 +0000
Message-Id: <20180305172046.21729-11-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 11/29] iproute2: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:02 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../iproute2/iproute2/configure-cross.patch                    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
index 866609ca991..5536fb57656 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -9,19 +9,19 @@ Upstream-Status: Pending
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Shane Wang <shane.wang@intel.com>
 
-Index: iproute2-3.7.0/configure
+Index: iproute2-4.11.0/configure
 ===================================================================
---- iproute2-3.7.0.orig/configure
-+++ iproute2-3.7.0/configure
+--- iproute2-4.11.0.orig/configure
++++ iproute2-4.11.0/configure
 @@ -2,6 +2,7 @@
- # This is not an autconf generated configure
+ # This is not an autoconf generated configure
  #
  INCLUDE=${1:-"$PWD/include"}
 +SYSROOT=$1
  
  # Make a temp directory in build tree.
  TMPDIR=$(mktemp -d config.XXXXXX)
-@@ -158,7 +159,7 @@ check_ipt_lib_dir()
+@@ -192,7 +193,7 @@ check_ipt_lib_dir()
  		return
  	fi
  
-- 
2.11.0


