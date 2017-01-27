Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4B577341
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:18 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id z134so158660984lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Vz5h6SepEghcgeqrbTiiHjXmHv8RWYGanDxzuvmFtEc=;
	b=tJe5CSO/16MRTdsp83aIRCHTNBc7wQQYIkHbbT7yGVJVKJV+CW1kUZm3Xwl2OQdP2a
	4+oT32XQcVwvI/zcmfJgzlgDwEO+0sTDCI1f/CXSO+p/sKgViE/I4qiS0z/VeyTXT5/i
	aYPb1SdFGThtwRgAokmHg1uEndnst3+aWWUmcJIcpJ4vdSUQesNmYkVPESFOksMA6rqf
	67OfDxSL6G9C4f3o5S9QEM9JijPoUEmp1ejCK88239aUj7xZoExe7nb1hCCfU8cXx5Jz
	aXg9+8nsfYUMRfK9mD5UpdeUeU/t1ib0mR8L9tiC8kOkXs1wOv5UH8iXz/qz8umJdztK
	kmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Vz5h6SepEghcgeqrbTiiHjXmHv8RWYGanDxzuvmFtEc=;
	b=bXJWHYI/LkHZQsPHe6RP4Y7SwfiZtrHMFWjdOlj+uU6NMwj3DWtYirqf9M524oaoKM
	ZjPxSu/TWqnyxDNn2Jf1fKX9dP3j/C67Ly1+ZPkJM4QColdPw2mTHLcvai5EgkG/Kfg5
	GkliOibc/O8bLHgvXXP/REhGmbzf+VoRorJ8uZOMm47upTr2vM9l8FY83krU6Pl1tmvQ
	xoh1WJPGcSqjhcDInM/g2HGoum90jI0TBPcmGl2qYle93W+vJv/ML9kXZF6ls2FSr0JR
	rYSGWBDUCFo/qu9nTJ7N/+FK3H5vwlpCO0npwo5heAjei/DsWtJZLAELNVMxvHNrKOs3
	TROg==
X-Gm-Message-State: AIkVDXJs9GidW1KjZhqQycjRKjf/PtE3dSQ9bxxssJanXvAJBFgVwiNUVqad/vt86dWaSQ==
X-Received: by 10.25.5.203 with SMTP id 194mr1978705lff.41.1485507978443;
	Fri, 27 Jan 2017 01:06:18 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	a78sm1115662ljb.47.2017.01.27.01.06.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:17 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:05:56 +0100
Message-Id: <c4cb9e52771161be9eeb31832a934927cf271aa3.1485505680.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 1/7] python-3-manifest: fix adding imp to importlib
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:19 -0000

Commit: 512334f102a33833d39af53467894315f0715d07
	"python-3.5-manifest: Add imp to importlib"

added imp to importlib in the generated manifest, but not in the generator script.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/contrib/python/generate-manifest-3.5.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 7259543098..cf19f477ab 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -279,7 +279,7 @@ if __name__ == "__main__":
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
     m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-lang",
-    "importlib" )
+    "importlib imp.*" )
 
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
     "lib-dynload/_gdbm.*.so" )
-- 
2.11.0


