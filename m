Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2424F7CF9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 15:58:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v16so2722210wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DwapZ5rMYnIY15a7b6KRuzjlkG24O1EquCG9acmVU4w=;
	b=rG3GuXmiiu0olXVIR9ZLRzNPwTLlNHZrkBOnAICfR5d5cynCQJXVnu5AESYmiHlych
	b9i2GQRKVlEUJullag8On+F+Vd1aVCi43tseegLLQIywrp5q9m0d/0b6mWgb2tGX6ba+
	xeokoymgnEm2Us/VS18LVPYwNui5jrjK/uJtNCSKYVfuVmY2rur1/ohmpGchYibneE8m
	4elgjLmRAxIycKheGwwyrC5+ZcF7DbaoUmJabz2HGxUek3bAj2ZOdBXfGPF0eeOvsxf+
	acmN13zpPFJmsYdA7jjQXXreQEXgUkJe86F4MTVANhShkP1iNoG9SVF7oiHG8GFxXobh
	CEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DwapZ5rMYnIY15a7b6KRuzjlkG24O1EquCG9acmVU4w=;
	b=Iv5LW6S+7Z5qIvkzKDL9zT6EYA+2jZUtCcU1dFVwuTUybVx62gDzqj+uN631eZ0yHt
	8NsE6iphTDMWrgjUgRE6bdUlfPn1bWr+BRYlquEoBTprGBIHD4LRD4fAhBacVAm/+zjA
	a5mlSDPEgyRh9Gn4/+pipyCX3PIjk1VDUxpqytRRO9Gps7pHdBt9Dikw6YMl8C5W+J3W
	ZbezQgC7ladmt2D3LqUpEHFWQ0QWoEMfEq9NLm9uNwahTaIY2w2/bXnYUsX9LskEcRWq
	LIomsyGvCaX+Ks5DNL3cJ/dLu30MCyMwSr5/vXjvz8FZiu/my1WbVUpo7MBNWy1u2TJE
	9KYg==
X-Gm-Message-State: APjAAAUhfo4aNrir6faWvVo3NWFplL3PoHR8tmZovSQ+xR/vbJSfgcwx
	fZYKGmtZTEgx0bl5P6eCMcJGC27pEmU=
X-Google-Smtp-Source: APXvYqwF3lbckZSgs0OKyryChr+nrWX//nzUM+ySRzvsEcG/9fpyU89WrDzrKHTwHsSmx1EZwuxzyg==
X-Received: by 2002:adf:cd83:: with SMTP id q3mr4710669wrj.228.1556294286412; 
	Fri, 26 Apr 2019 08:58:06 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	c13sm22578750wrx.88.2019.04.26.08.58.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 08:58:04 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2019 16:57:57 +0100
Message-Id: <20190426155757.28387-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: add cgroupv2 PACKAGECONFIG
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
X-List-Received-Date: Fri, 26 Apr 2019 15:58:06 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Allow users to change the default cgroup mode at build time
and use the unified hierarchy mode.
Disabled by default - hybrid is the default upstream value.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index a559fa0d75..33d3e0b000 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -115,6 +115,7 @@ PACKAGECONFIG[audit] = "-Daudit=true,-Daudit=false,audit"
 PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
 PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
 PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
+PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
 PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
-- 
2.20.1


