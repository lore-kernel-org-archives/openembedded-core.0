Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD336007A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 13:56:09 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w24so9346864plp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=G6VCbyfGqG5YJmpln7xauP7ugVDJC0yXmiTZKR1c30s=;
	b=Fa/sjyA9FPi47RkiInXYzK1x+2X0A0u8V/n5PjEEhpwfeh6Qll2XRmqU7l8pUVD7gK
	MsExgA1Y3odKAulgSWoi5vVZZqrntpiH5A175tAk5Iocovl9yVGv/McQ3casB01VFSLT
	IZLgfwU4F8GGGqlm4foQwZfHCjPOVoE0pottiP49vdg2Eb23vy4+V78QhH9P0DXfdv+D
	eIbBULV12TIPH4JBK8R2dzK3a8Ce6huYI0bxkFgv2jqopr4cgra4BgfJ93tHUVyhUfRo
	VQb5GTrS/gi/Awgw2MN4Xf5h2JbNHrDkavm9q51ia4FZuZa4D+gZ5WmcI6HBocdGf2YP
	lCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=G6VCbyfGqG5YJmpln7xauP7ugVDJC0yXmiTZKR1c30s=;
	b=j+WogzFh/muNcurtGBVsNTC5Q+dbsauaTdOM+zipmTwTis/sPsi+9kSSmvCATRbK4C
	TlrDX2MdAZHpYUB2YNhSEhjqvFx/vkgHQnX/nB0mPYLiIb1ezeaGXSWgAUF1yWEYkV4E
	g05bBq4zgqCLvV4Ma4cOivogPskXjLbE8c4SdGJEJbBCq9N3zqNX7um/DnBBPFgDoPmx
	X0HEwiAyThRTvzT6S9DZA6D/Hmj6rA3XlcUudqhdjtjzvbwEJJK335GShELLi6QecbdT
	9SOWs/jna+aO2Q6+NudPdnoaafzueloHuMl3h1PF+dMtna48SRg2ovmNlB/pwtNV+kAN
	1SUw==
X-Gm-Message-State: APjAAAVv5E5ljeY7nmphey9tzM0I+yilkUwjJGlg58+g81qXwwTLqwHH
	zvoZOZcPl2uP9CjByLqtaDzLASOc
X-Google-Smtp-Source: APXvYqzf7iIbTKWBG/rAqlMlBMQ7sHseX8cVyr9W0Au18KnAphCsDJxZyih2+qq2uSIkPs/K1oTAUw==
X-Received: by 2002:a17:902:b28:: with SMTP id
	37mr31897244plq.322.1556114170326; 
	Wed, 24 Apr 2019 06:56:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:a87f:9f1d:bbdb:3483])
	by smtp.gmail.com with ESMTPSA id
	v20sm29812437pfe.118.2019.04.24.06.56.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Apr 2019 06:56:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 06:56:08 -0700
Message-Id: <1556114168-23170-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [QA][PATCH] manual qa: compliance-test drop ltpstress
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
X-List-Received-Date: Wed, 24 Apr 2019 13:56:09 -0000

ltpstress was remived in Oct 2018

https://github.com/linux-test-project/ltp/commit/e752f7c19674d9b2f7d37aed123561a3f6410e97#diff-5231627fc8640e0adb955f9e69c3c08d

 Remove LTP stress tests

ltpstress.sh runs stress.part[1-3]. But these runtest files just
duplicate definitions:
* stress.part1: fs, mm, nfs
* stress.part2: ipc, math, nptl
* stress.part3: net.multicast, pty, syscalls

Definitions are outdated anyway. There is no point trying trying
to keep them sync.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/compliance-test.json | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
index 8c13b68..0ed090a 100644
--- a/meta/lib/oeqa/manual/compliance-test.json
+++ b/meta/lib/oeqa/manual/compliance-test.json
@@ -77,30 +77,4 @@
       "summary": "stress_test_-_crashme_-Beaglebone"
     }
   },
-  {
-    "test": {
-      "@alias": "compliance-test.compliance-test.stress_test_-_ltp_-Beaglebone",
-      "author": [
-        {
-          "email": "corneliux.stoicescu@intel.com",
-          "name": "corneliux.stoicescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Build LTP with toolchain or in sdk image",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Copy LTP folder into target, for example, /opt/ltp. Modify script,  testscripts/ltpstress.sh, set Iostat=1, NO_NETWORK=1",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "cd testscripts/ && ./ltpstress.sh",
-          "expected_results": "This stress case will run for 24 hours Check the result\ntarget should not crash with the program "
-        }
-      },
-      "summary": "stress_test_-_-ltp_-Beaglebone"
-    }
-  }
 ]
-- 
2.7.4


