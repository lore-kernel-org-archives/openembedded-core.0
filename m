Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB9A87FF3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 4so3863588pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dKvUp0RyWegDF13OofqNtnPbPF5/tJntUusuncz1/u8=;
	b=NASnjU46pOktaIS/ep/qrZFA9BjZiOgaH6BSCVrDBW4RBRnJz+F7tiE3cr8OS4V8Ir
	Qe/zhpxMJnC8VGyi3xdKelgzFOzYjF8kn5PYjMxiFGfr0NLlSKSqwpBdPor1O2J1YOl1
	Wrt532+JiY5NLNgljuNxLcwtWzGJoUApCpzSCGfqxPVR2u4s3QGCXnUS1ssik6zzb8w3
	oXVpv2zXJfuCirzy56rZ9wjcXoTX6i8gLp6DOEe+ObHUQqvUNGGkHU9qA+GlTiBPmc98
	J12N+pj+3N4zudYzKYCOhqCsqIKOtLFb8F1YvIPcvZGfM+S0CgmvWpbQu2RnCmGlqzyw
	DlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dKvUp0RyWegDF13OofqNtnPbPF5/tJntUusuncz1/u8=;
	b=qccWCgcZOKuxgYAShzB0YEgF7aX4VOpa4TwuVmyBpyaU43Z2TwGDAH0uDP+32QV2wc
	/3XN9N3yRSvXlo3r+kvCokNmVEwTVJwXkudupwMabiFsOQAoRYYOGc3wEeq5ObsAh4Ha
	J2HZClCt+6vA0S+r7K/wi8qjGBhr9KJg1+3bBNT9zm1KQg1vLjKMMNUkYCH1wbh2Z8lH
	0nM/X4dur/1objr7zSMCh9lbkFmCB2NvwXS4Vo09+qWjp0I/jx9j2Ce0gmgN5hgtI3Yu
	SEdShTk/ZXy9M6sUEXOSAxQUUumY4i+VT0/kNnhz8kNM+2pHG0MV7jVnCZto9/k6M5Fm
	VCrA==
X-Gm-Message-State: APjAAAXtERxw2PLT9BPfGdZ6VtpiQAis2oRMxA8mxa7Abml0JCnd7ghj
	cBLnT8hSGihk0fc8XufwQhskCur0Sus=
X-Google-Smtp-Source: APXvYqwnsxxbqXV4S96JCtAAiM/0jvDcnJBmvPnvpMLf8MKWWngjuDYC1kINBPZZ7EIO1dW8xmYU/Q==
X-Received: by 2002:a63:604:: with SMTP id 4mr16460654pgg.406.1580066877333;
	Sun, 26 Jan 2020 11:27:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:47 -0800
Message-Id: <63c96bbaf72fc577ef648db43916ca6aa7465ee0.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] go.bbclass: Disable PIE on riscv
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:56 -0000
Content-Transfer-Encoding: 8bit

Its not _yet_ supported for riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e40e55689d..369652dbbd 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -147,7 +147,7 @@ INSANE_SKIP_${PN} += "ldflags"
 # doesn't support -buildmode=pie, so skip the QA checking for mips and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH'):
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH'):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
         d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
-- 
2.25.0


