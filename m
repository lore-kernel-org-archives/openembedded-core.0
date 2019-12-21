Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 260957FD3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:15:23 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id t101so4831885pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ih3YXs9WD25AFnJ+QsRwCy+SH4dPENVrBBmweLIfe4o=;
	b=CJgE6PXirFLyN6NrhdLhmmy7zpo9cywQLymLYiYAmIYj2NKXQOTkk2YrFa/Z7ZgkCx
	nCgIlurTFqM5DySmwZZKWzzBgTc+naldnePDn+F+YIR8S790LlO2SyXv3wnjN246S0p5
	+k6C11Kq0QDvduuE5VAMu4koUULpgwavoEpzBxUJrYlP614R8aUzpJu6u1I5zWyMku/r
	53urwnQPtlIITk+oldUmU113SS0N9MbL92nPiHPdv4lGfsTckbQlNWCihq/Z/mj6P9JP
	xdCoP1N/9eoBTIl5fpDVdLnRFasxa09fVhuzOWvLfetHYQEnd5/viuEQd6fcDYLnR1C1
	FjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ih3YXs9WD25AFnJ+QsRwCy+SH4dPENVrBBmweLIfe4o=;
	b=Qiiz0QwCmOWY6/d28E0kf6JCVYhtIiXaXmt9EY3Dvi4Fn4KAWKPXgCMMS/kEfrYYuX
	tWI4xyx3NvmgEcIqk9dj+ZVmx6ewOXMwDtFSyvhnka32mguv4Xlu6YsN75nXpIriGmfY
	lgywhOtJi4cn+ISGJ7dTBsnTp6aHU2Q3JdsLf2/ZViiXSsB/+s5Q2aAxHq1qqtg7Z/NR
	JDgQLXOjTLewPDzCbtEesEYqeKePwCm2H4+Pnq7MOlHVk2Rgy0XVLVgueMjfhLvIgj7D
	OE+z54vAT5bsQrh7QI35BNqF6SWUG/lrTyUZHT3Ee4XEmM8P4DB24m6kSNjwgjCHJv5a
	DNFA==
X-Gm-Message-State: APjAAAV0dsjVYNrQTi0U41P7EPttIrfRxjHfQT1btVsTSRMLnO+ohmgA
	Okh/WnstZRpNQqyjHQGAKL9RQIP/o/s=
X-Google-Smtp-Source: APXvYqzVg5+zzczIzoSf9iAEBiA/rpLdp4WuW2LvyNOY6XEDFuTCHcsvs5ZfSj+3d2YvRfmcoJg3qA==
X-Received: by 2002:a17:902:8a91:: with SMTP id
	p17mr437403plo.75.1576887323668; 
	Fri, 20 Dec 2019 16:15:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	65sm15001784pfu.140.2019.12.20.16.15.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:15:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:14:57 -0800
Message-Id: <20191221001459.1630195-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/3] siteinfo: Recognize 64bit PPC LE
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
X-List-Received-Date: Sat, 21 Dec 2019 00:15:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 411e70478e..d62aaac0f0 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -48,6 +48,7 @@ def siteinfo_data_for_machine(arch, os, d):
         "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
         "powerpc64": "endian-big bit-64 powerpc-common",
+        "powerpc64le": "endian-little bit-64 powerpc-common",
         "ppc": "endian-big bit-32 powerpc-common",
         "ppc64": "endian-big bit-64 powerpc-common",
         "ppc64le" : "endian-little bit-64 powerpc-common",
@@ -106,8 +107,10 @@ def siteinfo_data_for_machine(arch, os, d):
         "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux": "powerpc-linux",
-        "powerpc64-linux-musl": "powerpc-linux",
+        "powerpc64-linux": "powerpc-linux powerpc64-linux",
+        "powerpc64-linux-musl": "powerpc-linux powerpc64-linux",
+        "powerpc64le-linux": "powerpc-linux powerpc64-linux",
+        "powerpc64le-linux-musl": "powerpc-linux powerpc64-linux",
         "riscv32-linux": "riscv32-linux",
         "riscv32-linux-musl": "riscv32-linux",
         "riscv64-linux": "riscv64-linux",
-- 
2.24.1


