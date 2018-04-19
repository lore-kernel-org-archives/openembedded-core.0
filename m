Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C44460272
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 21:23:59 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c7-v6so3988423plr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LcAK0OkRfuF84ATWlH+8X8ovgTO9SwaNz5ImaFIz8NA=;
	b=pCi1WCWenDVmXwLjLDPlM/3fxyS+9VgCrFqrqFTgOytSHeCek2jlWDlyOK4WQte/XZ
	bQBGtirIfzGsOSpNbT0xnn7TZC+H/NLkc2rwR0sw7QY6AulDZmobcLYdpSibEVP/Geeo
	RCRaRLZWw3+9r1rvUP7skEkrlLnVpLmsdrxJdECmho3jpLGdgT7VfoHQyoT+3dWVYlIl
	s84sZ+jeq8skM41iJqgGpaf5B/Myj6eyM3JQ8kSXiTGuRmGH9vsBBq5F+lbrLVMyvfC3
	6rKWTtMWhDRLovdwndnlZCDaHeLhCLqk02pXpLhDuvIKf9FkxoXjn5M6MpbfdqvZibqa
	WScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LcAK0OkRfuF84ATWlH+8X8ovgTO9SwaNz5ImaFIz8NA=;
	b=XpLdnA28e5pVrlDcPVKLGybKGMNIrxsMdIZMCgfvhy+i9ddy/VkEdNKO4w8fPM01vH
	YjWxM/3HpGDpqcA5HmrDuBQzQqTImkV5ZVyxNCNC/WcyRaizq4h42eQrkBnSpqfeq7j9
	IGM+DmKP5l50HjHowDz/ID/tvVpMEPX1f3LvoP5peLVxiPLW7MQ+aCV84pyxzTJLpqAo
	iv3MhUXFf1xf/hSo01c0jWfJjj9mQHquse3lUpUoVE0DWRynGN5Bsmg9vJtGUPezWmiW
	IBzWivsEvrXIFmytd9G2ka/Ac9HNR1lZQkbrRSN+n4Q7xHlVfwoCDK2nO7AaLE6CoxPo
	h7qA==
X-Gm-Message-State: ALQs6tBTLfGSZC6rUMwPZzrXdrtJDZI7Z8LHUvxILMdIYUH/+hJIdgaJ
	DvWCGbWz6fyagIzgeb3tlpVzvA==
X-Google-Smtp-Source: AIpwx48Tk5XP2z9N8jtLF1L5Cga7O+Ig6TVUxaZDUJHYWP4yk7KcEcvLc4gpGS2lzPnr+z3Ic5I84A==
X-Received: by 2002:a17:902:7c0e:: with SMTP id
	x14-v6mr7734455pll.392.1524173040210; 
	Thu, 19 Apr 2018 14:24:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	n86sm9526367pfk.178.2018.04.19.14.23.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 14:23:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 14:23:54 -0700
Message-Id: <20180419212354.25290-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V2] musl: Upgrade to latest
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
X-List-Received-Date: Thu, 19 Apr 2018 21:23:59 -0000

Changes are here

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=55df09bfccbfe21fc9dd7d8f94550c0ff25ace04..618b18c78e33acfe54a4434e91aa57b8e171df89

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Upgrade to newer SRCREV

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 936c64f2d1..ab0aa3ea47 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
+SRCREV = "618b18c78e33acfe54a4434e91aa57b8e171df89"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.17.0


