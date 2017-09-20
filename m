Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4272277F79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 12:59:28 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id l39so2090640wrl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xornbfa6eMzc8rry3npLPTNA7DpiO8IbK/7NH8Ury8k=;
	b=l4jh+5uCqVCQcfGQ3xTy563VRpfv28o1YrvsBlWKqcULBbKu0j5MMl/QujzsandaeT
	98rXwzd//E1KyHoZdT3YAojHITRByo1b8g5b82ZxtExxnJIAiCzECXOSHdIxT5pPrbsZ
	PeGPqkmNdbwzCO2WpX7zsZIPd3fTJnQg98/bGvvL7LLRhEQGiMs2xn5ykdrTp/BaE0mF
	Zkbwp8TFVyqr+GfGg+iP5ViwU1qnOUTsR344Oxg97frK81ZEc8xxDz1IaOXDwMQ9957K
	TeCD4swlZGuv0I6CjV4JP/58HLxsu3P9/h155TkV5t60FY8wF7h8ho5M3dYtMC0oiWL2
	zVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xornbfa6eMzc8rry3npLPTNA7DpiO8IbK/7NH8Ury8k=;
	b=LlR/QO9DSRaRXiyeatywIqyEhCSthJIKd8CW/3koFtnD5WT0dlEy4G991+NxbypoBO
	o+ckc6O327mAtLnowWZYpqak4aZrsngD9BwnlkS9oedwi26rUItAwcL9jAJo+R+EAC4B
	9guNty/BUSVVJlcJDHuWCSuhufREMVfx4PaASj3WsWPDv39RA7pk8xqFn/M1aQKMkQLJ
	Le2QapPb36W52yXLEewg1d1Hsvj5jlD5q3sbW+E/CGRFDlBbdA3X9sjUIrSgXT1REUhw
	pdKPE5SyoDqTt+3EcnR6Jl3nPFH7546CpLgYfYYd8hPhXjD9qS/lpKSHOAv1W/h95ozE
	jmZw==
X-Gm-Message-State: AHPjjUjWBEZHpIumLjaom2b2V4tzjdHmELsdqMvWfy7dSS6lPP4sbKsS
	PJv/7Yoftufib5Si3LsWAF7SHLzR
X-Google-Smtp-Source: AOwi7QCz3aB/ghT9FbEP9jpZG+S7j+P84YvpGk7DkF2MmyrwXjj/loTz7tpyPqhMoIKJH8mLdLhjjA==
X-Received: by 10.223.184.251 with SMTP id c56mr2123222wrg.145.1505912369620; 
	Wed, 20 Sep 2017 05:59:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p20sm1695658wma.28.2017.09.20.05.59.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 05:59:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 13:59:24 +0100
Message-Id: <20170920125925.28089-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] sanity: correct Python version sanity check
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
X-List-Received-Date: Wed, 20 Sep 2017 12:59:29 -0000

We now require Python 3.4, not 2.7.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5699287a4a2..91b92ec28a8 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -702,10 +702,10 @@ def check_sanity_everybuild(status, d):
     if 0 == os.getuid():
         raise_sanity_error("Do not use Bitbake as root.", d)
 
-    # Check the Python version, we now have a minimum of Python 2.7.3
+    # Check the Python version, we now have a minimum of Python 3.4
     import sys
-    if sys.hexversion < 0x020703F0:
-        status.addresult('The system requires at least Python 2.7.3 to run. Please update your Python interpreter.\n')
+    if sys.hexversion < 0x03040000:
+        status.addresult('The system requires at least Python 3.4 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
     from distutils.version import LooseVersion
-- 
2.11.0


