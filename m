Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58C6378A8E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t3so17418793wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JoCVxiPcAdm4Eywdl2UBbUu9463VgUT59lz4nD5xZqk=;
	b=Ystkdga3b1kbrDkdDs0FbeOwIP0QlIqmdJT6czfCgRqyLlAFBRZThPkRpqSCIOdwDr
	/yC/0yAHnn3Qcnmu/tOBWHAP5P+uBSfYdEDTjjWH2RF//PHcwOJbG1Oz03eowDZTOBNJ
	fQkBcMwT1K8ZZv8xW99P8jjtBKVGK3SaTuZUIcPjhFbzndUyU9b9f6Y40EhZVK2C0jkh
	KRVZhL9ossIDrcUguEx8W9BsKtKQO7E4Zmk89s6cFxEhHNZXa6LOqBEbdxPJXVs1/IBM
	AzDcpKyPBQ8P4T/p1MgU2OjW3Ho8OvnZo5pNoGHsF3qjLCUeHSSlQiICo6SV82Z/mnAB
	VXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JoCVxiPcAdm4Eywdl2UBbUu9463VgUT59lz4nD5xZqk=;
	b=C+a2L7xSjOT3RCSCCjp17M/9PEQ8soiPJuBzo87gyHe0Q0QqRG6f+sBskeFDwQDNM+
	bSgcfg/SJbrZl/gB0pzdcuV/SqF/ZCrKc14b9Zax20rY24YevuXmDdv5Kydl2q/zGB/o
	GjEdypg9rv2rJfftMz6DvJ8EvTgNcm3SXuzImyFaP21pzmiCdxkA22loQC8lC9+ZB5LQ
	My26woWDl4vOzMeLohVsvY+MYDhrxIrPsbCM1x7uis8o9G+P+GZMmogCRb652GZoqKCV
	sbYExH5SUHykwR5+m2+37jvQt5GQNsUn23UCg3lJAHnVXIvbPQWbhzBcnpy4MMGGDI9y
	3bKA==
X-Gm-Message-State: AElRT7FymBrHzcRvpAyC/Jp1NsiHVYbD+gzD8JLYLQyr8ZQu9yiyp00N
	VukL1vj8Bi0gGGnA59FRz5fs1/j5
X-Google-Smtp-Source: AG47ELtTN3GmYQFqRpHVihRKrzJnbIQUBEd/r+V+JpwHMOizQxrC+PWgECNtcIsAipGNxkl5TvS7SQ==
X-Received: by 10.28.84.26 with SMTP id i26mr8897236wmb.129.1520270456061;
	Mon, 05 Mar 2018 09:20:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:22 +0000
Message-Id: <20180305172046.21729-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 05/29] ovmf: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
index 959b1c649c7..25e5b58e707 100644
--- a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
+++ b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
@@ -17,4 +17,4 @@ Index: git/BaseTools/Conf/tools_def.template
 +DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-stack-protector -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
  DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32 -march=i586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables -fno-PIE -no-pie
  DEFINE GCC44_X64_CC_FLAGS            = DEF(GCC44_ALL_CC_FLAGS) -m64 -fno-stack-protector "-DEFIAPI=__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie -fno-asynchronous-unwind-tables
- DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20
+ DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20 -no-pie
-- 
2.11.0


