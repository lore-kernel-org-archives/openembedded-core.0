Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09681CF045B
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9231.1728452982677511034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X0QKvM9H;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452984; x=1759988984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=K4mtdk+efj7Z6ouEzUU/p7UjAxLQ1eHrq/ewEiVkW7M=;
  b=X0QKvM9Hc84WMhRK6MqiYQpdWyCsUx00k2ezlQ4dL1HaDVqRqeiuSPZa
   eBlVL41yixOEpcfmXuutQAiouncrFjM1wKx2jkf/QyW5GW4nR+QwzkQtJ
   QjF/2gZwXtB4BUh2NTOmB6KDg3yU40nXCArzitlkZmYmAqwDZ69z3jJNS
   6OZrCNfY9Mn1wOt/iF0F6SXppxMt2iGlDGnQ5x4nz4TsN9y89crLY0aZV
   PtRanO6UTW7+DxstsokSRRSTj0KuJmaDHgTezve0TNrFdODutD6MhB1BL
   4UuVX0GD5sSJ7Uc44TJ8bALIayh6/N0YWWy++nXmNKZ2gb+MNOrutHA0t
   w==;
X-CSE-ConnectionGUID: PSuqhNNLTCanXy31cs/I4g==
X-CSE-MsgGUID: xmVQEuykTQadmCxHQtOE9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="155690816"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="155690816"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:41 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DC58CA1E3
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F06D73B3
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41404E5A18
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E34881A01E9;
	Wed,  9 Oct 2024 13:49:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/26] python3-pefile: upgrade 2023.2.7 -> 2024.8.26
Date: Wed,  9 Oct 2024 13:49:05 +0800
Message-Id: <1728452955-25051-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--2.307700-10.000000
X-TMASE-MatchedRID: vQr1bp/0ccWjz0nOeth/yXg2y0j5vXZGlEDhvi2wR87QarzCEH4/6n3Y
	vtP37IU4N/cuMNJ8XfZ6HPIEoaCfv6+CQswOit7PMgcjIsJOvt6s4IQYg+G3CLoVNuDqd1E5qso
	OkxvQPPtKe5IHWzFlbP5nI8KIHQ65nvp70Y6l9Aq5x7uAXGEprdDZ1FFTJUym0iXxldiQKuTZUL
	VBYooo+gwjZ2/Aq7zan+JNq1HGt7SCaR+ejSrQOqncG1vVsfbQqqAda2WWSiv8ytp6SBqwxT2el
	AIPindml40eicjerpbednYgFc6jdnbph30JxFrnqhcdnP91eXFzN5x8iRZclpm6DQ5tseqPvqnF
	tM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBeN9Hd3TB5G2jptKXXbxD2wY+7
	AWQ49+XHfggRI8Ptq3la32wOlvgWvvxILmKK/HBRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs5d/AA
	ak3ZUk9dYI1MIfQAkKLHqpagRATTxYoIvaW0kEahbxgTNmylLNkpls05yilXMzRHi1M61t/s80p
	to1kCsYIdll6IRiUIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205326

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024

Changelog:
===========
- Close the data attribute before reassigning it
- Floor division (//) does mathematical division with the floor function applied to the result.
- Update new dvrt type and Load Config filed adapt to Windows11
- fix PE.get_data
- Fix ambiguous string syntax for PEid parsing regexp
- fixed a memory leak that caused the pe file to be access locked.
- Exphash from sha256 to md5 to match imphash
- More readable calls to superclass
- Fix cache_adjust_FileAlignment to work with files not aligned to 0x200
- [StepSecurity] Apply security best practices
- Create sets using curly brackets
- Change IOError to OSError
- Apply isort to sort all imports
- Remove "OC Patch" comments
- Update tox.ini Python versions
- Use with statement to write to file
- Remove distutils use
- Use chaining comparison operators
- Replace list comprehension with set comprehension
- Use not in operator
- Replace base class name with super()
- Increase readability and consistency
- Tiny comment improvements
- Update oleaut32.py from oleaut32.dll
- Improve parse_rich_header
- Include ordinals for wsock32.dll
- Update ws2_32.py from ws2_32.dll
- Update pefile.py for typo
- Add parsing for IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-pefile_2023.2.7.bb => python3-pefile_2024.8.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pefile_2023.2.7.bb => python3-pefile_2024.8.26.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
rename to meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
index e30b362323..87e651d9d5 100644
--- a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
+++ b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
@@ -2,10 +2,10 @@ SUMMARY = "Python PE parsing module"
 DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
 HOMEPAGE = "https://github.com/erocarrera/pefile"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e34c75178086aca0a17551ffbacaca53"
 
 inherit setuptools3 ptest
-SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
 SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
            file://run-ptest"
 S = "${WORKDIR}/git"
-- 
2.34.1


