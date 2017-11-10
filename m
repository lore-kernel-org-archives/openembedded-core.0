Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD6FA7865C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 17:04:21 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j16so2298045pgn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=l0iH0N6JmoZqGua1OKmRsYJoawUwp5LGmFep6nqHDrE=;
	b=Y8D7eWgS1RorFW94EiQdtF94nZeCYSAFaSg+8GS1egBG7kDVKCCYuiAaayGpgtyViv
	ZjMl9Z/D0yDeJW9rUKqajc/OjI5y1YfBo9DvwrxerNYiHhZcTuq6v5qnExGrf6Hcc/Pw
	OuQlA2xbR858p5eZEuAyNgB1TUtadwHFte6brgQ6VB5FjOnmjaCAV4RQmTYFvGxpO+rc
	UGxa+2JZh9yXePBRl0pzsAfVj1HvU678KSqxmfyuX6tPwo8VU8fgfcLIuWfLC2OClpzn
	5hly3DxYU1Oj+/Cz4yVOBD9HTPu+3rvUzKERnpkXifNDbb1PTWVTvx7gsEaYf22PUJKx
	5VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=l0iH0N6JmoZqGua1OKmRsYJoawUwp5LGmFep6nqHDrE=;
	b=m/5pFyqtHg/QrQHgpvtNpfU30uEBTaZm9e0svPAGcaIBfUMlmANxQQAFT9PPFnRl/W
	hMBfraqM6F1gDsk2iOoQ4pY5AM/2YoZb0GkeAivDGCrZ4hbq3OlPcob/hA1FuNgNIaKK
	AMwdEqCqyZV43CuhhreHE61MNC9IMUByhIrLF4H7jcYu71VWV4M40rOp/qN0hP2tC9t5
	7oPxxHOKuoHnWwVa9b5shuIZRAXwQ3zuodnHGMM/ui5kcyHckXtIDu6S+aLT418snxUc
	g73fhpbD2iq9VkEhraI8P1nr5JP9UvHzlHW+2Y47xfIXk2GSs5jVqYAnAmdZ4SZHFYQ5
	VAMw==
X-Gm-Message-State: AJaThX6IWZSozG1dUq12vvM7WzSffQ3z0To2lQ1Vmz4S7fj1zsdrbIKA
	mCQP9OXxUhofPZkJBSvEXBjiKk4+R0c=
X-Google-Smtp-Source: AGs4zMaF1FKsZpmZGIbrWPiIRFB6iPQSDT36xBKNp5X3AEeUPCeytaHdQfBMVHel3BUYq6kIMLoANw==
X-Received: by 10.98.163.200 with SMTP id q69mr1053634pfl.52.1510333462615;
	Fri, 10 Nov 2017 09:04:22 -0800 (PST)
Received: from [127.0.1.1] (CPE-121-222-32-11.lnse1.cha.bigpond.net.au.
	[121.222.32.11]) by smtp.gmail.com with ESMTPSA id
	a24sm19649232pfc.79.2017.11.10.09.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 09:04:22 -0800 (PST)
Date: Sat, 11 Nov 2017 03:04:17 +1000
Message-Id: <20171110170417.26537-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/2] siteinfo.bbclass: Add microblaze(eb/el) linux site info targets
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
X-List-Received-Date: Fri, 10 Nov 2017 17:04:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add mappings for the microblaze(eb/el) linux and linux-musl variants to
use architecture common linux site data.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/siteinfo.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 29cd2aa82b..8445702aba 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -81,6 +81,10 @@ def siteinfo_data(d):
         "arm-linux-musleabi": "arm-linux",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-musleabi": "armeb-linux",
+        "microblazeeb-linux" : "microblaze-linux",
+        "microblazeeb-linux-musl" : "microblaze-linux",
+        "microblazeel-linux" : "microblaze-linux",
+        "microblazeel-linux-musl" : "microblaze-linux",
         "mips-linux-musl": "mips-linux",
         "mipsel-linux-musl": "mipsel-linux",
         "mips64-linux-musl": "mips64-linux",
-- 
2.15.0



