Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 13FF171E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:18 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id z134so206575093lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c3lKqlchT7KnuK42OB98/J51CCh7lSkBD2v8XVFZ0A8=;
	b=D6Zf+dYkORMtSh8we4e7vqjvJUWiTkA81uyZhuGBXSTRQmkIhfzkQMgncSK1z1kMkd
	MvCCRdC9Dg43O51L5Qqq8t6dzuGR3Dn58mjrGBFcqg/z3sY162zZ93vrIQs4zcHK3Cq0
	X/rz8+961drvARSs0O2jmrBJswNlHxs7/Hqwhd+hRnhDpN7Y+OWH2bIfa9Fnp887q0UL
	NDvPEi4/uvgtCLBXgUXoO9I08TOXb3QH8qnJ6MaM5jVm0xYXGqn6vmwXeOl4XlJFmyjn
	OGnWL7Z4TEoDZWmtcFRaodzQQy/VM6pxt5hLaiGW8ce1PYswDVM6eKmp6QjfqcXMlSK6
	0Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c3lKqlchT7KnuK42OB98/J51CCh7lSkBD2v8XVFZ0A8=;
	b=hKgrIntpXS6u1ZryxGZ2KQvlcWLP6AeHP3XmIQv2j4/G/Eu6UN0+NcMtB3NFCpQDi2
	V0QczJoadF0cntRhQABn+tFhjkKhttMpqaDZzHy78ZPeaqKrDip38w9z3ORaRi1P//UK
	AdRILPNvdxSmpWiqTR5dwn8sTj5QWsdQI3UjFisWyEPX3Lz/H0iT67qMuG/2jPsBqDq3
	k6D8tAwN2I+N2Bg7H2iUNcbbaDmCeKJ3hPanuKp7CUyLikQdnC9Y2r16vGZ6pi6STl+5
	eVWu6V5HCJ0F3ZvUp2qfA290EVl+t/RA9R36OV4bXbKkGp8EAd5IcelNczWqiyj3HxMu
	W6TA==
X-Gm-Message-State: AIkVDXI9ayOQg47iLN5tmAM6Stxla4NTkpmt35q+Tj0InuE2IAIJzWuLesLEN1gssAj+mA==
X-Received: by 10.25.228.138 with SMTP id x10mr8394721lfi.55.1485847098599;
	Mon, 30 Jan 2017 23:18:18 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 87sm4331432lft.27.2017.01.30.23.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:17 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:10 +0100
Message-Id: <b2417bc1d96da9548da33ec782d5eb677f2d057a.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485846907.git.anders@chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 1/7] python-3-manifest: fix adding imp to importlib
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:19 -0000

Commit: 512334f102a33833d39af53467894315f0715d07
	"python-3.5-manifest: Add imp to importlib"

added imp to importlib in the generated manifest, but not in the generator script.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/contrib/python/generate-manifest-3.5.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 7259543..cf19f47 100755
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
2.10.2


